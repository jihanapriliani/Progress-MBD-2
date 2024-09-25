-- Mengakses Daftar Produk
DELIMITER //
CREATE PROCEDURE getProducts() BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    p.unit_weight,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id;
END //
DELIMITER ;

-- Detail Produk
DELIMITER //
CREATE PROCEDURE getProductById(IN id INT) BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    p.unit_weight,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id
WHERE
    p.id = id;
END //
DELIMITER ;

-- Mencari Produk berdasarkan Nama
DELIMITER //
CREATE PROCEDURE getProductByName(IN name VARCHAR(255)) BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    p.unit_weight,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id
WHERE
    p.name LIKE CONCAT('%', name, '%');
END //
DELIMITER ;

-- CRUD User
DELIMITER //
CREATE PROCEDURE getUsers() BEGIN
SELECT
    fullname,
    role,
    email,
    phone
FROM
    users;
END //
DELIMITER ;

DELIMETER //
CREATE PROCEDURE getUserById(IN id INT) BEGIN
SELECT
    fullname,
    role,
    email,
    phone
FROM
    users
WHERE
    id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getUserByName(IN name VARCHAR(100)) 
BEGIN
    SELECT
        fullname,
        role,
        email,
        phone
    FROM
        users
    WHERE
        fullname LIKE CONCAT('%', name, '%'); 
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getUserByEmail(IN email VARCHAR(100)) BEGIN
SELECT
   fullname,
   role,
   email,
   phone
FROM
    users
WHERE
    email = email;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE createUser(
    IN fullname VARCHAR(255),
    IN email VARCHAR(100),
    IN role ENUM('super-admin', 'admin', 'user'),
    IN password VARCHAR(255)
) BEGIN
INSERT INTO
    users (fullname, email, role, password)
VALUES
    (fullname, email, role, password);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateUser(
    IN id INT,
    IN fullname VARCHAR(100),
    IN email VARCHAR(100),
    IN role ENUM('super-admin', 'admin', 'user'),
    IN password VARCHAR(255)
) BEGIN
UPDATE
    users
SET
    fullname = fullname,
    email = email,
    role = role,
    password = password
WHERE
    id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteUser(IN id INT) BEGIN
DELETE FROM
    users
WHERE
    id = id;
END //
DELIMITER ;

-- CRUD Product
DELIMITER //
CREATE PROCEDURE getProducts() BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.stock,
    p.price,
    p.unit_weight,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getProductById(IN id INT) BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    p.unit_weight,
    p.stock,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id
WHERE
    p.id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getProductByName(IN name VARCHAR(255)) BEGIN
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    p.unit_weight,
    p.stock,
    c.name AS category
FROM
    products p
    JOIN categories c ON p.category_id = c.id
WHERE
    p.name LIKE CONCAT('%', name, '%');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE createProduct(
    IN name VARCHAR(255),
    IN description TEXT,
    IN price DECIMAL(10, 2),
    IN unit_weight DECIMAL(10, 2),
    IN stock INT,
    IN category_id INT
) BEGIN
INSERT INTO
    products (
        name,
        description,
        price,
        stock,
        unit_weight,
        category_id
    )
VALUES
    (
        name,
        description,
        price,
        stock,
        unit_weight,
        category_id
    );
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateProduct(
    IN id INT,
    IN name VARCHAR(255),
    IN description TEXT,
    IN price DECIMAL(10, 2),
    IN unit_weight DECIMAL(10, 2),
    IN stock INT,
    IN category_id INT
) BEGIN
UPDATE
    products
SET
    name = name,
    description = description,
    price = price,
    stock = stock,
    unit_weight = unit_weight,
    category_id = category_id
WHERE
    id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteProduct(IN id INT) BEGIN
DELETE FROM
    products
WHERE
    id = id;
END //
DELIMITER ;

-- CRUD Category
DELIMITER //
CREATE PROCEDURE getCategories() BEGIN
SELECT
    id,
    name
FROM
    categories;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getCategoryById(IN id INT) BEGIN
SELECT
    id,
    name
FROM
    categories
WHERE
    id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getCategoryByName(IN name VARCHAR(100)) BEGIN
SELECT
    id,
    name
FROM
    categories
WHERE
    name = name;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE createCategory(
    IN name VARCHAR(100),
    IN description TEXT
) BEGIN
INSERT INTO
    categories (name, description)
VALUES
    (name, description);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateCategory(
    IN id INT,
    IN name VARCHAR(100),
    IN description TEXT
) BEGIN
UPDATE
    categories
SET
    name = name,
    description = description
WHERE
    id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteCategory(IN id INT) BEGIN
DELETE FROM
    categories
WHERE
    id = id;
END //
DELIMITER ;

