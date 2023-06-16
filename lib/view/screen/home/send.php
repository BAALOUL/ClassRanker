function sendGCM($title, $message, $topic, $pageid, $pagename)
{
    $url= '';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'conttent_available' => true,

        'notification' => array(
            "body" => $message,
            "title" => $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",,
            "sound" => "default"
        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )
    );
 
    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key='."AAAAcSf7gKY:APA91bEhHE3iACTMrXRCjqw2oxXQLen5heog4R7NySohhIbqtAdWJJjQ15ARRVZ2t7QVCWx1uxJVnNnlB3NC35WzzgUGTWUrF2qDJqhatposIOFnFFTZ_QiFcghCc8NnUGA3VVhMWa-6",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}