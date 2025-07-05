select
    id,
    nvl(name, 'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
from {{ source('Assignment', 'host') }}
