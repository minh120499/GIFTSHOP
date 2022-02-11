<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';


$stmt = $conn->prepare('SELECT * FROM `administrator`');
$stmt->execute();
$conn = null;
$list = $stmt->fetchAll();
$data = [];
foreach ($list as $key => $value) {
    $data[] = array(
        'aboutus' => $value['aboutus'],
        'address' => $value['address'],
        'email' => $value['email'],
        'phone' => $value['phone'],
        'logo' => $value['logo'],
    );
}
die(json_encode($data));
