--- Test para comprobar que no hay valores vacíos sin ser Null
{% test is_not_empty(model, column_name) %}
select *
from {{ model }}
where length(trim({{ column_name }})) = 0
{% endtest %}