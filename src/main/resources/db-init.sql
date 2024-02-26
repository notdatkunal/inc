CREATE DATABASE N-INC;

CREATE TABLE admin_role_junction (
  admin_id INT NOT NULL,
   role_id INT NOT NULL,
   CONSTRAINT pk_admin_role_junction PRIMARY KEY (admin_id, role_id)
);

CREATE TABLE tbl_admin (
  admin_id INT AUTO_INCREMENT NOT NULL,
   admin_username VARCHAR(255) NOT NULL,
   admin_password VARCHAR(255) NOT NULL,
   admin_type VARCHAR(255) NULL,
   admin_created_at datetime NULL,
   admin_updated_at datetime NULL,
   CONSTRAINT pk_tbl_admin PRIMARY KEY (admin_id)
);

CREATE TABLE tbl_category (
  category_id INT AUTO_INCREMENT NOT NULL,
   category_name VARCHAR(255) NOT NULL,
   category_title VARCHAR(255) NOT NULL,
   category_created_at datetime NULL,
   category_updated_at datetime NULL,
   category_description VARCHAR(255) NULL,
   category_meta VARCHAR(255) NULL,
   CONSTRAINT pk_tbl_category PRIMARY KEY (category_id)
);

CREATE TABLE tbl_category_posts (
  posts_post_id INT NOT NULL,
   tbl_category_category_id INT NOT NULL
);

CREATE TABLE tbl_customer (
  id INT AUTO_INCREMENT NOT NULL,
   customer_created_at datetime NULL,
   customer_updated_at datetime NULL,
   CONSTRAINT pk_tbl_customer PRIMARY KEY (id)
);

CREATE TABLE tbl_location (
  location_id INT AUTO_INCREMENT NOT NULL,
   location_district VARCHAR(255) NOT NULL,
   location_state VARCHAR(255) NOT NULL,
   location_created_at datetime NULL,
   location_updated_at datetime NULL,
   location_description VARCHAR(255) NULL,
   location_meta VARCHAR(255) NULL,
   CONSTRAINT pk_tbl_location PRIMARY KEY (location_id)
);

CREATE TABLE tbl_location_posts (
  posts_post_id INT NOT NULL,
   tbl_location_location_id INT NOT NULL
);

CREATE TABLE tbl_payment (
  seller_id INT NOT NULL,
   payment_amount VARCHAR(255) NULL,
   payment_upi_id VARCHAR(255) NULL,
   payment_transaction_id VARCHAR(255) NULL,
   payment_created_at datetime NULL,
   payment_updated_at datetime NULL,
   CONSTRAINT pk_tbl_payment PRIMARY KEY (seller_id)
);

CREATE TABLE tbl_post (
  post_id INT AUTO_INCREMENT NOT NULL,
   post_title VARCHAR(255) NULL,
   location_location_id INT NULL,
   post_views INT NULL,
   post_contact VARCHAR(255) NULL,
   post_age INT NULL,
   post_description VARCHAR(255) NULL,
   category_category_id INT NULL,
   promotion_promotion_id INT NULL,
   post_created_at datetime NULL,
   post_updated_at datetime NULL,
   post_is_blocked BIT(1) NULL,
   seller_id INT NULL,
   CONSTRAINT pk_tbl_post PRIMARY KEY (post_id)
);

CREATE TABLE tbl_promotion (
  promotion_id INT AUTO_INCREMENT NOT NULL,
   promotion_amount VARCHAR(255) NOT NULL,
   promotion_created_at datetime NULL,
   promotion_updated_at datetime NULL,
   CONSTRAINT pk_tbl_promotion PRIMARY KEY (promotion_id)
);

CREATE TABLE tbl_role (
  role_id INT AUTO_INCREMENT NOT NULL,
   role_created_at datetime NULL,
   role_updated_at datetime NULL,
   role_authority VARCHAR(255) NULL,
   CONSTRAINT pk_tbl_role PRIMARY KEY (role_id)
);

