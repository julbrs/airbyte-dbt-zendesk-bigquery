{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    ticket_id,
    count(id) as count_conversation_parts,
    min(created_at) as first_response_date,
    max(created_at) as last_response_date,
from {{ ref('zendesk_ticket_comments_ab2') }}
group by ticket_id
-- zendesk_ticket_comments

