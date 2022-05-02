CREATE SCHEMA `Inventory_System` ;
USE `Inventory_System`;



CREATE TABLE `raw_materials` (
  `materialID` int(10) NOT NULL,
  `species` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL,
  `priceperfoot` int(10) NOT NULL,
  `quanity` int(10) NOT NULL,
  PRIMARY KEY (`materialID`),
  KEY `species` (`species`)
);

CREATE TABLE `finish` (
  `finishID` int(10) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `color` varchar(50) NOT NULL,
  `quanity` int(10) NOT NULL,
  PRIMARY KEY (`finishID`),
  KEY `color` (`color`)
);

CREATE TABLE `consumable` (
  `consumableID` int(10) NOT NULL,
  `quanity` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`consumableID`),
  KEY `name` (`name`)
);

CREATE TABLE `product` (
  `productID` int(10) NOT NULL,
  `materialID` int(10) NOT NULL,
  `finishID` int(10) NOT NULL,
  `raw_qty` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL,
  `consumable_rate` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `name` (`name`),
  CONSTRAINT `product_1` FOREIGN KEY (`materialID`) REFERENCES `raw_materials` (`materialID`),
  CONSTRAINT `product_2` FOREIGN KEY (`finishID`) REFERENCES `finish` (`finishID`)
);

CREATE TABLE `orders` (
  `orderID` int(10) NOT NULL,
  `quanity` int(10) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `totalprice` int(10) NOT NULL,
  PRIMARY KEY (`orderID`),
  CONSTRAINT `order_1` FOREIGN KEY (`productname`) REFERENCES `product` (`name`)
);

CREATE TABLE `customer` (
  `customerID` int(10) NOT NULL,
  `orderID` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenum` varchar(15) NOT NULL,
  `streetaddress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` int(5) NOT NULL,
  PRIMARY KEY (`customerID`),
  CONSTRAINT `customer_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
);

insert into raw_materials(materialID,species,weight,priceperfoot,quanity) values
('1','Red Oak','3.58','5.49','40'),
('2','White Oak','3.92','10.99','90'),
('3','Walnut','3.33','17.99','85'),
('4','Maple','3.67','8.99','30'),
('5','Cherry','3.0','7.99','40'),
('6','Hickory','4.16','5.99','55');

insert into finish(finishID, brand, price, color, quanity) values
('1','Rubio','52.99','Pure','10'),
('2','Rubio','52.99','Smoke 5%','5'),
('3','Rubio','52.99','Castle Brown','2'),
('4','Rubio','52.99','Cotton White','5'),
('5','Rubio','52.99','Walnut','2'),
('6','Rubio','52.99','Dark Oak','2');

insert into consumable(consumableID, quanity, name, price, type) values
('1','12','18in Drawer Slide','23.78','Hardware'),
('2','100','180grit sandpaper','23.78','Expendable'),
('3','5','Tape','23.78','Expendable'),
('4','24','Cabinet Handles','23.78','Hardware'),
('5','12','Wood Glue','23.78','Expendable'),
('6','500','Shop Towels','23.78','Expendable');

insert into product(productID, materialID, finishID, raw_qty, name, weight, consumable_rate, price) values
('1','2','2','1.75','Step Stool','6.86','4.50','29.99'),
('2','5','6','1.00','Keepsake Box','3.0','1.25','49.99'),
('3','6','1','30.3','Coffee Table','126.1','10.65','1100.99'),
('4','1','6','1.5','Wine Box','6.86','5.37','49.99'),
('5','5','1','1.0','Bottle Opener','3.33','1.0','29.99'),
('6','4','1','5.5','Cutting Board','20.2','2.75','129.99');

insert into orders(orderID, quanity, productname, totalprice) values
('1','1','Keepsake Box','49.99'),
('2','1','Wine Box','49.99'),
('3','1','Coffee Table','1100.99'),
('4','1','Wine Box','49.99'),
('5','1','Bottle Opener','29.99'),
('6','1','Cutting Board','129.99');

insert into customer(customerID, orderID, lname, fname, email, phonenum, streetaddress, city, state, zipcode) values
('1','1','Smith','John','js@email.com','222-333-4444','1 Place St','Kansas City','KS','64030'),
('2','2','Mamie','Angie','bunnylover@email.com','222-333-4444','20 Home St','Newark','NJ','07101'),
('3','3','Viola','Robbie','Rocker91@email.com','999-888-7777','56 Main St','St. Loius','Mo','63101'),
('4','4','Brandt','Petra','p_brandt@email.com','333-555-7777','1578 Second St','Chandler','AZ','85246'),
('5','5','Fleur','Mayme','1coffeefan@email.com','666-888-1111','957 Third St','Arlington','TX','76014'),
('6','6','Maurene','Terence','tm@email.com','222-666-4444','123 Side St','Kansas City','MO','64112');
