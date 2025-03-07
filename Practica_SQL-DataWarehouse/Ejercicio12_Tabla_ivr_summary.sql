create or replace table keepcoding.ivr_summary as
with documentation
  as (select CAST(calls_ivr_id as string) as ivr_id
           document_identification,
           document_type,
           module_sequece,
           step_sequence,
        from keepcoding.ivr_detail
       where document_identification not in ('UNKNOWN', 'DESCONOCIDO')
     QUALIFY ROW_NUMBER() over(partition by ivr_id order by module_sequece DESC, step_sequence DESC) = 1)

select 
	calls.ivr_id,
    calls.calls_phone_number as phone_number,
    calls.calls_ivr_result as ivr_result,
    case
  	  when calls.calls_vdn_label like 'ATC%' then 'FRONT'
      when calls.calls_vdn_label like 'TECH%' then 'TECH'
      when calls.calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
      else 'RESTO'
    end as vdn_aggregation,
    calls.calls_start_date as start_date,
    calls.calls_end_date as end_date,
    calls.calls_total_duration as total_duration,
    calls.calls_customer_segment as customer_segment,
    calls.calls_ivr_language as ivr_language,
    calls.calls_steps_module as steps_module,
    calls.calls_module_aggregation as module_aggregation,
    IFNULL(documentation.document_type, 'DESCONOCIDO') as document_type,
    IFNULL(documentation.document_identification, 'DESCONOCIDO') as document_identification,
    IFNULL(MAX(NULLIF(calls.customer_phone, 'UNKNOWN')), 'DESCONOCIDO') as customer_phone,
    IFNULL(MAX(NULLIF(calls.billing_account_id, 'UNKNOWN')), 'DESCONOCIDO') as billing_account_id,
    MAX(IF(calls.module_name = "AVERIA_MASIVA", 1, 0)) as masiva_lg,
    MAX(IF(calls.step_name = 'CUSTOMERINFOBYPHONE.TX' and calls.step_result = 'OK', 1, 0)) as info_by_phone_lg,
    MAX(IF(calls.step_name = 'CUSTOMERINFOBYDNI.TX' and calls.step_result = 'OK', 1, 0)) as info_by_dni_lg,
    MAX(IF(DATE_DIFF(calls.calls_start_date, recalls.calls_start_date, second) between 1 and 24*60*60, 1, 0)) as repeated_phone_24H,
    MAX(IF(DATE_DIFF(calls.start_date, recalls.start_date, second) between -24*60*60  and -1, 1, 0)) as cause_recall_phone_24H 
  from keepcoding.ivr_detail calls
  left join documentation
  on CAST(calls.calls_ivr_id as string) = documentation.ivr_id
  left join keepcoding.ivr_detail recalls
  on calls.calls_phone_number <> 'UNKNOWN'
  and calls.calls_phone_number = recalls.calls_phone_number
  and calls.calls_ivr_id <> recalls.calls_ivr_id
group by
	ivr_id,
    phone_number,
    ivr_result,
    vdn_aggregation,
    start_date,
    end_date,
    total_duration,
    customer_segment,
    ivr_language,
    steps_module,
    module_aggregation,
    document_type,
    document_identification;