<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
require_once '../ConnectDataBase/connect.php';

isset($_POST['userid']) && !empty($_POST['userid']) ? '' : die('invalid userid');
isset($_POST['productid']) && !empty($_POST['productid']) ? '' : die('invalid productid');
isset($_POST['quantity']) && !empty($_POST['quantity']) ? '' : die('invalid quantity');
isset($_POST['price']) && !empty($_POST['price']) ? '' : die('invalid price');
isset($_POST['img']) && !empty($_POST['img']) ? '' : die('invalid img');

$stmt = $conn->prepare("SELECT `id` FROM `users` WHERE `username` = :userid ");
$stmt->bindParam('userid', $_POST['userid']);
$stmt->execute();
$id = $stmt->fetch();
$userid = $id['id'] * 1;


// Check exist orders
$stmt = $conn->prepare("SELECT * FROM `orders` WHERE `userid` = :userid AND `status` = 'unpaid' ;");
$stmt->bindParam('userid', $userid);
$stmt->execute();

if ($stmt->rowCount() == 0) {
    try {
        // Lấy data user để insert vào orders
        $stmt = $conn->prepare("SELECT * FROM `users` WHERE `id` = :userid;");
        $stmt->bindParam('userid', $userid);
        $stmt->execute();
        $data = $stmt->fetch();

        $toname = ($data['firstname'] . " " . $data['lastname']);
        $toemail = $data['email'];
        $tophone = $data['phone'];
        $toaddress = $data['address'];

        $stmt = $conn->prepare("INSERT INTO `orders`(toname, toemail, tophone, toaddress, userid) VALUES (:toname, :toemail, :tophone, :toaddress, :userid)");
        $stmt->bindParam('toname', $toname);
        $stmt->bindParam('toemail', $toemail);
        $stmt->bindParam('tophone', $tophone);
        $stmt->bindParam('toaddress', $toaddress);
        $stmt->bindParam('userid', $userid);
        $stmt->execute();

        // Lấy id của orders
        $stmt = $conn->prepare("SELECT `id` FROM `orders` WHERE `userid` = :userid AND `status` = 'unpaid' ;");
        $stmt->bindParam('userid', $userid);
        $stmt->execute();
        $data = $stmt->fetch();

        $orderid = $data['id'];

        // INSERT INTO ordersdetail
        $stmt = $conn->prepare("INSERT INTO `ordersdetail`(img, productid, orderid, quantity, price, coupon) VALUES (:img, :productid, :orderid, :quantity, :price, :coupon)");
        $stmt->bindParam('productid', $_POST['productid']);
        $stmt->bindParam('quantity', $_POST['quantity']);
        $stmt->bindParam('price', $_POST['price']);
        $stmt->bindParam('coupon', $_POST['coupon']);
        $stmt->bindParam('img', $_POST['img']);
        $stmt->bindParam('orderid', $orderid);
        $stmt->execute();

        //Update total
        $stmt = $conn->prepare("SELECT SUM(`quantity` * `price`) as total FROM `ordersdetail` WHERE orderid = :orderid;");
        $stmt->bindParam('orderid', $orderid);
        $stmt->execute();
        $data = $stmt->fetch();
        $total = $data['total'];

        $stmt = $conn->prepare("UPDATE `orders` SET total = :total WHERE `userid` = :userid AND `status` = 'unpaid' ");
        $stmt->bindParam('userid', $userid);
        $stmt->bindParam('total', $total);
        $stmt->execute();

        die("Add Success");
    } catch (PDOException $e) {
        die($e);
    }
} else {
    try {
        // Lấy id của orders
        $stmt = $conn->prepare("SELECT `id` FROM `orders` WHERE `userid` = :userid AND `status` = 'unpaid' ;");
        $stmt->bindParam('userid', $userid);
        $stmt->execute();
        $data = $stmt->fetch();
        $orderid = $data['id'];

        $stmt = $conn->prepare("SELECT * FROM `ordersdetail` WHERE `productid` = :productid  AND `orderid` = :orderid;");
        $stmt->bindParam('orderid', $orderid);
        $stmt->bindParam('productid', $_POST['productid']);
        $stmt->execute();

        // INSERT INTO ordersdetail
        if ($stmt->rowCount() == 0) {
            $stmt = $conn->prepare("INSERT INTO `ordersdetail`(productid, orderid, quantity, price, coupon, img) VALUES (:productid, :orderid, :quantity, :price, :coupon, :img)");
            $stmt->bindParam('productid', $_POST['productid']);
            $stmt->bindParam('quantity', $_POST['quantity']);
            $stmt->bindParam('price', $_POST['price']);
            $stmt->bindParam('orderid', $orderid);
            $stmt->bindParam('coupon', $_POST['coupon']);
            $stmt->bindParam('img', $_POST['img']);
            $stmt->execute();
        } else {
            $data = $stmt->fetch();

            $stmt = $conn->prepare("UPDATE `ordersdetail` SET `quantity` = :quantity WHERE `productid` = :productid AND `orderid` = :orderid ;");
            $stmt->bindParam('productid', $_POST['productid']);
            $stmt->bindParam('quantity', $_POST['quantity']);
            $stmt->bindParam('orderid', $orderid);
            $stmt->execute();
        }

        //Update total
        $stmt = $conn->prepare("SELECT SUM(`quantity` * `price`) as total FROM `ordersdetail` WHERE orderid = :orderid;");
        $stmt->bindParam('orderid', $orderid);
        $stmt->execute();
        $data = $stmt->fetch();
        $total = $data['total'];

        $stmt = $conn->prepare("UPDATE `orders` SET total = :total WHERE `userid` = :userid AND `status` = 'unpaid' ");
        $stmt->bindParam('userid', $userid);
        $stmt->bindParam('total', $total);
        $stmt->execute();

        die("Add Success");
    } catch (PDOException $e) {
        die($e);
    }
}
