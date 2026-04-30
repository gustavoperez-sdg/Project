with parts as (
    select * from {{ ref('stg_tpch_part') }}
),
suppliers as (
    select * from {{ ref('stg_tpch_supplier') }}
),
part_supp as (
    select * from {{ ref('stg_tpch_partsupp') }}
)

select
    ps.partsupp_key,
    p.part_name,
    p.part_type,
    p.brand,
    s.supplier_name,
    ps.available_quantity,
    ps.supply_cost,
    (ps.available_quantity * ps.supply_cost) as total_stock_value
from part_supp ps
join parts p on ps.part_id = p.part_id
join suppliers s on ps.supplier_id = s.supplier_id