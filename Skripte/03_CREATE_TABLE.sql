use dbBricoMarche;

CREATE TABLE Benutzer (
	ID INT IDENTITY(1,1) NOT NULL,
	Benutzername VARCHAR(50) NOT NULL,
	Vorname VARCHAR(20) NOT NULL,
	Nachname VARCHAR(20) NOT NULL,
	Geburtsdatum DATE NOT NULL,
	Passwort VARBINARY(256) NOT NULL,
	Aktiv BIT NOT NULL DEFAULT 1,
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
	Aktiv BIT NOT NULL DEFAULT 1,
	Beschreibung VARCHAR(255),
	Bild VARBINARY NOT NULL,
	Kategorie_ID INT NOT NULL
);
GO

CREATE TABLE Video (
	ID INT IDENTITY(1,1) NOT NULL,
	Bezeichnung VARCHAR(50) NOT NULL,
	Aktiv BIT NOT NULL DEFAULT 1,
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

use master;