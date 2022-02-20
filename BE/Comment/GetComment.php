<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$today = getdate()['mday'] . '/' . getdate()['mon'] . '/' . getdate()['year'];

$stmt = $conn->prepare("SELECT 
                            `productid`,
                            `date`,
                            `content`,
                            `rating`,
                            `avatar`,
                            `firstname`,
                            `lastname`
                             FROM `comment` 
                                INNER JOIN `users`
                            WHERE `productid` = :productid
                              AND `users`.`id` = `comment`.`userid`");
$stmt->bindParam('productid', $_POST['productid']);
$stmt->execute();
$data = [];
foreach ($stmt->fetchAll() as $key => $value) {
    $data[] = array(
        'productid' => $value['productid'],
        'date' => $value['date'],
        'content' => $value['content'],
        'rating' => $value['rating'],
        'avatar' => $value['avatar'],
        'firstname' => $value['firstname'],
        'lastname' => $value['lastname']
    );
}
die(json_encode($data));
