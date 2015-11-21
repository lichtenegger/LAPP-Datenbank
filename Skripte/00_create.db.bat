osql -S 127.0.0.1 -U sa -P 123user! -i 01_DROP_DB.sql
osql -S 127.0.0.1 -U sa -P 123user! -i 02_CREATE_DB.sql
osql -S 127.0.0.1 -U sa -P 123user! -d dbBricoMarche -i 03_CREATE_TABLE.sql
osql -S 127.0.0.1 -U sa -P 123user! -d dbBricoMarche -i 04_CREATE_PK.sql
osql -S 127.0.0.1 -U sa -P 123user! -d dbBricoMarche -i 05_CREATE_FK.sql
osql -S 127.0.0.1 -U sa -P 123user! -d dbBricoMarche -i 06_CREATE_INDEX.sql

pause