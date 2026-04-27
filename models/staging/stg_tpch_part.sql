{{ config(materialized='table') }}

select
    p_partkey as part_id,
    p_name as part_name,
    p_mfgr as manufacturer,
    p_type as part_type,
    p_size as size,
    p_retailprice as retail_price
from {{ source('tpch_source', 'part') }}