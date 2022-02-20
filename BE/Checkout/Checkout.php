<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

$today = getdate()['mday'] . '/' . getdate()['mon'] . '/' . getdate()['year'];

$stmt = $conn->prepare("UPDATE `orders` SET `date` = :todate, 
                                            `toname` = :toname, 
                                            `toemail` = :toemail, 
                                            `tophone` = :tophone,
                                            `toaddress` = :toaddress, 
                                            `payment` = :payment, 
                                            `status` = 'paid' 
                        WHERE `id` = :orderid AND `userid` = :userid ;");
$stmt->bindParam('todate', $today);
$stmt->bindParam('toname', $_POST['name']);
$stmt->bindParam('toemail', $_POST['email']);
$stmt->bindParam('tophone', $_POST['phone']);
$stmt->bindParam('toaddress', $_POST['address']);
$stmt->bindParam('payment', $_POST['payment']);
$stmt->bindParam('orderid', $_POST['orderid']);
$stmt->bindParam('userid', $_POST['userid']);

$stmt->execute();
