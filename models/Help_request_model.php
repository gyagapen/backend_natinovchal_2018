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

    public function initiateHelpRequest($customer_name, $age, $bloog_group, $special_conditions, 
                                        $device_id, $longitude, $latitude, $provider_list, $event_type, $nic,
                                        $is_witness, $impact_type, $building_type, $no_floors, $samu_needed,
                                        $person_trapped, $video_path, $video_filename)
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
            'NIC' => $nic,
            'is_witness' => $is_witness
        );

        //witness details
        if($is_witness == 1)
        {
            $data_witness = array(
                'impact_type' => $impact_type,
                'building_type' => $building_type,
                'no_floors' => $no_floors,
                'samu_needed' => $samu_needed,
                'person_trapped' => $person_trapped,
                'video' => file_get_contents($video_path),
                'video_filename' => $video_filename
            );

            $data = array_merge($data, $data_witness);
        }

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

            if($provider == "FIREMAN"){
                $assignment_required = 1;
            } else {
                $assignment_required = 0;
            }

            $data_provider = array(
                'help_request_id' => $insert_id,
                'needed_provider_id' => $provider,
                'assignment_required' => $assignment_required,
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

    public function getLiveHelpRequestByProviderType($service_provider_type, $station_id)
    {

        $this->db->select('help_request.*');
        $this->db->select('help_request_provider_need.assignment_required');
        $this->db->select('help_request_provider_need.assigned_station');
        $this->db->from('help_request');
        $this->db->where('help_request_provider_need.needed_provider_id', $service_provider_type);
        
        //-1 => retrieve all assigned request for this provider
        if($station_id != -1){
            $this->db->where('help_request_provider_need.assigned_station', $station_id);
        } else{
            $this->db->where('help_request_provider_need.assigned_station != ', '0');
        }

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


    public function assignStationToHelpRequest($help_id, $provider_type, $station_id)
    {
        $data = array(
            'assigned_station' => $station_id,
        );

        $this->db->where('help_request_id', $help_id);
        $this->db->where('needed_provider_id', $provider_type);
        $this->db->update('help_request_provider_need', $data);
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


    public function uploadVideo($request_id, $filePath, $fileName)
    {
        $data = array(
            'video' => file_get_contents($filePath),
            'video_filename' => $fileName
        );

        $this->db->where('id', $request_id);
        $this->db->update('help_request', $data);
    }




}
