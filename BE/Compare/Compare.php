<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");


$stmt = $conn->prepare("SELECT `products`.* , `productimg`.`src`,`brand`.`name` as `brand`, `img` , `country` FROM `products`
                            INNER JOIN `productimg`
                            INNER JOIN `brand`
                         WHERE `products`.`id` = :id 
                            AND `products`.`id` = `productimg`.`productid`
                            AND `products`.`brand` = `brand`.`id`
                         GROUP BY `productid` ");
$stmt->bindParam('id', $_POST['id']);
$stmt->execute();

// $data == [] ? $data = [] : '';
$data = [];
$stmt->rowCount() == 0 ? die('Not found') : '';
foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'brand' => $value['brand'],
        'country' => $value['country'],
        'price' => $value['price'],
        'rating' => $value['rating'],
        'size' => $value['size'],
        'date' => $value['date'],
        'detail' => $value['detail'],
        'anniversary' => $value['anniversary'],
        'src' => $value['src']
    );
}

die(json_encode($data));
