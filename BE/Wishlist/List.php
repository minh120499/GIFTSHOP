<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
isset($_POST['userid']) ? $userid = $_POST['userid'] : die('empty userid');
// isset($_POST['productid']) ? '' : die('empty productid');

try {
    $stmt = $conn->prepare("SELECT * FROM `wishlists` WHERE userid = $userid");
    // $stmt->bindParam('userid', $_POST['userid']);
    // $stmt->bindParam('productid', $_POST['productid']);
    $stmt->execute();
    $data = [];
    foreach($stmt->fetchAll() as $key => $value) {
        $data[] = $value['productid'];
    }
    die(json_encode($data));
} catch (PDOException $e) {
    die($e);
}
