-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- Insert test data
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------

USE webdent;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblEinstellungen
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblEinstellungen (NameUnternehmen,RechnungNummerTeil1,RechnungNummer) VALUES 
('BurgarDental Zahntechnik','k-BurgarDental-',1);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblUnternehmen
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblUnternehmen (NameUnternehmen,Strasse,PLZ,Ort,Bundesland,Land,Tel,Mobil) VALUES 
('BurgarDental Zahntechnik','Gollierstr. 70A','80339','München','Bayern','Deutschland','+49 89 54070700','+49 177 7987680');


INSERT INTO tblAbteilungen (IDUnternehmen,NameAbteilung) VALUES (1, 'Leitung');

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblBenutzer
--
-- Initial user with role "superadmin"
--
-- username: burgard - password: SuperUser
-- username: admin - password: admin
--
-- Password is encoded with SHA-256 (Website for encoding: https://emn178.github.io/online-tools/sha256.html)
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblBenutzer (IDUnternehmen,Benutzername,Passwort,Rolle,Anrede,Nachname,Vorname,Taetigkeit,Bemerkung) VALUES 
(1,'burgard', '9f132b053488478489310e498069a7c6dd58e285fd1f7b18ddab98a5129643b9', 'superadmin', 'Frau', 'Burgard', 'Iris', 'Zahntechnikerin', 'Diese Rolle hat alle Rechte');

INSERT INTO tblBenutzer (IDUnternehmen,Benutzername,Passwort,Rolle,Anrede,Nachname,Vorname,Taetigkeit,Bemerkung) VALUES 
(1,'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'superadmin', 'Herr', 'Burgard', 'Thomas', 'Admin', 'Diese Rolle hat alle Rechte');

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblKundenTypen
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblKundenTypen (KundenTyp) VALUES ('Zahnarztpraxis');
INSERT INTO tblKundenTypen (KundenTyp) VALUES ('Dentallabor');
INSERT INTO tblKundenTypen (KundenTyp) VALUES ('Patient');

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblKunden
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblKunden (IDKundenTyp,IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Fax,Email,Internet,Bemerkung)
VALUES
(1,1,'Kunde','k-burgardental-1','Zahnarztpraxis Mayer & Kollegen','Herr','Mayer','Max','Dr. med. dent.','Teststr. 1','80339','München','Deutschland','+49 89 444444','+49 151 111111','+49 89 5401234','mayer@praxis.de','www.praxis1.de','Das ist ein Zahnarzt-Testkunde');

INSERT INTO tblKunden (IDKundenTyp,IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Fax,Email,Internet,Bemerkung)
VALUES
(1,1,'Kunde','k-burgardental-2','Zahnarztpraxis Müller','Frau','Müller','Maria','Dr. med. dent.','Teststr. 2','80339','München','Deutschland','+49 89 555555','+49 151 222222','+49 89 5405678','mueller@praxis.de','www.praxis2.de','Das ist ein Zahnarzt-Testkunde');

INSERT INTO tblKunden (IDKundenTyp,IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Fax,Email,Internet,Bemerkung)
VALUES
(1,1,'Kunde','k-burgardental-3','Dentallabor Schmidt GmbH','Herr','Schmidt','Heinz','','Teststr. 3','80339','München','Deutschland','+49 89 666666','+49 151 333333','+49 89 5401111','schmidt@labor.de','www.dentallabor1.de','Das ist ein Test-Dentallabor');

INSERT INTO tblKunden (IDKundenTyp,IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Fax,Email,Internet,Bemerkung)
VALUES
(1,1,'kein Kunde','k-burgardental-4','Zahnarztpraxis Hinterhuber','Frau','Hinterhuber','Sabine','','Teststr. 8','80339','München','Deutschland','+49 89 777777','+49 151 666666','+49 89 5404444','hinterhuber@praxis.de','www.hinterhuber.de','Das ist ein Zahnarzt, der Ineteresse hat, aber noch keine Arbiet geschickt hat');
