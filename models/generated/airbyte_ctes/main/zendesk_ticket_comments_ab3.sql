{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'via',
        'body',
        'type',
        boolean_to_string('public'),
        'audit_id',
        'metadata',
        'author_id',
        'html_body',
        'ticket_id',
        'created_at',
        'plain_body',
        'attachments',
    ]) }} as _airbyte_zendesk_ticket_comments_hashid,
    tmp.*
from {{ ref('zendesk_ticket_comments_ab2') }} tmp
-- zendesk_ticket_comments

