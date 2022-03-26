{{
  config(
    materialized='table'
  )
}}

with view_sessions AS (
                      SELECT
                          event_id,
                          session_id,
                          user_id,
                          product_id,
                          event_type
                          from {{ source('greenery', 'events') }} where event_type='page_view')
select pr.name AS product_name, count(ev_pr.session_id) AS total_page_views from view_sessions ev_pr join {{ source('greenery', 'products') }} pr 
        on pr.product_id = ev_pr.product_id group by pr.name
