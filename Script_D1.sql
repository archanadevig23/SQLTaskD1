drop table products;
drop table warehouses;
drop table warehouses_stock;
drop table wholesalers;
drop table wholesalers_stock;
drop table retailers;
drop table retailers_stock;

select * from products;
select * from warehouses;
select * from warehouses_stock;
select * from wholesalers;
select * from wholesalers_stock;
select * from retailers;
select * from retailers_stock;

create table products
(
	id int primary key,
	code varchar not null,
	pname varchar,
	mrp int,
	gst decimal
);

create table warehouses
(
	id int primary key,
	code varchar not null,
	wname varchar
);

create table warehouses_stock
(
	id int primary key,
	pid int not null,
	wid int not null,
	constraint wid_fk foreign key (wid) references warehouses(id),
	constraint pid_fk foreign key (pid) references products(id),
	stock int
);

create table wholesalers
(
	id int primary key,
	code varchar not null,
	whname varchar
);

create table wholesalers_stock
(
	id int primary key,
	pid int not null,
	wid int not null,
	whid int not null,
	constraint wid_fk foreign key (wid) references warehouses(id),
	constraint pid_fk foreign key (pid) references products(id),
	constraint whid_fk foreign key (whid) references wholesalers(id),
	stock int,
	price int
);

create table retailers
(
	id int primary key,
	code varchar not null,
	rname varchar
);

create table retailers_stock
(
	id int primary key,
	pid int not null,
	whid int not null,
	rid int not null,
	constraint pid_fk foreign key (pid) references products(id),
	constraint whid_fk foreign key (whid) references wholesalers(id),
	constraint rid_fk foreign key (rid) references retailers(id),
	stock int,
	price int
);

insert into products values 
(1, 'P1001', 'Apple Macbook Pro 12', 149999, 25.80),
(2, 'P1002', 'Lenovo Ideapad L9', 99999, 22.80),
(3, 'P1003', 'DELL Inspiron 16', 74999, 19.85),
(4, 'P1004', 'HP Paviliion 12', 75999, 19.85),
(5, 'P1005', 'DELL Inspiron 21', 84999, 20.55);

insert into warehouses values 
(1, 'W1001', 'ABC Warehouses'),
(2, 'W1002', 'DEF Warehouses'),
(3, 'W1003', 'GHI Warehouses');

insert into wholesalers values 
(1, 'WH1001', 'ABC Wholesalers'),
(2, 'WH1002', 'DEF Wholesalers'),
(3, 'WH1003', 'GHI Wholesalers');

insert into retailers values 
(1, 'R1001', 'ABC Retailers'),
(2, 'R1002', 'DEF Retailers'),
(3, 'R1003', 'GHI Retailers');

insert into warehouses_stock values
(1,1,1,10),
(2,1,2,10),
(3,1,3,10),
(4,2,1,20),
(5,3,2,10);

insert into wholesalers_stock values
(1,5,3,1,10,85999),
(2,3,1,1,20,75999),
(3,2,2,2,30,119999),
(4,2,3,3,10,109999),
(5,1,2,1,10,159999);

insert into retailers_stock values
(1,5,3,1,5,86999),
(2,3,1,1,10,76999),
(3,2,2,2,10,129999),
(4,2,3,3,5,119999),
(5,1,2,1,5,169999);
