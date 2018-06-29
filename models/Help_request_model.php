<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Help_request_model extends CI_Model {
    
    public function __construct() {
        $this->load->database();
    }

    public function initiateHelpRequest($customer_name, $age, $bloog_group, $special_conditions, $device_id, $longitude, $latitude, $provider_list)
    {
        //insert help request
        $data = array(
        'name' => $customer_name,
        'age' => $age,
        'blood_group' => $bloog_group,
        'special_conditions' => $special_conditions,
        'device_id' => $device_id);

        $this->db->insert('help_request', $data);
        $insert_id = $this->db->insert_id();

        //insert help_request location
        $data_location = array(
            'help_request_id' => $insert_id,
            'longitude' => $longitude,
            'latitude' => $latitude
        );
        $this->db->set('date_time', 'NOW()', FALSE);
        $this->db->insert('help_request_location', $data_location);

        //insert help_request_providers
        $providers = explode("|", $provider_list);
        foreach($providers as $provider)
        {
            $data_provider = array(
                'help_request_id' => $insert_id,
                'needed_provider_id' => $provider,
            );
            $this->db->insert('help_request_provider_need', $data_provider);
        }


    }



}
