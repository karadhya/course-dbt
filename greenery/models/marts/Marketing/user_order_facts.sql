{{
  config(
    materialized='table'
  )
}}

select     
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.created_at,
    u.updated_at,
    u.address_id,
    o.order_id,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id
FROM {{ source('greenery', 'users') }} u
join {{ source('greenery', 'orders') }} o 
on o.user_id = u.user_id