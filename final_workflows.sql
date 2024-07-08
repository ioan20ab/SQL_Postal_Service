
--SQL003 raw script --
-- here this has duplicates due to cost center duplicate
  SELECT 
	  toc.[Cost Center]
	 ,org.[Department Number]
      ,org.[Location Code]
      ,org.[Location]
      ,org.[Company]
      ,SUBSTRING(toc.[Account number],6,LEN([Account number])-5) as [Account number]
      ,SUBSTRING(toc.[Account number],6,2) as [Account_2_digits]
      ,acc.[Account Type]
      ,acc.[Account Group]
	  ,SUBSTRING(year,4,4) TT
      ,datefromparts(SUBSTRING(year,4,4), [month], 1) as [CostDate]
      ,SUBSTRING(year,4,4) as [Year]
      ,[Month]
      ,[Value DKK]
      ,'REA' [Version]
      ,'Cost Data' [Dataset]
      ,toc.[FileName]
      ,'yannis' [CreatedBy]
      ,getdate() as [CreatedDate]
      ,'yannis' as [UpdatedBy]
      ,getdate() as [Updateddate]
  FROM [dbo].[TMP_DTO_TOC_REA_2018_C] toc, TMP_DIM_MASTER_ORGANISATION org, TMP_DIM_MASTER_ACCOUNTGROUPS acc  
  where toc.[cost Center] = org.[cost Center] and 
  SUBSTRING(toc.[Account number],6,2) = acc.[Account 2-digits];
  
-- find duplicate 
  select * from TMP_DIM_MASTER_ORGANISATION where [Cost Center] in (
	select [Cost Center] from TMP_DIM_MASTER_ORGANISATION group by [Cost Center]
  having count(*) > 1
  );
  
-- build smaller table after duplicates
  select Company, [Department Number], [Cost Center], min(Location) Location, min([Location Code]) [Location Code]
  from TMP_DIM_MASTER_ORGANISATION
  group by Company, [Department Number], [Cost Center];
  
-- final script but will give an error due to decimal points
SELECT 
	  toc.[Cost Center]
	 ,org.[Department Number]
      ,org.[Location Code]
      ,org.[Location]
      ,org.[Company]
      ,SUBSTRING(toc.[Account number],6,LEN([Account number])-5) as [Account number]
      ,SUBSTRING(toc.[Account number],6,2) as [Account_2_digits]
      ,acc.[Account Type]
      ,acc.[Account Group]
	  ,SUBSTRING(year,4,4) TT
      ,datefromparts(SUBSTRING(year,4,4), [month], 1) as [CostDate]
      ,SUBSTRING(year,4,4) as [Year]
      ,[Month]
      ,[Value DKK]
      ,'REA' [Version]
      ,'Cost Data' [Dataset]
      ,toc.[FileName]
      ,'yannis' [CreatedBy]
      ,getdate() as [CreatedDate]
      ,'yannis' as [UpdatedBy]
      ,getdate() as [Updateddate]
  FROM [dbo].[TMP_DTO_TOC_REA_2018_C] toc, 
  (select Company, [Department Number], [Cost Center], min(Location) Location, min([Location Code]) [Location Code]
  from TMP_DIM_MASTER_ORGANISATION
  group by Company, [Department Number], [Cost Center]) org, 
  TMP_DIM_MASTER_ACCOUNTGROUPS acc  
  where toc.[cost Center] = org.[cost Center] and 
  SUBSTRING(toc.[Account number],6,2) = acc.[Account 2-digits];
  
  
-- SQL005 raw script --
SELECT [Cost_Center] Cost_Center, [TimePeriod], EmployeeCount  
FROM   
   (SELECT [Cost Center] Cost_Center
      ,[1_1_2018] '2018-1' 
      ,[2_1_2018] '2018-2'
      ,[3_1_2018] '2018-3'
      ,[4_1_2018] '2018-4'      
	  ,[5_1_2018] '2018-5'      
	  ,[6_1_2018] '2018-6'      
	  ,[7_1_2018] '2018-7'      
	  ,[8_1_2018] '2018-8'      
	  ,[9_1_2018] '2018-9'      
	  ,[10_1_2018] '2018-10'
	  ,[11_1_2018] '2018-11'
	  ,[12_1_2018] '2018-12'	  
	  ,[1_1_2019] '2019-1' 
      ,[2_1_2019] '2019-2'
      ,[3_1_2019] '2019-3'
      ,[4_1_2019] '2019-4'      
	  ,[5_1_2019] '2019-5'      
	  ,[6_1_2019] '2019-6'      
	  ,[7_1_2019] '2019-7'      
	  ,[8_1_2019] '2019-8'     
	  ,[1_1_2020] '2020-1' 
      ,[2_1_2020] '2020-2'
      ,[3_1_2020] '2020-3'
      ,[4_1_2020] '2020-4'      
	  ,[5_1_2020] '2020-5'      
	  ,[6_1_2020] '2020-6'      
  FROM [dbo].TMP_DTO_EMPLOYEES_REA_2018_C) p  
UNPIVOT  
   (EmployeeCount FOR TimePeriod IN   
      ([2018-1],[2018-2],[2018-3],[2018-4],
	  [2018-5],[2018-6],[2018-7],[2018-8],
	  [2018-9],[2018-10],[2018-11],[2018-12],
	  [2019-1],[2019-2],[2019-3],[2019-4],
	  [2019-5],[2019-6],[2019-7],[2019-8],
	  [2020-1],[2020-2],[2020-3],[2020-4],
	  [2020-5],[2020-6])  
) as employeeC;

  