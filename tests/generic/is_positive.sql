--- Test para comprobar que los valores son positivos
{% test is_positive(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} < 0
{% endtest %}