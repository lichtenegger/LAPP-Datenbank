-- ORTE ÖSTERREICH IMPORT SKRIPTE
use dbBricoMarche;

-- HIER WIRD TEMP TABELLE ERSTELLT
IF NOT OBJECT_ID('temp_plz_at') IS NULL	DROP TABLE temp_plz_at;
GO

CREATE TABLE temp_plz_at (
	PLZ VARCHAR(10) NOT NULL,
	Bezeichnung VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL,
	Rest NVARCHAR(MAX)
);
GO

-- csv-daten in temporäre tabelle
BULK
INSERT temp_plz_at
FROM 'F:\DatenQuellen\plz_at.csv'
WITH
(
FIELDTERMINATOR = ';',
ROWTERMINATOR = '\n',
FIRSTROW = 2
);
GO

SELECT * FROM temp_plz_at;
GO

-- Daten in Ort-Tabelle importieren

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID)
	SELECT temp.PLZ, temp.Bezeichnung, (SELECT ID FROM Land as land WHERE land.Bezeichnung = 'Österreich')
		FROM temp_plz_at as temp
			WHERE NOT (temp.Bezeichnung LIKE 'Wien%' AND PLZ % 10 != 0)
				AND NOT(temp.Bezeichnung LIKE 'Wien%' AND PLZ > 1230)
				AND temp.Bezeichnung != UPPER(temp.Bezeichnung);
GO

SELECT * FROM Ort;