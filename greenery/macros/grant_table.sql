{% macro grant_table(role) %}

    {% set sql %}
      GRANT SELECT ON {{ this }} TO group {{ role }}
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}