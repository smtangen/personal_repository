# Compustat data processing in Impala

# Loading the csv Data
CREATE EXTERNAL TABLE Big_financials_3 (
        gvkey STRING,
        fyear STRING,
        conm STRING,
        act	DOUBLE,
        ch DOUBLE,
        chech DOUBLE,
        cogs DOUBLE,
        dt DOUBLE,
        ebit DOUBLE,
        ebitda DOUBLE,
        epspi DOUBLE,
        intpn DOUBLE,
        lct DOUBLE,
        ni DOUBLE,
        oancf DOUBLE,
        rect DOUBLE,
        revt DOUBLE,
        seq DOUBLE,
        at DOUBLE,
        tfvl DOUBLE,
        tie DOUBLE,
        txc	DOUBLE,
        xsga DOUBLE,
        prcc_f DOUBLE,
        sic	DOUBLE,
        datadate DOUBLE,	
        org DOUBLE
    )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/cloudera/Big_fin/';

# Creating a subset of the data with 4 folds
DROP TABLE IF EXISTS Big_financials_2;
CREATE TABLE Big_financials_2 AS
SELECT * 
FROM big_financials_3
WHERE org IN (0,1,2,3);

# Creating a subset of the data with 2 folds
DROP TABLE IF EXISTS Big_financials_1;
CREATE TABLE Big_financials_1 AS
SELECT * 
FROM big_financials_3
WHERE org IN (0,1);

# Creating a Parquet table of 6 folds
DROP TABLE IF EXISTS big_fin_parq_3;
CREATE TABLE big_fin_parq_3
    LIKE Big_financials_3
    STORED AS PARQUET;
    
INSERT INTO big_fin_parq_3 select * from Big_financials_3;

# Creating a Parquet table of 4 folds
DROP TABLE IF EXISTS big_fin_parq_2;
CREATE TABLE big_fin_parq_2
    LIKE big_financials_2
    STORED AS PARQUET;
    
INSERT INTO big_fin_parq_2 select * from Big_financials_2;

# Creating a Parquet table of 2 folds
DROP TABLE IF EXISTS big_fin_parq_1;
CREATE TABLE big_fin_parq_1
    LIKE big_financials_1
    STORED AS PARQUET;
    
INSERT INTO big_fin_parq_1 select * from Big_financials_1;


-- Creating tables with metrics -- 

-- Text table - 6 folds
DROP TABLE IF EXISTS fin_csv_stats_3;
CREATE TABLE fin_csv_stats_3 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_financials_3 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_financials_3
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear;
    

-- Text table - 4 folds
DROP TABLE IF EXISTS fin_csv_stats_2;
CREATE TABLE fin_csv_stats_2 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_financials_2 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_financials_2
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear;


-- Text table - 2 folds
DROP TABLE IF EXISTS fin_csv_stats_1;
CREATE TABLE fin_csv_stats_1 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_financials_1 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_financials_1
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear;    
    

-- Parquet table - 6 folds
DROP TABLE IF EXISTS fin_parq_stats_3;
CREATE TABLE fin_parq_stats_3 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_fin_parq_3 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_fin_parq_3
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear; 
    

-- Parquet table - 4 folds
DROP TABLE IF EXISTS fin_parq_stats_2;
CREATE TABLE fin_parq_stats_2 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_fin_parq_2 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_fin_parq_2
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear;     
    
    
-- Parquet table - 2 folds
DROP TABLE IF EXISTS fin_parq_stats_1;
CREATE TABLE fin_parq_stats_1 AS 
SELECT com.*, dt / ebitda as leverage_ratio,
        (ni/epspi)*prcc_f AS market_cap,
        prcc_f/ni as p_e,
        act / lct as current_ratio,
        (ch + chech + rect) / lct as quick_ratio,
        ebit / revt as op_margin,
        (revt - cogs) / revt as gross_margin,
        xsga / revt as sg_sales,
        ebit/intpn as interest_cov_ratio,
        txc/(ebit - intpn) as etr,
        revt / at as sales_assets, 
        ind_market_cap,
        ind_p_e,
        ind_leverage_ratio,
        ind_current_ratio,
        ind_quick_ratio,
        ind_op_margin,
        ind_gross_margin,
        ind_sg_sales,
        ind_interest_cov_ratio,
        ind_etr,
        ind_sales_assets,
        ind_epspi
    FROM big_fin_parq_1 AS com
    LEFT JOIN (
            SELECT sic, fyear, sum(dt) / sum(ebitda) as ind_leverage_ratio,
                                avg((ni/epspi)*prcc_f) AS ind_market_cap,
                                avg(prcc_f/ni) as ind_p_e,
                                sum(act) / sum(lct) as ind_current_ratio,
                                sum(ch + chech + rect) / sum(lct) as ind_quick_ratio,
                                sum(ebit) / sum(revt) as ind_op_margin,
                                sum(revt) - sum(cogs) / sum(revt) as ind_gross_margin,
                                sum(xsga) / sum(revt) as ind_sg_sales,
                                sum(ebit) / sum(intpn) as ind_interest_cov_ratio,
                                sum(txc) / sum(ebit - intpn) as ind_etr,
                                sum(revt) / sum(at) as ind_sales_assets,
                                avg(epspi) as ind_epspi
                                FROM big_fin_parq_1
                                WHERE org = 0
            GROUP BY sic, fyear ) AS ind
    ON com.sic = ind.sic
    AND com.fyear = ind.fyear;     
    
    
show table stats fin_csv_stats_1;
show table stats fin_csv_stats_2;
show table stats fin_csv_stats_3;

show table stats fin_parq_stats_1;
show table stats fin_parq_stats_2;
show table stats fin_parq_stats_3;
    