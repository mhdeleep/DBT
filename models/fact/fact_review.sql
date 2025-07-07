{{ config(materialized="incremental", on_schema_change="fail") }}

select *
from {{ source("Assignment", "review") }}
where
    comments is not null
    {% if is_incremental() %} and date > (select max(date) from {{ this }}) {% endif %}
