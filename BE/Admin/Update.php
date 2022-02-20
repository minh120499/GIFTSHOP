<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

try {
    foreach ($_POST as $key => $value) {
        $stmt = $conn->prepare("UPDATE `products` SET $key = :value WHERE id = :id");
        $stmt->bindParam('value', $value);
        $stmt->bindParam('id', $_POST['id']);
        $stmt->execute();
    }
    die("Update Success");
} catch (PDOException $e) {
    die($e);
}
