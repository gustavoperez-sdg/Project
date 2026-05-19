--- Si el precio de venta es menor al de coste de obtenerlo, el negocio perdería dinero o hay un error con la carga de los datos
{{ config(
    severity = 'warn',
    store_failures = true
) }}

select
    lineitem_key,
    net_sales_amount,
    (quantity * supply_cost) as total_cost
from {{ ref('fct_sales') }}
join {{ ref('dim_parts_suppliers') }} using (part_id, supplier_id)
where net_sales_amount < (quantity * supply_cost)