-- ORTE ÖSTERREICH IMPORT SKRIPTE

use dbBricoMarche;

IF NOT OBJECT_ID('temp_plz_at') IS NULL	DROP TABLE temp_plz_at;
GO

-- HIER WIRD TEMP TABELLE ERSTELLT

-- csv-daten in temporäre tabelle
BULK
INSERT temp_plz_at
FROM 'C:\Users\johanna.lichtenegger\Documents\Visual Studio 2015\Projects\DB_BricoMarcheDACH\GebrauchsDaten\DatenQuellen\plz_at.csv'
WITH
(
FIELDTERMINATOR = ';',
ROWTERMINATOR = '\n',
FIRSTROW = 2
);
GO

SELECT * FROM temp_plz_at;
GO
