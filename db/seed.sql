use shibuya_development;

INSERT INTO nodes (name,  screen_name, created_at, parent_node_id) VALUES
  ("Shibuya",   "渋谷", NOW(), NULL),
  ("Tokyo",     "東京", NOW(), NULL),
  ("Shinagawa", "品川", NOW(), NULL),

  ("Sakuragaoka", "桜ヶ丘", NOW(), 1),
  ("Dogenzaka",   "道玄坂", NOW(), 1),
  ("Nanpeidai",   "南平台", NOW(), 1),

  ("Shibuya109",  "渋谷109", NOW(), 5)
;

INSERT INTO users (name, screen_name, encrypted_password, password_salt, created_at) VALUES
  ("test1", "Test User", "0000", "000000", NOW())
;
