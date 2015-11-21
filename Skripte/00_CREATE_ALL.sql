-- 01_DROP_DB

use master;

IF NOT DB_ID('dbBricoMarche') IS NULL
	DROP DATABASE dbBricoMarche;
GO

-- 02_CREATE_DB

CREATE DATABASE dbBricoMarche;
GO

-- 03_CREATE_TABLE

use dbBricoMarche;

CREATE TABLE Benutzer (
	ID INT IDENTITY(1,1) NOT NULL,
	Benutzername VARCHAR(50) NOT NULL,
	Vorname VARCHAR(20) NOT NULL,
	Nachname VARCHAR(20) NOT NULL,
	Geburtsdatum DATE NOT NULL,
	Passwort VARBINARY NOT NULL,
	Aktiv BIT NOT NULL,
	Adresse VARCHAR(50) NOT NULL,
	Ort_ID INT NOT NULL,
	Gruppe_ID INT NOT NULL
);
GO

CREATE TABLE Gruppe (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(20)
);
GO

CREATE TABLE Ort (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(20) NOT NULL,
	PLZ VARCHAR(10) NOT NULL,
	Land_ID INT NOT NULL
);
GO

CREATE TABLE Land (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Artikel (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(50) NOT NULL,
	Preis DECIMAL(8,2) NOT NULL,
	Aktiv BIT NOT NULL,
	Beschreibung VARCHAR(255),
	Bild VARBINARY NOT NULL,
	Kategorie_ID INT NOT NULL
);
GO

CREATE TABLE Video (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(50) NOT NULL,
	Aktiv BIT NOT NULL,
	Beschreibung VARCHAR(255),
	Bild VARBINARY NOT NULL,
	Pfad VARCHAR(8000) NOT NULL,
	Kategorie_ID INT NOT NULL
);
GO

CREATE TABLE Kategorie (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Schlagwort (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Benutzer_Artikel (
	Benutzer_ID INT NOT NULL,
	Artikel_ID INT NOT NULL
);
GO

CREATE TABLE Benutzer_Video (
	Benutzer_ID INT NOT NULL,
	Video_ID INT NOT NULL
);
GO

CREATE TABLE Artikel_Video (
	Artikel_ID INT NOT NULL,
	Video_ID INT NOT NULL
);
GO

CREATE TABLE Video_Schlagwort (
	Video_ID INT NOT NULL,
	Schlagwort_ID INT NOT NULL
);
GO

-- 04_CREATE_PK

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

-- 05_CREATE_FK

ALTER TABLE Benutzer
ADD
CONSTRAINT FK_Benutzer_Ort
FOREIGN KEY (Ort_ID)
REFERENCES Ort(ID);
GO

ALTER TABLE Benutzer
ADD
CONSTRAINT FK_Benutzer_Gruppe
FOREIGN KEY (Gruppe_ID)
REFERENCES Gruppe(ID);
GO

ALTER TABLE Ort
ADD
CONSTRAINT FK_Ort_Land
FOREIGN KEY (Land_ID)
REFERENCES Land(ID);
GO

ALTER TABLE Artikel
ADD
CONSTRAINT FK_Artikel_Kategorie
FOREIGN KEY (Kategorie_ID)
REFERENCES Kategorie(ID);
GO

ALTER TABLE Video
ADD
CONSTRAINT FK_Video_Kategorie
FOREIGN KEY (Kategorie_ID)
REFERENCES Kategorie(ID);
GO

ALTER TABLE Benutzer_Artikel
ADD CONSTRAINT FK_Benutzer_Artikel_Benutzer
FOREIGN KEY (Benutzer_ID)
REFERENCES Benutzer(ID);
GO

ALTER TABLE Benutzer_Artikel
ADD CONSTRAINT FK_Benutzer_Artikel_Artikel
FOREIGN KEY (Artikel_ID)
REFERENCES Artikel(ID);
GO

ALTER TABLE Benutzer_Video
ADD CONSTRAINT FK_Benutzer_Video_Benutzer
FOREIGN KEY (Benutzer_ID)
REFERENCES Benutzer(ID);
GO

ALTER TABLE Benutzer_Video
ADD CONSTRAINT FK_Benutzer_Video_Video
FOREIGN KEY (Video_ID)
REFERENCES Video(ID);
GO

ALTER TABLE Artikel_Video
ADD CONSTRAINT FK_Artikel_Video_Artikel
FOREIGN KEY (Artikel_ID)
REFERENCES Artikel(ID);
GO

ALTER TABLE Artikel_Video
ADD CONSTRAINT FK_Artikel_Video_Video
FOREIGN KEY (Video_ID)
REFERENCES Video(ID);
GO

ALTER TABLE Video_Schlagwort
ADD CONSTRAINT FK_Video_Schlagwort_Video
FOREIGN KEY (Video_ID)
REFERENCES Video(ID);
GO

ALTER TABLE Video_Schlagwort
ADD CONSTRAINT FK_Video_Schlagwort_Schlagwort
FOREIGN KEY (Schlagwort_ID)
REFERENCES Schlagwort(ID);
GO

-- 06_CREATE_INDEX

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