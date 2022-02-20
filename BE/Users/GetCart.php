<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT ordersdetail.*,
                               products.`name`,
                               products.`sold`,
                               products.view,
                               products.rating,
                               products.detail,
                               total,
                               `brand`.`name` as brand
                            FROM `orders` 
                        INNER JOIN `ordersdetail` 
                        INNER JOIN `products` 
                        INNER JOIN `users`
                        INNER JOIN `brand`
                            WHERE `orders`.`id` = `ordersdetail`.`orderid`
                              AND `brand`.`id` = `products`.`brand`
                              AND `products`.`id` = `ordersdetail`.`productid` 
                              AND `status` = 'unpaid'
                              AND `users`.`username` = :id");

$stmt->bindParam('id', $_POST['userid']);
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'productid' => $value['productid'],
        'name' => $value['name'],
        // 'img' => $value['img'],
        'price' => $value['price'],
        'quantity' => $value['quantity'],
        'coupon' => $value['coupon'],
        'sold' => $value['sold'],
        'view' => $value['view'],
        'rating' => $value['rating'],
        'orderid' => $value['orderid'],
        'detail' => $value['detail'],
        'brand' => $value['brand']
    );
}

die(json_encode($data));
