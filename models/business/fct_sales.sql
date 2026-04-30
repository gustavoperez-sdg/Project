select
    lineitem_key,
    order_id,
    customer_id,
    part_id,
    supplier_id,
    order_date,
    order_status,
    quantity,
    item_subtotal as net_sales_amount, -- Ingreso sin impuestos
    item_total_price as gross_sales_amount, -- Ingreso con impuestos
    discount_percentage,
    -- KPI Adicional: Margen estimado si se une con costo (opcional)
    (item_subtotal * 0.20) as estimated_profit -- Ejemplo de lógica de negocio
from {{ ref('int_order_items') }}