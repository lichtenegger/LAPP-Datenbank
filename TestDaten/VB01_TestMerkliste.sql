use dbBricoMarche;

DELETE FROM Benutzer_Video;
GO

INSERT INTO Benutzer_Video(Benutzer_ID, Video_ID) VALUES(1, 1);
INSERT INTO Benutzer_Video(Benutzer_ID, Video_ID) VALUES(3, 1);

use master;