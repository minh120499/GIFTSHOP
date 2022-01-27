<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';


$stmt = $conn->prepare('SELECT * FROM `administrator`');
$stmt->execute();
$conn = null; 
$list = $stmt->fetchAll();
$data = [];
foreach( $list as $key=>$value) {
    $data['aboutus'] = $value['aboutus'];
    $data['address'] = $value['address'];
    $data['email'] = $value['email'];
    $data['phone'] = $value['phone'];
    $data['logo'] = $value['logo'];
}
die(json_encode($data));