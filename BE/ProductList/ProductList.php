<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

isset($_POST['condition']) ? $condition = $_POST['condition'] : '';
isset($_POST['value']) ? $value = $_POST['value'] : '';

if (!empty($condition)) {
    $stmt = $conn->prepare("SELECT * FROM SanPham WHERE $condition = $value");
    $stmt->execute();
    die(json_encode($stmt->fetchAll()));
} else {
    $stmt = $conn->prepare('SELECT * FROM SanPham');
    $stmt->execute();
    die(json_encode($stmt->fetchAll()));
}