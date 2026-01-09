CREATE TABLE `zomata` (
  `RestaurantID` int DEFAULT NULL,
  `RestaurantName` text,
  `CountryCode` int DEFAULT NULL,
  `City` text,
  `Address` text,
  `Locality` text,
  `LocalityVerbose` text,
  `Longitude` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Cuisines` text,
  `Currency` text,
  `Has_Table_booking` text,
  `Has_Online_delivery` text,
  `Is_delivering_now` text,
  `Switch_to_order_menu` text,
  `Price_range` int DEFAULT NULL,
  `Votes` int DEFAULT NULL,
  `Average_Cost_for_two` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Datekey_Opening` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


