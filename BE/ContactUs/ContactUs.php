<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

$errors = [];

// Check empty input value
!isset($_POST['name']) || empty($_POST['name']) ? $errors['empty'][] = 'Name is empty' : $name = $_POST['name'];
!isset($_POST['email']) || empty($_POST['email']) ? $errors['empty'][] = 'Email is empty' : $email = $_POST['email'];
!isset($_POST['subject']) || empty($_POST['subject']) ? $errors['empty'][] = 'Subject is empty' : $subject = $_POST['subject'];
!isset($_POST['message']) || empty($_POST['message']) ? $errors['empty'][] = 'Message is empty' : $message = $_POST['message'];

// Validate
// Làm sau.
if (!$errors) {
    try {
        $stmt = $conn->prepare('INSERT INTO `feedback`(fullname,email,title,content) VALUES (:name,:email,:subject,:message)');
        $stmt->bindParam(':name', $bname);
        $stmt->bindParam(':email', $bemail);
        $stmt->bindParam(':subject', $bsubject);
        $stmt->bindParam(':message', $bmessage);

        $bname = $name;
        $bemail = $email;
        $bsubject = $subject;
        $bmessage = $message;

        $stmt->execute();
        $conn = null;

        die("SUBMIT SUCCESS");
    } catch (PDOException $e) {
        die("SUBMIT FAIL $e");
    }
} else {
    die(json_encode($errors));
}
