----IICS-----
-----EXTRACTING DATA ONE TABLE TO ANOTHER-----

CREATE TABLE TE_FA_IICS_HEALTH_TGT (
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
  
SELECT * FROM TE_FA_IICS_HEALTH_TGT 


---AGGREGATE---

SELECT * FROM TE_FA_HEALTH_AGGR


----Replication----


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



---SCD1---------

----Health Dataset------
CREATE TABLE TE_FA_HEALTH_DATASET_IICS (
    [PID] float,
    [AGE] float,
    [CATEGORY_NAME] nvarchar(255),
    [DISTRICT_NAME] nvarchar(255),
    [PREAUTH_AMT] float,
    [CLAIM_AMOUNT] float,
    [HOSP_NAME] nvarchar(255)
);

CREATE TABLE TE_FA_HEALTH_DATASET_IICS_TGT (
	[Pat_Key] float,
    [Pat_ID] float,
    [Pat_AGE] float,
    [Pat_CATEGORY_NAME] nvarchar(255),
    [Pat_DISTRICT_NAME] nvarchar(255),
    [Pat_PREAUTH_AMT] float,
    [Pat_CLAIM_AMOUNT] float,
    [Pat_HOSP_NAME] nvarchar(255),
    [Checksum] nvarchar(255)
);

---After first run ---
Select * from TE_FA_HEALTH_DATASET_IICS

--Updating source data----
UPDATE TE_FA_HEALTH_DATASET_IICS SET AGE=60 WHERE PID=1;
Select * from TE_FA_HEALTH_DATASET_IICS

--Update in Target Table-----
Select * from TE_FA_HEALTH_DATASET_IICS_TGT

