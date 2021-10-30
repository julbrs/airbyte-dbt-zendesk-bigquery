{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract('table_alias', '_airbyte_data', ['via']) }} as via,
    {{ json_extract_scalar('_airbyte_data', ['body'], ['body']) }} as body,
    {{ json_extract_scalar('_airbyte_data', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('_airbyte_data', ['public'], ['public']) }} as public,
    {{ json_extract_scalar('_airbyte_data', ['audit_id'], ['audit_id']) }} as audit_id,
    {{ json_extract('table_alias', '_airbyte_data', ['metadata']) }} as metadata,
    {{ json_extract_scalar('_airbyte_data', ['author_id'], ['author_id']) }} as author_id,
    {{ json_extract_scalar('_airbyte_data', ['html_body'], ['html_body']) }} as html_body,
    {{ json_extract_scalar('_airbyte_data', ['ticket_id'], ['ticket_id']) }} as ticket_id,
    {{ json_extract_scalar('_airbyte_data', ['created_at'], ['created_at']) }} as created_at,
    {{ json_extract_scalar('_airbyte_data', ['plain_body'], ['plain_body']) }} as plain_body,
    {{ json_extract('table_alias', '_airbyte_data', ['attachments']) }} as attachments,
    _airbyte_emitted_at
from {{ source('main', '_airbyte_raw_zendesk_ticket_comments') }} as table_alias
-- zendesk_ticket_comments

