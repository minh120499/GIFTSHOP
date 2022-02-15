<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

try {
    $today = getdate()['mday'] . '/' . getdate()['mon'] . '/' . getdate()['year'];

    $stmt = $conn->prepare("INSERT INTO `comment`(productid, userid, content, date, rating) VALUES (:productid, :userid, :content, :date, :rating)");
    $stmt->bindParam('productid', $_POST['productid']);
    $stmt->bindParam('userid', $_POST['userid']);
    $stmt->bindParam('content', $_POST['content']);
    $stmt->bindParam('rating', $_POST['rating']);
    $stmt->bindParam('date', $today);
    $stmt->execute();

    die("Comment success");
} catch (PDOException $e) {
    die($e);
}