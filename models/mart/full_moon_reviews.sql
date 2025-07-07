{{
    config(
        materialized="table",
    )
}}
with
    fct_reviews as (select * from {{ ref("fact_review") }}),
    full_moon_dates as (select * from {{ ref("seed_full_moon_dates") }})
select
    r.*,
    case
        when fm.full_moon_date is null then 'not full moon' else 'full moon'
    end as is_full_moon
from fct_reviews r
left join
    full_moon_dates fm
    on (
        to_date(r.date)
        = dateadd(day, 1, to_date(fm.full_moon_date, 'DD-MM-YYYY'))
    )
