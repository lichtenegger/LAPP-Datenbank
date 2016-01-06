use dbBricoMarche;
GO

CREATE VIEW view_Video_Schlagwort
AS
SELECT * FROM Video_Schlagwort;
GO

CREATE VIEW view_Artikel_Video
AS
SELECT * FROM Artikel_Video;
GO

CREATE VIEW view_Benutzer_Artikel
AS
SELECT * FROM Benutzer_Artikel;
GO

CREATE VIEW view_Benutzer_Video
AS
SELECT * FROM Benutzer_Video;
GO

use master;
GO