select
    partsupp_key,
    p_name as name,
    p_type as type,
    p_brand as brand,
    supplier_name,
    available_quantity,
    supply_cost,
    total_stock_value
from {{ ref('int_part_suppliers') }}