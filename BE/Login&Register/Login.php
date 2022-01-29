<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$stmt = $conn->prepare("SELECT * FROM `users` WHERE `username` = :username AND `password` = :password ;");
$stmt->bindParam('username', $_POST['username']);
$stmt->bindParam('password', $_POST['password']);
$stmt->execute();

$data = [];
$count = $stmt->rowCount();

if ($count == 0) {
    $stmt = $conn->prepare("SELECT * FROM `users` WHERE `username` = :username;");
    $stmt->bindParam('username', $username);
    $stmt->execute();

    $count = $stmt->rowCount();
    $count == 1 ? die("Password Incorrect") : die("Invalid Username");
}

foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'id' => $value['id'],
        'fullname' => $value['firstname'],
        'lastname' => $value['lastname'],
        'address' => $value['address'],
        'email' => $value['email'],
        'phone' => $value['phone'],
        'avatar' => $value['avatar'],
        'birthday' => $value['birthday']
    );
}

die(json_encode($data));
