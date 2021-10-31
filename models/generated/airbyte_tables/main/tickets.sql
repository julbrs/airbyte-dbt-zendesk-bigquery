{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    t.source,
    t.id,
    t.status,
    t.created_at,
    t.updated_at,
    c.count_conversation_parts as count_conversation_parts,
    datetime_diff(c.first_response_date, t.created_at, MINUTE) as first_response_time_min,
    datetime_diff(c.last_response_date, t.created_at, MINUTE) as total_response_time_min,
    t._airbyte_emitted_at,
    t._airbyte_zendesk_tickets_hashid as _airbyte_hashid
from {{ ref('zendesk_tickets_ab3') }} t
left join {{ ref('zendesk_ticket_comments_ab3') }} c on t.id=c.ticket_id
-- zendesk_tickets from {{ source('main', '_airbyte_raw_zendesk_tickets') }}

