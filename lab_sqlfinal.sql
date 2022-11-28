create database ECommerce;
use Ecommerce;
create table supplier (supp_id int , supp_name varchar(50) not null,supp_city varchar(50),
supp_phone varchar(50) not null,constraint sid_pk primary key(supp_id));

create table category( cat_id int,cat_name varchar(50) not null,
constraint catid_pk primary key(cat_id));

create table customer(cus_id int,cus_name varchar(50),cus_phone varchar(10) not null,
cus_city varchar(30) not null,cus_gender char,constraint cusid_pk primary key(cus_id));

create table product(pro_id int,pro_name varchar(20) not null default "Dummy",
 pro_desc varchar(60),cat_id int,constraint cat_id_fk foreign key (cat_id) references category (cat_id));
 alter table product add constraint pro_id_pk primary key(pro_id);
 
 create table supplier_pricing(pricing_id int,pro_id int,
 constraint pro_id_fk foreign key (pro_id) references product(pro_id),
 supp_id int ,constraint supp_id_fk foreign key (supp_id) references supplier(supp_id),
 constraint pricing_id_pk primary key (pricing_id));
 
 create table order1 (ord_id int,ord_amount int not null,ord_date date not null,cus_id int,
 constraint cus_id_fk foreign key(cus_id) references customer (cus_id),constraint ord_id_pk primary key (ord_id));
alter table order1 add(pricing_id int );
alter table order1  add constraint pricing_id_fk foreign key(pricing_id) references supplier_pricing(pricing_id);

create table rating( rat_id int,ord_id int,rat_ratstars int not null,
constraint rat_id_pk primary key(rat_id),
constraint ord_id_fk foreign key (ord_id) references order1(ord_id));

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

alter table supplier_pricing add supp_price int;
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER1` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER1` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER1` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER1` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER1` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER1` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER1` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER1` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER1` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER1` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER1` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER1` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER1` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER1` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER1` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER1` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from  
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
 (select `order1`.*, customer.cus_gender, customer.cus_name from `order1` inner join customer where `order1`.cus_id=customer.cus_id having `order1`.ord_amount>=3000)
as t1  group by t1.cus_id) as t2 group by t2.cus_gender;

select product.pro_name, `order1`.* from `order1`, supplier_pricing, product 
where `order1`.cus_id=2 and 
`order1`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

select supplier.* from supplier where supplier.supp_id in 
(select supp_id from supplier_pricing
 group by supp_id having 
count(supp_id)>1) 
group by supplier.supp_id;

select category.cat_id,category.cat_name,min(t3.min_price)as Min_Price
from Category inner join
(select product.cat_id,product.pro_name,t2.*
from product inner join
(select pro_id,min(supp_price) as min_price from supplier_pricing
group by pro_id)
as t2 where t2.pro_id=product.pro_id)
as t3 where t3.cat_id=category.cat_id
group by t3.cat_id;

select product.pro_id,product.pro_name from`order1`
inner join supplier_pricing on
supplier_pricing.pricing_id=`order1`.pricing_id
inner join product on
product.pro_id=supplier_pricing.pro_id
where `order1`.ord_date>"2021-10-05";

use ecommerce;
DELIMITER &&
CREATE PROCEDURE service_rater_proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE 
	WHEN report.Average =5 THEN  'Excellent Service'
    	WHEN report.Average >4 THEN  'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE  'Poor Service'
END AS Type_of_Service
from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join
(select `order1`.pricing_id, rating.ord_id, rating.rat_ratstars from `order1` inner join rating on rating.`ord_id` = `order1`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END && 
DELIMITER ;  
CALL service_rater_proc();

