<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$sql = "SELECT `products`.*,`productimg`.`src` FROM `products` 
            INNER JOIN `productimg`
            INNER JOIN `brand`
            INNER JOIN (SELECT `anniversary`,`brand` FROM `products` WHERE id = :id) as a
                WHERE `products`.`id` = `productimg`.`productid`
                  AND `products`.`brand` = `brand`.`id`
                  AND a.`anniversary` = `products`.`anniversary`
            GROUP BY `products`.`id`
            UNION 
            SELECT `products`.*,`productimg`.`src` FROM `products` 
            INNER JOIN `productimg`
            INNER JOIN `brand`
            INNER JOIN (SELECT `anniversary`,`brand` FROM `products` WHERE id = :id) as a
                WHERE `products`.`id` = `productimg`.`productid`
                  AND `products`.`brand` = `brand`.`id`
                  AND a.`brand` = `brand`.`id`
            GROUP BY `products`.`id`;";
$stmt = $conn->prepare("$sql");
$stmt->bindParam('id', $_POST['productid']);
$stmt->execute();

$data = [];

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'name' => $value['name'],
        'price' => $value['price'],
        'src' => $value['src'],
        'sale' => $value['sale']
    );
}

// $sql = "SELECT `products`.*,`productimg`.`src` FROM `products` 
//             INNER JOIN `productimg`
//             INNER JOIN `brand`
//             INNER JOIN (SELECT `anniversary`,`brand` FROM `products` WHERE id = :id) as a
//                 WHERE `products`.`id` = `productimg`.`productid`
//                   AND `products`.`brand` = `brand`.`id`
//                   AND a.`brand` = `brand`.`id`
//             GROUP BY `products`.`id`;";
// $stmt = $conn->prepare("$sql");
// $stmt->bindParam('id', $_POST['productid']);
// $stmt->execute();

// foreach ($stmt->fetchAll() as $key => $value) {
//     $data[] = array(
//         'id' => $value['id'],
//         'name' => $value['name'],
//         'price' => $value['price'],
//         'src' => $value['src'],
//         'sale' => $value['sale']
//     );
// }

die(json_encode($data));
