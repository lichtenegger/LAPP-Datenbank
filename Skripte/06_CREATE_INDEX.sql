use dbBricoMarche;

CREATE UNIQUE INDEX IX_Benutzer ON Benutzer(Benutzername);

CREATE UNIQUE INDEX IX_Gruppe ON Gruppe(Bezeichnung);

CREATE UNIQUE INDEX IX_Ort ON Ort(PLZ, Bezeichnung, Land_ID);

CREATE UNIQUE INDEX IX_Land ON Land(Bezeichnung);

CREATE UNIQUE INDEX IX_Artikel ON Artikel(Bezeichnung);

CREATE UNIQUE INDEX IX_Video ON Video(Bezeichnung);

CREATE UNIQUE INDEX IX_Kategorie ON Kategorie(Bezeichnung);

CREATE UNIQUE INDEX IX_Schlagwort ON Schlagwort(Bezeichnung);

GO

use master;