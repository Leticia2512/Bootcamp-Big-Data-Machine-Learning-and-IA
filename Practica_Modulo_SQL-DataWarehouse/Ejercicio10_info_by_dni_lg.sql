select 
    calls_ivr_id, 
    MAX(IF(step_name = 'CUSTOMERINFOBYDNI.TX' and step_result = 'OK', 1, 0)) as info_by_dni_lg
from `keepcoding.ivr_detail`
group by calls_ivr_id;