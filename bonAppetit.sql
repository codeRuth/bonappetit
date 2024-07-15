CREATE DATABASE IF NOT EXISTS bonAppetit;
USE bonAppetit;

--
-- Database: `bonAppetit`
--

DELIMITER $$
--
-- Procedures
--
CREATE
    DEFINER = `root`@`localhost` PROCEDURE `getPayAmount`(OUT `orderTotal` FLOAT, OUT `gst` FLOAT,
                                                          OUT `amountPayable` FLOAT, IN `cartIndex` INT)
BEGIN
    DECLARE gstValue FLOAT;
    DECLARE deliveryCharge INT;
    SET gstValue = 0.05;
    SET deliveryCharge = 30;
    SELECT DISTINCT cart_index, item_name, price, quantity, (price * quantity) as total_price
    FROM MENU_ITEM,
         CART,
         CART_INDEX
    WHERE CART.cart_index = cartIndex
      AND CART.item_id = MENU_ITEM.item_id;
    SET orderTotal = (SELECT SUM((select price from MENU_ITEM where item_id = CART.item_id) * CART.quantity)
                      FROM CART
                      WHERE CART.cart_index = cartIndex);
    SET gst = orderTotal * gstValue;
    SET amountPayable = orderTotal + gst + deliveryCharge;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CART`
--

CREATE TABLE `CART`
(
    `cart_index` int(11) NOT NULL,
    `item_id`    int(11) DEFAULT NULL,
    `quantity`   int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `CART_INDEX`
--

CREATE TABLE `CART_INDEX`
(
    `cart_id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DELIVERER`
--

CREATE TABLE `DELIVERER`
(
    `del_id`    int(11) NOT NULL,
    `del_name`  varchar(10) DEFAULT NULL,
    `del_phone` varchar(10) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `DELIVERER`
--

INSERT INTO `DELIVERER` (`del_id`, `del_name`, `del_phone`)
VALUES (1, 'Kamesh R', '9980641968'),
       (2, 'Ali Faizal', '9845275369'),
       (3, 'James P', '8050864017');

-- --------------------------------------------------------

--
-- Table structure for table `MENU_ITEM`
--

CREATE TABLE `MENU_ITEM`
(
    `item_id`   int(11) NOT NULL,
    `rest_id`   int(11)     DEFAULT NULL,
    `item_name` varchar(50) DEFAULT NULL,
    `price`     float       DEFAULT NULL,
    `vegan`     tinyint(1)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `MENU_ITEM`
--

INSERT INTO `MENU_ITEM` (`item_id`, `rest_id`, `item_name`, `price`, `vegan`)
VALUES (4, 115, 'Veg Hot & Sour Soup', 90, 1),
       (29, 115, 'Gobi Manchurian', 130, 1),
       (73, 115, 'Aloo Gobi', 150, 1),
       (94, 115, 'Paneer Tikka Salad', 125, 1),
       (229, 115, 'Gulab Jamun', 125, 1),
       (230, 115, 'Vanilla Ice Cream', 85, 1),
       (231, 116, 'French Fries', 60, 1),
       (232, 116, 'Tomato Soup', 90, 1),
       (233, 116, 'Paneer Tikka', 170, 1),
       (234, 116, 'Tandoori Chicken', 170, 0),
       (235, 116, 'Chicken Charcoal Kebab', 160, 0),
       (236, 116, 'Kadai Vegetable', 140, 1),
       (237, 116, 'Egg Masala', 130, 0),
       (238, 116, 'Chicken Do Pyaza', 165, 0),
       (239, 116, 'Dal Makhani', 130, 1),
       (240, 116, 'Yellow Dal Tadka', 120, 1),
       (241, 116, 'Vegetable Dum Biryani', 120, 1),
       (242, 116, 'Chicken Dum Biryani', 160, 0),
       (243, 116, 'Honey Chilli Potatoes', 130, 1),
       (244, 116, 'Gobi Manchurian', 130, 1),
       (245, 116, 'Schezwan Paneer', 160, 1),
       (246, 116, 'Egg Chilli', 130, 0),
       (247, 116, 'Chicken Lollipop', 180, 0),
       (248, 116, 'Thai Fry Chicken', 220, 0),
       (249, 116, 'Lemon Chicken', 160, 0),
       (250, 116, 'Chilli Fish', 220, 0),
       (251, 116, 'Egg Fried Rice', 120, 0),
       (252, 116, 'Vegetable Hakka Noodles', 120, 1),
       (253, 116, 'Chicken Champ', 175, 0),
       (254, 116, 'Veg Thai Green Curry & Rice', 200, 1),
       (255, 116, 'Chicken Thai Red Curry & Rice', 220, 0),
       (256, 116, 'Veg Combo (Large)', 180, 1),
       (257, 116, 'Chicken Combo', 120, 0),
       (258, 117, 'Chicken Hot & Sour Soup', 80, 0),
       (259, 117, 'Chicken Manchow Soup', 80, 0),
       (260, 117, 'Crispy Honey Chilli Potato', 120, 1),
       (261, 117, 'Salt & Pepper Mushroom', 120, 1),
       (262, 117, 'Hunan Chicken', 160, 0),
       (263, 117, 'Chicken Lollipop (6 Pcs)', 160, 0),
       (264, 117, 'Butter Garlic Prawns Dry', 220, 0),
       (265, 117, 'Chicken Momos (8 Pcs)', 140, 0),
       (266, 117, 'Veg Burnt Garlic Fried Rice', 100, 1),
       (267, 117, 'Veg Triple Schezwan Fried Rice', 120, 1),
       (268, 117, 'Veg Burnt Garlic Noodles', 100, 1),
       (269, 117, 'Chicken Chilli Garlic Noodles', 120, 0),
       (270, 117, 'Chicken Dragon Chop Suey', 140, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ORDER`
