drop database shibuya_development;
create database shibuya_development;
use shibuya_development;

-- Users table
CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  screen_name VARCHAR(128) NOT NULL,
  encrypted_password CHAR(128) NOT NULL,
  password_salt CHAR(64) NOT NULL,
  created_at datetime NOT NULL,
  last_sign_in_at datetime,
  PRIMARY KEY (id)
);
CREATE UNIQUE INDEX user_name_idx ON users (name);

-- nodes table
CREATE TABLE nodes (
  id BIGINT NOT NULL AUTO_INCREMENT,
  parent_node_id BIGINT,
  name VARCHAR(64) NOT NULL,
  color CHAR(6) NOT NULL,
  screen_name VARCHAR(255) NOT NULL,
  description TEXT,
-- last_updated_user_id BIGINT,
  created_at datetime NOT NULL,
  PRIMARY KEY (id)
);
CREATE UNIQUE INDEX node_name_idx ON nodes (parent_node_id, name);
ALTER TABLE nodes ADD FOREIGN KEY(parent_node_id) REFERENCES nodes(id);
-- ALTER TABLE nodes ADD FOREIGN KEY(last_updated_user_id) REFERENCES users(id);

-- node_owners table
CREATE TABLE node_owners (
  node_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (node_id, user_id)
);
ALTER TABLE node_owners ADD FOREIGN KEY(node_id) REFERENCES nodes(id);
ALTER TABLE node_owners ADD FOREIGN KEY(user_id) REFERENCES users(id);

-- favorites table
CREATE TABLE favorites (
  user_id BIGINT NOT NULL,
  node_id BIGINT NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (user_id, node_id)
);
CREATE UNIQUE INDEX favorite_idx ON favorites (user_id, node_id);
ALTER TABLE favorites ADD FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE favorites ADD FOREIGN KEY(node_id) REFERENCES nodes(id);

-- chat_logs table
CREATE TABLE chat_logs (
  id BIGINT NOT NULL AUTO_INCREMENT,
  node_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  text TEXT NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (id)
);
ALTER TABLE chat_logs ADD FOREIGN KEY(node_id) REFERENCES nodes(id);
ALTER TABLE chat_logs ADD FOREIGN KEY(user_id) REFERENCES users(id);
