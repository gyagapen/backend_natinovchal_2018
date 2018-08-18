<?php

function sendAngelNotificationSMS($number, $event_type, $requestor_name)
{
    $msg = $requestor_name . " needs help! Type of encountered problem: " . $event_type . ". Please log into Mausafe";
    return callSMSAPI($number, $msg);
}

function callSMSAPI($number, $msg)
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

    /*$response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if (curl_errno($ch)) {
    return curl_errno($ch); //probably you want to return false
    }
    if ($httpCode != 200) {
    return $response; //probably you want to return false
    }
    curl_close($ch);
    return $response;*/

    $output = array();
    $output['server_response'] = curl_exec($ch);
    $curl_info = curl_getinfo($ch);
    $output['http_status'] = $curl_info['http_code'];
    curl_close($ch);

    /*if ($output['http_status'] != 201) {
    print "Error sending.  HTTP status " . $output['http_status'];
    print " Response was " . $output['server_response'];
    } else {
    print "Response " . $output['server_response'];
    }*/

    return $output;

}
