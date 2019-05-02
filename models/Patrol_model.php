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

    public function getPatrolLatestLocation($patrol_id)
    {
        $this->db->where('patrol_id', $patrol_id);
        $this->db->order_by("date_time", "desc");
        $query = $this->db->get('service_provider_patrol_location');

        return $query->first_row();
    }

    
    public function getAvailableStations($provider_type)
    {
        $query = $this->db->get_where('service_provider_station', array('service_provider_id' => $provider_type));

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

    public function assignPatrol($help_request_id, $patrol_id, $patrol_type)
    {
        //assign patrol to help request
        $data = array(
            'help_request_id' => $help_request_id,
            'patrol_id' => $patrol_id,
            'service_provider_type' => $patrol_type,
            'status' => 'TRANSIT',
        );
        $this->db->insert('service_provider_patrol_assignment', $data);
        $insert_id = $this->db->insert_id();

        return $insert_id;

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

    public function updatePatrolETA($help_request_id, $patrol_id, $ETA_min, $distance_km)
    {
        $data = array(
            'ETA_min' => $ETA_min,
            'distance_km' => $distance_km,
        );

        $this->db->where('help_request_id', $help_request_id);
        $this->db->where('patrol_id', $patrol_id);
        $this->db->update('service_provider_patrol_assignment', $data);
    }

    public function getAssignedHelpRequest($help_request_id, $patrol_id)
    {
        $this->db->where('help_request_id', $help_request_id);
        $this->db->where('patrol_id', $patrol_id);
        $this->db->where('status', 'TRANSIT');
        $this->db->order_by("id", "desc");

        $query = $this->db->get('service_provider_patrol_assignment');

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function updateAssignmentETA($assignment_id, $ETA_min, $distance_km)
    {
        $data = array(
            'ETA_min' => $ETA_min,
            'distance_km' => $distance_km,
        );

        $this->db->where('id', $assignment_id);
        $this->db->update('service_provider_patrol_assignment', $data);
    }

    public function updateStatus($assignment_id, $new_status)
    {
        $data = array(
            'status' => $new_status,
        );

        $this->db->where('id', $assignment_id);
        $this->db->update('service_provider_patrol_assignment', $data);
    }

    public function updateStatusByPatrolId($help_request_id, $patrol_id, $new_status)
    {
        $data = array(
            'status' => $new_status,
        );

        $this->db->where('patrol_id', $patrol_id);
        $this->db->where('help_request_id', $help_request_id);
        $this->db->update('service_provider_patrol_assignment', $data);
    }

    public function getAssignedPatrols($help_request_id)
    {
        $this->db->where('help_request_id', $help_request_id);
        $this->db->where('status !=', 'CANCELLED');

        $query = $this->db->get('service_provider_patrol_assignment');

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

    public function getProviderPatrolsTokenIds($provider)
    {
        $this->db->where('service_provider_id', $provider);
        $this->db->where('token is NOT NULL', null, false);
        $this->db->where("token <>''", null, false);

        $query = $this->db->get('service_provider_patrol');

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return null;
        }
    }

    public function getPatrolInfo($device_id)
    {
        $this->db->where('device_id', $device_id);
        $query = $this->db->get('service_provider_patrol');

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

    public function getPatrolInfoById($patrol_id)
    {
        $this->db->where('id', $patrol_id);
        $query = $this->db->get('service_provider_patrol');

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function insertPatrolInfo($desc, $device_id, $provider, $token, $mobile_number)
    {
        //insert position into db
        $data = array(
            'description' => $desc,
            'device_id' => $device_id,
            'service_provider_id' => $provider,
            'token' => $token,
            'mobile_number' => $mobile_number,
        );

        $this->db->insert('service_provider_patrol', $data);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }

    public function updatePatrolInfo($device_id, $provider, $description, $mobile_number)
    {
        //insert position into db
        $data = array(
            'service_provider_id' => $provider,
            'description' => $description,
            'mobile_number' => $mobile_number,

        );

        $this->db->where('device_id', $device_id);
        $this->db->update('service_provider_patrol', $data);
    }

    public function getCompletedAssignment($help_request_id, $provider_id)
    {
        $this->db->where('help_request_id', $help_request_id);
        $this->db->where('service_provider_type', $provider_id);
        $this->db->where('status', 'ARRIVED');

        $query = $this->db->get('service_provider_patrol_assignment');

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function purgePatrolLocation()
    {
        $sql = "DELETE FROM service_provider_patrol_location WHERE date_time < DATE_SUB(NOW(), INTERVAL 12 HOUR)";
        $query = $this->db->query($sql);

        //return $query->result_array();
    }

}
