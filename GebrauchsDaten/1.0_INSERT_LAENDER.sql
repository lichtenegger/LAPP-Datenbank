 use dbBricoMarche;

DELETE FROM Land;
GO

DBCC CHECKIDENT(Land, RESEED, 0);
GO
 
INSERT INTO Land VALUES('Deutschland');
INSERT INTO Land VALUES('Österreich');
INSERT INTO Land VALUES('Schweiz');

use master;