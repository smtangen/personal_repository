DROP TABLE IF EXISTS financials_1;
CREATE TABLE financials_1 (
    gvkey varchar(25),
    fyear FLOAT, 
    conm varchar(50),
    act FLOAT NULL,
    ch FLOAT NULL,
    chech FLOAT NULL,
    cogs FLOAT NULL,
    dt FLOAT NULL,
    ebit FLOAT NULL,
    ebitda FLOAT NULL,
    epspi FLOAT NULL,
    intpn FLOAT NULL,
    lct FLOAT NULL,
    ni FLOAT NULL,
    oancf FLOAT NULL,
    rect FLOAT NULL,
    revt FLOAT NULL,
    seq FLOAT NULL,
    at FLOAT NULL,
    tfvl FLOAT NULL,
    tie FLOAT NULL,
    txc FLOAT NULL,
    xsga FLOAT NULL,
    prcc_f FLOAT NULL,
    sic INT NULL,
    datadate varchar(10),
    org INT NULL);


DROP TABLE IF EXISTS financials_2;
CREATE TABLE financials_2 (
    gvkey varchar(25),
    fyear FLOAT, 
    conm varchar(50),
    act FLOAT NULL,
    ch FLOAT NULL,
    chech FLOAT NULL,
    cogs FLOAT NULL,
    dt FLOAT NULL,
    ebit FLOAT NULL,
    ebitda FLOAT NULL,
    epspi FLOAT NULL,
    intpn FLOAT NULL,
    lct FLOAT NULL,
    ni FLOAT NULL,
    oancf FLOAT NULL,
    rect FLOAT NULL,
    revt FLOAT NULL,
    seq FLOAT NULL,
    at FLOAT NULL,
    tfvl FLOAT NULL,
    tie FLOAT NULL,
    txc FLOAT NULL,
    xsga FLOAT NULL,
    prcc_f FLOAT NULL,
    sic INT NULL,
    datadate varchar(10),
    org INT NULL);

