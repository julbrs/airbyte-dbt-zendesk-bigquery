{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'url',
        'via',
        array_to_string('tags'),
        'type',
        'due_at',
        'status',
        'subject',
        'brand_id',
        'group_id',
        'priority',
        boolean_to_string('is_public'),
        'recipient',
        'created_at',
        'problem_id',
        'updated_at',
        'assignee_id',
        'description',
        'external_id',
        'raw_subject',
        array_to_string('email_cc_ids'),
        array_to_string('follower_ids'),
        array_to_string('followup_ids'),
        'requester_id',
        'submitter_id',
        array_to_string('custom_fields'),
        boolean_to_string('has_incidents'),
        'forum_topic_id',
        'ticket_form_id',
        'organization_id',
        array_to_string('collaborator_ids'),
        boolean_to_string('allow_attachments'),
        boolean_to_string('allow_channelback'),
        'generated_timestamp',
        'satisfaction_rating',
        array_to_string('sharing_agreement_ids'),
    ]) }} as _airbyte_zendesk_tickets_hashid,
    tmp.*
from {{ ref('zendesk_tickets_ab2') }} tmp
-- zendesk_tickets

