select
    partsupp_key,
    part_name,
    part_type,
    brand,
    supplier_name,
    available_quantity,
    supply_cost,
    total_stock_value
from {{ ref('int_part_suppliers') }}