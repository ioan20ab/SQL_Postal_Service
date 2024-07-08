
CREATE TABLE [TMP_DIM_MASTER_ACCOUNTGROUPS](
	[Account 2-digits] [nvarchar](255) NULL,
	[Account Type] [nvarchar](255) NULL,
	[Account Group] [nvarchar](255) NULL);
	
CREATE TABLE [TMP_DIM_MASTER_ORGANISATION](
	[Location Code] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Department Number] [nvarchar](255) NULL,
	[Cost Center] [nvarchar](255) NULL);


CREATE TABLE TMP_DTO_EMPLOYEES_REA_2018_C(
[Cost Center] [nvarchar](255) NULL,
[1_1_2018] [nvarchar](255) NULL,
[2_1_2018] [nvarchar](255) NULL,
[3_1_2018] [nvarchar](255) NULL,
[4_1_2018] [nvarchar](255) NULL,
[5_1_2018] [nvarchar](255) NULL,
[6_1_2018] [nvarchar](255) NULL,
[7_1_2018] [nvarchar](255) NULL,
[8_1_2018] [nvarchar](255) NULL,
[9_1_2018] [nvarchar](255) NULL,
[10_1_2018] [nvarchar](255) NULL,
[11_1_2018] [nvarchar](255) NULL,
[12_1_2018] [nvarchar](255) NULL,
[1_1_2019] [nvarchar](255) NULL,
[2_1_2019] [nvarchar](255) NULL,
[3_1_2019] [nvarchar](255) NULL,
[4_1_2019] [nvarchar](255) NULL,
[5_1_2019] [nvarchar](255) NULL,
[6_1_2019] [nvarchar](255) NULL,
[7_1_2019] [nvarchar](255) NULL,
[8_1_2019] [nvarchar](255) NULL,
[1_1_2020] [nvarchar](255) NULL,
[2_1_2020] [nvarchar](255) NULL,
[3_1_2020] [nvarchar](255) NULL,
[4_1_2020] [nvarchar](255) NULL,
[5_1_2020] [nvarchar](255) NULL,
[6_1_2020] [nvarchar](255) NULL
);

CREATE TABLE [TMP_DTO_TOC_REA](
	[Account number] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Value DKK] [nvarchar](255) NULL,	
	[Cost Center] [nvarchar](255) NULL);

CREATE TABLE [TMP_DTO_TOC_REA_2018_C](
	[Account number] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Value DKK] [nvarchar](255) NULL,	
	[Cost Center] [nvarchar](255) NULL,
	[FileName]  [nvarchar](255) NULL);
	
CREATE TABLE [TMP_DTO_TOC_FUT_2020_2H](
	[Account number] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Value DKK] [nvarchar](255) NULL,	
	[Cost Center] [nvarchar](255) NULL,
	[FileName]  [nvarchar](255) NULL);
	
	
	

	