CREATE TABLE tbl_seller (
  verification_id INT NOT NULL,
   seller_username VARCHAR(255) NOT NULL,
   seller_email VARCHAR(255) NOT NULL,
   seller_password VARCHAR(255) NOT NULL,
   seller_created_at datetime NULL,
   seller_updated_at datetime NULL,
   seller_is_blocked BIT(1) NULL,
   CONSTRAINT pk_tbl_seller PRIMARY KEY (verification_id)
);

CREATE TABLE tbl_verification (
  verification_id INT AUTO_INCREMENT NOT NULL,
   verification_is_verified BIT(1) NULL,
   verification_created_at datetime NULL,
   verification_updated_at datetime NULL,
   CONSTRAINT pk_tbl_verification PRIMARY KEY (verification_id)
);

ALTER TABLE tbl_seller ADD CONSTRAINT uc_tbl_seller_seller_username UNIQUE (seller_username);

ALTER TABLE tbl_seller ADD CONSTRAINT FK_TBL_SELLER_ON_VERIFICATION FOREIGN KEY (verification_id) REFERENCES tbl_verification (verification_id);

ALTER TABLE tbl_post ADD CONSTRAINT uc_tbl_post_post_title UNIQUE (post_title);

ALTER TABLE tbl_post ADD CONSTRAINT FK_TBL_POST_ON_CATEGORY_CATEGORY FOREIGN KEY (category_category_id) REFERENCES tbl_category (category_id);

ALTER TABLE tbl_post ADD CONSTRAINT FK_TBL_POST_ON_LOCATION_LOCATION FOREIGN KEY (location_location_id) REFERENCES tbl_location (location_id);

ALTER TABLE tbl_post ADD CONSTRAINT FK_TBL_POST_ON_PROMOTION_PROMOTION FOREIGN KEY (promotion_promotion_id) REFERENCES tbl_promotion (promotion_id);

ALTER TABLE tbl_post ADD CONSTRAINT FK_TBL_POST_ON_SELLER FOREIGN KEY (seller_id) REFERENCES tbl_seller (verification_id);

ALTER TABLE tbl_payment ADD CONSTRAINT FK_TBL_PAYMENT_ON_SELLER FOREIGN KEY (seller_id) REFERENCES tbl_seller (verification_id);

ALTER TABLE tbl_location ADD CONSTRAINT uc_tbl_location_location_district UNIQUE (location_district);

ALTER TABLE tbl_location_posts ADD CONSTRAINT uc_tbl_location_posts_posts_post UNIQUE (posts_post_id);

ALTER TABLE tbl_location_posts ADD CONSTRAINT fk_tbllocpos_on_location FOREIGN KEY (tbl_location_location_id) REFERENCES tbl_location (location_id);

ALTER TABLE tbl_location_posts ADD CONSTRAINT fk_tbllocpos_on_post FOREIGN KEY (posts_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_category ADD CONSTRAINT uc_tbl_category_category_name UNIQUE (category_name);

ALTER TABLE tbl_category ADD CONSTRAINT uc_tbl_category_category_title UNIQUE (category_title);

ALTER TABLE tbl_category_posts ADD CONSTRAINT uc_tbl_category_posts_posts_post UNIQUE (posts_post_id);

ALTER TABLE tbl_category_posts ADD CONSTRAINT fk_tblcatpos_on_category FOREIGN KEY (tbl_category_category_id) REFERENCES tbl_category (category_id);

ALTER TABLE tbl_category_posts ADD CONSTRAINT fk_tblcatpos_on_post FOREIGN KEY (posts_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_admin ADD CONSTRAINT uc_tbl_admin_admin_username UNIQUE (admin_username);

ALTER TABLE admin_role_junction ADD CONSTRAINT fk_admroljun_on_admin FOREIGN KEY (admin_id) REFERENCES tbl_admin (admin_id);

ALTER TABLE admin_role_junction ADD CONSTRAINT fk_admroljun_on_role FOREIGN KEY (role_id) REFERENCES tbl_role (role_id);