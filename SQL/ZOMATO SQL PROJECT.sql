ZOMATO RESTAURANT ANALYTICS PROJECT

# 1. Build a country Map Table

SELECT DISTINCT c.CountryCode,c.Country, z.City
FROM country c  JOIN zomata z
ON c.CountryCode = z.CountryCode;




# 2. Build a Calendar Table using the Column Datekey

select datekey, year(datekey)Year , month(datekey)MonthNo , monthname(datekey)MonthName,
quarter(datekey)Qtr , DATE_FORMAT(datekey, '%Y-%b') AS YearMonth , weekday(datekey)WeekdayNo,
dayname(datekey)WeekdayName , if(month(datekey)>=4,month(datekey)-3 , month(datekey)+9)FinancialMonth , 
if(month(datekey)between 4 and 6,"FQ-1",
if(month(datekey)between 7 and 9,"FQ-2",
if(month(datekey)between 10 and 12,"FQ-3","FQ-4"))) FinancialQuarter
FROM Zomata;




# 3.Find the Numbers of Resturants based on City and Country.

select count(z.RestaurantID) TotalRestaurents, z.City, c.Country
 from zomata z join country c
 on c.CountryCode=z.CountryCode GROUP BY 2,3 order by 1 asc;



# 4.Numbers of Resturants opening based on Year , Quarter , Month

select count(restaurantID)TotalRestaurents, year(datekey)Year,
concat("Q-", quarter(datekey))Qtr,monthname(datekey)MonthName
from zomata group by 2,3,4 order by 2 asc;







# 5. Count of Resturants based on Average Ratings

select count(RestaurantID)TotalRestaurents,
if(Rating<2,"Below 2",if(Rating<3,"2 To 3",if(Rating<4,"3 To 4", "4 To 5") ))RatingBucket 
from zomata group by 2;



# 6. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

select count(RestaurantID)TotalRestaurents,
if (Average_Cost_for_two<=1000,"Low",if (Average_Cost_for_two<=3000,"Medium",
if (Average_Cost_for_two<=7000,"High","Premium")))PriceBucket 
from zomata GROUP BY 2;





# 7.Percentage of Resturants based on "Has_Table_booking"

select Has_Table_booking as "Table-Booking",
concat(round(count(*)*100/(select count(*) from zomata),2),"%")"Booking%" from zomata GROUP BY 1;







# 8.Percentage of Resturants based on "Has_Online_delivery"

	select Has_Online_delivery as "Online-Delivery",
	concat(round(  count(*)*100/(select count(*) from zomata),2),"%")"Deliver%" from zomata group by 1;
 



 # 9. Develop Charts based on Cusines, City, Ratings
		# Top 10 cuisines By Restaurents
	 select count(RestaurantID)TotalRestaurents,Cuisines 
	 from zomata GROUP BY 2 order by 1 desc limit 10 ;



	










	# Top 5 Cities By Restaurents
	 select  count(RestaurantID)TotalRestaurents,city 
	 from zomata GROUP BY 2 order by 1 desc limit 5 ;  


		# Rating Wise TotalRestaurents
	 select  count(RestaurantID)TotalRestaurents,rating 
	 from zomata GROUP BY 2;



		# Top 3 Countries By Restaurents
	 select  count(z.RestaurantID)TotalRestaurents,c.country
	 from zomata as z join country as c
	 on z.CountryCode=c.CountryCode
	 group by 2  order by 1 desc limit 3;
        


