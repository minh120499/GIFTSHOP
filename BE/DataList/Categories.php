<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$stmt = $conn->prepare("SELECT * FROM `categories`");
$stmt->execute();
$conn = NULL;

$data = [];

foreach($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'img' => $value['img']
    );
}

die(json_encode($data));
