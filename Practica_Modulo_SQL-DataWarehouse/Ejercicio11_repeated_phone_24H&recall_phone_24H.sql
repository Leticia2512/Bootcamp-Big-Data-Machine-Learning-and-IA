select
  calls.calls_ivr_id,
  MAX(IF(DATE_DIFF(calls.calls_start_date, recalls.calls_start_date, second) between 1 and 24*60*60, 1, 0)) as repeated_phone_24H,
  MAX(IF(DATE_DIFF(calls.calls_start_date, recalls.calls_start_date, second) between -24*60*60  and -1, 1, 0)) as cause_recall_phone_24H
from keepcoding.ivr_detail calls
left join keepcoding.ivr_detail recalls
on calls.calls_phone_number <> 'UNKNOWN'
and calls.calls_phone_number = recalls.calls_phone_number
and calls.calls_ivr_id <> recalls.calls_ivr_id
group by calls_ivr_id;