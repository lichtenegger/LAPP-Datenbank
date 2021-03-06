use dbBricoMarche;

-- Aufräumen (Umgekehrt)

DELETE FROM Benutzer_Video;
GO
DELETE FROM Video_Schlagwort;
GO
DELETE FROM Video;
GO
DBCC CHECKIDENT(Video, RESEED, 0);
GO
DELETE FROM Schlagwort; -- Alle Daten löschen.
GO
DBCC CHECKIDENT(Schlagwort, RESEED, 0); -- ID auf 1 zurücksetzen.
GO

-- TEST: Schlagwort

INSERT INTO Schlagwort VALUES('Werkzeug');
GO
INSERT INTO Schlagwort VALUES('Hammer');
GO
INSERT INTO Schlagwort VALUES('Schraubenzieher');
GO
INSERT INTO Schlagwort VALUES('Kokosnuss');
GO
INSERT INTO Schlagwort VALUES('Glas');
GO

-- TEST: Video


INSERT INTO Video(Bezeichnung, Aktiv, Beschreibung, Bild, Pfad, Kategorie_ID)
		VALUES(	'Das Öffnen einer Kokusnuss', 1,
				'Wie man mit Hammer und Schraubenzieher eine Kokosnuss öffnet. Dient zur Gewinnung folgender Ressourcen: Kokosnussmilch, Kokosnussfleisch. Eingesetztes Werkzeug: Hammer, Schraubenzieher. Benötigtes Material: Kokosnuss.',
				(SELECT * FROM OPENROWSET(BULK N'D:kokosnuss.jpg', SINGLE_BLOB) AS IMPORT),
				'kokosnuss.mp4',
				(SELECT ID FROM Kategorie Where Bezeichnung = 'Werkzeug'));

-- TEST: Video_Schlagwort

DECLARE @schlagwort INT;
SET @schlagwort = 1;
WHILE(@schlagwort <= 5)
BEGIN
	INSERT INTO Video_Schlagwort(Video_ID, Schlagwort_ID)
			VALUES(1 , @schlagwort);
SET @schlagwort = @schlagwort +1;
END
GO

use master;