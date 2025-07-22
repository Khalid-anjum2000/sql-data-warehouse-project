insert into silver.crm_prd_info(
prd_id,
cat_id,
prd_key,
prd_name,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
)
select 
	prd_id,
	replace(substring(prd_key,1,5),'-','_') as cat_id,
	substring(prd_key,7,length(prd_key)) as prd_key,
	prd_name,
	coalesce(prd_cost, 0) as prd_cost,
	case
		when upper(trim(prd_line)) = 'M' then 'Mountain'
		when upper(trim(prd_line)) = 'R' then 'Road'
		when upper(trim(prd_line)) = 'S' then 'Other Sales'
		when upper(trim(prd_line)) = 'T' then 'Touring'
		else 'n/a' 
	end as prd_line,
		cast(prd_start_dt as date),
		cast(lead(prd_start_dt) over( partition by prd_key order by prd_start_dt)-1 as date) as prd_end_dt
from bronze.crm_prd_info;
