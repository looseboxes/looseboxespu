drop database if exists `ivyfash_db0`;
create database if not exists `ivyfash_db0` CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`country`;
create table if not exists `ivyfash_db0`.`country` 
(   
    countryid smallint(4) unsigned not null,   
    country varchar(64) not null unique,   
    isocode2 char(2) not null unique,   
    isocode3 char(3) not null unique, 
    primary key(countryid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`region`;
create table if not exists `ivyfash_db0`.`region`
(   
    regionid smallint(4) unsigned not null,   
    region varchar(32) not null unique, 
    regionCode char(5) not null unique,
    countryid smallint(4) unsigned not null,
    primary key(regionid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;

drop table if exists `ivyfash_db0`.`gender`;
create table if not exists `ivyfash_db0`.`gender`
(   
    genderid smallint(4) unsigned not null,   
    gender varchar(8) not null unique,   
    primary key(genderid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`gender` VALUES (1, 'Male');
INSERT INTO `ivyfash_db0`.`gender` VALUES (2, 'Female');

drop table if exists `ivyfash_db0`.`userstatus`;
create table if not exists `ivyfash_db0`.`userstatus`
(   
    userstatusid smallint(4) unsigned not null,   
    userstatus varchar(32) not null unique,   
    primary key(userstatusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
insert into `ivyfash_db0`.`userstatus` VALUES(1, 'Unactivated');
insert into `ivyfash_db0`.`userstatus` VALUES(2, 'Activated');
insert into `ivyfash_db0`.`userstatus` VALUES(3, 'Deactivated');
insert into `ivyfash_db0`.`userstatus` VALUES(4, 'Unregistered');

# Made to conform iso currency code
drop table if exists `ivyfash_db0`.`currency`;
create table if not exists `ivyfash_db0`.`currency`
(   
    currencyid smallint(4) unsigned not null,   
    currency char(3) not null unique, 
    symbol char(3) not null unique,
    description varchar(32) not null unique,
    fractionDigits smallint(4) unsigned not null,
    primary key(currencyid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`currency` VALUES (566, 'NGN', '₦', 'Naira', 2);
INSERT INTO `ivyfash_db0`.`currency` VALUES (826, 'GBP', '£', 'Pound sterling', 2);
INSERT INTO `ivyfash_db0`.`currency` VALUES (840, 'USD', '$', 'United States dollar', 2);
INSERT INTO `ivyfash_db0`.`currency` VALUES (978, 'EUR', '€', 'Euro', 2);

drop table if exists `ivyfash_db0`.`howdidyoufindus`;
create table if not exists `ivyfash_db0`.`howdidyoufindus`
(   
    howdidyoufindusid smallint(4) unsigned not null,   
    howdidyoufindus varchar(32) not null unique,   
    primary key(howdidyoufindusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`howdidyoufindus` VALUES (1, 'Through a friend or colleague');
INSERT INTO `ivyfash_db0`.`howdidyoufindus` VALUES (2, 'From the web');
INSERT INTO `ivyfash_db0`.`howdidyoufindus` VALUES (3, 'Magazines or other print media');
INSERT INTO `ivyfash_db0`.`howdidyoufindus` VALUES (4, 'TV or other electronic media');
INSERT INTO `ivyfash_db0`.`howdidyoufindus` VALUES (5, 'Through our agent');

/** schema.org itemtype */
drop table if exists `ivyfash_db0`.`itemtype`;
create table if not exists `ivyfash_db0`.`itemtype`
(   
    itemtypeid smallint(4) unsigned not null,   
    itemtype varchar(64) not null unique,
    parenttype smallint(4) unsigned null,
    primary key(itemtypeid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (1, 'Data Type', null);
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (2, 'Thing', null);
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (3, 'Intangible', 2);
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (4, 'Product', 2);
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (5, 'Job Posting', 3);
INSERT INTO `ivyfash_db0`.`itemtype` VALUES (6, 'Vehicle', 4);

drop table if exists `ivyfash_db0`.`productcategory`;
create table if not exists `ivyfash_db0`.`productcategory`
(   
    productcategoryid smallint(4) unsigned not null,   
    productcategory varchar(32) not null unique,   
    itemtypeid smallint(4) unsigned not null,
    productcategory_sortorder smallint(4) unsigned null default null,
    primary key(productcategoryid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`productcategory` VALUES (1, 'Fashion', 4, 1);

drop table if exists `ivyfash_db0`.`productsubcategory`;
create table if not exists `ivyfash_db0`.`productsubcategory`
(   
    productsubcategoryid smallint(4) unsigned not null,   
    productsubcategory varchar(32) not null unique,   
    productcategoryid smallint(4) unsigned not null,
    productsubcategory_sortorder smallint(4) unsigned null default null,
    primary key(productsubcategoryid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (1, 'Women''s Clothing', 1, 1);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (2, 'Women''s Shoes', 1, 2);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (3, 'Women''s Accessories', 1, 3);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (4, 'Men''s Clothing', 1, 4);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (5, 'Men''s Shoes', 1, 5);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (6, 'Men''s Accessories', 1, 6);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (7, 'Kid''s Clothing', 1, 7);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (8, 'Kid''s Shoes', 1, 8);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (9, 'Kid''s Accessories', 1, 9);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (10, 'Baby''s Clothing', 1, 10);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (11, 'Baby''s Shoes', 1, 11);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (12, 'Baby''s Accessories', 1, 12);
INSERT INTO `ivyfash_db0`.`productsubcategory` VALUES (13, 'Other', 1, 13);

drop table if exists `ivyfash_db0`.`productstatus`;
create table if not exists `ivyfash_db0`.`productstatus`
(   
    productstatusid smallint(4) unsigned not null,   
    productstatus varchar(32) not null unique,   
    primary key(productstatusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`productstatus` VALUES (1, 'New');
INSERT INTO `ivyfash_db0`.`productstatus` VALUES (2, 'Classic');
INSERT INTO `ivyfash_db0`.`productstatus` VALUES (3, 'Refurbished');
INSERT INTO `ivyfash_db0`.`productstatus` VALUES (4, 'Used');

# Made to conform to schema.org
drop table if exists `ivyfash_db0`.`availability`;
create table if not exists `ivyfash_db0`.`availability`
(   
    availabilityid smallint(4) unsigned not null,   
    availability varchar(32) not null unique,   
    primary key(availabilityid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`availability` VALUES (1, 'In Stock');
INSERT INTO `ivyfash_db0`.`availability` VALUES (2, 'Limited Availability');
INSERT INTO `ivyfash_db0`.`availability` VALUES (3, 'Out of Stock');
INSERT INTO `ivyfash_db0`.`availability` VALUES (4, 'Sold Out');
INSERT INTO `ivyfash_db0`.`availability` VALUES (5, 'Moved');

drop table if exists `ivyfash_db0`.`paymentmethod`;
create table if not exists `ivyfash_db0`.`paymentmethod`
(   
    paymentmethodid smallint(4) unsigned not null,   
    paymentmethod varchar(32) not null unique,   
    primary key(paymentmethodid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (1, 'Master Card');
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (2, 'Visa Card');
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (3, 'Verve');
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (4, 'Bank Deposit');
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (5, 'Cash on Delivery');
INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (6, 'Book on Hold');
# INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (7, 'Pay Pal');
# INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (8, 'Mobile Money');
# INSERT INTO `ivyfash_db0`.`paymentmethod` VALUES (9, 'Bitcoin');

drop table if exists `ivyfash_db0`.`orderstatus`;
create table if not exists `ivyfash_db0`.`orderstatus`
(   
    orderstatusid smallint(4) unsigned not null,   
    orderstatus varchar(32) not null unique,   
    primary key(orderstatusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`orderstatus` VALUES (1, 'Pending');
INSERT INTO `ivyfash_db0`.`orderstatus` VALUES (2, 'Ordered');

drop table if exists `ivyfash_db0`.`paymentstatus`;
create table if not exists `ivyfash_db0`.`paymentstatus`
(   
    paymentstatusid smallint(4) unsigned not null,   
    paymentstatus varchar(32) not null unique,   
    primary key(paymentstatusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`paymentstatus` VALUES (1, 'Pending');
INSERT INTO `ivyfash_db0`.`paymentstatus` VALUES (2, 'Processing Payment');
INSERT INTO `ivyfash_db0`.`paymentstatus` VALUES (3, 'Payment Received');
INSERT INTO `ivyfash_db0`.`paymentstatus` VALUES (4, 'Payment Declined');
INSERT INTO `ivyfash_db0`.`paymentstatus` VALUES (5, 'Part Paid');

drop table if exists `ivyfash_db0`.`shippingstatus`;
create table if not exists `ivyfash_db0`.`shippingstatus`
(   
    shippingstatusid smallint(4) unsigned not null,   
    shippingstatus varchar(32) not null unique,   
    primary key(shippingstatusid)
)ENGINE=INNODB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (1, 'Pending');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (2, 'Partially Dispatched');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (3, 'Fully Dispatched');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (4, 'Partially Arrived');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (5, 'Fully Arrived');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (6, 'Partially Received');
INSERT INTO `ivyfash_db0`.`shippingstatus` VALUES (7, 'Fully Received');


# Made to conform to iso region codes
INSERT INTO `ivyfash_db0`.`region` VALUES (1,'Abia', 'NG-AB', 566);
INSERT INTO `ivyfash_db0`.`region` VALUES (2,'Abuja Federal Capital Territory', 'NG-FC', 566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	3	,'Adamawa', 'NG-AD',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	4	,'Akwa Ibom', 'NG-AK',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	5	,'Anambra', 'NG-AN',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	6	,'Bauchi', 'NG-BA',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	7	,'Bayelsa', 'NG-BY',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	8	,'Benue', 'NG-BE',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	9	,'Borno', 'NG-BO',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	10	,'Cross River', 'NG-CR',566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	11	,'Delta', 'NG-DE',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	12	,'Ebonyi', 'NG-EB',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	13	,'Edo', 'NG-ED',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	14	,'Ekiti', 'NG-EK',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	15	,'Enugu', 'NG-EN',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	16	,'Gombe', 'NG-GO',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	17	,'Imo', 'NG-IM',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	18	,'Jigawa', 'NG-JI',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	19	,'Kaduna', 'NG-KD',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	20	,'Kano', 'NG-KN',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	21	,'Katsina', 'NG-KT',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	22	,'Kebbi', 'NG-KE',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	23	,'Kogi', 'NG-KO',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	24	,'Kwara', 'NG-KW',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	25	,'Lagos', 'NG-LA',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	26	,'Nassarawa', 'NG-NA',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	27	,'Niger', 'NG-NI',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	28	,'Ogun', 'NG-OG',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	29	,'Ondo', 'NG-ON',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	30	,'Osun', 'NG-OS',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	31	,'Oyo', 'NG-OY',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	32	,'Plateau', 'NG-PL',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	33	,'Rivers', 'NG-RI',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	34	,'Sokoto', 'NG-SO',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	35	,'Taraba', 'NG-TA',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	36	,'Yobe', 'NG-YO',	566);
INSERT INTO `ivyfash_db0`.`region` VALUES (	37	,'Zamfara', 'NG-ZA',	566);

# Made to conform to iso country codes
# Only 566-Nigeria currently conforms to iso numberic codes for countries
# INSERT INTO `ivyfash_db0`.`country` VALUES (1,'Afghanistan','AF','AFG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (2,'Albania','AL','ALB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (3,'Algeria','DZ','DZA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (4,'American Samoa','AS','ASM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (5,'Andorra','AD','AND');
# INSERT INTO `ivyfash_db0`.`country` VALUES (6,'Angola','AO','AGO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (7,'Anguilla','AI','AIA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (8,'Antarctica','AQ','ATA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (9,'Antigua and Barbuda','AG','ATG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (10,'Argentina','AR','ARG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (11,'Armenia','AM','ARM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (12,'Aruba','AW','ABW');
# INSERT INTO `ivyfash_db0`.`country` VALUES (13,'Australia','AU','AUS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (14,'Austria','AT','AUT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (15,'Azerbaijan','AZ','AZE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (16,'Bahamas','BS','BHS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (17,'Bahrain','BH','BHR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (18,'Bangladesh','BD','BGD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (19,'Barbados','BB','BRB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (20,'Belarus','BY','BLR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (21,'Belgium','BE','BEL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (22,'Belize','BZ','BLZ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (23,'Benin','BJ','BEN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (24,'Bermuda','BM','BMU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (25,'Bhutan','BT','BTN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (26,'Bolivia','BO','BOL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (27,'Bosnia and Herzegowina','BA','BIH');
# INSERT INTO `ivyfash_db0`.`country` VALUES (28,'Botswana','BW','BWA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (29,'Bouvet Island','BV','BVT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (30,'Brazil','BR','BRA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (31,'British Indian Ocean Territory','IO','IOT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (32,'Brunei Darussalam','BN','BRN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (33,'Bulgaria','BG','BGR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (34,'Burkina Faso','BF','BFA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (35,'Burundi','BI','BDI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (36,'Cambodia','KH','KHM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (37,'Cameroon','CM','CMR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (38,'Canada','CA','CAN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (39,'Cape Verde','CV','CPV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (40,'Cayman Islands','KY','CYM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (41,'Central African Republic','CF','CAF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (42,'Chad','TD','TCD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (43,'Chile','CL','CHL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (44,'China','CN','CHN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (45,'Christmas Island','CX','CXR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (46,'Cocos (Keeling) Islands','CC','CCK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (47,'Colombia','CO','COL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (48,'Comoros','KM','COM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (49,'Congo','CG','COG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (50,'Cook Islands','CK','COK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (51,'Costa Rica','CR','CRI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (52,'Cote D Ivoire','CI','CIV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (53,'Croatia','HR','HRV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (54,'Cuba','CU','CUB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (55,'Cyprus','CY','CYP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (56,'Czech Republic','CZ','CZE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (57,'Denmark','DK','DNK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (58,'Djibouti','DJ','DJI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (59,'Dominica','DM','DMA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (60,'Dominican Republic','DO','DOM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (61,'East Timor','TP','TMP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (62,'Ecuador','EC','ECU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (63,'Egypt','EG','EGY');
# INSERT INTO `ivyfash_db0`.`country` VALUES (64,'El Salvador','SV','SLV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (65,'Equatorial Guinea','GQ','GNQ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (66,'Eritrea','ER','ERI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (67,'Estonia','EE','EST');
# INSERT INTO `ivyfash_db0`.`country` VALUES (68,'Ethiopia','ET','ETH');
# INSERT INTO `ivyfash_db0`.`country` VALUES (69,'Falkland Islands (Malvinas)','FK','FLK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (70,'Faroe Islands','FO','FRO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (71,'Fiji','FJ','FJI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (72,'Finland','FI','FIN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (73,'France','FR','FRA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (74,'France, Metropolitan','FX','FXX');
# INSERT INTO `ivyfash_db0`.`country` VALUES (75,'French Guiana','GF','GUF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (76,'French Polynesia','PF','PYF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (77,'French Southern Territories','TF','ATF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (78,'Gabon','GA','GAB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (79,'Gambia','GM','GMB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (80,'Georgia','GE','GEO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (81,'Germany','DE','DEU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (82,'Ghana','GH','GHA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (83,'Gibraltar','GI','GIB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (84,'Greece','GR','GRC');
# INSERT INTO `ivyfash_db0`.`country` VALUES (85,'Greenland','GL','GRL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (86,'Grenada','GD','GRD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (87,'Guadeloupe','GP','GLP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (88,'Guam','GU','GUM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (89,'Guatemala','GT','GTM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (90,'Guinea','GN','GIN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (91,'Guinea-bissau','GW','GNB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (92,'Guyana','GY','GUY');
# INSERT INTO `ivyfash_db0`.`country` VALUES (93,'Haiti','HT','HTI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (94,'Heard and Mc Donald Islands','HM','HMD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (95,'Honduras','HN','HND');
# INSERT INTO `ivyfash_db0`.`country` VALUES (96,'Hong Kong','HK','HKG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (97,'Hungary','HU','HUN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (98,'Iceland','IS','ISL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (99,'India','IN','IND');
# INSERT INTO `ivyfash_db0`.`country` VALUES (100,'Indonesia','ID','IDN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (101,'Iran (Islamic Republic of)','IR','IRN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (102,'Iraq','IQ','IRQ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (103,'Ireland','IE','IRL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (104,'Israel','IL','ISR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (105,'Italy','IT','ITA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (106,'Jamaica','JM','JAM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (107,'Japan','JP','JPN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (108,'Jordan','JO','JOR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (109,'Kazakhstan','KZ','KAZ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (110,'Kenya','KE','KEN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (111,'Kiribati','KI','KIR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (112,'Korea, Democratic Peoples Republic of','KP','PRK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (113,'Korea, Republic of','KR','KOR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (114,'Kuwait','KW','KWT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (115,'Kyrgyzstan','KG','KGZ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (116,'Lao Peoples Democratic Republic','LA','LAO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (117,'Latvia','LV','LVA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (118,'Lebanon','LB','LBN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (119,'Lesotho','LS','LSO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (120,'Liberia','LR','LBR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (121,'Libyan Arab Jamahiriya','LY','LBY');
# INSERT INTO `ivyfash_db0`.`country` VALUES (122,'Liechtenstein','LI','LIE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (123,'Lithuania','LT','LTU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (124,'Luxembourg','LU','LUX');
# INSERT INTO `ivyfash_db0`.`country` VALUES (125,'Macau','MO','MAC');
# INSERT INTO `ivyfash_db0`.`country` VALUES (126,'Macedonia, The Former Yugoslav Republic of','MK','MKD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (127,'Madagascar','MG','MDG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (128,'Malawi','MW','MWI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (129,'Malaysia','MY','MYS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (130,'Maldives','MV','MDV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (131,'Mali','ML','MLI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (132,'Malta','MT','MLT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (133,'Marshall Islands','MH','MHL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (134,'Martinique','MQ','MTQ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (135,'Mauritania','MR','MRT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (136,'Mauritius','MU','MUS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (137,'Mayotte','YT','MYT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (138,'Mexico','MX','MEX');
# INSERT INTO `ivyfash_db0`.`country` VALUES (139,'Micronesia, Federated States of','FM','FSM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (140,'Moldova, Republic of','MD','MDA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (141,'Monaco','MC','MCO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (142,'Mongolia','MN','MNG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (143,'Montserrat','MS','MSR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (144,'Morocco','MA','MAR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (145,'Mozambique','MZ','MOZ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (146,'Myanmar','MM','MMR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (147,'Namibia','NA','NAM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (148,'Nauru','NR','NRU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (149,'Nepal','NP','NPL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (150,'Netherlands','NL','NLD');
# INSERT INTO `ivyfash_db0`.`country` VALUES (151,'Netherlands Antilles','AN','ANT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (152,'New Caledonia','NC','NCL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (153,'New Zealand','NZ','NZL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (154,'Nicaragua','NI','NIC');
# INSERT INTO `ivyfash_db0`.`country` VALUES (155,'Niger','NE','NER');
INSERT INTO `ivyfash_db0`.`country` VALUES (566,'Nigeria','NG','NGA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (157,'Niue','NU','NIU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (158,'Norfolk Island','NF','NFK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (159,'Northern Mariana Islands','MP','MNP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (160,'Norway','NO','NOR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (161,'Oman','OM','OMN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (162,'Pakistan','PK','PAK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (163,'Palau','PW','PLW');
# INSERT INTO `ivyfash_db0`.`country` VALUES (164,'Panama','PA','PAN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (165,'Papua New Guinea','PG','PNG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (166,'Paraguay','PY','PRY');
# INSERT INTO `ivyfash_db0`.`country` VALUES (167,'Peru','PE','PER');
# INSERT INTO `ivyfash_db0`.`country` VALUES (168,'Philippines','PH','PHL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (169,'Pitcairn','PN','PCN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (170,'Poland','PL','POL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (171,'Portugal','PT','PRT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (172,'Puerto Rico','PR','PRI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (173,'Qatar','QA','QAT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (174,'Reunion','RE','REU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (175,'Romania','RO','ROM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (176,'Russian Federation','RU','RUS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (177,'Rwanda','RW','RWA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (178,'Saint Kitts and Nevis','KN','KNA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (179,'Saint Lucia','LC','LCA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (180,'Saint Vincent and the Grenadines','VC','VCT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (181,'Samoa','WS','WSM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (182,'San Marino','SM','SMR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (183,'Sao Tome and Principe','ST','STP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (184,'Saudi Arabia','SA','SAU');
# INSERT INTO `ivyfash_db0`.`country` VALUES (185,'Senegal','SN','SEN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (186,'Seychelles','SC','SYC');
# INSERT INTO `ivyfash_db0`.`country` VALUES (187,'Sierra Leone','SL','SLE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (188,'Singapore','SG','SGP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (189,'Slovakia (Slovak Republic)','SK','SVK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (190,'Slovenia','SI','SVN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (191,'Solomon Islands','SB','SLB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (192,'Somalia','SO','SOM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (193,'South Africa','ZA','ZAF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (194,'South Georgia and the South Sandwich Islands','GS','SGS');
# INSERT INTO `ivyfash_db0`.`country` VALUES (195,'Spain','ES','ESP');
# INSERT INTO `ivyfash_db0`.`country` VALUES (196,'Sri Lanka','LK','LKA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (197,'St. Helena','SH','SHN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (198,'St. Pierre and Miquelon','PM','SPM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (199,'Sudan','SD','SDN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (200,'Suriname','SR','SUR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (201,'Svalbard and Jan Mayen Islands','SJ','SJM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (202,'Swaziland','SZ','SWZ');
# INSERT INTO `ivyfash_db0`.`country` VALUES (203,'Sweden','SE','SWE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (204,'Switzerland','CH','CHE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (205,'Syrian Arab Republic','SY','SYR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (206,'Taiwan','TW','TWN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (207,'Tajikistan','TJ','TJK');
# INSERT INTO `ivyfash_db0`.`country` VALUES (208,'Tanzania, United Republic of','TZ','TZA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (209,'Thailand','TH','THA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (210,'Togo','TG','TGO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (211,'Tokelau','TK','TKL');
# INSERT INTO `ivyfash_db0`.`country` VALUES (212,'Tonga','TO','TON');
# INSERT INTO `ivyfash_db0`.`country` VALUES (213,'Trinidad and Tobago','TT','TTO');
# INSERT INTO `ivyfash_db0`.`country` VALUES (214,'Tunisia','TN','TUN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (215,'Turkey','TR','TUR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (216,'Turkmenistan','TM','TKM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (217,'Turks and Caicos Islands','TC','TCA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (218,'Tuvalu','TV','TUV');
# INSERT INTO `ivyfash_db0`.`country` VALUES (219,'Uganda','UG','UGA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (220,'Ukraine','UA','UKR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (221,'United Arab Emirates','AE','ARE');
# INSERT INTO `ivyfash_db0`.`country` VALUES (222,'United Kingdom','GB','GBR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (223,'United States','US','USA');
# INSERT INTO `ivyfash_db0`.`country` VALUES (224,'United States Minor Outlying Islands','UM','UMI');
# INSERT INTO `ivyfash_db0`.`country` VALUES (225,'Uruguay','UY','URY');
# INSERT INTO `ivyfash_db0`.`country` VALUES (226,'Uzbekistan','UZ','UZB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (227,'Vanuatu','VU','VUT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (228,'Vatican City State (Holy See)','VA','VAT');
# INSERT INTO `ivyfash_db0`.`country` VALUES (229,'Venezuela','VE','VEN');
# INSERT INTO `ivyfash_db0`.`country` VALUES (230,'Viet Nam','VN','VNM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (231,'Virgin Islands (British)','VG','VGB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (232,'Virgin Islands (U.S.)','VI','VIR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (233,'Wallis and Futuna Islands','WF','WLF');
# INSERT INTO `ivyfash_db0`.`country` VALUES (234,'Western Sahara','EH','ESH');
# INSERT INTO `ivyfash_db0`.`country` VALUES (235,'Yemen','YE','YEM');
# INSERT INTO `ivyfash_db0`.`country` VALUES (236,'Yugoslavia','YU','YUG');
# INSERT INTO `ivyfash_db0`.`country` VALUES (237,'Zaire','ZR','ZAR');
# INSERT INTO `ivyfash_db0`.`country` VALUES (238,'Zambia','ZM','ZMB');
# INSERT INTO `ivyfash_db0`.`country` VALUES (239,'Zimbabwe','ZW','ZWE');
