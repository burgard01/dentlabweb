-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- 1. Drop database "webdent" if exist then create database
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS webdent;
CREATE DATABASE webdent CHARACTER SET utf8 COLLATE utf8_general_ci;
USE webdent;

-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- 2. Drop all tables in MySQL database "webdent"
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tblUnternehmen;
DROP TABLE IF EXISTS tblAbteilungen;
DROP TABLE IF EXISTS tblBenutzer;
DROP TABLE IF EXISTS tblKundenInfos;
DROP TABLE IF EXISTS tblKunden;
DROP TABLE IF EXISTS tblAuftragMaterialInfos;
DROP TABLE IF EXISTS tblMaterialInfos;
DROP TABLE IF EXISTS tblAbrechnungslisten;
DROP TABLE IF EXISTS tblAbrechnungspositionen;
DROP TABLE IF EXISTS tblJumbopositionen;
DROP TABLE IF EXISTS tblJumbos;
DROP TABLE IF EXISTS tblAuftragNotizen;
DROP TABLE IF EXISTS tblAuftraege;
DROP TABLE IF EXISTS tblAuftragspositionen;
DROP TABLE IF EXISTS tblRechnungen;
DROP TABLE IF EXISTS tblMonatsaufstellungen;
DROP TABLE IF EXISTS tblBestellungen;

