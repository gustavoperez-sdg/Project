{{ config(materialized='view') }}

with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),
line_items as (
    select * from {{ ref('stg_tpch_lineitem') }}
)

select
    l.lineitem_key,
    o.order_id,
    o.customer_id,
    l.part_id,
    l.supplier_id,
    o.order_date,
    o.status as order_status,
    l.quantity,
    l.extended_price,
    l.discount_percentage,
    l.tax_rate,
    -- Cálculo de Negocio: Ingreso Neto
    (l.extended_price * (1 - l.discount_percentage)) as item_subtotal,
    ((l.extended_price * (1 - l.discount_percentage)) * (1 + l.tax_rate)) as item_total_price
from orders o
join line_items l on o.order_id = l.order_id