-- Mengakses Riwayat Transaksi
DELIMITER //
CREATE PROCEDURE getTransactions() BEGIN
SELECT
    t.id,
    t.user_id,
    t.user_address_id,
    t.total_price,
    t.total_weight,
    t.shipping_cost,
    t.delivery_code,
    t.status,
    t.created_at,
    u.username,
    ua.address,
    ua.zipcode
FROM
    transactions t
    JOIN users u ON t.user_id = u.id
    JOIN user_addresses ua ON t.useraddress_id = ua.id;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE getTransactionById(IN id INT) BEGIN
SELECT
   t.id,
    t.user_id,
    t.user_address_id,
    t.total_price,
    t.total_weight,
    t.shipping_cost,
    t.delivery_code,
    t.status,
    t.created_at,
    u.username,
    ua.addres
    ua.zipcode
FROM
    transactions t
    JOIN users u ON t.user_id = u.id
    JOIN useraddresses ua ON t.useraddress_id = ua.id
WHERE
    t.id = id;
END //
DELIMITER ;

-- Mengubah Status Transaksi
DELIMITER //
CREATE PROCEDURE updateTransactionStatus(
    IN id INT,
    IN status VARCHAR(50)
) BEGIN
UPDATE
    transactions
SET
    status = status
WHERE
    id = id;
END //
DELIMITER ;

-- Mengubah Resi Transaksi
DELIMITER //
CREATE PROCEDURE updateTransactionDelivery(
    IN id INT,
    IN delivery_code VARCHAR(255)
) BEGIN
UPDATE
    transactions
SET
    delivery_code = delivery_code
WHERE
    id = id;
END //
DELIMITER ;

-- CRUD Akun Admin
DELIMITER //
CREATE PROCEDURE getAdmins() BEGIN
SELECT
    id,
    fullname,
    email
FROM
    users
WHERE
    role = 'admin';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getAdminById(IN id INT) BEGIN
SELECT
    id,
    fullname,
    email
FROM
    users
WHERE
    id = id
    AND role = 'admin';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getAdminByName(IN name VARCHAR(255)) BEGIN
SELECT
    id,
    fullname,
    email
FROM
    users
WHERE
    fullname LIKE CONCAT('%', name, '%')
    AND role = 'admin';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE createAdmin(
    IN fullname VARCHAR(255),
    IN email VARCHAR(255),
    IN password VARCHAR(255)
) BEGIN
INSERT INTO
    users (
        fullname,
        email,
        password,
        role
    )
VALUES
    (
        fullname,
        email,
        password,
        'admin'
    );  

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateAdmin(
    IN id INT,
    IN fullname VARCHAR(255),
    IN email VARCHAR(255)
) BEGIN
UPDATE
    users
SET
    fullname = fullname,
    email = email
WHERE
    id = id
    AND role = 'admin';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteAdmin(IN id INT) BEGIN
DELETE FROM
    users
WHERE
    id = id
    AND role = 'admin';
END //
DELIMITER ;

// mengatur keranjang
DELIMITER //
CREATE PROCEDURE getCartProducts(IN user_id INT) 
BEGIN
    SELECT 
        c.id AS cart_id,
        p.id AS product_id,
        p.name AS product_name,
        c.quantity,
        p.price,
        (c.quantity * p.price) AS total_price
    FROM 
        carts c
    JOIN 
        products p ON c.product_id = p.id
    WHERE 
        c.user_id = user_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addToCart(
    IN user_id INT,
    IN product_id INT,
    IN amount INT
) 
BEGIN
    INSERT INTO carts (user_id, product_id, amount)
    VALUES (user_id, product_id, amount)
    ON DUPLICATE KEY UPDATE amount = amount + VALUES(amount);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateProductAmountInCart(
    IN cart_id INT,
    IN newAmount INT
) 
BEGIN
    UPDATE carts
    SET amount = newAmount
    WHERE id = cart_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE removeProductFromCart(
    IN cart_id INT
) 
BEGIN
    DELETE FROM carts
    WHERE id = cart_id;
END //
DELIMITER ;

