-- Retrieve all successful bookings:
create view Successful_Bookings As
select*from bookings
where Booking_Status ='Success';

select* from Successful_Bookings;

-- Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance
from bookings
group by vehicle_type;

select* from ride_distance_for_each_vehicle;

-- Get the total number of cancelled rides by customers: 
create view cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status ='canceled by Customer';

select* from cancelled_rides_by_customers;

--  List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id, count(Booking_ID) as total_rides 
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select*from top_5_customers;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_p_and_c_issues as
select count(*) from bookings
where Canceled_Rides_by_Driver ='Personal & Car related issue';

select * from rides_canceled_by_drivers_p_and_c_issues;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_driver_ratings_for_Prime_Sedan as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating 
from bookings where Vehicle_Type = 'Prime Sedan';

select* from max_and_min_driver_ratings_for_Prime_Sedan;
-- Retrieve all rides where payment was made using UPI:
create view UPI_payment as 
select* from bookings
where Payment_Method = 'UPI';

select* from UPI_payment;

-- Find the average customer rating per vehicle type:
create view AVG_Cust_rating as 
select Vehicle_Type, round(avg(Customer_Rating),2) as avg_customer_rating from bookings
group by Vehicle_Type;

select* from AVG_Cust_rating;

-- Calculate the total booking value of rides completed successfully
Create View total_successful_ride_value As
select sum(Booking_Value) as total_suceessful_ride_value from bookings
where Booking_Status ='success';

select* from total_successful_ride_value ;

-- List all incomplete rides along with the reason
create view incomplete_rides_reason as 
select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides ='yes';

select* from incomplete_rides_reason;