select 
    calls_ivr_id, 
    MAX(if(module_name = "AVERIA_MASIVA", 1, 0)) as masiva_lg
from keepcoding.ivr_detail
group by calls_ivr_id;
