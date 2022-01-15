<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';
// $db = new Database();
// $conn = $db->connect();

$stmt = $conn->prepare('SELECT * FROM Admin');
$conn = null; 
$stmt->execute();
$list = $stmt->fetchAll();
$data = [];
foreach( ($list) as $key=>$value) {
    $data[] = $value;
}
die(json_encode($data));