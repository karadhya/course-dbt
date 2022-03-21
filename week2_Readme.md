* What is our user repeat rate?

Repeat Rate = 79.83%  = 99 (Users who purchased 2 or more times) / 124 (users who purchased)

users who purchased = 124  - using the following query
with userPurchases as ( select user_id, count(order_id) as numberOfOrders from "dbt_kishore_A"."orders" group by user_id )
select count(user_id) from userPurchases where numberOfOrders > 0

users who purchased 2 or more items = 99  - using the following query
with userPurchases as ( select user_id, count(order_id) as numberOfOrders from "dbt_kishore_A"."orders" group by user_id )
select count(user_id) from userPurchases where numberOfOrders >= 2

* What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
> The "repeat rate" is a good indicator of buyer propensity to repurchase items.
> User recommending products to others tend to buy them as gifts.
> User who pens a good review and takes time to comment about that in social media posts is a committed buyer and hence a high likelihood of buying again.
> Promotions with deep discounts

Most unlikely to buy are:
> Bad reviews and social media posts reflecting it
> Product returned.
> User experiencing a bad customer service experience

More features:
> User demographic information
> Tying promotions to users and buyer propensity
> User reviews uses for Sentiment Analysis to mine and extrapolate user interests in products.

Explain the marts models you added. Why did you organize the models in the way you did?
> The marts models needs to be business friendly and it needs to be divided into specific business domains like marketing, core and products. These domains are represented by their associated fact and dimension tables to form a star schema that allows for easy querying and extraction of useful information in a potentially visual form (if needed)
The intermediate table allows for easy data querying without having to create complex joins by downstream entities.

Part 2 (Tests):
What assumptions are you making about each model? (i.e. why are you adding each test?)
> All tables have unique keys and have tests to validate that fact.

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
> There were tracking_id, shipping_service and delivered_at fields have NULL values and have included tests to warn about them.

Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
> Everyday these tests can be scheduled to run which then sends out a report with all the errors and warnings to the data ops team. This team can in turn send out a stakeholder notification or have the stakeholders directly get these automated emails with some more context added for easy understanding of the information,

