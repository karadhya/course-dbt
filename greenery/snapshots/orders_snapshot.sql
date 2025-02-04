{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='dbt_kishore_A',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='created_at',
    )
  }}

  SELECT * FROM {{ source('greenery', 'orders')}}

{% endsnapshot %}