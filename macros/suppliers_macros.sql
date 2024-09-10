{% macro suppliers_macros(column_name) %}
sum({{ column_name }})
{% endmacro %}