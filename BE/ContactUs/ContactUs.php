<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

try {
    isset($_POST['name']) ? $name = $_POST['name'] : '';
    isset($_POST['email']) ? $email = $_POST['email'] : '';
    isset($_POST['subject']) ? $subject = $_POST['subject'] : '';
    isset($_POST['message']) ? $message = $_POST['message'] : '';

    $stmt = $conn->prepare('INSERT INTO FEEDBACK VALUES ($name,$email,$subject,$massage)');
    $conn = null;
    $stmt->execute();
    die("SUBMIT SUCCESS");
} catch (PDOException $e){
    die("SUBMIT FALSE");
}
