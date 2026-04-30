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
    p.p_name,
    p.p_type,
    p.p_brand,
    s.supplier_name,
    ps.available_quantity,
    ps.supply_cost,
    (ps.available_quantity * ps.supply_cost) as total_stock_value
from part_supp ps
join parts p on ps.part_id = p.p_partkey
join suppliers s on ps.supplier_id = s.supplier_id