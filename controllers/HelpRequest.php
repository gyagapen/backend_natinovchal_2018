<?php
defined('BASEPATH') or exit('No direct script access allowed');

class HelpRequest extends REST_Controller
{

    public function index_get()
    {
        //get help request for a device
        $response_array = array(
            'status' => true,
            'error' => "",
            'help_details' => null,
            'assignment_details' => null,
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');

            //get parameters
            $device_id = $this->get('device_id');
            $type = $this->get('type');

            //retrieve help details
            if ($type == "UID") {
                $help_details = $this->Help_request_model->getLiveHelpRequestByDeviceId($device_id);
            } else {
                $help_details = $this->Help_request_model->getHelpRequestById($device_id);
            }

            $response_array["help_details"] = $help_details;

            if ($help_details != null) {

                $needed_providers = $this->Help_request_model->getNeededProviders($help_details->id);
                $provider_list = "";
                foreach ($needed_providers as $provider) {
                    $provider_list = $provider_list . $provider->needed_provider_id . "|";

                }
                $response_array["help_details"]->requested_providers = $provider_list;

                //assignment details
                $assignment_details = $this->Patrol_model->getAssignedPatrols($help_details->id);
                $response_array["assignment_details"] = $assignment_details;
                $i = 0;
                if ($assignment_details != null) {
                    foreach ($assignment_details as $assignment) {
                        $patrol_id = $assignment->patrol_id;
                        $latest_location = $this->Patrol_model->getPatrolLatestLocation($patrol_id);
                        $response_array["assignment_details"][$i]->longitude = $latest_location->longitude;
                        $response_array["assignment_details"][$i]->latitude = $latest_location->latitude;
                        $i++;
                    }
                }
            }

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);
    }

    public function retrievePendingRequestForProvider_get()
    {
        //get help request for a device
        $response_array = array(
            'status' => true,
            'error' => "",
            'help_details' => null,
            'assignment_details' => null,
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');

            //get parameters
            $service_provider_type = $this->get('service_provider_type');
            $service_provider_longitude = $this->get('longitude');
            $service_provider_latitude = $this->get('latitude');

            //retrieve help details
            $helpRequestList = array();

            $help_details = $this->Help_request_model->getLiveHelpRequestByProviderType($service_provider_type);
            //$response_array["help_details"] = $help_details;

            if ($help_details != null) {
                foreach ($help_details as $help) {

                    $already_completed = false;

                    $needed_providers = $this->Help_request_model->getNeededProviders($help->id);
                    $provider_list = "";
                    foreach ($needed_providers as $provider) {
                        $provider_list = $provider_list . $provider->needed_provider_id . "|";
                        //check if any completed assignment
                        if ($provider->needed_provider_id == $service_provider_type) {
                            $arrivedAssignment = $this->Patrol_model->getCompletedAssignment($help->id, $service_provider_type);
                            if ($arrivedAssignment != null) {
                                $already_completed = true;
                                break;
                            }
                        }
                    }

                    $help->requested_providers = $provider_list;

                    //get latest location
                    $helpRequestLatestPosition = $this->Help_request_model->retrieveLatestHelpRequestorPosition($help->id);
                    $help->latest_position = $helpRequestLatestPosition;

                    //compute new ETA and distance
                    $computed_dist = GetDrivingDistance($helpRequestLatestPosition->latitude, $service_provider_latitude, $helpRequestLatestPosition->longitude, $service_provider_longitude);
                    $help->latest_position->computed_distance = $computed_dist;

                    //assignment details
                    $assignment_details = $this->Patrol_model->getAssignedPatrols($help->id);
                    $help->assignment_details = $assignment_details;
                    $i = 0;
                    if ($assignment_details != null) {
                        foreach ($assignment_details as $assignment) {
                            $patrol_id = $assignment->patrol_id;
                            $latest_location = $this->Patrol_model->getPatrolLatestLocation($patrol_id);
                            $help->assignment_details[$i]->longitude = $latest_location->longitude;
                            $help->assignment_details[$i]->latitude = $latest_location->latitude;
                            $i++;
                        }
                    }

                    if (!$already_completed) {
                        $helpRequestList[] = $help;
                    }
                }

            }

            $response_array["help_details"] = $helpRequestList;

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);
    }

    public function index_post()
    {

    }

