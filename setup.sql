
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

INSERT INTO credentials (username, url, passwords_enc) VALUES
  ('lebron123',    'https://www.mysql.com',    AES_ENCRYPT('mysqlR0cks!', @key_str, @init_vector)),
  ('lebron123',    'https://www.wizard101.com',    AES_ENCRYPT('w1zardP@ss', @key_str, @init_vector)),
  ('steph456',    'https://www.pirate101.com',    AES_ENCRYPT('pirateP@ss', @key_str, @init_vector)),
  ('steph456',    'https://www.hulu.com',    AES_ENCRYPT('huluL0ve$', @key_str, @init_vector)),
  ('spiderman2030',    'https://www.minecraft.net',    AES_ENCRYPT('mineCr@ft!', @key_str, @init_vector)),
  ('spiderman2030',    'https://www.leagueoflegends.com',    AES_ENCRYPT('l3gendsRul3!', @key_str, @init_vector)),
  ('youngman789',    'https://www.fortnite.com',    AES_ENCRYPT('f0rtnite!', @key_str, @init_vector)),
  ('youngman789',    'https://www.callofduty.com',    AES_ENCRYPT('c@ll0fDutY!', @key_str, @init_vector)),
  ('youngman789',    'https://www.elderscrollsonline.com',    AES_ENCRYPT('3lderscr0lls!', @key_str, @init_vector)),
  ('youngman789',    'https://www.cyberpunk.net',    AES_ENCRYPT('cyb3rpunk!', @key_str, @init_vector));
