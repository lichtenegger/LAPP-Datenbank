use dbBricoMarche;

-- Aufräumen (Umgekehrt)

DELETE FROM Benutzer;
GO
DBCC CHECKIDENT(Benutzer, RESEED, 0);
GO
DELETE FROM Gruppe;
GO
DBCC CHECKIDENT(Gruppe, RESEED, 0);
GO
DELETE FROM Ort;
GO
DBCC CHECKIDENT(Ort, RESEED, 0);
GO
DELETE FROM Land; -- Alle Daten löschen.
GO
DBCC CHECKIDENT(Land, RESEED, 0); -- ID auf 0 zurücksetzen.
GO

-- Test: Land

INSERT INTO Land(Bezeichnung) VALUES('Testanien');
GO
INSERT INTO Land(Bezeichnung) VALUES('Testai');
GO

-- Test: Ort

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID) VALUES('00000', 'Testington',(
	SELECT ID FROM LAND
		WHERE Bezeichnung = 'Testanien'
));
GO

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID) VALUES('00100', 'Testis',(
	SELECT ID FROM LAND
		WHERE Bezeichnung = 'Testanien'
));
GO

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID) VALUES('10000', 'Testel',(
	SELECT ID FROM LAND
		WHERE Bezeichnung = 'Testai'
));
GO

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID) VALUES('10100', 'Testorie',(
	SELECT ID FROM LAND
		WHERE Bezeichnung = 'Testai'
));
GO

-- Test: Gruppe

INSERT INTO Gruppe(Bezeichnung) VALUES('Tester');
GO

-- Test: Benutzer

INSERT INTO Benutzer(Benutzername, Vorname, Nachname, Geburtsdatum, 
					Passwort, Adresse, Ort_ID, Gruppe_ID)
VALUES('test@mail.me', 'Testana', 'Testich', '01.02.1921',
		HASHBYTES('SHA2_256', 'test'), 'Testweg 12', 
		(SELECT ID FROM ORT WHERE PLZ = '00000'),
		(SELECT ID FROM Gruppe WHERE Bezeichnung = 'Tester')
);
GO

-- Ende

Use master;