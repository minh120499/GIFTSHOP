<?php
require_once '../ConnectDataBase/connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");

# Handling Request
$a = '';
isset($_POST['cateid']) && !empty($_POST['cateid']) ? $a = 1 : '';
isset($_POST['productName']) && !empty($_POST['productName']) ? $a = 2 : '';
isset($_POST['minPrice']) && isset($_POST['maxPrice']) ? $a = 3 : '';
isset($_POST['brand']) && !empty($_POST['brand']) ? $a = 4 : '';

switch ($a) {
  case 1:
    searchByCategories();
    break;
  case 2:
    searchByName();
    break;
  case 3:
    searchByPrice();
    break;
  case 4:
    searchByBrand();
    break;
  default:
    die('Syntax Error, Can\'t Search');
}
$stmt = $conn->prepare("$sql");
$stmt->execute();

$data = [];
foreach ($stmt->fetchAll() as $key => $value) {
  $data[] = array(
    'id' => $value['id'],
    'name' => $value['name'],
    'price' => $value['price'],
    'quantity' => $value['quantity'],
    'rating' => $value['rating'],
    'date' => $value['date'],
    'detail' => $value['detail'],
    'anniversary' => $value['anniversary'],
    'sold' => $value['sold'],
    'view' => $value['view'],
    'src' => $value['src']
  );
}

die(json_encode($data));

# -----------------------------------------------------
# -------------------------
# -----

# Search by Categories

function searchByCategories()
{
  $cateid = $_POST['cateid'];
  is_numeric($cateid) ? $option = "`categories`.`id` = $cateid" : $option = "`categories`.`name` = '$cateid'";
  $GLOBALS['sql'] = "SELECT 
            `products`.`id`,
            `products`.`name` as `name`,
            `price`,
            `quantity`,
            `rating`,
            `date`,
            `detail`,
            `anniversary`,
            `sold`,
            `view`,
            `src`
          FROM `products`
            INNER JOIN `productimg`
            INNER JOIN (SELECT `products`.`id` as `id` FROM `products` 
  						            INNER JOIN `catepro`
                          INNER JOIN `categories`
  					            WHERE `products`.`id` = `catepro`.`proid` 
                          AND `categories`.`id` = `catepro`.`cateid`
                          AND $option )as `a`
          WHERE `products`.`id` = `productimg`.`productid`
            AND `products`.`id` = `a`.`id`
            GROUP BY `productimg`.`productid`;";
}

# -----
# -------------------------
# -----------------------------------------------------

# -----------------------------------------------------
# -------------------------
# -----

# Search by Name

function searchByName()
{
  $productname = $_POST['productName'];
  $GLOBALS['sql'] = "SELECT * FROM `products`
             INNER JOIN `productimg`
            WHERE `products`.`id` = `productimg`.`productid` 
             AND  `name` LIKE '%$productname%'
            GROUP BY `productimg`.`productid`;";
}

# -----
# -------------------------
# -----------------------------------------------------

# -----------------------------------------------------
# -------------------------
# -----

# Search by Price 

function searchByPrice()
{
  $min = $_POST['minPrice'];
  $max = $_POST['maxPrice'];
  if($min > $max) {
    $min = $_POST['maxPrice'];
    $max = $_POST['minPrice'];
  }
  $GLOBALS['sql'] = "SELECT * FROM `products`
             INNER JOIN `productimg`
            WHERE `products`.`id` = `productimg`.`productid` 
             AND  `price` >= $min AND `price` <= $max
            GROUP BY `productimg`.`productid`
            ORDER BY `price` DESC;";
}
# -----
# -------------------------
# -----------------------------------------------------

# -----------------------------------------------------
# -------------------------
# -----

# Search by Brand

function searchByBrand()
{
  $brand = $_POST['brand'];
  $GLOBALS['sql'] = "SELECT `products`.*,`productimg`.src,`brand`.`name` as 'brand' FROM `products`
             INNER JOIN `productimg`
             INNER JOIN `brand`
            WHERE `products`.`id` = `productimg`.`productid` 
             AND `products`.`brand` = `brand`.`id`
             AND  `brand`.`id` = '$brand'
            GROUP BY `productimg`.`productid`";
}

# -----
# -------------------------
# -----------------------------------------------------