select
    {{ stage_columns(source('tpch_source', 'part'), 'p') }}
from {{ source('tpch_source', 'part') }}