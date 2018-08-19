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

        $result = sendAngelNotificationSMS("59807708", "Health", "Cedric");
        print_r($result);

        $this->load->view('welcome_message');
    }
}
