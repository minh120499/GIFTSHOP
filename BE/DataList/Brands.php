<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$sql = "SELECT * FROM `brand`";
$stmt = $conn->prepare("$sql");
$stmt->execute();

$data = [];

foreach( $stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'img' => $value['img'],
        'id' => $value['id']
    );
}

die(json_encode($data));