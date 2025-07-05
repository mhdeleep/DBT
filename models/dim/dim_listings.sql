select
    id,
    name,
    room_type,
    case when minimum_nights = 0 then 1 else minimum_nights end as minimum_nights,
    host_id,
    replace(price, '$')::number(10, 2) as price,
    created_at,
    updated_at
from {{ source('Assignment', 'listing') }}
