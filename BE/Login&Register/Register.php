<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$address = $_POST['address'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$birthday = $_POST['birthday']; 

try {
    $stmt = $conn->prepare("INSERT INTO `users`(`username`,`password`,`firstname`,`lastname`,`address`,`email`,`phone`,`birthday`) 
                                   VALUES (:username,:password,:firstname,:lastname,:address,:email,:phone,:birthday)");

    $stmt->bindParam('username', $username);
    $stmt->bindParam('password', $password);
    $stmt->bindParam('firstname', $firstname);
    $stmt->bindParam('lastname', $lastname);
    $stmt->bindParam('address', $address);
    $stmt->bindParam('email', $email);
    $stmt->bindParam('phone', $phone);
    $stmt->bindParam('birthday', $birthday); 

    $stmt->execute();
    die("Register success");
} catch (PDOException $e) {
    die($e);
}