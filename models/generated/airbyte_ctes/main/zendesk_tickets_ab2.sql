{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    via,
    tags,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast({{ empty_string_to_null('due_at') }} as {{ type_timestamp_with_timezone() }}) as due_at,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    cast(brand_id as {{ dbt_utils.type_bigint() }}) as brand_id,
    cast(group_id as {{ dbt_utils.type_bigint() }}) as group_id,
    cast(priority as {{ dbt_utils.type_string() }}) as priority,
    {{ cast_to_boolean('is_public') }} as is_public,
    cast(recipient as {{ dbt_utils.type_string() }}) as recipient,
    cast({{ empty_string_to_null('created_at') }} as {{ type_timestamp_with_timezone() }}) as created_at,
    cast(problem_id as {{ dbt_utils.type_bigint() }}) as problem_id,
    cast({{ empty_string_to_null('updated_at') }} as {{ type_timestamp_with_timezone() }}) as updated_at,
    cast(assignee_id as {{ dbt_utils.type_bigint() }}) as assignee_id,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(external_id as {{ dbt_utils.type_string() }}) as external_id,
    cast(raw_subject as {{ dbt_utils.type_string() }}) as raw_subject,
    email_cc_ids,
    follower_ids,
    followup_ids,
    cast(requester_id as {{ dbt_utils.type_bigint() }}) as requester_id,
    cast(submitter_id as {{ dbt_utils.type_bigint() }}) as submitter_id,
    custom_fields,
    {{ cast_to_boolean('has_incidents') }} as has_incidents,
    cast(forum_topic_id as {{ dbt_utils.type_bigint() }}) as forum_topic_id,
    cast(ticket_form_id as {{ dbt_utils.type_bigint() }}) as ticket_form_id,
    cast(organization_id as {{ dbt_utils.type_bigint() }}) as organization_id,
    collaborator_ids,
    {{ cast_to_boolean('allow_attachments') }} as allow_attachments,
    {{ cast_to_boolean('allow_channelback') }} as allow_channelback,
    cast(generated_timestamp as {{ dbt_utils.type_bigint() }}) as generated_timestamp,
    cast(satisfaction_rating as {{ type_json() }}) as satisfaction_rating,
    sharing_agreement_ids,
    _airbyte_emitted_at
from {{ ref('zendesk_tickets_ab1') }}
-- zendesk_tickets
