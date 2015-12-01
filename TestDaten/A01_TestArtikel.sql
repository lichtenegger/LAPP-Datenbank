use dbBricoMarche;

-- TEST: Kategorien

INSERT INTO Kategorie VALUES('Werkzeug');
GO
INSERT INTO Kategorie VALUES('Ger�te');
GO
INSERT INTO Kategorie VALUES('Material');
GO
INSERT INTO Kategorie VALUES('Ausr�stung');
GO
INSERT INTO Kategorie VALUES('Zubeh�r');
GO

-- TEST: Artikel

DELETE FROM Artikel;
GO

DBCC CHECKIDENT(Artikel, RESEED, 0);
GO

DECLARE @artikel INT;
SET @artikel = 1;
WHILE(@artikel <= 250)
BEGIN
	INSERT INTO Artikel(Bezeichnung, Preis, Aktiv, Beschreibung, Bild, Kategorie_ID)
			VALUES(concat('Artikel Nummer ', convert(nvarchar(max), @artikel)), 49.50, 1,
					'Dieser Artikel eignet sich ideal f�r Ihr n�chstes Heimwerker-Projekt!',
					(SELECT * FROM OPENROWSET(BULK N'E:hammer-hand_klein.png', SINGLE_BLOB) AS IMPORT),
					(@artikel % 5 +1));
SET @artikel = @artikel +1;
END
GO

use master;