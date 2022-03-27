What is our overall conversion rate?  361/3553 = 9.87%
select distinct count(session_id) from events
select  count(session_id) from events

What is our conversion rate by product?

select pg_views.product_name, round((pr_purchased.total_product_purchases :: decimal/ pg_views.total_page_views :: decimal) , 2) *100 as product_conversion 
    from total_product_page_views pg_views 
    join total_products_purchased pr_purchased on pg_views.product_name = pr_purchased.product_name

Devil's Ivy. 50.0%
Bamboo  50.0%
Dragon Tree. 50.0%
Bird of Paradise. 50.0%
Boston Fern. 40.0%
Pink Anthurium. 40.0%
Majesty Palm. 50.0%
Pilea Peperomioides. 50.0%
Pothos. 30.0%
Arrow Head. 50.0%
Cactus. 50.0%
Snake Plant. 40.0%
Angel Wings Begonia  40.0%
Philodendron. 50.0%
Aloe Vera  50.0%
ZZ Plant. 50.0%
Birds Nest Fern. 40.0%
Ponytail Palm. 40.0%
Spider Plant. 50.0%
Ficus. 40.0%
Orchid. 50.0%
Fiddle Leaf Fig. 50.0%
Rubber Plant. 50.0%
Monstera  50.0%
Peace Lily. 40.0%
Alocasia Polly. 40.0%
Money Tree. 50.0%
Jade Plant 50.0%
Calathea Makoyana 50.0%
String of pearls 60.0%

