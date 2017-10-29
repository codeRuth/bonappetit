CREATE DATABASE IF NOT EXISTS `bonAppetit`;
USE `bonAppetit`;

CREATE TABLE IF NOT EXISTS `USER`(
  'user_id' INT AUTO_INCREMENT,
  'name' VARCHAR(50) NULL,
  'email' VARCHAR(100) NULL,
  'password' VARCHAR(255) NULL,
  'phone' VARCHAR(10) UNIQUE NULL ,
  'address' VARCHAR(100) NULL,
  'created_at' DATETIME NULL,
  'updated_at' DATETIME NULL,
  PRIMARY KEY ('user_id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS RESTAURANT (
  'rest_id' INT NOT NULL AUTO_INCREMENT,
  'name' VARCHAR(50) NULL,
  'cuisine' VARCHAR(100) NULL,
  'rating' FLOAT(10) NULL,
  -- 'address' VARCHAR(50) NULL , --
  PRIMARY KEY ('rest_id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bonAppetit.MENU_ITEM (
  'item_id' INT NOT NULL AUTO_INCREMENT,
  'rest_id' INT,
  'item_name' VARCHAR(50) NULL,
  'price' FLOAT NULL,
  'vegan' BOOLEAN,
  PRIMARY KEY ('item_id'),
  FOREIGN KEY ('rest_id') REFERENCES bonAppetit.RESTAURANT('rest_id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS CART (
  'cart_id' INT NOT NULL AUTO_INCREMENT,
  'user_id' INT,
  'item_id' INT,
  'quantity' INT NULL,
  PRIMARY KEY ('cart_id'),
  FOREIGN KEY ('user_id') REFERENCES bonAppetit.USER('user_id'),
  FOREIGN KEY ('item_id') REFERENCES bonAppetit.MENU_ITEM('item_id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS 'ORDER'(
  'order_id' INT NOT NULL AUTO_INCREMENT,
  'rest_id' INT,
  'cust_id' INT,
  'cart_id' INT,
  'total_amt' FLOAT NULL,
  'accepted' BOOLEAN,
  'cooked' BOOLEAN,
  'delivered' BOOLEAN,
  'paid' BOOLEAN,
  PRIMARY KEY ('order_id'),
  FOREIGN KEY ('rest_id') REFERENCES bonAppetit.RESTAURANT('rest_id'),
  FOREIGN KEY ('cust_id') REFERENCES bonAppetit.USER('user_id'),
  FOREIGN KEY ('cart_id') REFERENCES bonAppetit.CART('cart_id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS DELIVERER (
  'del_id' INT NOT NULL AUTO_INCREMENT,
  'del_name' VARCHAR(10) NULL,
  'del_phone' VARCHAR(10) NULL,
  'cust_id' INT,
  'order_id' INT,
  PRIMARY KEY ('del_id'),
  FOREIGN KEY ('order_id') REFERENCES bonAppetit.'ORDER'('order_id'),
  FOREIGN KEY ('cust_id') REFERENCES bonAppetit.USER('user_id')
) ENGINE = InnoDB;


INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Phulke Ghar Ke', 'North Indian', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Purani Dilli By Anand Sweets', 'North Indian', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Kritunga Restaurant', 'Andhra', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Madhurai Idly Shop', 'South Indian', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Natural Ice Cream', 'Ice Cream', 4.6);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Chai Point', 'Cafe', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Kapoor Cafe', 'North Indian', 4.1);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Parathas Kitchen', 'North Indian', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Rolls On Wheels', 'Fast Food', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'New Cool Joint', 'Ice Cream, Juices, Fast Food', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Polar Bear', 'Desserts', 4.4);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'La Casa', 'North Indian, Chinese, American, Continental', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Amrutha Grand', 'Indian, Chinese, Andhra', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Big Brewsky', 'North Indian, South Indian, Thai, Continental', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Apni Rasoi', 'North Indian', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Vandana Andhra and Multicuisine Restaurant', 'North Indian, Andhra, Biryani, Desserts', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Barbeque Delight', 'Street Food, Chinese, Biryani, Desserts', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Zeeshan', 'North Indian', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Goli Vada PAv No.1', 'Fast Food', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Nandhini Deluxe', 'North Indian, Chinese, Andhra, Biryani, Desserts', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Fish & Fries', 'Mediterranean, Seafood, Continental', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Bombay Kulfis', 'Ice Cream', 4.1);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Inner Chef', 'Mediterranean, North Indian, Desserts, Continental', 4.1);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Mast Kalandar', 'North Indian', 3.7);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Faasos', 'North Indian, Fast Food', 3.9);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'RRoyal Rajasthan', 'North Indian, Rajasthani', 3.9);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Little Italy', 'Italian, Mexican', 4.4);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Behrouz Biryani', 'Biryani', 4.1);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Warm Oven', 'Bakery', 4.5);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'New Hyderabad House', 'North Indian, Biryani, Desserts, Seafod', 3.9);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Aroi', 'Chinese, Thai', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Cafe Coffee Day', 'Fast Food, Cafe', 4.2);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Ghar Ka Chulha', 'Bengali, Biryani, Chinese, Desserts', 3.7);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Kanua', 'Mangalorean, Sea-Food, Konkan', 4.4);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Pizza Hut', 'Fast Food, Pizzas', 3.8);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Pizza Stop', 'Pizzas', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Xtreme Sports Bar', 'Italian', 4.3);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Savoury Restaurant', 'Middle Eastern, Biryani, Beverages', 4.1);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Ovenstory Pizza', 'Pizzas', 4.0);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Xplode', 'North Indian, Chinese', 3.7);
INSERT INTO bonAppetit.RESTAURANT VALUES (DEFAULT, 'Lluvia Bakery', 'Desserts, Bakery', 4.2);


