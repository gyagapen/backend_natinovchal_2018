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

            //retrieve help details
            $help_details = $this->Help_request_model->getLiveHelpRequestByDeviceId($device_id);
            $response_array["help_details"] = $help_details;

            if($help_details != null)
            {
                $assignment_details = $this->Patrol_model->getAssignedPatrols($help_details->id);
                $response_array["assignment_details"] = $assignment_details;
            }

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
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Help_request_model');

            //get parameters
            $customer_name = $this->post('customer_name');
            $age = $this->post('age');
            $bloog_group = $this->post('blood_group');
            $special_conditions = $this->post('special_conditions');
            $device_id = $this->post('device_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');
            $provider_list = $this->post('provider_list');

            //check if any request for this device id is pending
            if ($this->Help_request_model->getLiveHelpRequestByDeviceId($device_id) != null) {
                throw new Exception('Pending request exists for this device id');
            } else {

                //insert in db
                $insert_id = $this->Help_request_model->initiateHelpRequest($customer_name,
                    $age, $bloog_group,
                    $special_conditions,
                    $device_id,
                    $longitude, $latitude, $provider_list);
            }

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $response_array["id"] = $insert_id;
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

            //get parameters
            $request_id = $this->post('request_id');

            //check if any request for this device id is pending
            $this->Help_request_model->updateRequestStatus($request_id, "CANCELLED");

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);

    }

    public function updateRequestorLocation()
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

            //get parameters
            $help_request_id = $this->post('help_request_id');
            $longitude = $this->post('longitude');
            $latitude = $this->post('latitude');

            //check if any request for this device id is pending
            $this->Help_request_model->updateHelpRequestorPosition($help_request_id, $longitude, $latitude);

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
