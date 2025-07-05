{{ config(materialized="incremental", on_schema_change="fail") }}

select *
from {{ source("Assignment", "review") }}
where
    review_text is not null
    {% if is_incremental() %}
        and review_date > (select max(review_date) from {{ this }})
    {% endif %}