-- Proses Checkout
DELIMITER //
CREATE FUNCTION calculateTotalPrice(p_user_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total_price DECIMAL(10,2);

    SELECT SUM(p.price * c.amount)
    INTO v_total_price
    FROM cart c
    JOIN products p ON p.id = c.product_id
    WHERE c.user_id = p_user_id;

    RETURN v_total_price;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION calculateTotalWeight(p_user_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total_weight DECIMAL(10,2);

    SELECT SUM(p.unit_weight * c.amount)  -- Menghitung total berat
    INTO v_total_weight
    FROM cart c
    JOIN products p ON p.id = c.product_id
    WHERE c.user_id = p_user_id;

    RETURN v_total_weight;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION calculateShippingCost(p_user_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total_weight DECIMAL(10,2);
    DECLARE v_shipping_cost DECIMAL(10,2);

    SET v_total_weight = calculateTotalWeight(p_user_id);

    SET v_shipping_cost = v_total_weight * 5000; 

    RETURN v_shipping_cost;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE processCheckout(
    IN p_user_id INT,
    IN p_user_address_id INT,
    IN p_total_weight DECIMAL(10,2),
    IN p_total_price DECIMAL(10,2),
    IN p_shipping_cost DECIMAL(10,2),
    IN p_note TEXT
)
BEGIN
    DECLARE v_address_text VARCHAR(500);
    DECLARE v_code VARCHAR(20);
    DECLARE v_transaction_id INT;
    DECLARE v_product_id INT;
    DECLARE v_product_price DECIMAL(10,2);
    DECLARE v_cart_amount INT;
    DECLARE v_cart_id INT;
    DECLARE v_current_stock INT;
    DECLARE done INT DEFAULT 0;

    START TRANSACTION;

    SELECT CONCAT(ua.address, ', ', ua.village, ', ', d.district_name, ', ', d.city, ', ', d.province, ', ', ua.country, ', ', ua.zipcode) 
    INTO v_address_text
    FROM UserAddress ua
    JOIN District d ON d.district_id = ua.district_id
    WHERE ua.id = p_user_address_id;

    SET v_code = CONCAT('TRX', FLOOR(1000000 + (RAND() * 8999999)));

    INSERT INTO transactions (
        user_id, 
        user_address_id, 
        total_weight, 
        total_price, 
        shipping_cost, 
        delivery_code, 
        code, 
        status, 
        note, 
        address, 
        created_at
    ) 
    VALUES (
        p_user_id, 
        p_user_address_id, 
        p_total_weight / 1000, 
        p_total_price, 
        p_shipping_cost, 
        '-',  
        v_code, 
        'unpaid',  
        p_note, 
        v_address_text, 
        NOW()
    );

    SET v_transaction_id = LAST_INSERT_ID();

    DECLARE cart_cursor CURSOR FOR 
    SELECT c.id, c.product_id, c.amount, p.price
    FROM Cart c
    JOIN Products p ON p.id = c.product_id
    WHERE c.user_id = p_user_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cart_cursor;
    
    read_loop: LOOP
        FETCH cart_cursor INTO v_cart_id, v_product_id, v_cart_amount, v_product_price;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO transaction_details (
            transaction_id, 
            product_id, 
            actual_price, 
            amount, 
            created_at
        ) 
        VALUES (
            v_transaction_id, 
            v_product_id, 
            v_product_price, 
            v_cart_amount, 
            NOW()
        );

    END LOOP;

    CLOSE cart_cursor;

    COMMIT;

    SELECT v_code AS transaction_code;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER after_transaction_detail_insert
AFTER INSERT ON transaction_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.amount
    WHERE id = NEW.product_id;
END //
DELIMITER ;

-- Trigger for delete product in cart after transaction
DELIMITER //
CREATE TRIGGER after_cart_delete
AFTER DELETE ON cart
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock + OLD.amount
    WHERE id = OLD.product_id;
END //
DELIMITER ;


-- Melihat Riwayat Checkout
DELIMITER //
CREATE PROCEDURE getUserTransactions(IN p_user_id INT)
BEGIN
    SELECT
        t.id,
        t.user_id,
        t.user_address_id,
        t.total_price,
        t.total_weight,
        t.shipping_cost,
        t.delivery_code,
        t.status,
        t.created_at,
        u.fullname AS username,
        ua.address,
        ua.zipcode
    FROM
        transactions t
        JOIN users u ON t.user_id = u.id
        JOIN user_address ua ON t.user_address_id = ua.id
    WHERE
        t.user_id = p_user_id
    ORDER BY
        t.created_at DESC;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getTransactionDetails(IN p_transaction_id INT)
BEGIN
    SELECT
        td.id AS transaction_detail_id,
        td.transaction_id,
        p.name AS product_name,
        td.amount,
        td.actual_price,
        (td.actual_price * td.amount) AS total_price,
        p.unit_weight * td.amount AS total_weight,
        t.shipping_cost,
        t.status,
        t.created_at
    FROM
        transactiondetails td
        JOIN products p ON td.product_id = p.id
        JOIN transactions t ON td.transaction_id = t.id
    WHERE
        td.transaction_id = p_transaction_id;
END //
DELIMITER ;


-- Update Status Terima
DELIMITER //
CREATE PROCEDURE acceptPackage(
    IN p_transaction_id INT
)
BEGIN
    UPDATE transactions
    SET 
        status = 'accepted',
        accepted_at = NOW()
    WHERE 
        id = p_transaction_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction not found or already accepted.';
    END IF;
END //
DELIMITER ;