insert into bonAppetit.MENU_ITEM values (DEFAULT, 6, 'Ginger Chai Mini Flask', 109, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 6, 'Bombay Masala Sandwich', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 6, 'Chatpata Chicken Sandwich', 99, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 6, 'Poha', 40, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 6, 'Banana Cake', 40, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 1, 'Panner Pakora', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 1, 'Aloo Paratha', 40, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 1, 'Dal Makhani', 90, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 1, 'Bhindi Masala and Fry', 80, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 1, 'Jeera Rice', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 2, 'Chandni Chowk Bhaji Roll', 120, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 2, 'Grilled Vegetable Sandwich', 90, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 2, 'Chilli Paneer MAnchurian', 135, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 2, 'Aloo Tikki Chole', 90, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 2, 'Anand Special Thali', 210, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 3, 'Kaju Pakora', 195, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 3, 'Bhindi Fry', 100, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 3, 'Chicken Drumsticks', 225, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 3, 'Mutton Keema Balls', 240, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 3, 'Garlic Fish Fry', 230, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 4, 'Podi Idli', 50, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 4, 'Curd Vada', 30, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 4, 'Pongal', 40, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 4, 'Tomato Onion Uttapam', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 4, 'Parcel Meals', 80, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 5, 'Choco Almond Ice Cream', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 5, 'Tender Coconut Ice Cream', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 5, 'Mango Ice Cream', 80, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 5, 'Kaju Kishmis Ice Cream', 70, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 5, 'Coffee Walnut Ice Cream', 60, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 7, 'Kalmi Punjabi Sticks', 180, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 7, 'Dile Punjab Veg Cutlets', 160, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 7, 'Mattar Pulao', 220, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 7, 'Shahi Tukda', 160, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 7, 'Lassi', 70, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 8, 'Aloo Pyaaz Paratha', 55, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 8, 'Aloo Paratha Combo with Chole', 120, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 8, 'Paratha Combo with Mattar', 120, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 8, 'Corn Cheese Paratha', 85, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 8, 'Paneer Paratha', 70, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Chicken Nuggets', 56, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Veg Steamed Momos', 40, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Chicken Biryani', 80, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Chicken Lollipop', 72, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Veg Biryani', 64, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Veg Maggi', 38, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Egg Maggi', 68, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Egg Sandwich', 68, FALSE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Veg Cheese Sandwich', 80, TRUE);
insert into bonAppetit.MENU_ITEM values (DEFAULT, 9, 'Corn Cheese Sandwich', 80, TRUE);
