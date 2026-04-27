{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select
    o_orderkey as order_id,
    o_custkey as customer_id,
    o_orderstatus as status,
    o_totalprice as total_price,
    o_orderdate as order_date
from {{ source('tpch_source', 'orders') }}

{% if is_incremental() %}
  -- Solo trae registros más recientes que el máximo ya existente en el modelo
  where o_orderdate > (select max(order_date) from {{ this }})
{% endif %}