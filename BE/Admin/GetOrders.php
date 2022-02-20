<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT `orders`.*,
                               `ordersdetail`.*,
                               `products`.`name`
                        FROM `orders` 
                          INNER JOIN `ordersdetail` 
                          INNER JOIN `products` 
                        WHERE `orders`.`id` = `ordersdetail`.`orderid` 
                          AND `ordersdetail`.`productid` = `products`.`id`");
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'date' => $value['date'],
        'toname' => $value['toname'],
        'toemail' => $value['toemail'],
        'tophone' => $value['tophone'],
        'toaddress' => $value['toaddress'],
        'payment' => $value['payment'],
        'status' => $value['status'],
        'total' => $value['total'],
        'quantity' => $value['quantity'],
        'price' => $value['price'],
        'img' => $value['img'],
        'coupon' => $value['coupon'],
        'name' => $value['name']
    );
}

die(json_encode($data));
