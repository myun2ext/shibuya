use shibuya_development;

INSERT INTO nodes (name, screen_name, color, created_at, parent_node_id) VALUES
  ("root",       "", "fff", NOW(), NULL),

  ("Geography",  "地理", "fff", NOW(), NULL),
  ("3",  "地理", "fff", NOW(), NULL),
  ("4",  "地理", "fff", NOW(), NULL),
  ("5",  "地理", "fff", NOW(), NULL),
  ("5",  "地理", "fff", NOW(), NULL),
  ("6",  "地理", "fff", NOW(), NULL),
  ("7",  "地理", "fff", NOW(), NULL),
  ("8",  "地理", "fff", NOW(), NULL),

  ("Country",    "国",   "fff", NOW(), 8),
  ("Japan",      "日本", "fff", NOW(), 9),

  ("Shibuya",   "渋谷", "278C3E", NOW(), 10),
  ("Tokyo",     "東京", "37B7DD", NOW(), 10),
  ("Shinagawa", "品川", "3689DB", NOW(), 10),

  ("Sakuragaoka", "桜ヶ丘", "FFAAEC", NOW(), 11),
  ("Dogenzaka",   "道玄坂", "AA693D", NOW(), 11),
  ("Nanpeidai",   "南平台", "82A4D6", NOW(), 11),

  ("Shibuya109",  "渋谷109", "EA59BA", NOW(), 15)
;

INSERT INTO users (name, screen_name, encrypted_password, password_salt, created_at) VALUES
  ("test1", "Test User", "0000", "000000", NOW())
;
