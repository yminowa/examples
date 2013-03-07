<?php
require_once 'HTTP/Request2.php';

$apiKey     = 'your-api-key';
$templateId = 'your-template-id';

$data = array('pages' => array(
  array('name' => 'John'), 
  array('name' => 'ジョン')
));

$api = new HTTP_Request2(
  "https://repoten-api.net/api/templates/{$templateId}.pdf?key={$apiKey}");
$api->setConfig('ssl_verify_peer', false);

$api->setMethod(HTTP_Request2::METHOD_POST)
    ->setHeader('Content-Type', 'application/json')
    ->setBody(json_encode($data));

$response = $api->send();

if ($response->getStatus() == '200') {
  $pdf = fopen('result.pdf', 'w');
  fwrite($pdf, $response->getBody());
  fclose($pdf);
} else {
  exit("Error: {$response->getBody()}");
}
