{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    via,
    cast(body as {{ dbt_utils.type_string() }}) as body,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    {{ cast_to_boolean('public') }} as public,
    cast(audit_id as {{ dbt_utils.type_bigint() }}) as audit_id,
    metadata,
    cast(author_id as {{ dbt_utils.type_bigint() }}) as author_id,
    cast(html_body as {{ dbt_utils.type_string() }}) as html_body,
    cast(ticket_id as {{ dbt_utils.type_bigint() }}) as ticket_id,
    cast({{ empty_string_to_null('created_at') }} as {{ type_timestamp_with_timezone() }}) as created_at,
    cast(plain_body as {{ dbt_utils.type_string() }}) as plain_body,
    attachments,
    _airbyte_emitted_at
from {{ ref('zendesk_ticket_comments_ab1') }}
-- zendesk_ticket_comments

