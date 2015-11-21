use dbBricoMarche;

ALTER TABLE Benutzer
ADD
CONSTRAINT PK_Benutzer
PRIMARY KEY (ID);
GO

ALTER TABLE Gruppe
ADD
CONSTRAINT PK_Gruppe
PRIMARY KEY (ID);
GO

ALTER TABLE Ort
ADD
CONSTRAINT PK_Ort
PRIMARY KEY (ID);
GO

ALTER TABLE Land
ADD
CONSTRAINT PK_Land
PRIMARY KEY (ID);
GO

ALTER TABLE Artikel
ADD
CONSTRAINT PK_Artikel
PRIMARY KEY (ID);
GO

ALTER TABLE Video
ADD
CONSTRAINT PK_Video
PRIMARY KEY (ID);
GO

ALTER TABLE Kategorie
ADD
CONSTRAINT PK_Kategorie
PRIMARY KEY (ID);
GO

ALTER TABLE Schlagwort
ADD
CONSTRAINT PK_Schlagwort
PRIMARY KEY (ID);
GO

ALTER TABLE Benutzer_Artikel
ADD
CONSTRAINT PK_Benutzer_Artikel
PRIMARY KEY(Benutzer_ID, Artikel_ID);
GO

ALTER TABLE Benutzer_Video
ADD
CONSTRAINT PK_Benutzer_Video
PRIMARY KEY(Benutzer_ID, Video_ID);
GO

ALTER TABLE Artikel_Video
ADD
CONSTRAINT PK_Artikel_Video
PRIMARY KEY(Artikel_ID, Video_ID);
GO

ALTER TABLE Video_Schlagwort
ADD
CONSTRAINT PK_Video_Schlagwort
PRIMARY KEY(Video_ID, Schlagwort_ID);
GO

use master;