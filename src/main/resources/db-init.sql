
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


ALTER TABLE tbl_category ADD CONSTRAINT uc_tbl_category_category_name UNIQUE (category_name);

ALTER TABLE tbl_category ADD CONSTRAINT uc_tbl_category_category_title UNIQUE (category_title);

ALTER TABLE tbl_category_posts ADD CONSTRAINT uc_tbl_category_posts_posts_post UNIQUE (posts_post_id);

ALTER TABLE tbl_category_posts ADD CONSTRAINT fk_tblcatpos_on_category FOREIGN KEY (tbl_category_category_id) REFERENCES tbl_category (category_id);

ALTER TABLE tbl_category_posts ADD CONSTRAINT fk_tblcatpos_on_post FOREIGN KEY (posts_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_admin ADD CONSTRAINT uc_tbl_admin_admin_username UNIQUE (admin_username);

ALTER TABLE admin_role_junction ADD CONSTRAINT fk_admroljun_on_admin FOREIGN KEY (admin_id) REFERENCES tbl_admin (admin_id);

ALTER TABLE admin_role_junction ADD CONSTRAINT fk_admroljun_on_role FOREIGN KEY (role_id) REFERENCES tbl_role (role_id);