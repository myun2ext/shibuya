use shibuya_development;

INSERT INTO nodes (id, name, screen_name, color, created_at) VALUES
  (1000, "Anime",   "Anime (Root)", "278C3E", NOW())
;

INSERT INTO nodes (name, screen_name, color, created_at, parent_node_id) VALUES
  ("Koukaku-Kidoutai",    "攻殻機動隊", "278C3E", NOW(), 1000),
  ("Akira",               "AKIRA", "37B7DD", NOW(), 1),
  ("Shinagawa", "品川", "3689DB", NOW(), 1),
  ("Meguro",    "目黒", "212B23", NOW(), 1),
;
