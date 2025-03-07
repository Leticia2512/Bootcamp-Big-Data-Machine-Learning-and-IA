
select  
	calls_ivr_id,
    IFNULL(MAX(NULLIF(customer_phone, 'UNKNOWN')), 'DESCONOCIDO') as customer_phone
from keepcoding.ivr_detail
group by calls_ivr_id

