<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

// Search by Categories

// $id = $_POST['id'];
$cateid = 2;

$sql = "SELECT * FROM `products` 
            INNER JOIN `productdetails` 
            INNER JOIN (SELECT `src`,`productid` 
                            FROM `img` GROUP BY `productid`) as a 
            INNER JOIN (SELECT `products`.`id` as c 
                            FROM `products`, `catepro`,`categories` 
                        WHERE `products`.`id` = `catepro`.`proid` 
                          AND `categories`.`id` = `catepro`.`cateid` 
                          AND `catepro`.`cateid` = $cateid) as b 
        WHERE `products`.`id` = `productdetails`.`productid` 
          AND `products`.`id` = `a`.`productid` 
          AND `b`.`c` = `products`.`id`";

$stmt = $conn->prepare("$sql");
$stmt->execute();

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

die(json_encode($data));

// Search by Price 

// Search by Name 

// Search by Brand

// Search by 