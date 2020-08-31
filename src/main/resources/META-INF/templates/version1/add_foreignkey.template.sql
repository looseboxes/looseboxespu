alter table `${database}`.`region` add foreign key (country) references country(id) on delete cascade on update cascade;

alter table `${database}`.`product_subcategory` add foreign key (category) references product_category(id) on delete cascade on update cascade;

alter table `${database}`.`address` add foreign key (country) references country(id) on delete cascade on update cascade;
alter table `${database}`.`address` add foreign key (region) references region(id) on delete cascade on update cascade;

alter table `${database}`.`site_user` add foreign key (gender) references gender(id) on delete cascade on update cascade;
alter table `${database}`.`site_user` add foreign key (address) references address(id) on delete cascade on update cascade;
alter table `${database}`.`site_user` add foreign key (status) references user_status(id) on delete cascade on update cascade;
alter table `${database}`.`site_user` add foreign key (currency) references currency(id) on delete cascade on update cascade;
alter table `${database}`.`site_user` add foreign key (how_did_you_find_us) references how_did_you_find_us(id) on delete cascade on update cascade;

alter table `${database}`.`product` add foreign key (category) references product_category(id) on delete cascade on update cascade;
alter table `${database}`.`product` add foreign key (subcategory) references product_subcategory(id) on delete cascade on update cascade;
alter table `${database}`.`product` add foreign key (status) references product_status(id) on delete cascade on update cascade;
alter table `${database}`.`product` add foreign key (brand) references brand(id) on delete cascade on update cascade;
alter table `${database}`.`product` add foreign key (is_related_to) references product(id) on delete cascade on update cascade;

alter table `${database}`.`product_unit` add foreign key (product) references product(id) on delete cascade on update cascade;

alter table `${database}`.`offer` add foreign key (product) references product(id) on delete cascade on update cascade;
alter table `${database}`.`offer` add foreign key (availability) references availability(id) on delete cascade on update cascade;
alter table `${database}`.`offer` add foreign key (available_at_or_from) references address(id) on delete cascade on update cascade;
alter table `${database}`.`offer` add foreign key (currency) references currency(id) on delete cascade on update cascade;
alter table `${database}`.`offer` add foreign key (seller) references site_user(id) on delete cascade on update cascade;

alter table `${database}`.`product_comment` add foreign key (product) references product(id) on delete cascade on update cascade;
alter table `${database}`.`product_comment` add foreign key (author) references site_user(id) on delete cascade on update cascade;
alter table `${database}`.`product_comment` add foreign key (replied_to) references site_user(id) on delete cascade on update cascade;

alter table `${database}`.`user_payment_method` add foreign key (payment_method) references payment_method(id) on delete cascade on update cascade;
alter table `${database}`.`user_payment_method` add foreign key (owner) references site_user(id) on delete cascade on update cascade;
alter table `${database}`.`user_payment_method` add foreign key (billing_address) references address(id) on delete cascade on update cascade;

alter table `${database}`.`payment` add foreign key (order) references product_order(id) on delete cascade on update cascade;
alter table `${database}`.`payment` add foreign key (selected_payment_method) references user_payment_method(id) on delete cascade on update cascade;
alter table `${database}`.`payment` add foreign key (currency) references currency(id) on delete cascade on update cascade;

alter table `${database}`.`product_order` add foreign key (buyer) references site_user(id) on delete cascade on update cascade;
alter table `${database}`.`product_order` add foreign key (status) references order_status(id) on delete cascade on update cascade;
alter table `${database}`.`product_order` add foreign key (payment_details) references payment_details(id) on delete cascade on update cascade;
alter table `${database}`.`product_order` add foreign key (shipping_detals) references shipping_details(id) on delete cascade on update cascade;

alter table `${database}`.`order_product` add foreign key (order) references product_order(id) on delete cascade on update cascade;
alter table `${database}`.`order_product` add foreign key (product) references product(id) on delete cascade on update cascade;
alter table `${database}`.`order_product` add foreign key (currency) references currency(id) on delete cascade on update cascade;

alter table `${database}`.`shipping_details` add foreign key (order) references product_order(id) on delete cascade on update cascade;
