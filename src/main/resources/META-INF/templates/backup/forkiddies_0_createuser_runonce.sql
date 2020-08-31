drop database if exists `ivyfash_db0`;
create database if not exists `ivyfash_db0` CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create user 'ivyfash_root'@'localhost' identified by '7345xT-eeSw';

grant all privileges on ivyfash_db0.* TO 'ivyfash_root'@'localhost' WITH GRANT OPTION;

