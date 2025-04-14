<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <form action="process_product.php" method="POST">
        <div class="form-group">
            <label for="name">Product Name*</label>
            <input type="text" id="name" name="name" required maxlength="100" value="Sam">
        </div>



        <div class="form-group">
            <label for="price">Price ($)</label>
            <input type="number" id="price" name="price" step="0.01" min="0">
        </div>

        <div class="form-group price-range">
            <div>
                <label for="price_min">Minimum Price ($)</label>
                <input type="number" id="price_min" name="price_min" step="0.01" min="0">
            </div>
            <div>
                <label for="price_max">Maximum Price ($)</label>
                <input type="number" id="price_max" name="price_max" step="0.01" min="0">
            </div>
        </div>

        <div class="form-group">
            <label for="sale_price">Sale Price ($)</label>
            <input type="number" id="sale_price" name="sale_price" step="0.01" min="0">
        </div>

        <div class="form-group">
            <label for="image">Product Image*</label>
            <input type="text" id="image" name="image" required value="https://raw.githubusercontent.com/EFP-DEV/1-X75-Atelier/refs/heads/main/assets/LAMP_flowchart.svg">
        </div>

        <div class="form-group">
            <label for="rating">Rating</label>
            <select id="rating" name="rating">
                <option value="0">No Rating</option>
                <option value="1">1 Star</option>
                <option value="2">2 Stars</option>
                <option value="3">3 Stars</option>
                <option value="4">4 Stars</option>
                <option value="5">5 Stars</option>
            </select>
        </div>

        <div class="form-group">
            <label for="product_type">Product Type*</label>
            <select id="product_type" name="product_type" required>
                <option value="standard">Standard</option>
                <option value="fancy">Fancy</option>
                <option value="popular">Popular</option>
                <option value="special">Special</option>
                <option value="sale">Sale</option>
            </select>
        </div>

        <button type="submit">Submit Product</button>
    </form>
</body>

</html>