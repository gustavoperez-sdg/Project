{% macro stage_columns(source_table, prefix) -%}

    {%- set columns = adapter.get_columns_in_relation(source_table) -%}
    
    {%- for col in columns -%}
        {{ col.column }} as {{ col.column | replace(prefix ~ '_', '') }}{% if not loop.last %},{% endif %}
    {%- endfor -%}

{%- endmacro %}