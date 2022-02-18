<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require './conn.php';
$a = new Database();
$cnn = $a->connect();
$id = $_POST['userid'];
$stmt = $cnn->prepare("SELECT `products`.`id`,`products`.`name`,`price`,`quantity`,`src` FROM `products`
                        INNER JOIN `users`
                        INNER JOIN `wishlists`
                        INNER JOIN `productimg`
                       WHERE `products`.`id` = `wishlists`.productid
                        AND `users`.id = `wishlists`.userid
                        AND `productimg`.`productid` = `products`.`id`
                        AND `users`.`id` = $id
                       GROUP BY `products`.`id`;");
$stmt->execute();

$listdata = $stmt->fetchAll();
echo json_encode($listdata);
