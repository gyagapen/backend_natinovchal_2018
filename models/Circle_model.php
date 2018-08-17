<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Circle_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function insertCircle($device_id, $name, $number)
    {
        //insert position into db
        $data = array(
            'device_id' => $device_id,
            'contact_name' => $name,
            'contact_number' => $number,
        );
        $this->db->insert('circle_details', $data);
    }


    public function updateCircle($id, $name, $number)
    {
        $data = array(
            'contact_name' => $name,
            'contact_number' => $number,
        );
        $this->db->where('id', $id);
        $this->db->update('circle_details', $data);
    }

    public function deleteCircle($id)
    {
        $this->db->delete('circle_details', array('id' => $id)); 
    }

    public function getCirclesForDeviceId($device_id)
    {
        $this->db->where('device_id', $device_id);
        $this->db->order_by("id");

        $query = $this->db->get('circle_details');

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return null;
        }
    }

}