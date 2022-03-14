Answers to Week 1 Questions below:


How many users do we have?  
Answer: 130
    
    select count(user_id) 
        from "dbt_kishore_A"."users"

On average, how many orders do we receive per hour?  Answer: 7

    with ordersByHour as (
    select 
        date_trunc('hour', created_at) as perHour,
        count(order_id) as numOrders
    from
        "dbt_kishore_A"."orders"
    group by perHour
    )
    select avg(numOrders) from ordersByHour

On average, how long does an order take from being placed to being delivered?  4 days approx (3 days, 21 hours, 24 minutes)

    with deliveryTime as (
    select 
        order_id,
        created_at,
        delivered_at,
        (delivered_at - created_at) as duration
    from
        "dbt_kishore_A"."orders"
    )
    select avg(duration) from deliveryTime


How many users have only made one purchase? Two purchases? Three+ purchases? 
Answer:  One: 25 , Two: 28 , Three+: 71

with userPurchases as 
( 
  select 
    user_id, 
    count(order_id) as numberOfOrders 
  from "dbt_kishore_A"."orders" 
  group by user_id 
)

select 
  case 
    when numberOfOrders  = 1 then '1' 
    when numberOfOrders  = 2 then '2' 
    when numberOfOrders  >= 3 then '3+' 
  end as numberPurchases, 
  count(user_id) from userPurchases 
  group by numberPurchases 


On average, how many unique sessions do we have per hour? 
Answer: 16

with numberSessionsByHour as (
    select 
        date_trunc('hour', created_at) as uniqueHour,
        count(distinct session_id) as uniqueSessions
    from
        "dbt_kishore_A"."events"
    group by uniqueHour
    )
select avg(uniqueSessions) from numberSessionsByHour

