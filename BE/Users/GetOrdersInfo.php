<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT ordersdetail.*,
                               products.`name`,
                               products.`sold`,
                               products.view,
                               products.rating,
                               products.detail
                            FROM `orders` 
                        INNER JOIN `ordersdetail` 
                        INNER JOIN `products` 
                            WHERE `orders`.`id` = `ordersdetail`.`orderid`
                              AND `products`.`id` = `ordersdetail`.`productid` 
                              AND `orders`.`id` = :id");

$stmt->bindParam('id', $_POST['orderid']);
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'productid' => $value['productid'],
        'name' => $value['name'],
        'img' => $value['img'],
        'price' => $value['price'],
        'quantity' => $value['quantity'],
        'coupon' => $value['coupon'],
        'sold' => $value['sold'],
        'view' => $value['view'],
        'rating' => $value['rating'],
        'detail' => $value['detail']
    );
}

die(json_encode($data));
