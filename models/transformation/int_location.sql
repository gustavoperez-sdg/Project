with nations as (
    select * from {{ ref('stg_tpch_nation') }}
),
regions as (
    select * from {{ ref('stg_tpch_region') }}
)

select
    n.nation_id,
    n.nation_name,
    r.region_name,
    n.comment as nation_comment
from nations n
join regions r on n.region_id = r.region_id