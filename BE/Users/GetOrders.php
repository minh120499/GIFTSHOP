<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT `orders`.*
                            FROM `orders` 
                            INNER JOIN `users` 
                         WHERE `orders`.`userid` = `users`.`id` 
                           AND `users`.`username` = :id");

$stmt->bindParam('id',$_POST['userid']);
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'toname' => $value['toname'],
        'toaddress' => $value['toaddress'],
        'toemail' => $value['toemail'],
        'tophone' => $value['tophone'],
        'total' => $value['total'],
        'status' => $value['status'],
        'payment' => $value['payment']
    );
}

die(json_encode($data));
