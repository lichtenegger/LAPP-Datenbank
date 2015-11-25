use dbBricoMarche;
GO

-- Test: Land

INSERT INTO Land(Bezeichnung) VALUES('Testanien');
GO

-- Test: Ort

INSERT INTO Ort(PLZ, Bezeichnung, Land_ID) VALUES('00000', 'Testington',(
	SELECT ID FROM LAND
		WHERE Bezeichnung = 'Testanien'
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
GO