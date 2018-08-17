<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Patrol extends REST_Controller
{

    //assign patrol to help request
    public function assign_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
            'distance' => "",
            'ETA' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Patrol_model');

            //get parameters
            $help_request_id = $this->post('help_request_id');
            $patrol_id = $this->post('patrol_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');
            $device_id = $this->post('device_id');
            $patrol_type = $this->post('patrol_type');

            //assign patrol
            if ($this->Patrol_model->getAssignedHelpRequest($help_request_id, $patrol_id) == null) {
                $insert_id = $this->Patrol_model->assignPatrol($help_request_id, $patrol_id, $patrol_type);
            } else {
                throw new Exception('Patrol already assigned');
            }

            //update location
            $result = $this->updateHelpRequestStatusFromPatrol($help_request_id, $patrol_id, $latitude, $longitude, $device_id);

            $response_array["id"] = $insert_id;
            $response_array["distance"] = $result["distance"];
            $response_array["ETA"] = $result["time"];

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

    //cancel patrol intervention
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
            $this->load->model('Patrol_model');

            //get parameters
            $assignment_id = $this->post('assignment_id');

            //assign patrol
            $this->Patrol_model->updateStatus($assignment_id, 'CANCELLED');

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

    public function infoPerDeviceName_get()
    {
        $response_array = array(
            'status' => true,
            'error' => "",
            'patrol_info' => null,
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Patrol_model');

            //get parameters
            $device_id = $this->get('device_id');

            $patrol_info = $this->Patrol_model->getPatrolInfo($device_id);

            $response_array["patrol_info"] = $patrol_info;
        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);
    }

    public function registerPatrol_post()
    {
        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
            'id' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Patrol_model');

            //get parameters
            $device_id = $this->post('device_id');
            $desc = $this->post('desc');
            $provider = $this->post('provider');
            $token = $this->post('token');
            $mobile_number = $this->post('mobile_number');

            //check if not already assigned
            $patrol_info = $this->Patrol_model->getPatrolInfo($device_id);
            if ($patrol_info == null) {
                $insert_id = $this->Patrol_model->insertPatrolInfo($desc, $device_id, $provider, $token, $mobile_number);
                $response_array["id"] = $insert_id;
            } else {
                $response_array["status"] = false;
                $response_array["error"] = "Patrol already assigned";
            }

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);
    }

    public function updatePatrolRegistration_post()
    {
        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Patrol_model');

            //get parameters
            $device_id = $this->post('device_id');
            $provider = $this->post('provider');
            $description = $this->post('description');
            $mobile_number = $this->post('mobile_number');

            $this->Patrol_model->updatePatrolInfo($device_id, $provider, $description, $mobile_number);

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);
    }

    public function logPatrolArrival_post()
    {
        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
            'all_arrived' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Patrol_model');
            $this->load->model('Help_request_model');

            //get parameters
            $patrol_id = $this->post('patrol_id');
            $help_request_id = $this->post('help_request_id');

            //update status
            $this->Patrol_model->updateStatusByPatrolId($help_request_id, $patrol_id, "ARRIVED");

            //check global status
            $all_arrived = true;
            //for each needed provider
            $needed_providers = $this->Help_request_model->getNeededProviders($help_request_id);
            foreach ($needed_providers as $provider) {
                $provider_id = $provider->needed_provider_id;
                //check if any completed assignment
                $arrivedAssignment = $this->Patrol_model->getCompletedAssignment($help_request_id, $provider_id);
                if ($arrivedAssignment == null) {
                    $all_arrived = false;
                    break;
                }
            }

            if ($all_arrived) {
                //update status of request to COMPLETED
                $this->Help_request_model->updateRequestStatus($help_request_id, "COMPLETED");
            }

            $response_array["all_arrived"] = $all_arrived;

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);
    }

    public function updatePatrolPosition_post()
    {
        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            //get parameters
            $patrol_id = $this->post('patrol_id');
            $help_request_id = $this->post('help_request_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');

            $this->updateHelpRequestStatusFromPatrol($help_request_id, $patrol_id, $latitude, $longitude, "");

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);
    }

    public function test_get()
    {
        $token_ids = array('d8DozVGRcGI:APA91bH5KohTrBn8U5-6aPyHq09Hal_L8NC6QqJu4RSsQg0zu_9v-60hWAm33DjaKda-RsvQRL_PM60lH9TbJgNk7TrcEma0a3RmtzDU_nfiaA4vOVSLEWZLKc13h-9ZbOCZj6_TanRdeNAtkqoykx9PYj88_NXtPQ');

        //$result = sendFireBaseNotif($token_ids, 'test','100',$title=null,$sub_title=null,$device_type=null,$data = null,$content_available = null);
        $result = sendInitiationRequestNotif($token_ids);

        $this->response($result);

    }

    /************ PRIVATE FUNCTIONS ***************/

    private function updateHelpRequestStatusFromPatrol($help_request_id, $patrol_id, $latitude, $longitude, $device_id)
    {
        $this->CI = &get_instance();
        $this->load->model('Help_request_model');
        $this->load->model('Patrol_model');

        //update patrol location
        $this->Patrol_model->updatePatrolPostition($patrol_id, $longitude, $latitude);

        //get requestor latest position
        $requestor_position = $this->Help_request_model->retrieveLatestHelpRequestorPosition($help_request_id);

        //compute new ETA and distance
        $computed_dist = GetDrivingDistance($requestor_position->latitude, $latitude, $requestor_position->longitude, $longitude);

        //update patrol location and ETA/distance
        $this->Patrol_model->updatePatrolETA($help_request_id, $patrol_id, $computed_dist["time"], $computed_dist["distance"]);

        return $computed_dist;
    }

}
