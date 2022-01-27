<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$stmt = $conn->prepare("SELECT * FROM `products` 
                            INNER JOIN `productdetails` 
                            INNER JOIN (SELECT `src`,`productid` FROM `img` GROUP BY `productid`) as a 
                        WHERE `products`.`id` = `productdetails`.`productid` 
                          AND `products`.`id` = `a`.`productid`;");
$stmt->execute();
$conn = NULL;
$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[$value['id']]['id'] = $value['id'];
    $data[$value['id']]['name'] = $value['productname'];
    // $data[$value['id']]['brand'] = $value['brand'];
    $data[$value['id']]['price'] = $value['price'];
    $data[$value['id']]['quantity'] = $value['quantity'];
    $data[$value['id']]['rating'] = $value['rating'];
    // $data[$value['id']]['size'] = $value['size'];
    // $data[$value['id']]['date'] = $value['date'];
    // $data[$value['id']]['content'] = $value['content'];
    // $data[$value['id']]['anniversary'] = $value['anniversary'];
    $data[$value['id']]['sold'] = $value['sold'];
    $data[$value['id']]['view'] = $value['view'];
    $data[$value['id']]['src'] = $value['src'];
}

echo json_encode($data);