--

CREATE TABLE `ORDER`
(
    `order_id`  int(11) NOT NULL,
    `rest_id`   int(11)    DEFAULT NULL,
    `cust_id`   int(11)    DEFAULT NULL,
    `cart_id`   int(11)    DEFAULT NULL,
    `del_id`    int(11)    DEFAULT NULL,
    `total_amt` float      DEFAULT NULL,
    `accepted`  tinyint(1) DEFAULT NULL,
    `cooked`    tinyint(1) DEFAULT NULL,
    `delivered` tinyint(1) DEFAULT NULL,
    `paid`      tinyint(1) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


--
-- Triggers `ORDER`
--
DELIMITER $$
CREATE TRIGGER `assignDelivery`
    BEFORE UPDATE
    ON `ORDER`
    FOR EACH ROW
BEGIN
    IF OLD.cooked = 0 THEN
        SET NEW.del_id = (SELECT del_id FROM DELIVERER ORDER BY RAND() LIMIT 1);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `RESTAURANT`
--

CREATE TABLE `RESTAURANT`
(
    `rest_id` int(11) NOT NULL,
    `name`    varchar(100) DEFAULT NULL,
    `cuisine` varchar(200) DEFAULT NULL,
    `rating`  float        DEFAULT NULL,
    `address` varchar(50)  DEFAULT NULL,
    `image`   varchar(200) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `RESTAURANT`
--

INSERT INTO `RESTAURANT` (`rest_id`, `name`, `cuisine`, `rating`, `address`, `image`)
VALUES (115, 'Sea Route', 'Indian, Chinese, Mangalorean', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/naphroxjbdv52wdbkpdq'),
       (116, 'The Purple Pan', 'Mughlai, North Indian, Chinese, Arabian', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vq4c5baqzxwqgcxtinfc'),
       (117, 'Absolute Chinese', 'Chinese, Thai', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/hb30an4bfywl4mzba63h'),
       (118, 'Khud\'s Mughlai Family Restaurant', 'Mughlai, Indian, Chinese', 3.9, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/xwodep3zdpviwndda3z1'),
       (119, 'RS Shiv Sagar', 'North Indian, Chinese, South Indian, Mexican', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/ulym2asgf5gbqnjly16x'),
       (120, 'Hotel Prashanth', 'South Indian', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/fdvq8dsyaifdgfckcgaz'),
       (121, 'New Shanthi Sagar',
        'Beverages, Biryani, Cafe, Chinese, Desserts, Fast Food, Healthy Food, Jain, North Indian, South Indian', 4.1,
        'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/rvcb4kqtciikquyxuiuk'),
       (122, 'Bangalore Agarwal Bhawan', 'North Indian, South Indian, Chaat', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/q7xxtiibwkelojsyjkco'),
       (123, 'Big Bite', 'Beverages, Cafe, Chinese, Continental, Desserts', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/jwrrc5v8rw5suapqhjv1'),
       (124, 'Rolls Kitchen', 'Fast Food', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/sfhci5voaxydhl73ewu0'),
       (125, 'Halli Mane', 'North Indian, Chinese, South Indian', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/sud8e7miz6quxc8bkxav'),
       (126, 'Punjab Mail', 'North Indian', 3.9, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/bqkaxp4b0onc2w5bmr1n'),
       (127, 'Burger King', 'American, Fast Food', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/gpgmcp42yatzqhp7ven0'),
       (128, 'Vasudev Adiga\'s', 'Beverages, Biryani, Chinese, Desserts, North Indian, South Indian', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/aqucvbjxzzezguu2mban'),
       (129, 'Food Zone', 'North Indian, Chinese', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/savnf6it2v1cgxjhb7ck'),
       (130, 'Four Seasons Fast Food Centre', 'Biryani', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/tnhxjcxgydojbgaj2ly5'),
       (131, '1947 Restaurant', 'North Indian, Chinese, Desserts, Biryani', 4.3, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qwmluuthmlzjjqh8rwb7'),
       (132, 'Annapoorani -  Truly South Indian', 'South Indian', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/kk8z38tp5ulw8lchrges'),
       (133, 'Subway', 'Fast Food', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/neekvr3w6hbrfn8qq0s3'),
       (134, 'Nisarga', 'Andhra, Chinese, Coastal, Desserts, North Indian, Seafood', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/rflaqy42dg7ajess2dwm'),
       (135, 'FreshMenu', 'Chinese, Continental, Italian, Mediterranean, Thai, Lebanese', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/m5oaeljipowqjue4mx3j'),
       (136, 'Nandhana Palace', 'Andhra', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/rhk1nucxc3b1dxwnddfd'),
       (137, 'Chowmein', 'Mughlai, North Indian, Chinese, Fast Food', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/i69fcq1ec2eque8fvcff'),
       (138, 'Pizza Stop', 'Italian, Pizzas', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qgym91gk9wbtwtw153b3'),
       (139, 'A2B Veg', 'North Indian, Chinese, Desserts, South Indian', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/ewwnx4enjghff30dfmmq'),
       (140, 'Al Sadique', 'Biryani, Chettinad, Chinese, North Indian', 3.9, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/whyfuppzrbd5d886h8oj'),
       (141, 'Karavalli Lunch Home', 'South Indian', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/z4hk2ymxxnlq117sjrrt'),
       (142, 'Papanna\'s Biriyani', 'Biryani', 4, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/tmjhkp2m1y8wfuapzrdc'),
       (143, 'Kadai', 'North Indian, South Indian', 4.1, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qkxvuc7fbglckewte57g'),
       (144, 'New Prashanth Hotel', 'North Indian, Andhra, Cafe', 4.2, 'Rajajinagar',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vg8itlukggrblclzttxk'),
       (145, 'Kaaram', 'Andhra, Biryani', 4.1, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/ymkozq4ha3txd3p2r7oo'),
       (146, 'Anjappar', 'Chettinad, South Indian', 4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qcktf68dlcjtbzqdhx3u'),
       (147, 'The Bowl Company', 'Continental, Indian, Pan-Asian', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/ppbixkxsympbudrhzmnx'),
       (148, 'Meghana Foods', 'Chinese, Andhra, Biryani, Seafood', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/mjmmsaaxmnoepiaieva4'),
       (149, 'Domino\'s Pizza', 'Pizzas', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/jwffqqmqa174xwhjee6j'),
       (150, 'House Of Dabbas', 'Indian, Home Food', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vhcfdyvfoujrd0jdralx'),
       (151, 'Frozen Bottle', 'Beverages, Ice Cream, Desserts, Cafe', 4.6, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/mmx0xtqorjjxgz2jylvi'),
       (153, 'Corner House Ice Cream', 'Ice Cream, Desserts', 4.6, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/b6qvoop4fpdv2zjhuu6j'),
       (154, 'Leon Grill', 'Turkish, Portuguese, American', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/cnmlyn9twikwsqmr8nke'),
       (155, 'Paradise Biryani', 'North Indian, Biryani', 4.1, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/nmr7jujzvbu7znjkveyz'),
       (156, 'Punjabi Rasoi', 'North Indian', 4.3, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/xjgbsi338wnfg2droi7n'),
       (157, 'Hotel Tom\'s Restaurant', 'Mangalorean', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/s4khfhdh0h06d9kjeilr'),
       (158, 'McDonald\'s', 'Fast Food', 4.3, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/kvk53wi9yn74dwt2kj44'),
       (159, 'Mughal Treat', 'Arabian, Chinese', 4.1, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/mnuisrlnk2who9kt2hp8'),
       (160, 'Hotel Empire', 'North Indian, Chinese, South Indian, Biryani', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/sodexiyxufetae1fyyax'),
       (161, 'Cream Stone', 'Ice Cream, Desserts', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/s77ipqklarzvxz2lwfjf'),
       (162, 'Helloo Delhi', 'North Indian', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vjx8xl7yv4gpy8mhfxwv'),
       (163, 'Lazeez', 'North Indian, Mughlai', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qqebo6wvcgrtdymsnbbe'),
       (164, 'Momoz', 'Chinese, Seafood, Thai, Asian', 4.3, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/kndsi8i9keakyrh6a1pl'),
       (165, 'Punjabi Daawat (Authentic Punjabi Cuisine)', 'Mughlai, North Indian, Biryani, Fast Food, Asian', 4,
        'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vdnzjhfz7xnfuiidv56h'),
       (166, 'Paratha Plaza', 'North Indian', 4.3, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/lnyobbils7uvslckyekt'),
       (167, 'Kabab Magic', 'North Indian, Chinese, Biryani, Tandoor', 4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/oej3nqmenzzllr5cl6hg'),
       (168, 'Royal Treat', 'North Indian, Chinese, Seafood, Biryani', 4.3, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/e0e8vnuhlwr50flue4bf'),
       (169, 'Purani Dilli By Anand Sweets', 'North Indian', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/xyuncvevs17mbt9gtki9'),
       (170, 'Bundar', 'Indian, Continental', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/vqrgh1h1qnrcq8mnqish'),
       (171, 'Donne Biryani House', ' Biryani', 4.2, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/uzmidprvsi3sbhonaimm'),
       (172, 'CRAVY WINGS - The American Diner', 'American, Fast Food', 4.4, 'Koramangala',
        'https://res.cloudinary.com/swiggy/image/upload/c_scale,f_auto,fl_lossy,h_134,q_auto,w_269/qd8rft0lw1qeyg10rh1t');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER`
(
    `user_id`    int(11) NOT NULL,
    `name`       varchar(50)  DEFAULT NULL,
    `email`      varchar(100) DEFAULT NULL,
    `password`   varchar(300) DEFAULT NULL,
    `phone`      varchar(10)  DEFAULT NULL,
    `address`    varchar(100) DEFAULT NULL,
    `created_at` datetime     DEFAULT NULL,
    `updated_at` datetime     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;



--
-- Indexes for table `CART`
--
ALTER TABLE `CART`
    ADD KEY `cart_index` (`cart_index`),
    ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `CART_INDEX`
--
ALTER TABLE `CART_INDEX`
    ADD PRIMARY KEY (`cart_id`),
    ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `DELIVERER`
--
ALTER TABLE `DELIVERER`
    ADD PRIMARY KEY (`del_id`);

--
-- Indexes for table `MENU_ITEM`
--
ALTER TABLE `MENU_ITEM`
    ADD PRIMARY KEY (`item_id`),
    ADD KEY `rest_id` (`rest_id`);

--
-- Indexes for table `ORDER`
--
ALTER TABLE `ORDER`
    ADD PRIMARY KEY (`order_id`),
    ADD KEY `rest_id` (`rest_id`),
    ADD KEY `cust_id` (`cust_id`),
    ADD KEY `cart_id` (`cart_id`),
    ADD KEY `del_id` (`del_id`);

--
-- Indexes for table `RESTAURANT`
--
ALTER TABLE `RESTAURANT`
    ADD PRIMARY KEY (`rest_id`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
    ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DELIVERER`
--
ALTER TABLE `DELIVERER`
    MODIFY `del_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `MENU_ITEM`
--
ALTER TABLE `MENU_ITEM`
    MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 271;
--
-- AUTO_INCREMENT for table `ORDER`
--
ALTER TABLE `ORDER`
    MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 42;
--
-- AUTO_INCREMENT for table `RESTAURANT`
--
ALTER TABLE `RESTAURANT`
    MODIFY `rest_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 173;
--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `CART`
--
ALTER TABLE `CART`
    ADD CONSTRAINT `CART_ibfk_1` FOREIGN KEY (`cart_index`) REFERENCES `CART_INDEX` (`cart_id`) ON DELETE CASCADE,
    ADD CONSTRAINT `CART_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `MENU_ITEM` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `CART_INDEX`
--
ALTER TABLE `CART_INDEX`
    ADD CONSTRAINT `CART_INDEX_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `MENU_ITEM`
--
ALTER TABLE `MENU_ITEM`
    ADD CONSTRAINT `MENU_ITEM_ibfk_1` FOREIGN KEY (`rest_id`) REFERENCES `RESTAURANT` (`rest_id`);

--
-- Constraints for table `ORDER`
--
ALTER TABLE `ORDER`
    ADD CONSTRAINT `ORDER_ibfk_1` FOREIGN KEY (`rest_id`) REFERENCES `RESTAURANT` (`rest_id`),
    ADD CONSTRAINT `ORDER_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `USER` (`user_id`),
    ADD CONSTRAINT `ORDER_ibfk_3` FOREIGN KEY (`cart_id`) REFERENCES `CART_INDEX` (`cart_id`) ON DELETE SET NULL,
    ADD CONSTRAINT `ORDER_ibfk_4` FOREIGN KEY (`del_id`) REFERENCES `DELIVERER` (`del_id`);
