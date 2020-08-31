alter table `ivyfash_db0`.`region` add foreign key `region_country_countryid_fk` (countryid) references country(countryid) on delete cascade on update cascade;

alter table `ivyfash_db0`.`itemtype` add foreign key `itemtype_itemtype_itemtypid_fk` (parenttype) references itemtype(itemtypeid) on delete cascade on update cascade;

alter table `ivyfash_db0`.`productcategory` add foreign key `productcategory_itemtype_itemtypeid_fk` (itemtypeid) references itemtype(itemtypeid) on delete cascade on update cascade;

alter table `ivyfash_db0`.`productsubcategory` add foreign key `productsubcategory_productcategory_productcategoryid_fk` (productcategoryid) references productcategory(productcategoryid) on update cascade;

alter table `ivyfash_db0`.`address` add foreign key `address_country_countryid_fk` (countryid) references country(countryid) on update cascade;
alter table `ivyfash_db0`.`address` add foreign key `address_region_regionid_fk` (regionid) references region(regionid) on update cascade;

alter table `ivyfash_db0`.`siteuser` add foreign key `siteuser_gender_genderid_fk` (genderid) references gender(genderid) on update cascade;
alter table `ivyfash_db0`.`siteuser` add foreign key `siteuser_address_addressid_fk` (addressid) references address(addressid) on update cascade;
alter table `ivyfash_db0`.`siteuser` add foreign key `siteuser_userstatus_userstatusid_fk` (userstatusid) references userstatus(userstatusid) on update cascade;
alter table `ivyfash_db0`.`siteuser` add foreign key `siteuser_currency_currencyid_fk` (currencyid) references currency(currencyid) on update cascade;
alter table `ivyfash_db0`.`siteuser` add foreign key `siteuser_howdidyoufindus_howdidyoufindusid_fk` (howdidyoufindusid) references howdidyoufindus(howdidyoufindusid) on update cascade;

alter table `ivyfash_db0`.`product` add foreign key `product_productcategory_productcategoryid_fk` (productcategoryid) references productcategory(productcategoryid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_productsubcategory_productsubcategoryid_fk` (productsubcategoryid) references productsubcategory(productsubcategoryid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_productstatus_productstatusid_fk` (productstatusid) references productstatus(productstatusid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_brand_brandid_fk` (brandid) references brand(brandid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_product_productid_fk` (isRelatedTo) references product(productid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_availability_availabilityid_fk` (availabilityid) references availability(availabilityid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_address_addressid_fk` (availableAtOrFrom) references address(addressid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_currency_currencyid_fk` (currencyid) references currency(currencyid) on update cascade; 
alter table `ivyfash_db0`.`product` add foreign key `product_siteuser_siteuserid_fk` (seller) references siteuser(siteuserid) on update cascade; 

alter table `ivyfash_db0`.`productvariant` add foreign key `productvariant_product_productid_fk` (productid) references product(productid) on delete cascade on update cascade; 

alter table `ivyfash_db0`.`productcomment` add foreign key `productcomment_product_productid_fk` (productid) references product(productid) on delete cascade on update cascade; 
alter table `ivyfash_db0`.`productcomment` add foreign key `productcomment_siteuser_siteuserid_fk` (author) references siteuser(siteuserid) on delete cascade on update cascade; 
alter table `ivyfash_db0`.`productcomment` add foreign key `productcomment_productcomment_productcommentid_fk` (isreplyto) references productcomment(productcommentid) on update cascade; 

alter table `ivyfash_db0`.`userpaymentmethod` add foreign key `userpaymentmethod_paymentmethod_paymentmethodid_fk` (paymentmethodid) references paymentmethod(paymentmethodid) on update cascade; 
alter table `ivyfash_db0`.`userpaymentmethod` add foreign key `userpaymentmethod_siteuser_siteuserid_fk` (paymentmethoduser) references siteuser(siteuserid) on delete cascade on update cascade; 
alter table `ivyfash_db0`.`userpaymentmethod` add foreign key `userpaymentmethod_address_addressid_fk` (billingAddress) references address(addressid) on update cascade; 

alter table `ivyfash_db0`.`payment` add foreign key `payment_productorder_productorderid_fk` (productorderid) references productorder(productorderid) on update cascade; 
alter table `ivyfash_db0`.`payment` add foreign key `payment_paymentstatus_paymentstatusid_fk` (paymentstatusid) references paymentstatus(paymentstatusid) on update cascade; 
alter table `ivyfash_db0`.`payment` add foreign key `payment_userpaymentmethod_userpaymentmethodid_fk` (userpaymentmethodid) references userpaymentmethod(userpaymentmethodid) on update cascade; 
alter table `ivyfash_db0`.`payment` add foreign key `payment_currency_currencyid_fk` (currencyid) references currency(currencyid) on update cascade; 

alter table `ivyfash_db0`.`productorder` add foreign key `productorder_siteuser_siteuserid_fk` (buyer) references siteuser(siteuserid) on update cascade; 
alter table `ivyfash_db0`.`productorder` add foreign key `productorder_orderstatus_orderstatusid_fk` (orderstatusid) references orderstatus(orderstatusid) on update cascade; 

alter table `ivyfash_db0`.`orderproduct` add foreign key `orderproduct_productorder_productorderid_fk` (productorderid) references productorder(productorderid) on delete cascade on update cascade; 
alter table `ivyfash_db0`.`orderproduct` add foreign key `orderproduct_productvariant_productvariantid_fk` (productvariantid) references productvariant(productvariantid); 
alter table `ivyfash_db0`.`orderproduct` add foreign key `orderproduct_currency_currencyid_fk` (currencyid) references currency(currencyid) on delete cascade on update cascade; 

alter table `ivyfash_db0`.`shippingdetails` add foreign key `shippingdetails_productorder_productorderid_fk` (productorderid) references productorder(productorderid) on delete cascade on update cascade; 
alter table `ivyfash_db0`.`shippingdetails` add foreign key `shippingdetails_shippingstatus_shippingstatusid_fk` (shippingstatusid) references shippingstatus(shippingstatusid) on update cascade; 
alter table `ivyfash_db0`.`shippingdetails` add foreign key `shippingdetails_address_addressid_fk` (deliveryAddress) references address(addressid) on delete cascade on update cascade; 

