{% macro aggregate_events(in_session_id) %}

    {% set sql %}
        select event_type, session_id, count(event_id) 
        from events where session_id = {{ in_session_id }} group by event_type, session_id
    {% endset %}

{% endmacro %}