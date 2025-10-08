
-- Create Database
DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE passwords;

-- Encryption
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('SEUZ', 512));
SET @init_vector = RANDOM_BYTES(16);

-- Create Table

CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(256)   NOT NULL,
  first_name VARCHAR(256)   NOT NULL,
  last_name VARCHAR(256)   NOT NULL,
  email    VARCHAR(256)   NOT NULL,
  create_at TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (username),
  UNIQUE KEY uq_user_email (email)
)
CREATE TABLE IF NOT EXISTS websites (
  url      VARCHAR(256)   NOT NULL,
  name     VARCHAR(256)   NOT NULL,
  create_at TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (url),
  UNIQUE KEY uq_website_name (name)
);

CREATE TABLE IF NOT EXISTS credentials (
  username VARCHAR(50)   NOT NULL,
  url     VARCHAR(256)   NOT NULL,
  passwords_enc VARBINARY(512) NOT NULL,
  create_at TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (username, url),
);
