<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$today = getdate()['mday'] . '/' . getdate()['mon'] . '/' . getdate()['year'];
$stmt = $conn->prepare("SELECT `id` FROM `users` WHERE `username` = :userid ");
$stmt->bindParam('userid', $_POST['userid']);
$stmt->execute();
$id = $stmt->fetch();
$id = $id['id']*1;
// echo json_encode($id);
$stmt = $conn->prepare("UPDATE `orders` SET `date` = :todate, 
                                            `toname` = :toname, 
                                            `toemail` = :toemail, 
                                            `tophone` = :tophone,
                                            `toaddress` = :toaddress, 
                                            `payment` = :payment, 
                                            `delivery` = :delivery,
                                            `status` = 'paid'
                        WHERE `status` = 'unpaid' AND `userid` = $id ;");
$stmt->bindParam('todate', $today);
$stmt->bindParam('toname', $_POST['name']);
$stmt->bindParam('toemail', $_POST['email']);
$stmt->bindParam('tophone', $_POST['phone']);
$stmt->bindParam('toaddress', $_POST['address']);
$stmt->bindParam('payment', $_POST['payment']);
$stmt->bindParam('delivery', $_POST['delivery']);


$stmt->execute();

die("Your order is confirmed");