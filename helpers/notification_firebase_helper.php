<?php

function sendInitiationRequestNotif($deviceTokens)
{
        $title = "EMERGENCY";
        $message = "New EMERGENCY request received. Click here to act upon";
        return sendFireBaseNotif($deviceTokens, $message, $title);
}

function sendCancellationNotif($token)
{
        $title = "CANCELLATION";
        $message = "Your assignment has been CANCELLED";
        return sendFireBaseNotif(array($token), $message, $title);
}

function sendFireBaseNotif($deviceTokens, $message,$title=null,$sub_title=null,$device_type=null,$data = null,$content_available = null, $type = 'high')
{

    if($content_available == 1){
        $content_available = false;
    }else{
        $content_available =  true;
    }
    if($type == 12 || $type == 13){
        $priority = '';
    }else{
        $priority = 'high';
    }

    //$deviceToken = array_values($deviceToken);
    $no = null;

    $apiKey = "AAAATVBvGmY:APA91bGXyAPo7H2gl3lOtre8D_ezxqGUWFva0wYKBAeXwOmb-KNYf-1nDyccLSC3HqE14EdmAItFO2VTnBoCDwvQ4it_nn7gJs3Bmv0YftOwL6SCct9jH11MeGdgeLyEKEO2BRdC3XMgQFHP5WhHLFiXS3ALO5BtPA";

    $notification = array("text" => "test",'badge' => "1",'sound' => 'shutter.wav','body'=>$message,'icon'=>'notif_icn','title'=>$title,'priority'=>'high','tag'=>'test','vibrate'=> 1,'alert'=> $message);

    $msg = array('message'=> $message,'title'=> $title,'sub_title'=> $sub_title,'type'=>$type,'activitydata' => $data);

    if($device_type == 'android'){
        $fields = array("content_available" => true,"priority" => "high",'registration_ids'=> $deviceTokens,'data'=> $msg);
    }else{
        $fields = array('notification' => $notification,"content_available" => $content_available,"priority" => $priority,'registration_ids'=> $deviceTokens,'data'=> $msg);
    }

    $headers = array('Authorization: key=' . $apiKey,'Content-Type: application/json');

    if ($headers){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://fcm.googleapis.com/fcm/send");
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $response = curl_exec($ch);
    }
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if (curl_errno($ch)) {
            return false; //probably you want to return false
        }
        if ($httpCode != 200) {
            return false; //probably you want to return false
        }
        curl_close($ch);
        return $response;
}
