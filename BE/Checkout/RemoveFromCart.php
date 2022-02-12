<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

isset($_POST['userid']) && !empty($_POST['userid']) ? '' : die('invalid userid');
isset($_POST['productid']) && !empty($_POST['productid']) ? '' : die('invalid productid');

try {
    $stmt = $conn->prepare("SELECT * FROM `orders` WHERE `userid` = :userid AND `status` = 'unpaid' ;");
    $stmt->bindParam('userid', $_POST['userid']);
    $stmt->execute();

    $data = $stmt->fetch();
    $orderid = $data['id'];

    $stmt = $conn->prepare("DELETE FROM `ordersdetail` WHERE orderid = :orderid AND productid = :productid ;");
    $stmt->bindParam('productid', $_POST['productid']);
    $stmt->bindParam('orderid', $orderid);
    $stmt->execute();

    //Update total
    $stmt = $conn->prepare("SELECT SUM(`quantity` * `price`) as total FROM `ordersdetail` WHERE orderid = :orderid;");
    $stmt->bindParam('orderid', $orderid);
    $stmt->execute();
    $data = $stmt->fetch();
    $total = $data['total'];

    $stmt = $conn->prepare("UPDATE `orders` SET total = :total WHERE `userid` = :userid AND `status` = 'unpaid' ");
    $stmt->bindParam('userid', $_POST['userid']);
    $stmt->bindParam('total', $total);
    $stmt->execute();

    die('Delete success');
} catch (PDOException $e) {
    die($e);
}
