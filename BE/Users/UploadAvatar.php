<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$files = $_FILES['fileupload'];

$names      = $files['name'];
$tmp_names  = $files['tmp_name'];

try {
    move_uploaded_file($tmp_names, "D:/XAMPP/htdocs/img/giftshop/user/" . $names);
    die("http://localhost/img/giftshop/user/$names");
} catch (PDOException $e) {
    die($e);
}
