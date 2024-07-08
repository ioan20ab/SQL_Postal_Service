sqlcmd -S <server path> -d <database name> -U <username> -P <password> -i "C:\Dataset1\Step1_DDL\step1_TablesToImportData.sql"
bcp TMP_DIM_MASTER_ACCOUNTGROUPS in "C:\Dataset1\Master_Data\csv\DIM_MASTER_ACCOUNTGROUPS.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
bcp TMP_DIM_MASTER_ORGANI<username>TION in "C:\Dataset1\Master_Data\csv\DIM_MASTER_ORGANI<username>TION.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
bcp TMP_DTO_EMPLOYEES_REA_2018_C in "C:\Dataset1\DTO\Employee_data\DTO_EMPLOYEES_REA_2018_C.csv" -F2 -c -t, -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2018_1H.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2018_1H' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2018_2H.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2018_2H' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_01.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_01' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_02.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_02' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_03.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_03' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_04.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_04' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_05.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_05' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_06.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_06' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_07.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_07' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2019_08.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2019_08' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Actual_Costs\csv\DTO_TOC_REA_2020_1H.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2020_1H' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit
bcp TMP_DTO_TOC_REA in "C:\Dataset1\DTO\Total_Operating_Costs\Future_Budget\csv\DTO_TOC_FUT_2020_2H.csv" -F2 -c -t; -S <server path> -d <database name> -U <username> -P <password>
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_FUT_2020_2H]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_FUT_2020_2H' FROM TMP_DTO_TOC_REA"
exit
sqlcmd -S <server path> -d <database name> -U <username> -P <password> -q "Delete from TMP_DTO_TOC_REA"
exit