    //initiate help request
    public function initiate_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
            'id' => "",
            'sms_status' => "",
        );

        $insert_id = "";
        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');
            $this->load->model('Circle_model');

            //get parameters
            $customer_name = $this->post('customer_name');
            $age = $this->post('age');
            $bloog_group = $this->post('blood_group');
            $special_conditions = $this->post('special_conditions');
            $device_id = $this->post('device_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');
            $provider_list = $this->post('provider_list');
            $event_type = $this->post('event_type');
            $nic = $this->post('nic');

            //check if any request for this device id is pending
            if ($this->Help_request_model->getLiveHelpRequestByDeviceId($device_id) != null) {
                throw new Exception('Pending request exists for this device id');
            } else {

                //insert in db
                $insert_id = $this->Help_request_model->initiateHelpRequest($customer_name,
                    $age, $bloog_group,
                    $special_conditions,
                    $device_id,
                    $longitude, $latitude, $provider_list, $event_type, $nic);

                //select all concerned patrols and send push notifications
                $providers = explode("|", $provider_list);
                $array_tokens = array();
                foreach ($providers as $provider) {
                    $array_prov_tokens = $this->Patrol_model->getProviderPatrolsTokenIds($provider);
                    if ($array_prov_tokens != null) {
                        foreach ($array_prov_tokens as $patrol_record) {
                            $array_tokens[] = $patrol_record["token"];
                        }
                    }
                }
                $result_notif = sendInitiationRequestNotif($array_tokens);
                $response_array["notification_sent"] = $result_notif;

                //send sms to angels
                $sms_status = array();
                $circles = $this->Circle_model->getCirclesForDeviceId($device_id);
                if ($circles != null) {
                    foreach ($circles as $circle) {
                        $result = sendAngelNotificationSMS($circle->contact_number, $event_type, $customer_name);
                        $sms_status[] = $result;
                    }
                    $response_array["sms_status"] = $sms_status;
                }

            }

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $response_array["id"] = $insert_id;
        $this->response($response_array);

    }

    //initiate help request
    public function addServiceProvider_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');

            //get parameters
            $help_request_id = $this->post('help_request_id');
            $provider_name = $this->post('provider_name');

            $result = $this->Help_request_model->addServiceProvider($help_request_id, $provider_name);

            //select all concerned patrols and send push notifications
            $array_tokens = array();
            $array_prov_tokens = $this->Patrol_model->getProviderPatrolsTokenIds($provider_name);
            if ($array_prov_tokens != null) {
                foreach ($array_prov_tokens as $patrol_record) {
                    $array_tokens[] = $patrol_record["token"];
                }

            }
            sendInitiationRequestNotif($array_tokens);

            $response_array['status'] = $result;
        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

    //cancel help request
    public function cancel_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');

            //get parameters
            $request_id = $this->post('request_id');

            //perform cancellation
            $this->Help_request_model->updateRequestStatus($request_id, "CANCELLED");

            //inform assigned patrols

            //assignment details
            $assignment_details = $this->Patrol_model->getAssignedPatrols($request_id);
            if ($assignment_details != null) {
                foreach ($assignment_details as $assignment) {
                    $patrol_id = $assignment->patrol_id;
                    //retrieve token
                    $patrol_info = $this->Patrol_model->getPatrolInfoById($patrol_id);
                    $token = $patrol_info->token;
                    sendCancellationNotif($token);
                }
            }

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);

    }

    public function updateRequestorLocation_post()
    {
        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
            'assignment_details' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');
            $this->load->model('Patrol_model');

            //get parameters
            $help_request_id = $this->post('help_request_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');

            //update
            $this->Help_request_model->updateHelpRequestorPosition($help_request_id, $longitude, $latitude);

            //get assigned patrols
            $assignment_patrols = $this->Patrol_model->getAssignedPatrols($help_request_id);
            foreach ($assignment_patrols as $assignment) {
                //retrieve location
                $patrol_location = $this->Patrol_model->getPatrolLatestLocation($assignment->patrol_id);

                //recompute distance
                $computed_dist = GetDrivingDistance($patrol_location->latitude, $latitude, $patrol_location->longitude, $longitude);
                $assignment->ETA_min = $computed_dist["time"];
                $assignment->distance_km = $computed_dist["distance"];

                //save recomputed distance
                $this->Patrol_model->updateAssignmentETA($assignment_id, $computed_dist["time"], $computed_dist["distance"]);

            }

            $response_array["assignment_details"] = $assignment_patrols;

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);

    }

    public function test_get()
    {

        $lat1 = "-20.2358373";
        $long1 = "57.4512947";

        $lat2 = "-20.1629776";
        $long2 = "57.4617569";

        $result = GetDrivingDistance($lat1, $lat2, $long1, $long2);

        $this->response($result);
    }

}
