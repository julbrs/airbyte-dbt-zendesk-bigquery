{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'zendesk' as source,
    id,
    status,
    created_at,
    updated_at,
    _airbyte_emitted_at,
    _airbyte_zendesk_tickets_hashid
from {{ ref('zendesk_tickets_ab3') }}
-- zendesk_tickets from {{ source('main', '_airbyte_raw_zendesk_tickets') }}

