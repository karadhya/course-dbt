{{
  config(
    materialized='table'
  )
}}

SELECT
    {{ dbt_utils.surrogate_key(
    [order_id, user_id, promo_id, address_id]
    )}} as fct_order_id,
    order_id,
    user_id,
    promo_id,
    address_id,
    created_at,
    order_cost,
    order_total
    status 
FROM {{ source('greenery', 'orders') }}