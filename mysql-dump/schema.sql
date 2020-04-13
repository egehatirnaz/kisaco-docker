DROP DATABASE IF EXISTS kisaco_db;
CREATE DATABASE kisaco_db;
ALTER DATABASE
    kisaco_db
    CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;
USE kisaco_db;

CREATE TABLE `User` (
	`id` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(60) NOT NULL,
	`name` varchar(255) NOT NULL,
	`created_at` INT(11)
);

CREATE TABLE `URL` (
	`id` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`user_id` INT(10) NOT NULL,
	`orig_url` VARCHAR(2000) NOT NULL,
	`short_url` VARCHAR(225) NOT NULL,
	`created_at` INT(11) NOT NULL,
	`expires_at` INT(11),
	`creator_ip` VARCHAR(41) NOT NULL,
	`visitor_count` VARCHAR(10) NOT NULL DEFAULT '0',
	`visitor_limit` VARCHAR(10) NOT NULL DEFAULT '0',
	`is_private` BOOLEAN NOT NULL DEFAULT '0',
	FOREIGN KEY (user_id) REFERENCES User(id) on delete cascade on update cascade
);

CREATE TABLE `URL_Request` (
	`id` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`url_id` INT(10) NOT NULL,
	`request_ip` VARCHAR(41) NOT NULL,
	`country_code` VARCHAR(2),
	`request_referrer` VARCHAR(255),
	`created_at` INT(11) NOT NULL,
	FOREIGN KEY (url_id) REFERENCES URL(id) on delete cascade on update cascade
);

-- ALTER TABLE `URL` ADD CONSTRAINT `URL_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

-- ALTER TABLE `URL_Request` ADD CONSTRAINT `URL_Request_fk0` FOREIGN KEY (`url_id`) REFERENCES `URL`(`id`);