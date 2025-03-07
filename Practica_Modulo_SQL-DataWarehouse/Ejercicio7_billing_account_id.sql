select 
  calls_ivr_id,
  IFNULL(MAX(NULLIF(billing_account_id, 'UNKNOWN')), 'DESCONOCIDO') as billing_account_id
from keepcoding.ivr_detail
group by calls_ivr_id;
