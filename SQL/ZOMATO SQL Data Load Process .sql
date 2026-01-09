SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';


LOAD DATA LOCAL INFILE 'C:\\Users\\I2st\\OneDrive\\Desktop\\Zomata.csv'
INTO TABLE projectzomato.zomata
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM projectzomato.zomata;
SELECT*from zomata;

DELETE z1
FROM zomata z1
JOIN zomata z2
ON z1.RestaurantName = z2.RestaurantName
AND z1.City = z2.City
AND z1.Address = z2.Address
AND z1.RestaurantID > z2.RestaurantID;


