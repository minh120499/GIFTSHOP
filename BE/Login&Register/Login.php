<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
$password = $_POST['password'];
// $password = password_hash($password, PASSWORD_DEFAULT);
$stmt = $conn->prepare("SELECT * FROM `administrator` WHERE `account` = :username AND `password` = :password ;");
$stmt->bindParam('username', $_POST['username']);
$stmt->bindParam('password', $password);
$stmt->execute();
if ($stmt->rowCount() == 1) {
    die("Welcome Admin");
}

$stmt = $conn->prepare("SELECT * FROM `users` WHERE `username` = :username AND `password` = :password");
$stmt->bindParam('username', $_POST['username']);
$stmt->bindParam('password', $password);
$stmt->execute();
$count = $stmt->rowCount();
$count == 0 ? die("Invalid Username") : die("Login Success");