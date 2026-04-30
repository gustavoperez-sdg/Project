select
    customer_id,
    customer_name,
    address,
    nation_name as country,
    region_name as continent,
    market_segment,
    phone_number
from {{ ref('int_customers') }}