use shibuya_development;

INSERT INTO nodes (name, screen_name, color, created_at, parent_node_id) VALUES
  ("Tokyo",     "東京", "fff", NOW(), NULL),

  ("Shibuya",   "渋谷", "278C3E", NOW(), 1),
  ("Tokyo",     "東京", "37B7DD", NOW(), 1),
  ("Shinagawa", "品川", "3689DB", NOW(), 1),

-- EA628F
  ("Sakuragaoka", "桜ヶ丘", "E35AED", NOW(), 2),
  ("Dogenzaka",   "道玄坂", "7F1033", NOW(), 2),
  ("Nanpeidai",   "南平台", "2A32C1", NOW(), 2),

  ("Shibuya109",  "渋谷109", "EA59BA", NOW(), 6)
;

INSERT INTO users (name, screen_name, encrypted_password, password_salt, created_at) VALUES
  ("test1", "Test User", "0000", "000000", NOW())
;
