<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT * FROM `users` WHERE `id` = :id;");
$stmt->bindParam('id', $_POST['userid']);
$stmt->execute();

$data = [];

foreach($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'firstname' => $value['firstname'],
        'lastname' => $value['lastname'],
        'address' => $value['address'],
        'email' => $value['email'],
        'phone' => $value['phone'],
        'avatar' => $value['avatar'],
        'birthday' => $value['birthday'],
        'password' => $value['password']
    );
}

die(json_encode($data));