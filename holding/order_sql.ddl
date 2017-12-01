

DROP TABLE HasTag;
DROP TABLE ItemInOrder;
DROP TABLE ItemInCart;
DROP TABLE Suggestion;
DROP TABLE Review;
DROP TABLE ShippedProduct;
DROP TABLE PaymentInfo;
DROP TABLE CustAddress;
DROP TABLE Shipment;
DROP TABLE Orders;
DROP TABLE Tags;
DROP TABLE Product;
DROP TABLE Supplier;
DROP TABLE Customer;


create table Customer(
	cID integer NOT NULL,
	firstName varchar(20),
	lastName varchar(20),
	birthdate date,
	phoneNum varchar(12),
	userEmail varchar(30) unique,
	password varchar(30),
	Uuid varchar(36),
	accType varchar(15),
	primary key (cID)
	);
	
create table Supplier(
	suID integer NOT NULL,
	name varchar(20),
	phoneNum varchar(12),
	descr varchar(256),
	primary key (suID)
	)
	
create table Product(
	pID integer,
	name varchar(20),
	description varchar(500),
	price decimal,
	videoLink varchar(50),
	inventory integer,
	image varchar(200),
	tag varchar(20),
	primary key (pID)
	);
	

	
create table Orders(
	oID integer NOT NULL,
	orderDate date,
	totalPrice decimal(9,2),
	shipDate date,
	cID integer,
	primary key (oID),
	foreign key (cID) references Customer (cID)
		on delete set null on update cascade
	);
	
create table Shipment(
	sID integer,
	estimateCost decimal(9,2),
	suID integer,
	primary key (sID),
	foreign key (suID) references Supplier (suID)
		on delete set null on update cascade
	);


create table CustAddress(
	address varchar(30),
	provinceOrState varchar(20),
	country varchar(20),
	postalCode varchar(6),
	cID integer,
	suID integer,
	primary key (address, cID, suID),
	foreign key (cID) references Customer (cID)
		On delete cascade on update cascade,
	foreign key (suID) references Supplier (suID)
		On delete cascade on update cascade
	);

create table PaymentInfo(
	cardID integer,
	cardNum varchar(16),
	cardType varchar(10),
	cID integer,
	suID integer,
	address varchar(30) unique,
	primary key (cardID),
	foreign key (address,cID,suID) references CustAddress (address,cID,suID)
		On delete set null on update cascade
	);
	
create table ShippedProduct(
	pID integer,
	sID integer,
	quantity integer,
	primary key (pID, sID),
	foreign key (pID) references Product (pID)
		on delete cascade on update cascade,
	foreign key (sID) references Shipment (sID)
		on delete cascade on update cascade
	);

create table Review(
	revID integer,
	stars char(1),
	comments varchar(256), 
	cID integer,
	pID integer,
	datePosted date,
	primary key (revID),
	foreign key (cID) references Customer (cID)
		on delete set null on update cascade,
	foreign key (pID) references Product (pID)
		on delete set null on update cascade
	);

create table Suggestion(
	tagID integer,
	tagTally integer,
	pID integer,
	cID integer,
	primary key (tagID),
	foreign key (pID) references Product (pID)
		on delete set null on update cascade,
	foreign key (cID) references Customer (cID)
		on delete set null on update cascade
	);

create table ItemInCart(
	cID integer,
	pID integer,
	primary key (cID, pID),
	foreign key (cID) references Customer (cID)
		on delete cascade on update cascade,
	foreign key (pID) references Product (pID)
		on delete cascade on update cascade
	);

create table ItemInOrder(
	pID integer,
	oID integer,
	primary key (pID, oID),
	foreign key (pID) references Product (pID)
		on delete cascade on update cascade,
	foreign key (oID) references Orders (oID)
		on delete cascade on update cascade
	);


	
