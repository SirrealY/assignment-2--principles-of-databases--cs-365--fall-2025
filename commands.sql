/*
1. Create a new entry into the database, which already has your ten initial entries.
2. Get the password associated with the URL of one of your ten entries.
3. Get all the password-related data, including the *decrypted* password, associated with URLs that have `https` in two of your ten entries.
4. Change a URL associated with one of the passwords in your ten entries.
5. Change the password to any entry.
6. Remove a tuple based on a URL.
7. Remove a tuple based on a password.
*/

USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('SEUZ', 512));


-- Create a new entry, already populated with ten intital entries
INSERT INTO websites (name, url)
SELECT 'Pacsun', 'https://www.pacsun.com'
WHERE NOT EXISTS (SELECT 1 FROM websites WHERE url = 'https://www.pacsun.com');

INSERT INTO credentials (user_id, website_id, url, site_username, passwords_enc)
SELECT u.user_id, w.website_id, w.url, 'sirreal', AES_ENCRYPT('pacsunR0cks!', @key_str, @init_vector)
FROM users u
JOIN websites w ON u.user_id = 4 AND w.url = 'https://www.pacsun.com'
WHERE NOT EXISTS (SELECT 1 FROM credentials WHERE url = 'https://www.pacsun.com' AND user_id = 4);

-- Get the decrypted password associated with the URL of one of your ten entries
SELECT 
  c.credential_id,
    c.site_username,
    c.url,
    CONVERT(AES_DECRYPT(c.passwords_enc, @key_str, @init_vector) USING utf8mb4) AS decrypted_password
FROM credentials AS c 
WHERE c.url = 'https://www.hulu.com';

-- Get all the password-related data, including the *decrypted* password, associated with URLs that have `https` in two of your ten entries.

SELECT 
  c.credential_id,
  c.user_id,
  c.website_id,
  c.site_username,
  c.url,
  CONVERT(AES_DECRYPT(c.passwords_enc, @key_str, @init_vector) USING utf8mb4) AS decrypted_password,
  c.created_at
FROM credentials AS c
WHERE c.url IN ('https://www.mysql.com', 'https://www.hulu.com')
ORDER BY c.credential_id;


-- UPDATE the URL associated with one of your password entries
UPDATE websites
SET url = 'https://www.idontlikewizard101.org'
WHERE url = 'https://www.wizard101.com';

UPDATE credentials 
SET url = 'https://www.idontlikewizard101.org'
WHERE url = 'https://www.wizard101.com';

-- Update the password to any entry 

UPDATE credentials AS c 
JOIN users u ON u.user_id = c.user_id
JOIN websites w ON w.website_id = c.website_id
SET c.passwords_enc = AES_ENCRYPT('newP@ssw0rd!', @key_str, @init_vector)
WHERE u.username = 'steph456' AND w.url = 'https://www.hulu.com';

-- Remove a tuple based on URL

DELETE FROM credentials 
where url = 'https://www.pacsun.com';

-- Remove a tuple based on password
DELETE FROM credentials 
WHERE passwords_enc = AES_ENCRYPT('pacsunR0cks!', @key_str, @init_vector);
