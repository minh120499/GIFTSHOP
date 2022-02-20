<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$sql = "SELECT `products`.`id`,
               `products`.`name` as `name`,
               `brand`.`name` as `brand`,
               `price`,
               `quantity`,
               `rating`,
               `date`,
               `detail`,
               `anniversary`,
               `sold`,
               `view`,
               `src`,
               `country`,
               `sale`
          FROM `products` INNER JOIN `productimg` 
                          INNER JOIN `brand` 
          WHERE `products`.`brand` = `brand`.`id` 
            AND `products`.`id` = `productimg`.`productid`";

$stmt = $conn->prepare("$sql");
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'price' => $value['price'],
        'quantity' => $value['quantity'],
        'rating' => $value['rating'],
        'date' => $value['date'],
        'detail' => $value['detail'],
        'anniversary' => $value['anniversary'],
        'sold' => $value['sold'],
        'view' => $value['view'],
        'src' => $value['src'],
        'brand' => $value['brand'],
        'country' => $value['country'],
        'sale' => $value['sale']
    );
}

die(json_encode($data));
