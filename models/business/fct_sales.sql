select
    lineitem_key,
    order_id,
    customer_id,
    part_id,
    supplier_id,
    order_date,
    order_status,
    quantity,
    item_subtotal as net_sales_amount,
    item_total_price as gross_sales_amount,
    discount_percentage,
    (item_subtotal * 0.20) as estimated_profit -- Ejemplo de potencial columna de negocio que generamos nosotros
from {{ ref('int_order_items') }}