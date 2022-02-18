<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

try {
    $stmt = $conn->prepare("INSERT INTO `products` VALUES ()");
    $stmt->execute();
    $stmt = $conn->prepare("SELECT `id` from `products` WHERE `productid` IS NULL");
    $stmt->execute();
    $id = $stmt->fetch()['id'];

    foreach ($data as $key => $value) {
        if ($key == 'img') {
            $stmt = $conn->prepare("INSERT INTO `productimg`(src,productid) VALUES ('$value',$id)");
            $stmt->execute();
        } else {
            $stmt = $conn->prepare("UPDATE `products` SET $key = :value WHERE id = :id");
            $stmt->bindParam('value', $value);
            $stmt->bindParam('id', $id);
            $stmt->execute();
        }
    }
    die("Update Success");
} catch (PDOException $e) {
    die($e);
}
