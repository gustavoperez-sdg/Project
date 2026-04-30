with customers as (
    select * from {{ ref('stg_tpch_customer') }}
),
geography as (
    select * from {{ ref('int_location') }}
)

select
    c.customer_id,
    c.customer_name,
    c.address,
    g.nation_name,
    g.region_name,
    c.phone_number,
    c.market_segment,
    c.account_balance
    
from customers c
join geography g on c.nation_id = g.nation_id