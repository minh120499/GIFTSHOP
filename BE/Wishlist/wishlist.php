<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';
$stmt = $conn->prepare("SELECT `id` FROM `users` WHERE `username` = :userid ");
$stmt->bindParam('userid', $_POST['userid']);
$stmt->execute();
$id = $stmt->fetch();
$userid = $id['id'] * 1;
$stmt = $conn->prepare("SELECT `products`.`id`,`products`.`name`,`price`,`quantity`,`src` FROM `products`
                        INNER JOIN `users`
                        INNER JOIN `wishlists`
                        INNER JOIN `productimg`
                       WHERE `products`.`id` = `wishlists`.productid
                        AND `users`.id = `wishlists`.userid
                        AND `productimg`.`productid` = `products`.`id`
                        AND `users`.`id` = $userid
                       GROUP BY `products`.`id`;");
$stmt->execute();

$listdata = $stmt->fetchAll();
echo json_encode($listdata);
