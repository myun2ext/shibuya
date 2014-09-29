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
  screen_name VARCHAR(128) NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (id)
);
CREATE UNIQUE INDEX node_name_idx ON nodes (name);
ALTER TABLE nodes ADD FOREIGN KEY(parent_node_id) REFERENCES nodes(id);

-- chat_logs table
CREATE TABLE chat_logs (
  id BIGINT NOT NULL AUTO_INCREMENT,
  node_id BIGINT NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (id)
);
ALTER TABLE chat_logs ADD FOREIGN KEY(node_id) REFERENCES nodes(id);
