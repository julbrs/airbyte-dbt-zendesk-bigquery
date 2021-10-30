{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    'zendesk' as source,
    id,
    type,
    ticket_id,
    created_at,
    _airbyte_emitted_at,
    _airbyte_zendesk_ticket_comments_hashid as _airbyte_hashid
from {{ ref('zendesk_ticket_comments_ab3') }}
-- zendesk_ticket_comments from {{ source('main', '_airbyte_raw_zendesk_ticket_comments') }}

