select 
  calls_ivr_id,
  document_type,
  document_identification
from (
	select CAST(calls_ivr_id as string) as calls_ivr_id,
		document_identification,
		document_type,
		module_sequece,
		step_sequence,
		IF(document_identification not in ('UNKNOWN', 'DESCONOCIDO'), 1, 0) as has_document_lg
	 from keepcoding.ivr_detail
	QUALIFY ROW_NUMBER() over(partition by calls_ivr_id order by has_document_lg DESC, module_sequece DESC, step_sequence DESC) = 1)

