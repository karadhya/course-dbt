{% macro grant_schema(role) %}

    {% set sql %}
      GRANT USAGE ON SCHEMA {{ target.schema }} TO group {{ role }}
    {% endset %}
    {% set table = run_query(sql) %}

{% endmacro %}