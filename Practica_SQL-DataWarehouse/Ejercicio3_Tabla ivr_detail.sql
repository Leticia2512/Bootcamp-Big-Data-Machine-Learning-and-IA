create or replace table keepcoding.ivr_detail as
select 
    cal.ivr_id as calls_ivr_id,
    cal.phone_number as calls_phone_number,
    cal.ivr_result as calls_ivr_result,
    cal.vdn_label as calls_vdn_label,
    cal.start_date as calls_start_date,
    format_timestamp('%Y%m%d', cal.start_date) as calls_start_date_id,
    cal.end_date as calls_end_date,
    format_timestamp('%Y%m%d', cal.end_date) as calls_end_date_id,
    cal.total_duration as calls_total_duration,
    cal.customer_segment as calls_customer_segment,
    cal.ivr_language as calls_ivr_language,
    cal.steps_module as calls_steps_module,
    cal.module_aggregation as calls_module_aggregation,
    mdl.module_sequece,
    mdl.module_name,
    mdl.module_duration,
    mdl.module_result,
    stp.step_sequence,
    stp.step_name,
    stp.step_result,
    stp.step_description_error,
    stp.document_type,
    stp.document_identification,
    stp.customer_phone,
    stp.billing_account_id
from keepcoding.ivr_calls cal
left join keepcoding.ivr_modules mdl
on cal.ivr_id = mdl.ivr_id
left join  keepcoding.ivr_steps stp
on mdl.ivr_id = stp.ivr_id and mdl.module_sequece = stp.module_sequece;

