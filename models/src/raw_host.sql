with raw_host as (SELECT * FROM {{ source('Assignment', 'host') }})
SELECT
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at
FROM raw_host