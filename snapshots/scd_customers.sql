{% snapshot scd_customers %}

{{
    config(
      target_schema='snapshots',
      unique_key='c_custkey',
      strategy='check',
      check_cols=['c_name', 'c_address', 'c_phone', 'c_acctbal']
    )
}}

select * from {{ source('tpch_source', 'customer') }}

{% endsnapshot %}