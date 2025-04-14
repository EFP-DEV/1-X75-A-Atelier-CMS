<?php
require_once('../config/db.php');

$data = $_POST;

foreach(['price_min', 'price_max', 'price', 'sale_price'] as $field){
    if ($data[$field] === '') {
        $data[$field] = null;
    }
}

$query = 'INSERT INTO `products`(`name`, `price_min`, `price_max`, `price`, `sale_price`, `image`, `rating`, `product_type`) 
VALUES (:name, :price_min, :price_max, :price, :sale_price, :image, :rating, :product_type)';


$stmt = $pdo->prepare($query);
$res = $stmt->execute($data);
die;