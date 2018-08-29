<?php

function sendAngelNotificationSMS($number, $event_type, $requestor_name)
{
    $msg = $requestor_name . " needs help! Type of encountered problem: " . $event_type . ". Please log into Mausafe";
    return callSMSAPI($number, urlencode($msg));
}


function sendAngelNotificationSMSArrived($number, $provider_name, $requestor_name)
{
    $msg = $provider_name." has reached ".$requestor_name . "! Please log into Mausafe for more details";
    return callSMSAPI($number, urlencode($msg));
}

/*function callSMSAPI($number, $msg)
{
$username = 'FAF42EDB53594758865C042BA04687DF-02-3';
$password = 'v*0MWm00S!lS3uJUJAq!#8twOoecW';
$messages = array('to' => $number, 'body' => $msg);

$url = 'https://api.bulksms.com/v1/messages';

$post_body = json_encode($messages);

$ch = curl_init();
$headers = array(
'Content-Type:application/json',
'Authorization:Basic ' . base64_encode("$username:$password"),
);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_body);

$output = array();
$output['server_response'] = curl_exec($ch);
$curl_info = curl_getinfo($ch);
$output['http_status'] = $curl_info['http_code'];
curl_close($ch);

return $output;

}*/

function callSMSAPI($number, $msg)
{
    $username = "gyagapen";
    $userid = "15747";
    $handle = "5bda5896ebc7e6441db0f5c9960659c9";
    $from = "MauSafe";

    $url = 'https://api.budgetsms.net/sendsms?username=' . $username . '&userid=' . $userid . '&handle=' . $handle . '&msg=' . $msg . '&to=%20230' . $number . '&from=' . $from;

    // Get cURL resource
    $curl = curl_init();
// Set some options - we are passing in a useragent too here
    curl_setopt_array($curl, array(
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL => $url,
        CURLOPT_SSL_VERIFYPEER => false,
    ));

// Send the request & save response to $resp
    $resp = curl_exec($curl);
// Close request to clear up some resources
    curl_close($curl);

    return $resp;

}
