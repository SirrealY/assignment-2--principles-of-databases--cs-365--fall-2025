-- INSERT VALUES FOR credentials, users, websites
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


INSERT INTO users (username, first_name, last_name, email) VALUES
  ('lebron123', 'LeBron', 'James', 'bron@gmail.com'),
  ('steph456', 'Stephen', 'Curry', 'curry@yahoo.com'),
  ('spiderman2030', 'Peter', 'Parker', 'spiderguy22@gmail.com'),
  ('youngman789', 'Sirreal', 'Young', 'upsidedown2500@hartford.edu');



INSERT INTO websites (url, name) VALUES
  ('https://www.mysql.com', 'MySQL'),
  ('https://www.wizard101.com', 'Wizard101'),
  ('https://www.pirate101.com', 'Pirate101'),
  ('https://www.hulu.com', 'Hulu'),
  ('https://www.minecraft.net', 'Minecraft'),
  ('https://www.leagueoflegends.com', 'League of Legends'),
  ('https://www.fortnite.com', 'Fortnite'),
  ('https://www.callofduty.com', 'Call of Duty'),
  ('https://www.elderscrollsonline.com', 'Elder Scrolls Online'),
  ('https://www.cyberpunk.net', 'Cyberpunk 2077');
