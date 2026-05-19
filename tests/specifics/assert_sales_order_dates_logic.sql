--- Un pedido no puede ser recibido antes de ser enviado ni enviado antes de ser ordenado
{{ config(
    severity = 'warn',
    store_failures = true
) }}

select
    order_id,
    order_date,
    ship_date,
    receipt_date
from {{ ref('fct_sales') }}
where ship_date < order_date 
   or receipt_date < ship_date