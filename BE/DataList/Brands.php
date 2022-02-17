<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$sql = "SELECT `brand`.*,COUNT(1) AS `quantity` FROM `brand` INNER JOIN `products` WHERE `brand`.`id` = `products`.`brand` GROUP BY `brand`.`id`;";
$stmt = $conn->prepare("$sql");
$stmt->execute();

$data = [];

foreach( $stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'img' => $value['img'],
        'id' => $value['id'],
        'quantity' => $value['quantity']
    );
}

die(json_encode($data));