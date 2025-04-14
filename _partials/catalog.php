<div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <?php
        require_once 'config/db.php';

        $stmt = $pdo->query('SELECT * FROM products');
        while ($product = $stmt->fetch()) {
        ?>
            <div class="col mb-5">
                <div class="card h-100">
                    <?php
                    if ($product['sale_price'] !== null){
                        ?>
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <?php
                    }
                    ?>
                    
                    <!-- Product image-->
                    <img class="card-img-top" src="<?= $product['image']; ?>" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><?php echo $product['name']; ?></h5>
                            <?php
                            if (!empty($product['rating'])) {
                            ?>
                                <div class="d-flex justify-content-center small text-warning mb-2">
                                    <?php
                                    for ($i = 0; $i < $product['rating']; ++$i) {
                                        echo '<div class="bi-star-fill"></div>';
                                    }
                                    ?>

                                </div>
                            <?php
                            }

                            if ($product['price_min'] !== null && $product['price_max'] !== null) {
                                printf('$%s - $%s', $product['price_min'], $product['price_max']);
                            }
                            // sale
                            elseif ($product['sale_price'] !== null) {
                                printf('<span class="text-muted text-decoration-line-through">$50.00</span>$25.00');
                            } else {
                                echo '$' . $product['price'];
                            }
                            ?>
                            <!-- Product price-->

                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                    </div>
                </div>
            </div>
        <?php
        }
        ?>
    </div>
</div>