DROP TABLE IF EXISTS financials_3;
CREATE TABLE financials_3 (
    gvkey varchar(25),
    fyear FLOAT, 
    conm varchar(50),
    act FLOAT NULL,
    ch FLOAT NULL,
    chech FLOAT NULL,
    cogs FLOAT NULL,
    dt FLOAT NULL,
    ebit FLOAT NULL,
    ebitda FLOAT NULL,
    epspi FLOAT NULL,
    intpn FLOAT NULL,
    lct FLOAT NULL,
    ni FLOAT NULL,
    oancf FLOAT NULL,
    rect FLOAT NULL,
    revt FLOAT NULL,
    seq FLOAT NULL,
    at FLOAT NULL,
    tfvl FLOAT NULL,
    tie FLOAT NULL,
    txc FLOAT NULL,
    xsga FLOAT NULL,
    prcc_f FLOAT NULL,
    sic INT NULL,
    datadate varchar(10),
    org INT NULL);
    
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/big_fin1.csv'
INTO TABLE financials_1 FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@gvkey,@fyear, @conm, @act, @ch, @chech, @cogs, @dt, @ebit, @ebitda, @epspi, @intpn, @lct, @ni, @oancf, @rect,
    @revt, @seq, @at,@tfvl, @tie, @txc, @xsga, @prcc_f, @sic, @datadate, @org) 
       SET gvkey = IF(char_length(@gvkey) <1 , NULL, @gvkey), 
           fyear = IF(char_length(@fyear) <1 , NULL, @fyear), 
           conm = IF(char_length(@conm) <1 , NULL, @conm), 
           act = IF(char_length(@act) <1 , NULL, @act), 
           ch = IF(char_length(@ch) <1 , NULL, @ch),
           chech = IF(char_length(@chech) <1 , NULL, @chech), 
           cogs = IF(char_length(@cogs) <1 , NULL, @cogs), 
           dt = IF(char_length(@dt) <1 , NULL, @dt),
           ebit = IF(char_length(@ebit) <1 , NULL, @ebit),
           ebitda = IF(char_length(@ebitda) <1 , NULL, @ebitda),
           epspi = IF(char_length(@epspi ) <1 , NULL, @epspi), 
           intpn = IF(char_length(@intpn) <1 , NULL, @intpn),
           lct = IF(char_length(@lct ) <1 , NULL, @lct),
           ni = IF(char_length(@ni ) <1 , NULL, @ni), 
           oancf = IF(char_length(@oancf) <1 , NULL, @oancf),
           rect = IF(char_length(@rect) <1, NULL, @rect),
           revt = IF(char_length(@revt) <1 , NULL, @revt),
           seq = IF(char_length(@seq ) <1 , NULL, @seq), 
           at = IF(char_length(@at ) <1 , NULL, @at), 
           tfvl = IF(char_length(@tfvl ) <1 , NULL, @tfvl), 
           tie = IF(char_length(@tie ) <1 , NULL, @tie),
           txc = IF(char_length(@txc ) <1 , NULL, @txc),
           xsga = IF(char_length(@xsga) <1 , NULL, @xsga), 
           prcc_f = IF(char_length(@prcc_f) <1 , NULL, @prcc_f), 
           sic = IF(char_length(@sic) <1 , NULL, @sic), 
           datadate = IF(char_length(@datadate) <1 , NULL, @datadate),
           org = IF(char_length(@org) <1 , NULL, @org);
           
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/big_fin2.csv'
INTO TABLE financials_2 FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@gvkey,@fyear, @conm, @act, @ch, @chech, @cogs, @dt, @ebit, @ebitda, @epspi, @intpn, @lct, @ni, @oancf, @rect,
    @revt, @seq, @at,@tfvl, @tie, @txc, @xsga, @prcc_f, @sic, @datadate, @org) 
       SET gvkey = IF(char_length(@gvkey) <1 , NULL, @gvkey), 
           fyear = IF(char_length(@fyear) <1 , NULL, @fyear), 
           conm = IF(char_length(@conm) <1 , NULL, @conm), 
           act = IF(char_length(@act) <1 , NULL, @act), 
           ch = IF(char_length(@ch) <1 , NULL, @ch),
           chech = IF(char_length(@chech) <1 , NULL, @chech), 
           cogs = IF(char_length(@cogs) <1 , NULL, @cogs), 
           dt = IF(char_length(@dt) <1 , NULL, @dt),
           ebit = IF(char_length(@ebit) <1 , NULL, @ebit),
           ebitda = IF(char_length(@ebitda) <1 , NULL, @ebitda),
           epspi = IF(char_length(@epspi ) <1 , NULL, @epspi), 
           intpn = IF(char_length(@intpn) <1 , NULL, @intpn),
           lct = IF(char_length(@lct ) <1 , NULL, @lct),
           ni = IF(char_length(@ni ) <1 , NULL, @ni), 
           oancf = IF(char_length(@oancf) <1 , NULL, @oancf),
           rect = IF(char_length(@rect) <1, NULL, @rect),
           revt = IF(char_length(@revt) <1 , NULL, @revt),
           seq = IF(char_length(@seq ) <1 , NULL, @seq), 
           at = IF(char_length(@at ) <1 , NULL, @at), 
           tfvl = IF(char_length(@tfvl ) <1 , NULL, @tfvl), 
           tie = IF(char_length(@tie ) <1 , NULL, @tie),
           txc = IF(char_length(@txc ) <1 , NULL, @txc),
           xsga = IF(char_length(@xsga) <1 , NULL, @xsga), 
           prcc_f = IF(char_length(@prcc_f) <1 , NULL, @prcc_f), 
           sic = IF(char_length(@sic) <1 , NULL, @sic), 
           datadate = IF(char_length(@datadate) <1 , NULL, @datadate),
           org = IF(char_length(@org) <1 , NULL, @org);
           
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/big_fin3.csv'
INTO TABLE financials_3 FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@gvkey,@fyear, @conm, @act, @ch, @chech, @cogs, @dt, @ebit, @ebitda, @epspi, @intpn, @lct, @ni, @oancf, @rect,
    @revt, @seq, @at,@tfvl, @tie, @txc, @xsga, @prcc_f, @sic, @datadate, @org) 
       SET gvkey = IF(char_length(@gvkey) <1 , NULL, @gvkey), 
           fyear = IF(char_length(@fyear) <1 , NULL, @fyear), 
           conm = IF(char_length(@conm) <1 , NULL, @conm), 
           act = IF(char_length(@act) <1 , NULL, @act), 
           ch = IF(char_length(@ch) <1 , NULL, @ch),
           chech = IF(char_length(@chech) <1 , NULL, @chech), 
           cogs = IF(char_length(@cogs) <1 , NULL, @cogs), 
           dt = IF(char_length(@dt) <1 , NULL, @dt),
           ebit = IF(char_length(@ebit) <1 , NULL, @ebit),
           ebitda = IF(char_length(@ebitda) <1 , NULL, @ebitda),
           epspi = IF(char_length(@epspi ) <1 , NULL, @epspi), 
           intpn = IF(char_length(@intpn) <1 , NULL, @intpn),
           lct = IF(char_length(@lct ) <1 , NULL, @lct),
           ni = IF(char_length(@ni ) <1 , NULL, @ni), 
           oancf = IF(char_length(@oancf) <1 , NULL, @oancf),
           rect = IF(char_length(@rect) <1, NULL, @rect),
           revt = IF(char_length(@revt) <1 , NULL, @revt),
           seq = IF(char_length(@seq ) <1 , NULL, @seq), 
           at = IF(char_length(@at ) <1 , NULL, @at), 
           tfvl = IF(char_length(@tfvl ) <1 , NULL, @tfvl), 
           tie = IF(char_length(@tie ) <1 , NULL, @tie),
           txc = IF(char_length(@txc ) <1 , NULL, @txc),
           xsga = IF(char_length(@xsga) <1 , NULL, @xsga), 
           prcc_f = IF(char_length(@prcc_f) <1 , NULL, @prcc_f), 
           sic = IF(char_length(@sic) <1 , NULL, @sic), 
           datadate = IF(char_length(@datadate) <1 , NULL, @datadate),
           org = IF(char_length(@org) <1 , NULL, @org);

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
