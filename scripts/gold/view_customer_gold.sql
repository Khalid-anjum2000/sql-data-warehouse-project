


--Customer dimesion
CREATE VIEW gold.dim_customers as

select
	row_number() over( order by ci.cst_id) as customer_key,
	ci.cst_id as customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname as firstname,
	ci.cst_lastname as lastname,
	la.cntry as country,
	ci.cst_marital_status as marital_status,
	case when ci.cst_gndr != 'n/a' then ci.cst_gndr
		 else coalesce(ca.gen, 'n/a')
	end as gender,
	ca.bdate as birthdate,
	ci.cst_create_date as create_date
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key= ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key = la.cid



--product Dimesnion
CREATE VIEW gold.dim_products as

select 
	row_number() over(order by prd_id) as product_key,
	pr.prd_id as product_id,
	pr.prd_key as product_number,
	pr.prd_name as product_name,
	pr.cat_id as category_id,
	pc.cat as category,
	pc.subcat as subcategory,
	pc.maintenance as maintainance,
	pr.prd_cost as cost,
	pr.prd_line as product_line,
	pr.prd_start_dt as start_date
from silver.crm_prd_info pr
left join silver.erp_px_cat_g1v2 pc
on pr.cat_id=pc.id
where pr.prd_end_dt is null



