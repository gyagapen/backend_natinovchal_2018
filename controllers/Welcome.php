<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Welcome extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *         http://example.com/index.php/welcome
     *    - or -
     *         http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function index()
    {

        $this->load->model('Patrol_model');

        /*$provider_list = "SAMU|POLICE|FIREMEN";
        //select all concerned patrols and send push notifications
        $providers = explode("|", $provider_list);
        $array_tokens = array();
        foreach ($providers as $provider) {
        $array_prov_tokens = $this->Patrol_model->getProviderPatrolsTokenIds($provider);
        if ($array_prov_tokens != null) {
        foreach ($array_prov_tokens as $patrol_record) {
        $array_tokens[] = $patrol_record["token"];
        }
        }
        }

        print_r($array_tokens);
        $result_notif = sendInitiationRequestNotif($token_ids);
        print_r($result_notif);*/

        //$result = $this->Patrol_model->purgePatrolLocation();

        $this->load->view('login');
    }

    public function requests()
    {
        $headers = array(
            'x-api-key:58eb50e1-f87b-44a7-a4be-dcccd71625eb'
        );

        $provider_type = "FIREMAN";

        $payload = array(
            'service_provider_type' => $provider_type,
            'longitude' => '57.48913900',
            'latitude' =>'-20.25491100',
        );
    
        //get unassigned requests
        $get_url = base_url()."index.php/HelpRequest/retrievePendingRequestForProvider?service_provider_type=FIREMAN&longitude=57.48913900&latitude=-20.25491100&station_id=0";
        $process = curl_init($get_url); //your API url
        curl_setopt($process, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($process, CURLOPT_HEADER, false);
        curl_setopt($process, CURLOPT_RETURNTRANSFER, true);
        $return = curl_exec($process);
        curl_close($process);
        $data["response"] = json_decode ($return) ;

        //get assigned requests
        $get_url_assigned = base_url()."index.php/HelpRequest/retrievePendingRequestForProvider?service_provider_type=FIREMAN&longitude=57.48913900&latitude=-20.25491100&station_id=-1";
        $process_assigned  = curl_init($get_url_assigned ); //your API url
        curl_setopt($process_assigned , CURLOPT_HTTPHEADER, $headers);
        curl_setopt($process_assigned , CURLOPT_HEADER, false);
        curl_setopt($process_assigned , CURLOPT_RETURNTRANSFER, true);
        $return_assigned  = curl_exec($process_assigned );
        curl_close($process_assigned );
        $data["response_assigned"] = json_decode ($return_assigned) ;

        //get stations
        $this->load->model('Patrol_model');
        $data["stations"] = $this->Patrol_model->getAvailableStations($provider_type);

        $this->load->view('pending_requests', $data);
    }

   


    public function getVideo($id)
    {
        $this->load->model('Help_request_model');

        $help_request = $this->Help_request_model->getHelpRequestById($id);
        header('Content-Type: video/mp4'); 

        print($help_request->video);
    }

    public function assignRequest($help_id, $station_id)
    {
        $provider_type = "FIREMAN";
        $this->load->model('Help_request_model');
        $this->load->model('Patrol_model');

        $this->Help_request_model->assignStationToHelpRequest($help_id, $provider_type, $station_id);

        //send notifications
        $array_prov_tokens = $this->Patrol_model->getProviderPatrolsTokenIdsForStation($provider_type, $station_id);
        $array_tokens = array();
        if ($array_prov_tokens != null) {
            foreach ($array_prov_tokens as $patrol_record) {
                $array_tokens[] = $patrol_record["token"];
            }
        }
        sendInitiationRequestNotif($array_tokens);

        //success messgge
        $this->session->set_flashdata('success', 'Assignment Done');

        //redirect
        redirect('index.php/welcome/requests');
    }




}
