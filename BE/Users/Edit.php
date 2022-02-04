<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$stmt = $conn->prepare("SELECT * FROM `users` WHERE `id` = :id;");
$stmt->bindParam('id', $_POST['userid']);
$stmt->execute();
// $data = $stmt->fetchAll();
// die(json_encode($data));

foreach ($stmt->fetchAll() as $key => $value) {
    isset($_POST['firstname']) ? $firstname = $_POST['firstname'] : $firstname = $value['firstname'];
    isset($_POST['lastname']) ? $lastname = $_POST['lastname'] : $lastname = $value['lastname'];
    isset($_POST['address']) ? $address = $_POST['address'] : $address = $value['address'];
    isset($_POST['email']) ? $email = $_POST['email'] : $email = $value['email'];
    isset($_POST['phone']) ? $phone = $_POST['phone'] : $phone = $value['phone'];
    isset($_POST['avatar']) ? $avatar = $_POST['avatar'] : $avatar = $value['avatar'];
    isset($_POST['birthday']) ? $birthday = $_POST['birthday'] : $birthday = $value['birthday'];
    isset($_POST['password']) ? $password = $_POST['password'] : $password = $value['password'];
}

$stmt = $conn->prepare("UPDATE `users` SET `firstname` = :firstname,
                                           `lastname` = :lastname,
                                           `address` = :address,
                                           `email` = :email,
                                           `phone` = :phone,
                                           `avatar` = :avatar,
                                           `birthday` = :birthday,
                                           `password` = :password
                        WHERE `id` = :id;");
$stmt->bindParam('firstname', $firstname);
$stmt->bindParam('lastname', $lastname);
$stmt->bindParam('address', $address);
$stmt->bindParam('email', $email);
$stmt->bindParam('phone', $phone);
$stmt->bindParam('avatar', $avatar);
$stmt->bindParam('birthday', $birthday);
$stmt->bindParam('password', $password);
$stmt->bindParam('id', $_POST['userid']);

$stmt->execute();


die(json_encode($firstname));
