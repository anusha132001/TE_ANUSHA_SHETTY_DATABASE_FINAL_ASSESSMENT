----EXTRACTING DATA FROM HEALTH RECORD------

-----EXTARCTING DATA FROM EXCEL TO DESTINATION-------

CREATE TABLE TE_FA_HEALTH_DATASET(
    [PID] float,
    [AGE] float,
    [GENDER] nvarchar(255),
    [CASTE_NAME] nvarchar(255),
    [CATEGORY_CODE] nvarchar(255),
    [CATEGORY_NAME] nvarchar(255),
    [SURGERY_DATE] datetime,
    [DISCHARGE_DATE] datetime,
    [VILLAGE] nvarchar(255),
    [MANDAL_NAME] nvarchar(255),
    [DISTRICT_NAME] nvarchar(255),
    [PREAUTH_DATE] datetime,
    [PREAUTH_AMT] float,
    [CLAIM_DATE] datetime,
    [CLAIM_AMOUNT] float,
    [HOSP_NAME] nvarchar(255),
    [HOSP_TYPE] nvarchar(255),
    [HOSP_DISTRICT] nvarchar(255),
    [MORTALITY] nvarchar(255),
    [MORTALITY_DATE] datetime,
    [SRC_REGISTRATION] nvarchar(255)
);


----SLOWLY CHANGING DIMENSION-----

CREATE TABLE TE_FA_HEALTH_DATA_DEST(
    [PID] float,
    [AGE] float,
    [GENDER] nvarchar(255),
    [CASTE_NAME] nvarchar(255),
    [CATEGORY_CODE] nvarchar(255),
    [CATEGORY_NAME] nvarchar(255),
    [SURGERY_DATE] datetime,
    [DISCHARGE_DATE] datetime,
    [VILLAGE] nvarchar(255),
    [MANDAL_NAME] nvarchar(255),
    [DISTRICT_NAME] nvarchar(255),
    [PREAUTH_DATE] datetime,
    [PREAUTH_AMT] float,
    [CLAIM_DATE] datetime,
    [CLAIM_AMOUNT] float,
    [HOSP_NAME] nvarchar(255),
    [HOSP_TYPE] nvarchar(255),
    [HOSP_DISTRICT] nvarchar(255),
    [MORTALITY] nvarchar(255),
    [MORTALITY_DATE] datetime,
    [SRC_REGISTRATION] nvarchar(255)
);

SELECT * FROM TE_FA_HEALTH_DATA_DEST;
---TYPE 0 UPDATING COLUMN CASTE_NAME IN SOURCE TABLE---

UPDATE TE_FA_HEALTH_DATASET 
SET CASTE_NAME='Minorities' WHERE PID=2;


--TYPE 1--SET CHANGING ATRIBUTE IN SSIS ----
SELECT * FROM TE_FA_HEALTH_DATA_DEST;


---TYPE 2 ---HISTORICAL ATTRIBUTE----

---ADD ADDITIONAL COLUMS--- TO SOURCE AND DESTINATIONS

ALTER TABLE TE_FA_HEALTH_DATA_DEST  
ADD START_DATE DATE, END_DATE DATE, STATUS VARCHAR(10);

ALTER TABLE TE_FA_HEALTH_DATASET  
ADD START_DATE DATE, END_DATE DATE, STATUS VARCHAR(10);

SELECT * FROM TE_FA_HEALTH_DATASET;

SELECT * FROM TE_FA_HEALTH_DATA_DEST;

---CHANGING START AND END DATE IN SSIS-------

---UPDATE RECORDS AFTER INSERTING-------

UPDATE TE_FA_HEALTH_DATASET 
SET CASTE_NAME ='OBC' 
WHERE PID=1;

SELECT * FROM TE_FA_HEALTH_DATASET WHERE  CATEGORY_NAME='NEPHROLOGY';

SELECT * FROM TE_FA_HEALTH_DATA_DEST;

----SET STATUS AS CURRENT OR EXPIRED-----
SELECT * FROM TE_FA_HEALTH_DATA_DEST;

---PERFORM UPDATE AFTER INSERTION TO DESTINATION TABLE-----

UPDATE TE_FA_HEALTH_DATASET 
SET CASTE_NAME ='BC' 
WHERE PID=2;

SELECT * FROM TE_FA_HEALTH_DATASET;

---RUN THE PACKAGE---
--RETRIEVE RESULT---
SELECT * FROM TE_FA_HEALTH_DATA_DEST;


--AGGREGATE TRANSFORMATION----
----EXTRACTING DATA FROM CINEMA DATASET------

CREATE TABLE TE_FA_CINEMA_DATASET  (
    [Film_Type] nvarchar(255),
    [Film_code] float,
    [Cinema_code] float,
    [Total_sales] float,
    [Tickets_sold] float,
    [Tickets_out] float,
    [Show_time] float,
    [Occu_perc] float,
    [Ticket_price] float,
    [Ticket_use] float,
    [Capacity] float,
    [Date] datetime,
    [Month] float,
    [Quarter] float,
    [Day] float
)


SELECT * FROM TE_FA_CINEMA_DATASET;

---AGGREGATE IN SQL----
SELECT 
sum(Tickets_sold) AS SUM, AVG(Ticket_use) AS AVG ,film_type from TE_FA_CINEMA_DATASET 
group by Film_Type 

----AGGREGATE IN SSIS---
SELECT * FROM TE_FA_CINEMA_DATASET_AGG





----EXTRACTING LOAN DATASET TO DESTINATION-----
CREATE TABLE TE_FA_LOAN_DATASET (
    [LoanNr_ChkDgt] float,
    [Name] nvarchar(255),
    [City] nvarchar(255),
    [State] nvarchar(255),
    [Zip] float,
    [Bank] nvarchar(255),
    [BankState] nvarchar(255),
    [NAICS] float,
    [ApprovalDate] datetime,
    [ApprovalFY] float,
    [Term] float,
    [NoEmp] float,
    [NewExist] float,
    [CreateJob] float,
    [RetainedJob] float,
    [FranchiseCode] float,
    [UrbanRural] float,
    [RevLineCr] nvarchar(255),
    [LowDoc] nvarchar(255),
    [ChgOffDate] datetime,
    [DisbursementDate] datetime,
    [DisbursementGross] nvarchar(255),
    [BalanceGross] nvarchar(255),
    [MIS_Status] nvarchar(255),
    [ChgOffPrinGr] nvarchar(255),
    [GrAppv] nvarchar(255),
    [SBA_Appv] nvarchar(255)
)

SELECT * FROM TE_FA_LOAN_DATASET;

---FLAT FILE TO DB DESTINATION----


SELECT * FROM TE_FA_SALES_DATA_DES
