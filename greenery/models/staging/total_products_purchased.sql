{{
  config(
    materialized='table'
  )
}}

with event_checkout AS (
                      SELECT
                          event_id,
                          session_id,
                          user_id,
                          page_url,
                          created_at,
                          event_type,
                          order_id
                      FROM {{ source('greenery', 'events') }} where event_type='checkout'), event_checkout_product AS (
                      select                    
                          ev.event_id,
                          ev.session_id,
                          ev.user_id,
                          ev.order_id,
                          ord.product_id
                          from event_checkout ev join {{ source('greenery', 'order_items') }} ord 
                          on ord.order_id = ev.order_id 
                          )
select pr.name as product_name, count(ev_pr.session_id) AS total_product_purchases from event_checkout_product ev_pr 
        join {{ source('greenery', 'products') }} pr on pr.product_id = ev_pr.product_id group by pr.name
