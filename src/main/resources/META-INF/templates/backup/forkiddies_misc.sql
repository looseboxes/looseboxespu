drop table if exists `ivyfash_db0`.`oauthuser`;
create table if not exists `ivyfash_db0`.`oauthuser` (
    emailAddress varchar(96) not null unique,
    accessToken varchar(512) not null,
    secret varchar(512) null default null,
    datecreated timestamp not null default current_timestamp,
    primary key(emailAddress)
) ENGINE=MyISAM DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`supportticket`;
create table if not exists `ivyfash_db0`.`supportticket` (
    supportticketid mediumint(8) unsigned not null auto_increment,
    emailAddress varchar(96) not null,
    phoneNumber varchar(32) null default null,
    subject varchar(64) null default null,
    message varchar(1000) not null,
    isreplyto mediumint(8) unsigned null default null,
    closed boolean not null default false,
    datecreated timestamp not null default current_timestamp,
    primary key(supportticketid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
alter table `ivyfash_db0`.`supportticket` 
add foreign key `supportticket_supportticket_supportticketid_fk` (isreplyto) 
references supportticket(supportticketid) on update cascade;

