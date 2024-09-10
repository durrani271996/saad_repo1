{% macro avg_macros(column_name) %}
AVG({{ column_name }})
{% endmacro %}