-- ---------------------------------------------------------------------------------------------------------------------
-- 2. Create all tables for MySQL database "webdent"
-- ---------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblUnternehmen
--
-- Purpose: for WebDentLab companies data
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblUnternehmen (
    ID_Unternehmen INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameUnternehmen VARCHAR(255) NOT NULL,
    Strasse VARCHAR(255) NOT NULL,
    PLZ VARCHAR(100) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    Bundesland VARCHAR(255),
    Land VARCHAR(255),
    Tel VARCHAR(255) NOT NULL,
    Mobil VARCHAR(255),
    Email VARCHAR(255),
    Internet VARCHAR(255),
    Steuernummer VARCHAR(255),
    UmsatzID VARCHAR(255),
    Handwerksrolle VARCHAR(255),
    ZustaendigeAufsichtsbehörde VARCHAR(255),
    Handelsregister VARCHAR(255),
    Registereintrag VARCHAR(255),
    Registergericht VARCHAR(255),
    Registernummer VARCHAR(255),
    Unternehmensleitung VARCHAR(255),
    NameBank VARCHAR(255),
    IBAN VARCHAR(255),
    BIC VARCHAR(255),
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAbteilungen
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAbteilungen (
    ID_Abteilung INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDUnternehmen INT,
    NameAbteilung VARCHAR(255) UNIQUE NOT NULL,
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblBenutzer
--
-- Roles:
-- superadmin (role after installation - superuser has all rights)
-- admin      (has also all rights & can import)
-- level2     (has also all rights)
-- level1     (has only some rights -> create order, manage accounting positions, jumbos, material)
--
-- userNumber = Mitarbeiternummer
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblBenutzer (
    ID_Benutzer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDUnternehmen INT,
    IDAbteilung INT,
    Benutzername VARCHAR(255) NOT NULL,
    Passwort VARCHAR(255) NOT NULL,
    Rolle VARCHAR(255) NOT NULL,
    NummerBenutzer VARCHAR(255),
    Anrede VARCHAR(50),
    Nachname VARCHAR(255),
    Vorname VARCHAR(255),    
    Email VARCHAR(255) UNIQUE,        
    Titel VARCHAR(255),
    Taetigkeit VARCHAR(255),
    TelPrivat VARCHAR(255),
    TelImUnternehmen VARCHAR(255),
    MobilImUnternehmen VARCHAR(255),         
    StrassePrivat VARCHAR(255),
    PLZPrivat VARCHAR(255),
    OrtPrivat VARCHAR(255),
    Geburtsdatum DATE,
    EintrittsDatum DATE,
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY(IDAbteilung) REFERENCES tblAbteilungen(ID_Abteilung),
    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)     
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblKunden
--
-- Kundenstatus:
--     - Kunde
--     - hat Interesse
--     - kein Kunde
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblKunden (
    ID_Kunde INT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    IDUnternehmen INT NOT NULL,
    Kundentyp VARCHAR(255),
    Kundenstatus VARCHAR(50) NOT NULL DEFAULT 'kein Kunde',
    Kundennummer VARCHAR(255) UNIQUE NOT NULL,    
    NameUnternehmen VARCHAR(255) NOT NULL,
    Anrede VARCHAR(50),
    Nachname VARCHAR(255),
    Vorname VARCHAR(255),
    Titel VARCHAR(255),
    Strasse VARCHAR(255) NOT NULL,
    PLZ VARCHAR(100) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    Land VARCHAR(255),
    Tel VARCHAR(255) NOT NULL,
    Mobil VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Internet VARCHAR(255),
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     
    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblKundenInfos
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblKundenInfos (
    ID_KundenInfo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDKunde INT NOT NULL,
    Notiz TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDKunde) REFERENCES tblKunden(ID_Kunde)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAbrechnungslisten
--
-- BEL, BEB, BEB97
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAbrechnungslisten (
    ID_Abrechnungsliste INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameListe VARCHAR(50) NOT NULL,
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAbrechnungspositionen
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAbrechnungspositionen (
    ID_Abrechnungsposition INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAbrechnungsliste INT,
    IDUnternehmen INT NOT NULL,
    PositionsNummer VARCHAR(20) NOT NULL,
    Bezeichnung VARCHAR(255) NOT NULL,
    Preis DECIMAL(13,2),
    Datum DATE,
    Mehrwertsteuer INT,
    Minutenaufwand INT,
    NachAnzahl BOOLEAN,
    NachGewicht BOOLEAN,
    Bemerkung TEXT,
    
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDAbrechnungsliste) REFERENCES tblAbrechnungslisten(ID_Abrechnungsliste),
    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblMaterialInfos 
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblMaterialInfos (
    ID_Materialinfo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAbrechnungsposition INT,
    Hersteller VARCHAR(255),
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    

    FOREIGN KEY(IDAbrechnungsposition) REFERENCES tblAbrechnungspositionen(ID_Abrechnungsposition)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - jumbos
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblJumbos (
    ID_Jumbo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameJumbo VARCHAR(255),
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblJumbopositionen
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblJumbopositionen (
    ID_Jumboposition INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDJumbo INT,
    IDAbrechnungsposition INT,    
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDJumbo) REFERENCES tblJumbos(ID_Jumbo),
    FOREIGN KEY(IDAbrechnungsposition) REFERENCES tblAbrechnungspositionen(ID_Abrechnungsposition)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAuftraege
--
-- Auftrag Art:
--     Auftrag
--     KV
--     Gutsc
--
-- Leistungsart: 
--     Regelleistung
--     Gleichartige Leistung
--     Andersartige Leistung
--
-- Status:
--     erfasst
--     in Bearbeitung
--     fertiggestellt
--     geliefert
--     storniert
--
-- Auftrag Herkunft:
--     Zahnarztpraxis
--     Fremdlabor
--     Patient
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAuftraege (
    ID_Auftrag INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDKunde INT NOT NULL,
    IDUnternehmen INT NOT NULL,
    IDMitarbeiter INT NOT NULL,
    Auftragsnummer VARCHAR(255) UNIQUE NOT NULL,
    Auftragsart VARCHAR(70) NOT NULL,
    Auftragsbezeichnung VARCHAR(255) NOT NULL,
    Auftragsstatus VARCHAR(70) NOT NULL,
    Leistungsart VARCHAR(70),    
    AuftragHerkunft VARCHAR(70),
    PatientNameNummer VARCHAR(255),
    XMLNummer VARCHAR(255),      
    Zahnfarbe VARCHAR(70), 
    DatumErfasstAm Date,  
    DatumAbdrucknahme Date, 
    ZeitAbdrucknahme Time,  
    DatumLieferung Date,
    ZeitLieferung Time,
    DatumAnprobe1 Date,    
    DatumAnprobe2 Date,
    DatumAnprobe3 Date,
    DatumAnprobe4 Date,
    DatumAnprobe5 Date,    
    Anprobe1InfoText VARCHAR(255),
    Anprobe2InfoText VARCHAR(255),
    Anprobe3InfoText VARCHAR(255),
    Anprobe4InfoText VARCHAR(255),
    Anprobe5InfoText VARCHAR(255),
    ZeitAnprobe1 Time,    
    ZeitAnprobe2 Time,  
    ZeitAnprobe3 Time,  
    ZeitAnprobe4 Time,  
    ZeitAnprobe5 Time,   
    DatumFunktionsLoeffel Date,
    ZeitFunktionsLoeffel Time,
    DatumBissnahme1 Date,
    ZeitBissnahme1 Time,
    DatumBissnahme2 Date,
    ZeitBissnahme2 Time, 
    Zahn11 TINYINT,  
    Zahn12 TINYINT,
    Zahn13 TINYINT,
    Zahn14 TINYINT,
    Zahn15 TINYINT,
    Zahn16 TINYINT,
    Zahn17 TINYINT,
    Zahn18 TINYINT,
    Zahn21 TINYINT,  
    Zahn22 TINYINT,
    Zahn23 TINYINT,
    Zahn24 TINYINT,
    Zahn25 TINYINT,
    Zahn26 TINYINT,
    Zahn27 TINYINT,
    Zahn28 TINYINT,
    Zahn31 TINYINT,  
    Zahn32 TINYINT,
    Zahn33 TINYINT,
    Zahn34 TINYINT,
    Zahn35 TINYINT,
    Zahn36 TINYINT,
    Zahn37 TINYINT,
    Zahn38 TINYINT,
    Zahn41 TINYINT,  
    Zahn42 TINYINT,
    Zahn43 TINYINT,
    Zahn44 TINYINT,
    Zahn45 TINYINT,
    Zahn46 TINYINT,
    Zahn47 TINYINT,
    Zahn48 TINYINT,
    Bild1 VARCHAR(255),
    Bild2 VARCHAR(255),
    Bild3 VARCHAR(255),
    Bild4 VARCHAR(255), 
    Bild5 VARCHAR(255),   
    Bild6 VARCHAR(255),
    Bild7 VARCHAR(255),
    Bild8 VARCHAR(255),
    Bild9 VARCHAR(255), 
    Bild10 VARCHAR(255),        
    Bemerkung TEXT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDKunde) REFERENCES tblKunden(ID_Kunde),
    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen),      
    FOREIGN KEY(IDMitarbeiter) REFERENCES tblBenutzer(ID_Benutzer)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAuftragNotizen
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAuftragNotizen (
    ID_AuftragNotiz INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAuftrag INT NOT NULL, 
    NameNotizErsteller VARCHAR(255),      
    Notiz VARCHAR(255), 
    DatumNotizErstellung Date,          
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDAuftrag) REFERENCES tblAuftraege(ID_Auftrag)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAuftragspositionen
--
-- PreisNeu: Wenn der Preis einer Abrechnungsposition für einen bestimmten Auftrag geändert wird.
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAuftragspositionen (
    ID_Auftragsposition INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAuftrag INT,
    IDAbrechnungsposition INT,
    PreisNeu DECIMAL(13,2),
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDAuftrag) REFERENCES tblAuftraege(ID_Auftrag),
    FOREIGN KEY(IDAbrechnungsposition) REFERENCES tblAbrechnungspositionen(ID_Abrechnungsposition)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblAuftragMaterialInfos
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblAuftragMaterialInfos (
    ID_AuftragNotiz INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAuftrag INTEGER NOT NULL,
    IDMaterialInfo INTEGER NOT NULL,
    NameNotizErsteller VARCHAR(255),      
    Notiz VARCHAR(255), 
    DatumNotizErstellung Date,          
    ErstelltDatum DATETIME DEFAULT CURRENT_TIMESTAMP,
    AenderungDatum DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDAuftrag) REFERENCES tblAuftraege(ID_Auftrag),
    FOREIGN KEY(IDMaterialInfo) REFERENCES tblMaterialInfos(ID_Materialinfo)
    
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblRechnungen
--
-- Rechnungsstatus 0 = offen
--                 1 = bezahlt
--
-- Rechnungstyp 0 = Rechnung
--              1 = KV
--              2 = Gutschrift
--              3 = 1.Mahnung
--              4 = 2.Mahnung
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblRechnungen (
    ID_Rechnung INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDAuftrag INT,
    Rechnungsnummer VARCHAR(100),
    Rechnungsstatus INT,
    Rechnungstyp VARCHAR(20),     
    Patientennummer VARCHAR(255),
    BetragNetto DECIMAL(10,2),
    BetragBrutto DECIMAL(10,2),
    BetragMehrwertsteuer DECIMAL(10,2),  
    DateinameXML VARCHAR(255),
    DateinameRechnung VARCHAR(255),
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDAuftrag) REFERENCES tblAuftraege(ID_Auftrag)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table - tblMonatsaufstellungen
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblMonatsaufstellungen (
    ID_Monatsaufstellung INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDUnternehmen INT,
    BetragNetto DECIMAL(10,2),
    BetragBrutto DECIMAL(10,2),
    BetragMehrwertsteuer DECIMAL(10,2),
    Dateiname VARCHAR(255),
    Jahr INT,
    Monat INT,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    UPDATEDAT TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- 3. Insert generic data for all
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------------------------------
-- Table "tblAusgaben"
--
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblBestellungen (
    ID_Bestellung INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDUnternehmen INT,
    Bezeichnung VARCHAR(255) NOT NULL,
    Brutto DECIMAL(10,2),
    Netto DECIMAL(10,2),
    Mehrwertsteuer DECIMAL(10,2),
    Bemerkung VARCHAR(255),
    ErfasstDatum DATE,
    CREATEDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATEDAT TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(IDUnternehmen) REFERENCES tblUnternehmen(ID_Unternehmen)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- 3. Insert generic data for all
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------
-- Table "tblAbrechnungslisten"
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO tblAbrechnungslisten (NameListe,Bemerkung) VALUES ('BEL','Für gesetzliche Versicherung');
INSERT INTO tblAbrechnungslisten (NameListe,Bemerkung) VALUES ('BEB','Für private Versicherung');
INSERT INTO tblAbrechnungslisten (NameListe,Bemerkung) VALUES ('BEB97','Für private Versicherung');
INSERT INTO tblAbrechnungslisten (NameListe,Bemerkung) VALUES ('MAT','Für Material');
INSERT INTO tblAbrechnungslisten (NameListe,Bemerkung) VALUES ('EDM','Für Edelmetalle');

-- ---------------------------------------------------------------------------------------------------------------------
-- Table "tblAbrechnungspositionen"
-- ---------------------------------------------------------------------------------------------------------------------
