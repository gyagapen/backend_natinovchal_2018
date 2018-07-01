<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Patrol_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function assignPatrol($help_request_id, $patrol_id, $ETA_min, $distance_km)
    {
        //assign patrol to help request
        $data = array(
            'help_request_id' => $help_request_id,
            'patrol_id' => $patrol_id,
            'ETA_min' => $ETA_min,
            'distance_km' => $distance_km,
            'status' => 'TRANSIT'   
        );
        $this->db->insert('service_provider_patrol_assignment', $data);
        $insert_id = $this->db->insert_id();

    }

    public function updatePatrolPostition($patrol_id, $longitude, $latitude)
    {
        //insert position into db
        $data = array(
            'patrol_id' => $patrol_id,
            'longitude' => $longitude,
            'latitude' => $latitude,    
        );
        $this->db->set('date_time', 'NOW()', false);
        $this->db->insert('service_provider_patrol_location', $data);
    }



}