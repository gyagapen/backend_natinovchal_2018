<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class HelpRequest extends REST_Controller
{
  public function index_get()
  {
    // Display all book

    $this->response('ok');
  }

  public function index_post()
  {
    // Create a new book
  }

  public function test_get()
  {
    $this->CI =& get_instance();
    $this->load->model('Help_request_model');

    $response_array = array(
      'error_code' => 0,
      'error_msg' => ""
    );

    try{
        //test db functions
        $customer_name = "Cedric Azemia";
        $age = "28";
        $bloog_group = "A";
        $special_conditions = "Asthma, Cardiac";
        $device_id = "sdf4sdf654sf54sf651";
        $longitude = "20.556";
        $latitude = "18.557";
        $provider_list = "POLICE|SAMU|FIRE";
        $this->Help_request_model->initiateHelpRequest($customer_name,
                                                      $age, $bloog_group, 
                                                      $special_conditions, 
                                                      $device_id, 
                                                      $longitude, $latitude, $provider_list);
      }catch(Exception $e)
      {
        $response_array["error_code"] = -1;
        $response_array["error_msg"] = $e->getMessage();
      }
      $this->response($response_array);
  }
}