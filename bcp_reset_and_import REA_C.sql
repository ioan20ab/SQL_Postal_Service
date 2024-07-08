sqlcmd -S <server> -d <database> -U <username> -P <password> -i "<path to file>\ScripDDLTablesToImportData.sql"
bcp TMP_DIM_MASTER_ACCOUNTGROUPS in "<path to file>\DIM_MASTER_ACCOUNTGROUPS.csv" -F2 -c -t; -S <Server> -d <Database> -U <username> -P <Password>
sqlcmd -S <Server> -d <database> -U <username> -P <Password> -q <query to reset temp table>
exit
bcp TMP_DTO_TOC_REA in "<Path to file>\Actual_Costs\csv\DTO_TOC_REA_2018_1H.csv" -F2 -c -t; -S <Server> -d <Database> -U <Username> -P <Password>
sqlcmd -S <Server> -d <database> -U <username> -P <password> -q "INSERT INTO [TMP_DTO_TOC_REA_2018_C]([Account number], [Year], [Month],[Value DKK],[Cost Center],[FileName]) SELECT [Account number], [Year], [Month],[Value DKK],[Cost Center],'DTO_TOC_REA_2018_1H' FROM TMP_DTO_TOC_REA"
exit



