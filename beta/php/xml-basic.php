<?php
require_once 'HTTP/Request2.php';

$templateId = 'your-template-id';

$data = <<<XML
<?xml version="1.0" encoding="UTF-8"?>
<pages type="array">
  <page>
    <name>John</name>
  </page>
  <page>
    <name>ジョン</name>
  </page>
</pages>
XML;

$api = new HTTP_Request2("https://repoten-api.net/api/templates/{$templateId}.pdf");
$api->setConfig('ssl_verify_peer', false);

$api->setMethod(HTTP_Request2::METHOD_POST)
  ->setHeader('Content-Type', 'application/xml')
  ->setBody($data);

$response = $api->send();

if ($response->getStatus() == '200') {
  $pdf = fopen('result.pdf', 'w');
  fwrite($pdf, $response->getBody());
  fclose($pdf);
} else {
  exit("Error: {$response->getBody()}");
}
