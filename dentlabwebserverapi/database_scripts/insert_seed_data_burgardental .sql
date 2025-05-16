-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- Insert test data
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------

USE webdent;

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
-- username: iris - password: platon01
-- username: thomas - password: platon09
--
-- Password is encoded with SHA-256 (Website for encoding: https://emn178.github.io/online-tools/sha256.html)
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblBenutzer (IDUnternehmen,Benutzername,Passwort,Rolle,Anrede,Nachname,Vorname,Taetigkeit,Bemerkung) VALUES 
(1,'iris', '0081c86d601e6b624b356f1193578ba1b2407a3980481900cdb98458a2160dec', 'superadmin', 'Frau', 'Burgard', 'Iris', 'Zahntechnikerin', 'Diese Rolle hat alle Rechte');

INSERT INTO tblBenutzer (IDUnternehmen,Benutzername,Passwort,Rolle,Anrede,Nachname,Vorname,Taetigkeit,Bemerkung) VALUES 
(1,'thomas', 'e98145efe97fee1d4b1b19bc91ae4bcc6ab89d6156ccca930d3fdbafe8afcc50', 'superadmin', 'Herr', 'Burgard', 'Thomas', 'Admin', 'Diese Rolle hat alle Rechte');

-- ---------------------------------------------------------------------------------------------------------------------
-- Table: tblKunden
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblKunden (IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Email,Internet,Bemerkung)
VALUES
(1,'Kunde','k-burgardental-1','Zahnarztpraxis Mayer & Kollegen','Herr','Mayer','Max','Dr. med. dent.','Teststr. 1','80339','München','Deutschland','+49 89 444444','+49 151 111111','mayer@praxis.de','www.praxis1.de','Das ist ein Zahnarzt-Testkunde');

INSERT INTO tblKunden (IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Email,Internet,Bemerkung)
VALUES
(1,'Kunde','k-burgardental-2','Zahnarztpraxis Müller','Frau','Müller','Maria','Dr. med. dent.','Teststr. 2','80339','München','Deutschland','+49 89 555555','+49 151 222222','mueller@praxis.de','www.praxis2.de','Das ist ein Zahnarzt-Testkunde');

INSERT INTO tblKunden (IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Email,Internet,Bemerkung)
VALUES
(1,'Kunde','k-burgardental-3','Dentallabor Schmidt GmbH','Herr','Schmidt','Heinz','','Teststr. 3','80339','München','Deutschland','+49 89 666666','+49 151 333333','schmidt@labor.de','www.dentallabor1.de','Das ist ein Test-Dentallabor');

INSERT INTO tblKunden (IDUnternehmen,Kundenstatus,KundenNummer,NameUnternehmen,Anrede,Nachname,Vorname,Titel,Strasse,PLZ,Ort,Land,Tel,Mobil,Email,Internet,Bemerkung)
VALUES
(1,'kein Kunde','k-burgardental-4','Zahnarztpraxis Hinterhuber','Frau','Hinterhuber','Sabine','','Teststr. 8','80339','München','Deutschland','+49 89 777777','+49 151 666666','hinterhuber@praxis.de','www.hinterhuber.de','Das ist ein Zahnarzt, der Ineteresse hat, aber noch keine Arbiet geschickt hat');
