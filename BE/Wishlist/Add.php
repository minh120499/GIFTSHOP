<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
isset($_POST['userid']) ? '' : die('empty userid');
isset($_POST['productid']) ? '' : die('empty productid');
$stmt = $conn->prepare("SELECT `id` FROM `users` WHERE `username` = :userid ");
$stmt->bindParam('userid', $_POST['userid']);
$stmt->execute();
$id = $stmt->fetch();
$userid = $id['id'] * 1;
try {
    $stmt = $conn->prepare("INSERT INTO `wishlists` VALUES (:userid, :productid)");
    $stmt->bindParam('userid', $userid);
    $stmt->bindParam('productid', $_POST['productid']);
    $stmt->execute();
    die('Add Succes');
} catch (PDOException $e) {
    die($e);
}
