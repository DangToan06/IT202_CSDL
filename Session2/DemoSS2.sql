create database db_ks24_cntt1_ss2;

use db_ks24_cntt1_ss2;

create table province(
    prov_id char(10) not null primary key ,
    prov_name varchar(100) not null unique ,
    created_date date not null ,
    area float check ( area > 0 ),
    population int check ( population > 8 ) default 1000
);

create table district(
    dist_id int auto_increment primary key ,
    prov_id char(10) not null ,
    dis_name varchar(100) not null,
    created_date date default  '1970-01-01',
    area float check ( area >= 0 ),
    population int check ( population>=0 ) default '100',
    foreign key (prov_id) references province(prov_id),
    unique (dist_id, dis_name)
);

select * from province;

insert into province(prov_id, prov_name, created_date, area, population) VALUE
('hn', 'Ha Noi', '1973-06-20', 300000, 1200000)