INSERT Product VALUES (1,'Awesome Auger','Take the hard work out of yard work.',29.01,'https://www.youtube.com/watch?v=Ir9TAYMcFWw',100,'Search','Yard');
INSERT Product VALUES (2,'Cheers to You','A life-affirmirming, motivational CD to eliminate your doom and gloom.',8.99,'https://www.youtube.com/watch?v=o50_ZlMnjqY',66,'Search','Home');
INSERT Product VALUES (3,'Clapper','Clap on, clap off light switch.',	22.95,'https://www.youtube.com/watch?v=Ny8-G8EoWOw',79,'Search','Home');
INSERT Product VALUES (4,'Fidget Spinner','The toy that spins, on ball bearings, up to five minutes straight!',3.89,'https://www.youtube.com/watch?v=xCCXCJO4FDE',299,'Search','Msc');
INSERT Product VALUES (5,'Floam','Silly Putty, but foamier.',15.05,'https://www.youtube.com/watch?v=OwiAbiGP0xA',40,'Search','Msc');
INSERT Product VALUES (6,'Happy Hot Dog Man','Make dinner exciting and create your own hot dog man.',5.65,'https://www.youtube.com/watch?v=CUTPCEA-al0',148,'Search','Kitchen');
INSERT Product VALUES (7,'Hawaii Chair','Electric hula-hooping, swivel chair.',43.99,'https://www.youtube.com/watch?v=E9_amg-Aos4',69,'Search','Office');
INSERT Product VALUES (8,'Hercules Hook','A hook with the strength of a hero.',11.55,'https://www.youtube.com/watch?v=sF-IWJEQuEQ',29,'Search','Home');
INSERT Product VALUES (9,'Licki Brush','Lick your cat, like a cat.',23.11,'https://www.youtube.com/watch?v=3hPMc89sKhk',280,'Search','Home');
INSERT Product VALUES (10,'Life Alert','I have fallen and I cannot get up! The portable alarm button.',19.95,'https://www.youtube.com/watch?v=gh0Sslh9JKA',78,'Search','Home');
INSERT Product VALUES (11,'Mighty Putty','A powerful bonding epoxy stick that you can mold to any shape and can apply to any surface for an everlasting bond.',19.99,'https://www.youtube.com/watch?v=nkuReA-AGa8',358,'Search','Yard');
INSERT Product VALUES (12,'Magic Air Cushion','Neck pain therapy that allows you to stretch out your neck and let your muscles relax.',25.76,'https://www.youtube.com/watch?v=zzd73Ubx8KY',105,'Search','Home');
INSERT Product VALUES (13,'OxiClean','Verstile laundry stain remover, to remove your toughest stains.',10.98,'https://www.youtube.com/watch?v=2PU8ZxQj7eE',99,'Search','Home');
INSERT Product VALUES (14,'Pet Rock','Complete with breathable carrier box, this pet is a strong companion for life.',4.21,'https://www.youtube.com/watch?v=7tR2dz4_o4E',420,'Search','Home');
INSERT Product VALUES (15,'Schticky','A three-piece, washable, reusable lint roller.',15.99,'https://www.youtube.com/watch?v=VAQjF5RPgbg',5,'Search','Home');
INSERT Product VALUES (16,'Shake Weight','A modified dumbbell that oscillates, increasing the effects of exercise.',18.99,'https://www.youtube.com/watch?v=rwIJlEsIVZQ',73,'Search','Home');
INSERT Product VALUES (17,'ShamWow','Made of super-absorbent cloth that will not scratch surfaces and lasts for years, unlike paper towels and other cleaning cloths.',19.95,'https://www.youtube.com/watch?v=23zGquwJfbw',96,'Search','Kitchen');
INSERT Product VALUES (18,'Slap Chop','You are gonna be slapping your troubles away with the slap chop, a manual chopping machine.',19.99,'https://www.youtube.com/watch?v=pPKtBM99kAc',55,'https://my-live-02.slatic.net/p/3/slap-chop-food-chopper-1483504147-8023261-af95347d634fb187464f7d52323d3085.jpg','Kitchen');
INSERT Product VALUES (19,'Snuggy','A body-length blanket with sleeves usually made of fleece or nylon material.',25.39,'https://www.youtube.com/watch?v=2xZp-GLMMJ0',30,'Search','Kitchen');
INSERT Product VALUES (20,'Tiddy Bear','Comfort strap, making seatbelt waering more comfortable.',5.99,'https://www.youtube.com/watch?v=gw1g2yKxb0I',21,'Search','Car');


INSERT Customer VALUES (1, 'Archie', 'Andrews', '1991-01-01','111-222-3333','aandrews@amail.com','pass1','a1a1',null);
INSERT Customer VALUES (2, 'Betty', 'Boop', '1992-02-02','222-333-4444','bboop@bmail.com','pass2','b2b2',null);
INSERT Customer VALUES (3, 'Charlie', 'Chaplin', '1991-03-03','333-444-5555','cchaplin@cmail.com','pass3','c3c3',null);
INSERT Customer VALUES (4, 'Debbie', 'Downer', '1991-04-04','444-555-6666','ddowner@dmail.com','pass4','d4d4',null);
INSERT Customer VALUES (5, 'Ed', 'Eddie', '1991-05-05','555-666-7777','eeddie@email.com','pass5','e5e5',null);
INSERT Customer VALUES (-1, 'DefaultSUP',null,null,null,null,null,null,null);

INSERT Supplier VALUES (1, 'Adam', '111-111-1111',null);
INSERT Supplier VALUES (2, 'Ben', '222-222-2222',null);
INSERT Supplier VALUES (3, 'Carl', '333-333-3333',null);
INSERT Supplier VALUES (4, 'Dave', '444-444-4444',null);
INSERT Supplier VALUES (5, 'Ethan', '555-555-5555',null);
INSERT Supplier VALUES (-1,'DefaultCust',null,null);


INSERT CustAddress VALUES ('1 Avenue', 'AL', 'United States', 'A1A1A1',1,5);
INSERT CustAddress VALUES ('2 Boulevard', 'BC', 'Canada', 'B2B2B2',2,4);
INSERT CustAddress VALUES ('3 Cathedral', 'CA', 'United States', 'C3C3C3',3,3);
INSERT CustAddress VALUES ('4 Drive', 'SD', 'United States', 'D4D4D4',4,2);
INSERT CustAddress VALUES ('5 Elsewhere', 'ON', 'Canada', 'E5E5E5',5,1);

INSERT Orders VALUES (1,'2017-01-03',30.99,'2017-01-08',2);
INSERT Orders VALUES (2,'2017-04-06',15.99,'2017-01-08',2);
INSERT Orders VALUES (3,'2017-01-09',20.99,'2017-01-10',3);

