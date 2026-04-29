{{ config(materialized='table') }}

select
    -- Generación de clave única combinando Part y Supplier
    md5(cast(coalesce(cast(ps_partkey as varchar), '') || '-' || coalesce(cast(ps_suppkey as varchar), '') as varchar)) as partsupp_key,
    ps_partkey as part_id,
    ps_suppkey as supplier_id,
    ps_availqty as available_quantity,
    ps_supplycost as supply_cost,
    ps_comment as comment
from {{ source('tpch_source', 'partsupp') }}