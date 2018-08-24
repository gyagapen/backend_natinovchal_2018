<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Help_request_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function initiateHelpRequest($customer_name, $age, $bloog_group, $special_conditions, $device_id, $longitude, $latitude, $provider_list, $event_type, $nic)
    {
        //insert help request
        $data = array(
            'name' => $customer_name,
            'age' => $age,
            'blood_group' => $bloog_group,
            'special_conditions' => $special_conditions,
            'device_id' => $device_id,
            'status' => 'PENDING',
            'event_type' => $event_type,
            'NIC' => $nic
        );

        $this->db->insert('help_request', $data);
        $insert_id = $this->db->insert_id();

        //insert help_request location
        $data_location = array(
            'help_request_id' => $insert_id,
            'longitude' => $longitude,
            'latitude' => $latitude,
        );
        $this->db->set('date_time', 'NOW()', false);
        $this->db->insert('help_request_location', $data_location);

        //insert help_request_providers
        $providers = explode("|", $provider_list);
        foreach ($providers as $provider) {
            $data_provider = array(
                'help_request_id' => $insert_id,
                'needed_provider_id' => $provider,
            );
            $this->db->insert('help_request_provider_need', $data_provider);

        }

        


        return $insert_id;

    }

    public function addServiceProvider($help_request_id, $provider_name)
    {
        $result = false;

        if (!$this->serviceProviderExistsForHelpRequest($help_request_id, $provider_name)) {
            $data_provider = array(
                'help_request_id' => $help_request_id,
                'needed_provider_id' => $provider_name,
            );
            $this->db->insert('help_request_provider_need', $data_provider);
            $result = true;
        }

        return $result;
    }

    public function getLiveHelpRequestByDeviceId($device_id)
    {
        $query = $this->db->get_where('help_request', array('device_id' => $device_id, 'status' => 'PENDING'));

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function getHelpRequestById($help_request_id)
    {
        $query = $this->db->get_where('help_request', array('id' => $help_request_id));

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function getLiveHelpRequestByProviderType($service_provider_type)
    {

        $this->db->select('help_request.*');
        $this->db->from('help_request');
        $this->db->where('help_request_provider_need.needed_provider_id', $service_provider_type);
        $this->db->where('status', 'PENDING');
        $this->db->join('help_request_provider_need', 'help_request_provider_need.help_request_id = help_request.id');
        

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

    public function serviceProviderExistsForHelpRequest($help_request_id, $provider_name)
    {
        $query = $this->db->get_where('help_request_provider_need', array('help_request_id' => $help_request_id, 'needed_provider_id' => $provider_name));

        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getNeededProviders($help_request_id)
    {
        $query = $this->db->get_where('help_request_provider_need', array('help_request_id' => $help_request_id));

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

    public function getLiveHelpRequestbyReqId($request_id)
    {
        $query = $this->db->get_where('help_request', array('id' => $request_id, 'status' => 'PENDING'));

        if ($query->num_rows() > 0) {
            return $query->first_row();
        } else {
            return null;
        }
    }

    public function updateRequestStatus($request_id, $new_status)
    {
        $data = array(
            'status' => $new_status,
        );

        $this->db->where('id', $request_id);
        $this->db->update('help_request', $data);
    }

    public function retrieveLatestHelpRequestorPosition($help_request_id)
    {
        $this->db->where('help_request_id', $help_request_id);
        $this->db->order_by("date_time", "desc");
        $query = $this->db->get('help_request_location');

        return $query->first_row();
    }

    public function updateHelpRequestorPosition($help_request_id, $longitude, $latitude)
    {
        $data_location = array(
            'help_request_id' => $help_request_id,
            'longitude' => $longitude,
            'latitude' => $latitude,
        );
        $this->db->set('date_time', 'NOW()', false);
        $this->db->insert('help_request_location', $data_location);
    }



}
