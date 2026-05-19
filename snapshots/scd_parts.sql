{% snapshot scd_parts %}

{{
    config(
      target_schema='snapshots',
      unique_key='p_partkey',
      strategy='check',
      check_cols=['p_name', 'p_mfgr', 'p_brand', 'p_type', 'p_size']
    )
}}

select * from {{ source('tpch_source', 'part') }}

{% endsnapshot %}