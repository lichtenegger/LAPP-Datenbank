-- ORTE - LAENDER - DATEN-IMPORT SKRIPT ---------------------------------------------
use dbBricoMarche;

DELETE FROM Benutzer;
GO
DBCC CHECKIDENT(Benutzer, RESEED, 0);

-- Ort zurücksetzen
DELETE FROM Ort;
GO
DBCC CHECKIDENT(Ort, RESEED, 0);
GO

-- Land zurücksetzen
DELETE FROM Land;
GO
DBCC CHECKIDENT(Land, RESEED, 0);
GO

-- LAND BEFUELLEN
INSERT INTO Land VALUES('Deutschland');
INSERT INTO Land VALUES('Österreich');
INSERT INTO Land VALUES('Schweiz');

-- HIER WIRD TEMP TABELLE ERSTELLT
IF NOT OBJECT_ID('temp_plz') IS NULL DROP TABLE temp_plz;
GO

CREATE TABLE temp_plz (
	PLZ VARCHAR(10) NOT NULL,
	Bezeichnung VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL,
	Rest NVARCHAR(MAX)
);
GO

-- ORTE ÖSTERREICH ---------------------------------------------

-- csv-daten in temporäre tabelle
BULK
INSERT temp_plz
FROM 'F:\DatenQuellen\plz_at.csv'
WITH
(
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);
GO

-- Daten in Ort-Tabelle importieren
INSERT INTO Ort(PLZ, Bezeichnung, Land_ID)
	SELECT temp.PLZ, temp.Bezeichnung, (SELECT ID FROM Land as land WHERE land.Bezeichnung = 'Österreich')
		FROM temp_plz as temp
			WHERE NOT (temp.Bezeichnung LIKE 'Wien%' AND PLZ % 10 != 0)
				AND NOT(temp.Bezeichnung LIKE 'Wien%' AND PLZ > 1230)
				AND temp.Bezeichnung != UPPER(temp.Bezeichnung);
GO

-- DONE ÖSTERREICH! --------------------------------------------------------------------------

-- HIER WIRD TEMP TABELLE ERSTELLT
IF NOT OBJECT_ID('temp_plz') IS NULL DROP TABLE temp_plz;
GO

-- ORTE DEUTSCHLAND ---------------------------------------------------

CREATE TABLE temp_plz (
	Bezeichnung VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL,
	Zusatz NVARCHAR(MAX),
	PLZ VARCHAR(10) NOT NULL,
	Rest NVARCHAR(MAX)
)
-- csv-daten in temporäre tabelle
BULK
INSERT temp_plz
FROM 'F:\DatenQuellen\plz_de.csv'
WITH
(
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);
GO
-- Daten in Ort-Tabelle importieren
INSERT INTO Ort(PLZ, Bezeichnung, Land_ID)
	SELECT temp.PLZ, temp.Bezeichnung, (SELECT ID FROM Land as land WHERE land.Bezeichnung = 'Deutschland')
		FROM temp_plz as temp;
GO
-- DONE Deutschland! --------------------------------------------------------------------------

-- TEMP-TABELLE LÖSCHEN --
IF NOT OBJECT_ID('temp_plz') IS NULL DROP TABLE temp_plz;
GO

-- ORTE SCHWEIZ ---------------------------------------------------------------------------------

CREATE TABLE temp_plz (
	PLZ VARCHAR(10) NOT NULL,
	Bezeichnung VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL,
	Rest NVARCHAR(MAX)
)
-- csv-daten in temporäre tabelle
BULK
INSERT temp_plz
FROM 'F:\DatenQuellen\plz_ch.csv'
WITH
(
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);
GO
-- Daten in Ort-Tabelle importieren
INSERT INTO Ort(PLZ, Bezeichnung, Land_ID)
	SELECT temp.PLZ, temp.Bezeichnung, (SELECT ID FROM Land as land WHERE land.Bezeichnung = 'Schweiz')
		FROM temp_plz as temp;
GO
-- DONE Schweiz! --------------------------------------------------------------------------

-- TEMP-TABELLE LÖSCHEN --
IF NOT OBJECT_ID('temp_plz') IS NULL DROP TABLE temp_plz;
GO

use master;