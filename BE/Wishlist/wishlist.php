<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require './conn.php';
$a = new Database();
$cnn = $a->connect();
$id = $_POST['userid'];
$stmt = $cnn->prepare("SELECT * FROM products
                       INNER JOIN users
                       INNER JOIN wishlists
                       WHERE products.id = wishlists.productid
                       AND users.id = wishlists.userid
                     AND users.id = $id");
$stmt->execute();

$listdata = $stmt->fetchAll();
echo json_encode($listdata);
