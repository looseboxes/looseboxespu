#
# MyIsam Tables

drop table if exists `ivyfash_db0`.`chatmessage`;
create table if not exists `ivyfash_db0`.`chatmessage` (
    chatmessageid mediumint(8) unsigned not null auto_increment,
    fromEmail varchar(96) NOT NULL,
    toEmail varchar(96) NOT NULL,
    chatText varchar(255) NOT NULL,
    datecreated timestamp not null default current_timestamp,
    primary key(chatmessageid)
) ENGINE=MyISAM DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`email`;
create table if not exists `ivyfash_db0`.`email` (
    emailid mediumint(8) unsigned not null auto_increment,
    fromEmail varchar(63) not null,
    toEmails varchar(4095) not null,
    emailSubject varchar(255),
    emailText varchar(4095) not null,
    contentType varchar(31),
    file1 varchar(255) null default null,
    file2 varchar(255) null default null,
    file3 varchar(255) null default null,
    file4 varchar(255) null default null,
    file5 varchar(255) null default null,
    file6 varchar(255) null default null,
    file7 varchar(255) null default null,
    sent boolean not null default false,
    datecreated timestamp not null default current_timestamp,
    primary key(emailid)
) ENGINE=MyISAM DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

#
# InnoDb Tables

drop table if exists `ivyfash_db0`.`address`;
create table if not exists `ivyfash_db0`.`address` (
    addressid mediumint(8) unsigned not null auto_increment,
    countryid smallint(4) unsigned not null,
    regionid smallint(4) unsigned null default null,
    city varchar(64) null default null,
    county varchar(64) null default null,
    streetAddress varchar(64) null default null, 
    fax varchar(32)  null default null,
    postalCode varchar(32) null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(addressid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`siteuser`;
create table if not exists `ivyfash_db0`.`siteuser` (
    siteuserid mediumint(8) unsigned not null auto_increment,
    emailAddress varchar(96) not null unique,
    username varchar(32) not null unique,
    genderid smallint(4) unsigned null default null, 
    lastName varchar(64) null default null,
    firstName varchar(64) null default null,
    dateOfBirth date null default null,
    phoneNumber varchar(32) null default null,
    mobileNumber varchar(32) null default null,
    contactDetails varchar(96) null default null, /** e.g BB Pin, Skype etc **/
    addressid mediumint(8) unsigned null default null, 
    logo varchar(255) null default null, 
    image1 varchar(255) null default null,
    image2 varchar(255) null default null,
    image3 varchar(255) null default null,
    url varchar(255) null default null, 
    userstatusid smallint(4) unsigned not null DEFAULT '1',
    currencyid smallint(4) unsigned not null default '566', 
    howdidyoufindusid smallint(4) unsigned null default null, 
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(siteuserid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

# Made to conform to schema.org
drop table if exists `ivyfash_db0`.`brand`;
create table if not exists `ivyfash_db0`.`brand`
(   
    brandid smallint(4) unsigned not null auto_increment,   
    brandName varchar(64) not null,   
    description varchar(255) null default null,
    logo varchar(255) null default null,
    image varchar(255) null default null,
    url varchar(255) null default null,
    primary key(brandid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`product`; 
create table if not exists `ivyfash_db0`.`product` 
(
    productid mediumint(8) unsigned not null auto_increment, 
    productName varchar(64) not null,  
    productcategoryid smallint(4) unsigned not null, 
    productsubcategoryid smallint(4) unsigned not null default '13', 
    productstatusid smallint(4) unsigned not null default '1', 
    brandid smallint(4) unsigned null default null, 
    model varchar(64) null default null, 
    keywords varchar(96) null default null,
    description varchar(1000) null default null,
    price decimal(12,4) null default null,
    discount decimal(12,4) null default null,
    currencyid smallint(4) unsigned not null default '566',
    seller mediumint(8) unsigned not null, 
    minimumOrderQuantity mediumint(8) unsigned not null default '1',
    logo varchar(255) null default null,
    url varchar(255) null default null, 
    isRelatedTo mediumint(8) unsigned null default null,
    dateOfManufacture date null default null,
    ratingPercent smallint(4) unsigned null default null,
    views mediumint(8) unsigned not null default '0',
    availabilityid smallint(4) unsigned not null default '1', 
    availableAtOrFrom mediumint(8) unsigned null default null, 
    validFrom datetime null default null,
    validThrough datetime null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(productid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`productvariant`; 
create table if not exists `ivyfash_db0`.`productvariant` 
(
    productvariantid mediumint(8) unsigned not null auto_increment, 
    productid mediumint(8) unsigned not null,
    color varchar(32) null default null,
    productSize varchar(32) null default null,
    weight decimal(5,2) null default null,
    quantityInStock mediumint(8) unsigned not null default '1',
    image1 varchar(255) null default null,
    image2 varchar(255) null default null,
    image3 varchar(255) null default null,
    image4 varchar(255) null default null,
    image5 varchar(255) null default null,
    image6 varchar(255) null default null,
    image7 varchar(255) null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(productvariantid),
    key color_productSize_idx (color, productSize)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`productcomment`;
create table if not exists `ivyfash_db0`.`productcomment` (
    productcommentid mediumint(8) unsigned not null auto_increment,
    productid mediumint(8) unsigned not null,
    author mediumint(8) unsigned null default null, 
    headline varchar(64) null default null,
    commentText varchar(1000) not null, 
    keywords varchar(96) null default null,
    isreplyto mediumint(8) unsigned null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(productcommentid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`productorder`;
create table if not exists `ivyfash_db0`.`productorder` (
    productorderid mediumint(8) unsigned not null auto_increment,
    buyer mediumint(8) unsigned not null,
    orderstatusid smallint(4) unsigned not null default '1',
    orderDate datetime null default null,
    requiredDate datetime null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(productorderid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`orderproduct`;
create table if not exists `ivyfash_db0`.`orderproduct` (
    orderproductid mediumint(8) unsigned not null auto_increment,
    productorderid mediumint(8) unsigned not null,
    productvariantid mediumint(8) unsigned not null,
    price decimal(12,4) null default null,
    discount decimal(12,4) null default null,
    currencyid smallint(4) unsigned not null default '566', 
    quantity mediumint(8) unsigned not null default '1',
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(orderproductid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`userpaymentmethod`;
create table if not exists `ivyfash_db0`.`userpaymentmethod` (
    userpaymentmethodid mediumint(8) unsigned not null auto_increment,
    paymentmethodid smallint(4) unsigned not null, 
    paymentmethoduser mediumint(8) unsigned not null,
    paymentMethodUsername varchar(64) null default null, 
    paymentMethodNumber varchar(64) null default null, 
    code varchar(8) null default null,
    billingAddress mediumint(8) unsigned null default null,
    expiryDate date null default null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(userpaymentmethodid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`payment`;
create table if not exists `ivyfash_db0`.`payment` (
    paymentid mediumint(8) unsigned not null auto_increment,
    productorderid mediumint(8) unsigned not null unique,
    paymentstatusid smallint(4) unsigned not null default '1',
    userpaymentmethodid mediumint(8) unsigned not null,
    paymentAmount decimal(12,4) not null,
    currencyid smallint(4) unsigned not null default '566',
    paymentCode char(16) not null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(paymentid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`shippingdetails`;
create table if not exists `ivyfash_db0`.`shippingdetails` (
    shippingdetailsid mediumint(8) unsigned not null auto_increment,
    productorderid mediumint(8) unsigned not null unique,
    shippingstatusid smallint(4) unsigned not null default '1',
    shippingMethod varchar(64) null default null,
    shipDate datetime null default null,
    estimatedArrivalDate datetime null default null,
    deliveryAddress mediumint(8) unsigned not null,
    datecreated datetime not null,
    timemodified timestamp not null default current_timestamp on update current_timestamp,
    primary key(shippingdetailsid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;




