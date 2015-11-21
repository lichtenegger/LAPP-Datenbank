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
