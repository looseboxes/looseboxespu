DROP DATABASE IF EXISTS `${database}`;
CREATE DATABASE IF NOT EXISTS `${database}` CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`country`;
CREATE TABLE IF NOT EXISTS `${database}`.`country`
(
    id SMALLINT unsigned NOT NULL,
    country VARCHAR(64) NOT NULL,
    isocode2 CHAR(2) NOT NULL,
    isocode3 CHAR(3) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`region`;
CREATE TABLE IF NOT EXISTS `${database}`.`region`
(
    id SMALLINT unsigned NOT NULL,
    region VARCHAR(32) NOT NULL,
    country SMALLINT unsigned NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`gender`;
CREATE TABLE IF NOT EXISTS `${database}`.`gender`
(
    id SMALLINT unsigned NOT NULL,
    gender VARCHAR(8) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`user_status`;
CREATE TABLE IF NOT EXISTS `${database}`.`user_status`
(
    id SMALLINT unsigned NOT NULL,
    user_status VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`currency`;
CREATE TABLE IF NOT EXISTS `${database}`.`currency`
(
    id SMALLINT unsigned NOT NULL,
    code CHAR(3) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`how_did_you_find_us`;
CREATE TABLE IF NOT EXISTS `${database}`.`how_did_you_find_us`
(
    id SMALLINT unsigned NOT NULL,
    how_did_you_find_us VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_category`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_category`
(
    id SMALLINT unsigned NOT NULL,
    product_category VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_subcategory`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_subcategory`
(
    id SMALLINT unsigned NOT NULL,
    product_subcategory VARCHAR(32) NOT NULL,
    category SMALLINT unsigned NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_status`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_status`
(
    id SMALLINT unsigned NOT NULL,
    product_status VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`availability`;
CREATE TABLE IF NOT EXISTS `${database}`.`availability`
(
    id SMALLINT unsigned NOT NULL,
    availability VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`order_status`;
CREATE TABLE IF NOT EXISTS `${database}`.`order_status`
(
    id SMALLINT unsigned NOT NULL,
    order_status VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`address`;
CREATE TABLE IF NOT EXISTS `${database}`.`address` (
    id INTEGER unsigned NOT NULL auto_increment,
    country SMALLINT unsigned NOT NULL,
    region SMALLINT unsigned NULL DEFAULT NULL,
    city VARCHAR(64) NULL DEFAULT NULL,
    county VARCHAR(64) NULL DEFAULT NULL,
    street_address VARCHAR(128) NULL DEFAULT NULL,
    fax VARCHAR(32)  NULL DEFAULT NULL,
    post_code VARCHAR(32) NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`site_user`;
CREATE TABLE IF NOT EXISTS `${database}`.`site_user` (
    id INTEGER unsigned NOT NULL auto_increment,
    email_address VARCHAR(96) NOT NULL unique,
    username VARCHAR(32) NOT NULL unique,
--    password VARCHAR(255) NOT NULL,
    gender SMALLINT unsigned NULL DEFAULT NULL,
    last_name VARCHAR(64) NULL DEFAULT NULL,
    first_name VARCHAR(64) NULL DEFAULT NULL,
    date_of_birth date NULL DEFAULT NULL,
    phone_number_1 VARCHAR(32) NULL DEFAULT NULL,
    phone_number_2 VARCHAR(32) NULL DEFAULT NULL,
    address INTEGER unsigned NULL DEFAULT NULL,
    logo VARCHAR(255) NULL DEFAULT NULL,
    image VARCHAR(255) NULL DEFAULT NULL,
    url VARCHAR(255) NULL DEFAULT NULL,
    status SMALLINT unsigned DEFAULT '1',
    currency SMALLINT unsigned NOT NULL DEFAULT '566',
    how_did_you_find_us SMALLINT unsigned NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

--------------------------------
-- Made to conform to schema.org
--------------------------------
DROP TABLE IF EXISTS `${database}`.`brand`;
CREATE TABLE IF NOT EXISTS `${database}`.`brand`
(
    id SMALLINT unsigned NOT NULL,
    brandName VARCHAR(64) NOT NULL,
    description VARCHAR(255) NULL DEFAULT NULL,
    logo VARCHAR(255) NULL DEFAULT NULL,
    image VARCHAR(255) NULL DEFAULT NULL,
    url VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product`;
CREATE TABLE IF NOT EXISTS `${database}`.`product`
(
    id INTEGER unsigned NOT NULL auto_increment,
    product_name VARCHAR(64) NOT NULL,
    category SMALLINT unsigned NOT NULL,
    subcategory SMALLINT unsigned NOT NULL DEFAULT '13',
    status SMALLINT unsigned NOT NULL DEFAULT '1',
    brand SMALLINT unsigned NULL DEFAULT NULL,
    model VARCHAR(64) NULL DEFAULT NULL,
    weight DECIMAL(5,2) NULL DEFAULT NULL,
    description VARCHAR(10000) NULL DEFAULT NULL,
    logo VARCHAR(255) NULL DEFAULT NULL,
    image VARCHAR(255) NULL DEFAULT NULL,
    url VARCHAR(255) NULL DEFAULT NULL,
    is_related_to INTEGER unsigned NULL DEFAULT NULL,
    minimum_order_quantity INTEGER unsigned NOT NULL DEFAULT '1',
    date_of_manufacture date NULL DEFAULT NULL,
    keywords VARCHAR(96) NULL DEFAULT NULL,
    rating_percent SMALLINT unsigned NULL DEFAULT NULL,
    views INTEGER unsigned NOT NULL DEFAULT '0',
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_unit`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_unit`
(
    id INTEGER unsigned NOT NULL auto_increment,
    product INTEGER unsigned NOT NULL,
    color CHAR(9) NULL DEFAULT NULL,
    product_size VARCHAR(8) NULL DEFAULT NULL,
    quantity_in_stock INTEGER unsigned NOT NULL DEFAULT '1',
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`offer`;
CREATE TABLE IF NOT EXISTS `${database}`.`offer`
(
    id INTEGER unsigned NOT NULL auto_increment,
    product INTEGER unsigned NOT NULL,
    availability SMALLINT unsigned NOT NULL DEFAULT '1',
    availability_starts DATETIME NULL DEFAULT NULL,
    availability_ends DATETIME NULL DEFAULT NULL,
    available_at_or_from INTEGER unsigned NULL DEFAULT NULL,
    price DECIMAL(12,4) NULL DEFAULT NULL,
    discount DECIMAL(12,4) NULL DEFAULT NULL,
    currency SMALLINT unsigned NULL DEFAULT '566',
    seller INTEGER unsigned NOT NULL,
    valid_from DATETIME NULL DEFAULT NULL,
    valid_through DATETIME NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_comment`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_comment` (
    id INTEGER unsigned NOT NULL auto_increment,
    product INTEGER unsigned NOT NULL unique,
    author INTEGER unsigned NULL DEFAULT NULL,
    title VARCHAR(64) NULL DEFAULT NULL,
    content VARCHAR(10000) NOT NULL,
    keywords VARCHAR(96) NULL DEFAULT NULL,
    replied_to INTEGER unsigned NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`payment_method`;
CREATE TABLE IF NOT EXISTS `${database}`.`payment_method`
(
    id SMALLINT unsigned NOT NULL,
    payment_method VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`user_payment_method`;
CREATE TABLE IF NOT EXISTS `${database}`.`user_payment_method` (
    id INTEGER unsigned NOT NULL auto_increment,
    payment_method SMALLINT unsigned NOT NULL,
    owner INTEGER unsigned NOT NULL,
    username VARCHAR(64) NULL DEFAULT NULL,
    payment_method_number VARCHAR(64) NULL DEFAULT NULL,
    code VARCHAR(8) NULL DEFAULT NULL,
    billing_address INTEGER unsigned NULL DEFAULT NULL,
    expiry_date date NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`payment_details`;
CREATE TABLE IF NOT EXISTS `${database}`.`payment_details` (
    id INTEGER unsigned NOT NULL auto_increment,
    order INTEGER unsigned NOT NULL unique,
    selected_payment_method INTEGER unsigned NOT NULL,
    payment_amount DECIMAL(12,4) NOT NULL,
    currency SMALLINT unsigned NOT NULL DEFAULT '566',
    payment_code CHAR(16) NOT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`product_order`;
CREATE TABLE IF NOT EXISTS `${database}`.`product_order` (
    id INTEGER unsigned NOT NULL auto_increment,
    buyer INTEGER unsigned NOT NULL,
    status SMALLINT unsigned NOT NULL DEFAULT '1',
    order_date DATETIME NULL DEFAULT NULL,
    required_date DATETIME NULL DEFAULT NULL,
    payment_details INTEGER unsigned NULL DEFAULT NULL,
    shipping_details INTEGER unsigned NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`order_product`;
CREATE TABLE IF NOT EXISTS `${database}`.`order_product` (
    id INTEGER unsigned NOT NULL auto_increment,
    order INTEGER unsigned NOT NULL,
    product INTEGER unsigned NOT NULL,
    price DECIMAL(12,4) NULL DEFAULT NULL,
    discount DECIMAL(12,4) NULL DEFAULT NULL,
    currency SMALLINT unsigned NOT NULL DEFAULT '566',
    quantity INTEGER unsigned NOT NULL DEFAULT '1',
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;

DROP TABLE IF EXISTS `${database}`.`shipping_details`;
CREATE TABLE IF NOT EXISTS `${database}`.`shipping_details` (
    id INTEGER unsigned NOT NULL auto_increment,
    order INTEGER unsigned NOT NULL unique,
    shipping_method VARCHAR(64) NULL DEFAULT NULL,
    ship_date DATETIME NULL DEFAULT NULL,
    estimated_arrival_date DATETIME NULL DEFAULT NULL,
    datecreated DATETIME NOT NULL,
    timemodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARACTER SET = UTF8 COLLATE = UTF8_GENERAL_CI;
