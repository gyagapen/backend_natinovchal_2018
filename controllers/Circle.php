<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Circle extends REST_Controller
{

    public function index_get()
    {
        //get circles for a device
        $response_array = array(
            'status' => true,
            'error' => "",
            'circles' => null,
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Circle_model');

            //get parameters
            $device_id = $this->get('device_id');

            $circles = $this->Circle_model->getCirclesForDeviceId($device_id);
            $response_array["circles"] = $circles;

        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }
        $this->response($response_array);
    }

    //insert cirlce
    public function insert_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Circle_model');

            //get parameters
            $device_id = $this->post('device_id');
            $circle_name = $this->post('name');
            $circle_number = $this->post('number');

            $this->Circle_model->insertCircle($device_id, $circle_name, $circle_number);

            $response_array['status'] = true;
        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

    //update_cirlce
    public function update_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Circle_model');

            //get parameters
            $circle_id = $this->post('id');
            $circle_name = $this->post('name');
            $circle_number = $this->post('number');

            $this->Circle_model->updateCircle($circle_id, $circle_name, $circle_number);

            $response_array['status'] = true;
        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

    //delete cirlce
    public function delete_post()
    {

        //initialization
        $response_array = array(
            'status' => true,
            'error' => "",
        );

        try
        {
            $this->CI = &get_instance();
            $this->load->model('Circle_model');

            //get parameters
            $id = $this->post('id');

            $this->Circle_model->deleteCircle($id);

            $response_array['status'] = true;
        } catch (Exception $e) {
            $response_array["status"] = false;
            $response_array["error"] = $e->getMessage();
        }

        $this->response($response_array);

    }

}
