/*===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

drop table if exists silver.crm_cust_info;
create table silver.crm_cust_info(
	cst_id int,
	cst_key varchar(50),
	cst_firstname varchar(50),
	cst_lastname varchar(50),
	cst_material_status varchar(50),
	cst_gndr varchar(50),
	cst_create_date date,
	dwh_create_date timestamp default current_timestamp
);

drop table if exists silver.crm_prd_info;
Create Table silver.crm_prd_info(
	prd_id int,
	cat_id varchar(50),
	prd_key varchar(50),
	prd_name varchar(50),
	prd_cost int,
	prd_line varchar(50),
	prd_start_dt date,
	prd_end_dt date
	dwh_create_date timestamp default current_timestamp
);

drop table if exists silver.crm_sales_details;
Create Table silver.crm_sales_details(
	sls_ord_num varchar(50),
	sls_prd_key varchar(50),
	sls_cust_id int,
	sls_order_dt date,
	sls_ship_dt date,
	sls_due_dt date,
	sls_sales int,
	sls_quantity int,
	sls_price int,
	dwh_create_date timestamp default current_timestamp
);

drop table if exists silver.erp_loc_a101;
Create Table silver.erp_loc_a101(
	cid varchar(50),
	cntry varchar(50),
	dwh_create_date timestamp default current_timestamp
);


drop table if exists silver.erp_cust_az12;
Create Table silver.erp_cust_az12(
	cid varchar(50),
	bdate date,
	gen varchar(50),
	dwh_create_date timestamp default current_timestamp
);


drop table if exists silver.erp_px_cat_g1v2;
Create Table silver.erp_px_cat_g1v2(
	id varchar(50),
	cat varchar(50),
	subcat varchar(50),
	maintenance varchar(50)
	dwh_create_date timestamp default current_timestamp
);
