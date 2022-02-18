<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT * FROM `orders`
	INNER JOIN `ordersdetail`
    INNER JOIN `products`
    WHERE `orders`.`id` = `ordersdetail`.`orderid`
    	AND `ordersdetail`.`productid` = `products`.`id`");
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'to' => $value['firstname'],
        'lastname' => $value['lastname'],
        'address' => $value['address'],
        'email' => $value['email'],
        'phone' => $value['phone'],
        'avatar' => $value['avatar'],
        'birthday' => $value['birthday']
    );
}

die(json_encode($data));
