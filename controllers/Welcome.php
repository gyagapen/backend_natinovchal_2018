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

        $payload = array(
            'service_provider_type' => "FIREMAN",
            'longitude' => '57.48913900',
            'latitude' =>'-20.25491100',
        );
    
        $get_url = base_url()."index.php/HelpRequest/retrievePendingRequestForProvider?service_provider_type=FIREMAN&longitude=57.48913900&latitude=-20.25491100";
        $process = curl_init($get_url); //your API url
        curl_setopt($process, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($process, CURLOPT_HEADER, false);
        curl_setopt($process, CURLOPT_RETURNTRANSFER, true);
        $return = curl_exec($process);
        curl_close($process);
    
        $data["response"] = json_decode ($return) ;

        $this->load->view('pending_requests', $data);
    }

    public function getVideo($id)
    {
        $this->load->model('Help_request_model');

        $help_request = $this->Help_request_model->getHelpRequestById($id);
        header('Content-Type: video/mp4'); 

        print($help_request->video);
    }

}
