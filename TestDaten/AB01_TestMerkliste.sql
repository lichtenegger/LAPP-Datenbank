use dbBricoMarche;

DELETE FROM Benutzer_Artikel;
GO
DBCC CHECKIDENT(Benutzer, RESEED, 1);

INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 1);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 2);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 5);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 7);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 13);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 25);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 37);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 33);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 15);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(1, 47);

INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 8);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 2);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 55);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 7);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 3);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 27);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 37);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 23);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 11);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(2, 45);

INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 8);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 6);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 63);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 7);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 3);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 17);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 37);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 53);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 11);
INSERT INTO Benutzer_Artikel(Benutzer_ID, Artikel_ID) VALUES(3, 48);

use master;