-- MySQL dump 10.13  Distrib 5.7.39, for osx11.0 (x86_64)
--
-- Host: 127.0.0.1    Database: farmacia
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appartenenza`
--

DROP TABLE IF EXISTS `appartenenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenenza` (
  `categoria` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `prodotto` int NOT NULL,
  PRIMARY KEY (`categoria`,`prodotto`),
  KEY `prodotto` (`prodotto`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `appartenenza_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appartenenza_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nome_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza`
--

LOCK TABLES `appartenenza` WRITE;
/*!40000 ALTER TABLE `appartenenza` DISABLE KEYS */;
INSERT INTO `appartenenza` VALUES ('Medicinale',4),('Benessere e Igiene',5),('Cosmesi',5),('Benessere e Igiene',6),('Medicinale',7),('Medicinale',8),('Medicinale',9),('Medicinale',10),('Medicinale',11),('Medicinale',12),('Medicinale',13),('Integratori e Dietetici',14),('Benessere e Igiene',15),('Medicazione e Sanitaria',15),('Medicinale',16),('Cosmesi',17),('Medicinale',18),('Medicinale',19),('Medicinale',20),('Medicinale',21),('Medicinale',22),('Medicinale',23);
/*!40000 ALTER TABLE `appartenenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistenza_sanitaria`
--

DROP TABLE IF EXISTS `assistenza_sanitaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assistenza_sanitaria` (
  `tipologia` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `prezzo` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`tipologia`),
  CONSTRAINT `check_name` CHECK ((`prezzo` >= 0)),
  CONSTRAINT `ck_tipologia` CHECK ((`tipologia` in (_utf8mb4'misurazione della pressione sanguigna',_utf8mb4'misurazione ossigenazione nel sangue',_utf8mb4'test di glicemia',_utf8mb4'consulenza uso di dispositivi per aerosolterapia',_utf8mb4'misurazione del colesterolo',_utf8mb4'screening anemia',_utf8mb4'test rapido Covid-19',_utf8mb4'servizio di vaccinazione',_utf8mb4'analisi del ritmo cardiaco',_utf8mb4'servizio di consulenza sul controllo del peso')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistenza_sanitaria`
--

LOCK TABLES `assistenza_sanitaria` WRITE;
/*!40000 ALTER TABLE `assistenza_sanitaria` DISABLE KEYS */;
INSERT INTO `assistenza_sanitaria` VALUES ('analisi del ritmo cardiaco',40.00),('consulenza uso di dispositivi per aerosolterapia',15.00),('misurazione del colesterolo',5.00),('misurazione della pressione sanguigna',0.00),('misurazione ossigenazione nel sangue',0.00),('screening anemia',20.00),('servizio di consulenza sul controllo del peso',50.00),('servizio di vaccinazione',0.00),('test di glicemia',5.00),('test rapido Covid-19',6.00);
/*!40000 ALTER TABLE `assistenza_sanitaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busta_paga`
--

DROP TABLE IF EXISTS `busta_paga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busta_paga` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `importo_mensile` decimal(6,2) NOT NULL,
  `dipendente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `chiave_busta_paga` (`dipendente`,`data`),
  KEY `dipendente` (`dipendente`),
  CONSTRAINT `busta_paga_1` FOREIGN KEY (`dipendente`) REFERENCES `dipendente` (`codice_fiscale`) ON UPDATE CASCADE,
  CONSTRAINT `ck_data_pagamento` CHECK ((`data_pagamento` >= `data`)),
  CONSTRAINT `ck_data_primo_del_mese` CHECK ((dayofmonth(`data`) = 1)),
  CONSTRAINT `ck_importo` CHECK ((`importo_mensile` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busta_paga`
--

LOCK TABLES `busta_paga` WRITE;
/*!40000 ALTER TABLE `busta_paga` DISABLE KEYS */;
INSERT INTO `busta_paga` VALUES (23,1750.42,'ANCLMO76A01A271J','2024-01-03','2024-01-01'),(24,1800.00,'BLTFNC96A01G273J','2024-01-02','2024-01-01'),(25,1900.00,'CTNMRC85M04C615X','2024-01-01','2024-01-01'),(26,2500.68,'FBLGIO82A01B605Z','2024-01-01','2024-01-01'),(27,1700.00,'MRNLSA79A48A271K','2024-01-01','2024-01-01'),(28,1800.89,'PRSGDA88E05Z602S','2024-01-04','2024-01-01'),(29,2500.00,'PZZMNO01E42A271P','2024-01-01','2024-01-01'),(30,2500.50,'RSSMRA93E08H501X','2024-01-01','2024-01-01'),(31,1680.00,'SNTLDA90M01D612K','2024-01-02','2024-01-01'),(32,1800.35,'VRNGLI98M41L736C','2024-01-01','2024-01-01');
/*!40000 ALTER TABLE `busta_paga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carta_fedeltà`
--

DROP TABLE IF EXISTS `carta_fedeltà`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carta_fedeltà` (
  `codice_carta` int NOT NULL AUTO_INCREMENT,
  `punti` int NOT NULL DEFAULT '0',
  `cliente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codice_carta`),
  UNIQUE KEY `chiave_cliente` (`cliente`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `carta_fedeltà` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codice_fiscale`) ON UPDATE CASCADE,
  CONSTRAINT `ck_punti_carta` CHECK ((`punti` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta_fedeltà`
--

LOCK TABLES `carta_fedeltà` WRITE;
/*!40000 ALTER TABLE `carta_fedeltà` DISABLE KEYS */;
INSERT INTO `carta_fedeltà` VALUES (2,120,'RSSMRA60A01A271J'),(3,200,'VRDGNL61B02A271K'),(4,50,'BNCMRC62C03A271L'),(5,150,'FRRGIA63D04A271M'),(6,80,'MRCLDA64E05A271N'),(7,0,'SSTLRA65F06A271O'),(8,20,'BLTSTE66G07A271P'),(9,300,'GRNFNC67H08A271Q'),(10,250,'PZZLIA68I09A271R'),(11,100,'RSSMRA69L10A271S');
/*!40000 ALTER TABLE `carta_fedeltà` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `nome_categoria` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `descrizione` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`nome_categoria`),
  CONSTRAINT `check_nome_categoria` CHECK ((`nome_categoria` in (_utf8mb4'Medicinale',_utf8mb4'Integratori e Dietetici',_utf8mb4'Cosmesi',_utf8mb4'Benessere e Igiene',_utf8mb4'Medicazione e Sanitaria',_utf8mb4'Mamma e Bambino',_utf8mb4'Omeopatia',_utf8mb4'Veterinaria')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Benessere e Igiene','Prodotti per igiene personale e il benessere quotidiano.'),('Cosmesi','Prodotti per la cura della pelle e la bellezza.'),('Integratori e Dietetici','Prodotti per integrare la dieta quotidiana e supportare uno stile di vita sano.'),('Mamma e Bambino','Prodotti dedicati alla cura della mamma e del bambino.'),('Medicazione e Sanitaria','Prodotti per il primo soccorso e la medicazione.'),('Medicinale','Prodotti farmaceutici per la cura di malattie e disturbi.'),('Omeopatia','Prodotti omeopatici per vari trattamenti.'),('Veterinaria','Prodotti per la cura e il benessere degli animali.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codice_fiscale` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CAP` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `citta` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `via` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_civico` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('BLTSTE66G07A271P','Stefano Alberti','stefano.alberti@yahoo.it','071 4567890','60128','Ancona','Via Buozzi','42'),('BLTSTE75R16A271Y','Elena Alberti','elena.alberti@outlook.it',NULL,'60100','Ancona','Via Fornari','29'),('BNCMRC62C03A271L','Marco Bianchi','marco.bianchi@yahoo.it','071 2345678','60123','Ancona','Via della Logistica','8'),('BNCMRC71N12A271U','Carla Bianchi','carla.bianchi@outlook.it',NULL,'60131','Ancona','Via Martiri','3'),('FRRGIA63D04A271M','Giada Ferrari','giada.ferrari@outlook.it',NULL,'60125','Ancona','Via Conca','15'),('FRRGIA72O13A271V','Giorgio Ferrari','giorgio.ferrari@gmail.com','071 7890123','60132','Ancona','Via della Resistenza','21'),('GRNFNC67H08A271Q','Francesco Grani','francesco.grani@outlook.it',NULL,'60129','Ancona','Via della Vittoria','56'),('GRNFNC76S17A271Z','Nicola Grani','nicola.grani@gmail.com','071 9012345','60121','Ancona','Via Mazzini','31'),('MRCLDA64E05A271N','Claudio Mancini','claudio.mancini@gmail.com','071 3456789','60126','Ancona','Via Thaon de Revel','22'),('MRCLDA73P14A271W','Daniela Mancini','daniela.mancini@libero.it',NULL,'62019','Recanati','Via Leopardi','12'),('PZZLIA68I09A271R','Lia Pizzo','lia.pizzo@gmail.com','071 5678901','60130','Ancona','Via Piave','64'),('PZZLIA77T18A272A','Alice Pizzo','alice.pizzo@libero.it',NULL,'60122','Ancona','Via Dante','2'),('RSSMRA60A01A271J','Maria Rossi','maria.rossi@gmail.com','071 1234567','60121','Ancona','Via Garibaldi','5'),('RSSMRA69L10A271S','Marta Rossi','marta.rossi@libero.it',NULL,'60020','Senigallia','Via Roma','72'),('RSSMRA78U19A272B','Sergio Rossi','sergio.rossi@yahoo.it','071 0123456','60123','Ancona','Via delle Grazie','11'),('SSTLRA65F06A271O','Lara Sisti','lara.sisti@libero.it',NULL,'60127','Ancona','Via Marconi','33'),('SSTLRA74Q15A271X','Roberto Sisti','roberto.sisti@yahoo.it','071 8901234','60035','Jesi','Via Verdi','6'),('VRDGNL61B02A271K','Gianluca Verdi','gianluca.verdi@libero.it',NULL,'60122','Ancona','Corso Amendola','12'),('VRDGNL70M11A271T','Luca Verdi','luca.verdi@yahoo.it','071 6789012','60019','Senigallia','Corso Garibaldi','80'),('VRDGNL79V20A272C','Valeria Verdi','valeria.verdi@outlook.it',NULL,'61100','Pesaro','Via Rossini','14');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contr_acquisto`
--

DROP TABLE IF EXISTS `contr_acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contr_acquisto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `fornitore` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `data_stipula` date NOT NULL DEFAULT (curdate()),
  `scadenza` date DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `fornitore` (`fornitore`),
  CONSTRAINT `contr_acquisto_1` FOREIGN KEY (`fornitore`) REFERENCES `fornitore` (`partita_iva`) ON UPDATE CASCADE,
  CONSTRAINT `ck_data_acquisto` CHECK ((`data_stipula` < `scadenza`))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contr_acquisto`
--

LOCK TABLES `contr_acquisto` WRITE;
/*!40000 ALTER TABLE `contr_acquisto` DISABLE KEYS */;
INSERT INTO `contr_acquisto` VALUES (2,'01234567890','2022-01-04','2024-12-31'),(3,'01234567890','2024-12-31','2026-12-31'),(4,'12345678901','2023-02-01','2024-12-15'),(5,'23456789012','2022-02-03','2024-11-30'),(6,'34567890123','2023-09-13','2024-10-31'),(7,'45678901234','2024-01-03','2024-09-30'),(8,'56789012345','2022-08-17','2024-08-31'),(9,'67890123456','2024-02-01','2024-07-31'),(10,'78901234567','2024-01-06','2024-06-30'),(11,'89012345678','2023-05-17','2024-05-31'),(12,'90123456789','2022-04-07','2024-04-30');
/*!40000 ALTER TABLE `contr_acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contr_assistenza`
--

DROP TABLE IF EXISTS `contr_assistenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contr_assistenza` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `data_stipula` date NOT NULL DEFAULT (curdate()),
  `cliente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `ordine_vendita` int NOT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `unique_ordine_vendita` (`ordine_vendita`),
  KEY `contr_assistenza_2` (`ordine_vendita`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `contr_assistenza_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codice_fiscale`) ON UPDATE CASCADE,
  CONSTRAINT `contr_assistenza_2` FOREIGN KEY (`ordine_vendita`) REFERENCES `ordine_vend` (`numero_ordine`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contr_assistenza`
--

LOCK TABLES `contr_assistenza` WRITE;
/*!40000 ALTER TABLE `contr_assistenza` DISABLE KEYS */;
INSERT INTO `contr_assistenza` VALUES (13,'2024-01-10','BLTSTE66G07A271P',12),(14,'2024-02-01','FRRGIA63D04A271M',7),(15,'2024-02-07','PZZLIA68I09A271R',19);
/*!40000 ALTER TABLE `contr_assistenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contr_trasporto`
--

DROP TABLE IF EXISTS `contr_trasporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contr_trasporto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `data_stipula` date NOT NULL DEFAULT (curdate()),
  `scadenza` date DEFAULT NULL,
  `corriere` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `corriere` (`corriere`),
  CONSTRAINT `contr_trasporto_1` FOREIGN KEY (`corriere`) REFERENCES `corriere` (`partita_iva`) ON UPDATE CASCADE,
  CONSTRAINT `ck_data_trasporto` CHECK ((`data_stipula` < `scadenza`))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contr_trasporto`
--

LOCK TABLES `contr_trasporto` WRITE;
/*!40000 ALTER TABLE `contr_trasporto` DISABLE KEYS */;
INSERT INTO `contr_trasporto` VALUES (1,'2024-01-01','2024-12-31','02456789012'),(2,'2024-02-01','2025-02-14','13567890123'),(3,'2024-01-01','2024-08-31','24678901234'),(4,'2023-04-01','2024-09-30','80234567890'),(5,'2023-05-01','2024-10-31','91345678901'),(6,'2025-01-01','2025-12-31','02456789012');
/*!40000 ALTER TABLE `contr_trasporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contr_vend`
--

DROP TABLE IF EXISTS `contr_vend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contr_vend` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `data_stipula` date NOT NULL DEFAULT (curdate()),
  `cliente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `ordine_vendita` int NOT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `unique_ordine_vendita` (`ordine_vendita`),
  KEY `contr_vend_2` (`ordine_vendita`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `contr_vend_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codice_fiscale`) ON UPDATE CASCADE,
  CONSTRAINT `contr_vend_2` FOREIGN KEY (`ordine_vendita`) REFERENCES `ordine_vend` (`numero_ordine`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contr_vend`
--

LOCK TABLES `contr_vend` WRITE;
/*!40000 ALTER TABLE `contr_vend` DISABLE KEYS */;
INSERT INTO `contr_vend` VALUES (5,'2024-01-10','BLTSTE66G07A271P',4),(6,'2024-01-15','BNCMRC62C03A271L',5),(7,'2024-02-01','FRRGIA63D04A271M',7),(8,'2024-02-10','GRNFNC67H08A271Q',8),(10,'2024-02-05','GRNFNC67H08A271Q',9),(11,'2024-02-05','SSTLRA65F06A271O',12),(12,'2024-02-06','VRDGNL70M11A271T',15),(13,'2024-02-06','FRRGIA72O13A271V',16),(14,'2024-02-06','MRCLDA73P14A271W',17),(15,'2024-02-07','GRNFNC76S17A271Z',18),(16,'2024-02-06','BLTSTE66G07A271P',19),(18,'2024-02-08','BLTSTE66G07A271P',20);
/*!40000 ALTER TABLE `contr_vend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corriere`
--

DROP TABLE IF EXISTS `corriere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corriere` (
  `partita_iva` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CAP` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `citta` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `via` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_civico` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`partita_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corriere`
--

LOCK TABLES `corriere` WRITE;
/*!40000 ALTER TABLE `corriere` DISABLE KEYS */;
INSERT INTO `corriere` VALUES ('02456789012','SafeTransport','contatti@safetransport.it','071 2345600','60128','Ancona','Via della Sicurezza','21'),('13567890123','GreenWay Couriers','info@greenwaycouriers.it',NULL,'60125','Ancona','Via dell’Ecologia','8'),('24678901234','QuickMove','servizio@quickmove.it','071 8765400','60122','Ancona','Via Rapida','16'),('80234567890','RapidDelivery','info@rapiddelivery.it','071 9876500','60131','Ancona','Via della Logistica','4'),('91345678901','ExpressLogistics','supporto@expresslogistics.it',NULL,'60100','Ancona','Via del Corriere','12');
/*!40000 ALTER TABLE `corriere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo_fisso`
--

DROP TABLE IF EXISTS `costo_fisso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costo_fisso` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `importo` decimal(6,2) NOT NULL,
  `scadenza` date NOT NULL,
  `descrizione` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`codice`),
  CONSTRAINT `ck_data` CHECK ((`data_pagamento` <= `scadenza`)),
  CONSTRAINT `ck_importo_1` CHECK ((`importo` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_fisso`
--

LOCK TABLES `costo_fisso` WRITE;
/*!40000 ALTER TABLE `costo_fisso` DISABLE KEYS */;
INSERT INTO `costo_fisso` VALUES (1,2000.00,'2024-03-01','Affitto Marzo','2024-03-01'),(2,150.00,'2024-03-10','Bolletta elettrica Marzo','2024-03-05'),(3,100.00,'2024-03-15','Bolletta acqua Marzo','2024-03-10'),(4,250.00,'2024-03-20','Servizi di pulizia Marzo','2024-03-15'),(5,500.00,'2024-04-01','Tasse trimestrali','2024-03-25'),(6,2000.00,'2024-04-01','Affitto Aprile',NULL),(7,150.00,'2024-04-10','Bolletta elettrica Aprile',NULL),(8,100.00,'2024-04-15','Bolletta acqua Aprile',NULL),(9,325.90,'2024-02-13','Manutenzione laboratorio',NULL);
/*!40000 ALTER TABLE `costo_fisso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dipendente` (
  `codice_fiscale` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `CAP` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `citta` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `via` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_civico` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `ruolo` enum('Farmacista','Direttore') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES ('ANCLMO76A01A271J','Lorenzo Ancini','lorenzo.ancini@gmail.com','071 9876543','60121','Ancona','Via Marconi','10','Farmacista'),('BLTFNC96A01G273J','Francesco Belotti','francesco.belotti@icloud.com','0734 1234567','63023','Fermo','Via Mazzini','15','Farmacista'),('CTNMRC85M04C615X','Marco Cattani','marco.cattani@yahoo.it','071 2345678','60128','Ancona','Via Thaon de Revel','30','Farmacista'),('FBLGIO82A01B605Z','Giorgia Fabi','giorgia.fabi@outlook.com','0732 7654321','60020','Senigallia','Via Cellini','1B','Direttore'),('MRNLSA79A48A271K','Alessia Marino','alessia.marino@libero.it','071 1234567','60125','Ancona','Corso Stamira','25','Farmacista'),('PRSGDA88E05Z602S','Giada Persi','giada.persi@gmail.com','0733 9876543','62100','Macerata','Corso Cavour','50','Farmacista'),('PZZMNO01E42A271P','Monia Pizzi','monia.pizzi@gmail.com','071 9123456','60126','Ancona','Via Buozzi','5','Direttore'),('RSSMRA93E08H501X','Mara Rossi','mara.rossi@tiscali.it','071 8765432','60131','Ancona','Via Flaminia','78','Direttore'),('SNTLDA90M01D612K','Ludovica Santi','ludovica.santi@hotmail.it','071 3456789','60122','Ancona','Via Mattei','12','Farmacista'),('VRNGLI98M41L736C','Gilia Veroni','gilia.veroni@libero.it','071 5678123','60129','Ancona','Via Garibaldi','42','Farmacista');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elenc_acq`
--

DROP TABLE IF EXISTS `elenc_acq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elenc_acq` (
  `ordine_acquisto` int NOT NULL,
  `prodotto` int NOT NULL,
  `quantità` decimal(3,0) NOT NULL,
  `prezzo_acquisto` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ordine_acquisto`,`prodotto`) USING BTREE,
  KEY `elenc_acq_2` (`prodotto`),
  CONSTRAINT `elenc_acq_1` FOREIGN KEY (`ordine_acquisto`) REFERENCES `ordine_acq` (`numero_ordine`),
  CONSTRAINT `elenc_acq_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codice`),
  CONSTRAINT `ck_prezzo` CHECK ((`prezzo_acquisto` > 0)),
  CONSTRAINT `ck_quantità_acquisto` CHECK ((`quantità` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenc_acq`
--

LOCK TABLES `elenc_acq` WRITE;
/*!40000 ALTER TABLE `elenc_acq` DISABLE KEYS */;
INSERT INTO `elenc_acq` VALUES (2,4,99,5.00),(2,5,50,6.00),(2,6,150,3.00),(3,7,100,7.00),(3,8,75,6.00),(3,9,80,8.00),(6,10,60,7.00),(6,11,90,5.00),(6,12,40,10.00);
/*!40000 ALTER TABLE `elenc_acq` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoInserimentoElencAcq */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoInserimentoElencAcq` AFTER INSERT ON `elenc_acq` FOR EACH ROW BEGIN
    CALL CalcolaAggiornaImportoTotaleAcquisto(NEW.ordine_acquisto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiungiDisponibiliàDopoAcquisto */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiungiDisponibiliàDopoAcquisto` AFTER INSERT ON `elenc_acq` FOR EACH ROW BEGIN
    -- Aggiorna la disponibilità del prodotto aumentandola della quantità acquistata
    UPDATE prodotto
    SET disponibilità = disponibilità + NEW.quantità
    WHERE codice = NEW.prodotto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoAggiornamentoElencAcq */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoAggiornamentoElencAcq` AFTER UPDATE ON `elenc_acq` FOR EACH ROW BEGIN
    CALL CalcolaAggiornaImportoTotaleAcquisto(NEW.ordine_acquisto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaDisponibiliàDopoAcquisto */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaDisponibiliàDopoAcquisto` AFTER UPDATE ON `elenc_acq` FOR EACH ROW BEGIN
    -- Aggiorna la disponibilità del prodotto aumentandola della quantità acquistata
    UPDATE prodotto
    SET disponibilità = disponibilità + NEW.quantità
    WHERE codice = NEW.prodotto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `elenc_ass`
--

DROP TABLE IF EXISTS `elenc_ass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elenc_ass` (
  `assistenza_sanitaria` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `ordine_vendita` int NOT NULL,
  `quantita` decimal(2,0) NOT NULL,
  PRIMARY KEY (`assistenza_sanitaria`,`ordine_vendita`),
  KEY `elenc_ass_1` (`ordine_vendita`),
  KEY `tipologia` (`assistenza_sanitaria`),
  CONSTRAINT `elenc_ass_1` FOREIGN KEY (`ordine_vendita`) REFERENCES `ordine` (`numero_ordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elenc_ass_2` FOREIGN KEY (`assistenza_sanitaria`) REFERENCES `assistenza_sanitaria` (`tipologia`) ON UPDATE CASCADE,
  CONSTRAINT `ck_quantita_assistenza` CHECK ((`quantita` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenc_ass`
--

LOCK TABLES `elenc_ass` WRITE;
/*!40000 ALTER TABLE `elenc_ass` DISABLE KEYS */;
INSERT INTO `elenc_ass` VALUES ('test di glicemia',7,1),('test rapido Covid-19',12,1),('test rapido Covid-19',19,2);
/*!40000 ALTER TABLE `elenc_ass` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoInserimentoInElencAss */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoInserimentoInElencAss` AFTER INSERT ON `elenc_ass` FOR EACH ROW BEGIN
    CALL CalcolaEAggiornaImportoTotale(NEW.ordine_vendita);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoModificaInElencAss */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoModificaInElencAss` AFTER UPDATE ON `elenc_ass` FOR EACH ROW BEGIN
    CALL AggiornaImportoTotaleOrdine(NEW.ordine_vendita);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `elenc_vend`
--

DROP TABLE IF EXISTS `elenc_vend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elenc_vend` (
  `ordine_vendita` int NOT NULL,
  `prodotto` int NOT NULL,
  `quantita` decimal(2,0) NOT NULL,
  `sconto` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ordine_vendita`,`prodotto`) USING BTREE,
  KEY `elenc_vend_2` (`prodotto`),
  CONSTRAINT `elenc_vend_1` FOREIGN KEY (`ordine_vendita`) REFERENCES `ordine_vend` (`numero_ordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elenc_vend_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codice`) ON UPDATE CASCADE,
  CONSTRAINT `ck_quantita_vendita` CHECK ((`quantita` > 0)),
  CONSTRAINT `ck_sconto` CHECK ((`sconto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenc_vend`
--

LOCK TABLES `elenc_vend` WRITE;
/*!40000 ALTER TABLE `elenc_vend` DISABLE KEYS */;
INSERT INTO `elenc_vend` VALUES (4,10,4,0.00),(5,11,1,0.00),(5,14,3,0.00),(7,19,2,10.00),(7,22,1,0.00),(8,4,2,0.00),(8,13,2,7.50),(9,7,1,5.00),(12,7,3,0.00),(15,8,1,0.00),(16,20,1,0.00),(16,22,1,0.00),(17,9,2,0.00),(17,12,1,0.00),(18,13,2,0.00),(18,17,4,0.00),(18,19,1,0.00),(19,20,1,0.00),(19,22,1,0.00),(20,22,3,0.00);
/*!40000 ALTER TABLE `elenc_vend` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS ControllaDisponibilitaPrimaDellaVendita */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ControllaDisponibilitaPrimaDellaVendita` BEFORE INSERT ON `elenc_vend` FOR EACH ROW BEGIN
    DECLARE disponibilitaAttuale INT;

    -- Ottiene la disponibilità attuale del prodotto
    SELECT disponibilità INTO disponibilitaAttuale
    FROM prodotto
    WHERE codice = NEW.prodotto;

    -- Verifica se la quantità venduta supera la disponibilità
    IF NEW.quantita > disponibilitaAttuale THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La quantità venduta supera la disponibilità del prodotto.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoInserimentoInElencVend */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoInserimentoInElencVend` AFTER INSERT ON `elenc_vend` FOR EACH ROW BEGIN
    CALL CalcolaEAggiornaImportoTotale(NEW.ordine_vendita);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS RiduciDisponibilitaDopoVendita */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RiduciDisponibilitaDopoVendita` AFTER INSERT ON `elenc_vend` FOR EACH ROW BEGIN
    -- Aggiorna la disponibilità del prodotto riducendola della quantità venduta
    UPDATE prodotto
    SET disponibilità = disponibilità - NEW.quantita
    WHERE codice = NEW.prodotto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaDisponibilitaDopoVendita */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaDisponibilitaDopoVendita` AFTER UPDATE ON `elenc_vend` FOR EACH ROW BEGIN
    -- Aggiorna la disponibilità del prodotto riducendola della quantità venduta
    UPDATE prodotto
    SET disponibilità = disponibilità - NEW.quantita
    WHERE codice = NEW.prodotto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AggiornaImportoDopoModificaInElencVend */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AggiornaImportoDopoModificaInElencVend` AFTER UPDATE ON `elenc_vend` FOR EACH ROW BEGIN
    CALL CalcolaEAggiornaImportoTotale(NEW.ordine_vendita);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornitore` (
  `partita_iva` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CAP` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `citta` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `via` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_civico` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`partita_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES ('01234567890','Laboratori VitaVerde','info@vitaverde.it','071 2345678','60131','Ancona','Via delle Brecce','12'),('12345678901','Distribuzioni Salus','contatti@salusdistribuzioni.it',NULL,'62019','Recanati','Via Leopardi','5'),('23456789012','BioEssenze Adriatiche','info@bioessenzeadriatiche.it',NULL,'61121','Pesaro','Viale Trieste','23'),('34567890123','Erbe & Benessere','supporto@erbebenessere.it','071 9876543','60125','Ancona','Via Thaon de Revel','45'),('45678901234','Bellezza Naturale Cosmetici','servizio@bellezzanaturale.com','0733 1234567','62010','Macerata','Corso Cavour','88'),('56789012345','Marche Sanità Prodotti','info@marchesanitaprodotti.it',NULL,'60100','Ancona','Via Marconi','30A'),('67890123456','NutriVita Integratori','contatti@nutrivitaintegratori.it','0732 2345678','60035','Jesi','Via Roma','16'),('78901234567','VivaSalute Integratori','supporto@vivasalute.it',NULL,'60127','Ancona','Via Flaminia','92'),('89012345678','GreenLife Sanità','info@greenlifesanita.it','071 8765432','60128','Ancona','Via Mattei','54'),('90123456789','TecnoMed Solutions','servizio@tecnomedsolutions.it',NULL,'60122','Ancona','Corso Amendola','101');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitura`
--

DROP TABLE IF EXISTS `fornitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornitura` (
  `fornitore` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `nome_categoria` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`fornitore`,`nome_categoria`),
  KEY `fornitore` (`fornitore`),
  KEY `categoria` (`nome_categoria`),
  CONSTRAINT `fornitura_1` FOREIGN KEY (`nome_categoria`) REFERENCES `categoria` (`nome_categoria`) ON UPDATE CASCADE,
  CONSTRAINT `fornitura_2` FOREIGN KEY (`fornitore`) REFERENCES `fornitore` (`partita_iva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitura`
--

LOCK TABLES `fornitura` WRITE;
/*!40000 ALTER TABLE `fornitura` DISABLE KEYS */;
INSERT INTO `fornitura` VALUES ('01234567890','Cosmesi'),('01234567890','Medicinale'),('12345678901','Integratori e Dietetici'),('12345678901','Medicazione e Sanitaria'),('23456789012','Benessere e Igiene'),('23456789012','Medicinale'),('34567890123','Cosmesi'),('34567890123','Omeopatia'),('45678901234','Benessere e Igiene'),('45678901234','Cosmesi'),('56789012345','Mamma e Bambino'),('56789012345','Veterinaria'),('67890123456','Integratori e Dietetici'),('67890123456','Medicazione e Sanitaria'),('78901234567','Cosmesi'),('78901234567','Integratori e Dietetici'),('89012345678','Benessere e Igiene'),('89012345678','Medicinale'),('90123456789','Medicinale'),('90123456789','Omeopatia');
/*!40000 ALTER TABLE `fornitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orario_lavorativo`
--

DROP TABLE IF EXISTS `orario_lavorativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orario_lavorativo` (
  `data` date NOT NULL,
  `ora_inizio` time NOT NULL,
  `ora_fine` time NOT NULL,
  `dipendente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`dipendente`,`data`,`ora_inizio`,`ora_fine`) USING BTREE,
  KEY `dipendente` (`dipendente`),
  CONSTRAINT `orario_lavorativo_1` FOREIGN KEY (`dipendente`) REFERENCES `dipendente` (`codice_fiscale`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orario_lavorativo`
--

LOCK TABLES `orario_lavorativo` WRITE;
/*!40000 ALTER TABLE `orario_lavorativo` DISABLE KEYS */;
INSERT INTO `orario_lavorativo` VALUES ('2024-02-05','08:00:00','13:00:00','ANCLMO76A01A271J'),('2024-02-05','14:00:00','19:00:00','BLTFNC96A01G273J'),('2024-02-06','08:00:00','13:00:00','CTNMRC85M04C615X'),('2024-02-06','14:00:00','19:00:00','FBLGIO82A01B605Z'),('2024-02-07','08:00:00','13:00:00','MRNLSA79A48A271K'),('2024-02-07','14:00:00','19:00:00','PRSGDA88E05Z602S'),('2024-02-08','08:00:00','13:00:00','PZZMNO01E42A271P'),('2024-02-08','14:00:00','19:00:00','PZZMNO01E42A271P'),('2024-02-09','08:00:00','13:00:00','RSSMRA93E08H501X'),('2024-02-09','14:00:00','19:00:00','SNTLDA90M01D612K'),('2024-02-10','08:00:00','13:00:00','VRNGLI98M41L736C');
/*!40000 ALTER TABLE `orario_lavorativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordine` (
  `numero_ordine` int NOT NULL AUTO_INCREMENT,
  `data_ordine` date NOT NULL DEFAULT (curdate()),
  `importo_totale` decimal(7,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`numero_ordine`),
  CONSTRAINT `ck_importo_totale` CHECK ((`importo_totale` >= 0)),
  CONSTRAINT `ck_pagamento` CHECK ((`data_pagamento` >= `data_ordine`))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (2,'2024-02-01',1245.00,'2024-02-05'),(3,'2024-02-02',1790.00,'2024-02-07'),(4,'2024-02-03',34.00,'2024-02-03'),(5,'2024-02-04',50.30,'2024-02-04'),(6,'2024-02-05',1270.00,'2024-02-10'),(7,'2024-02-04',101.90,'2024-02-04'),(8,'2024-02-04',23.55,'2024-02-04'),(9,'2024-02-05',8.55,'2024-02-05'),(12,'2024-02-05',33.00,'2024-02-05'),(15,'2024-02-06',7.50,'2024-02-06'),(16,'2024-02-06',125.00,'2024-02-06'),(17,'2024-02-06',32.00,'2024-02-06'),(18,'2024-02-07',66.50,'2024-02-07'),(19,'2024-02-06',137.00,'2024-02-06'),(20,'2024-02-08',207.00,'2024-02-08');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine_acq`
--

DROP TABLE IF EXISTS `ordine_acq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordine_acq` (
  `numero_ordine` int NOT NULL,
  `stato_ordine` enum('In elaborazione','In corso','Consegnato') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'In elaborazione',
  `tempo_spedizione` decimal(2,0) DEFAULT NULL,
  `codice_contratto` int NOT NULL,
  PRIMARY KEY (`numero_ordine`),
  KEY `codice_contratto` (`codice_contratto`),
  KEY `nomero_ordine` (`numero_ordine`),
  CONSTRAINT `ordine_acq` FOREIGN KEY (`numero_ordine`) REFERENCES `ordine` (`numero_ordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordine_acq_1` FOREIGN KEY (`codice_contratto`) REFERENCES `contr_acquisto` (`codice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine_acq`
--

LOCK TABLES `ordine_acq` WRITE;
/*!40000 ALTER TABLE `ordine_acq` DISABLE KEYS */;
INSERT INTO `ordine_acq` VALUES (2,'Consegnato',1,2),(3,'Consegnato',2,9),(6,'In corso',1,7);
/*!40000 ALTER TABLE `ordine_acq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine_vend`
--

DROP TABLE IF EXISTS `ordine_vend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordine_vend` (
  `numero_ordine` int NOT NULL,
  PRIMARY KEY (`numero_ordine`) USING BTREE,
  KEY `numero_ordine` (`numero_ordine`),
  CONSTRAINT `ordine_vend_1` FOREIGN KEY (`numero_ordine`) REFERENCES `ordine` (`numero_ordine`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine_vend`
--

LOCK TABLES `ordine_vend` WRITE;
/*!40000 ALTER TABLE `ordine_vend` DISABLE KEYS */;
INSERT INTO `ordine_vend` VALUES (4),(5),(7),(8),(9),(12),(15),(16),(17),(18),(19),(20);
/*!40000 ALTER TABLE `ordine_vend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `descrizione` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scaffale` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `cassetto` decimal(2,0) NOT NULL,
  `disponibilità` decimal(3,0) NOT NULL,
  `prezzo_vendita` decimal(7,2) NOT NULL,
  `mutuabile` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`codice`),
  CONSTRAINT `ck_disponibilita` CHECK ((`disponibilità` >= 0)),
  CONSTRAINT `ck_prezzo_vendita` CHECK ((`prezzo_vendita` > 0)),
  CONSTRAINT `ck_scaffale_cassetto` CHECK (((`scaffale` in (_utf8mb4'scaf1',_utf8mb4'scaf2',_utf8mb4'scaf3')) and (`cassetto` between 1 and 18)))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (4,'Tachipirina','Paracetamolo 1000mg, febbre e dolore','scaf1',1,197,6.50,1),(5,'Vicks Vaporub','Unguento balsamico per tosse e raffreddore','scaf1',2,50,8.20,0),(6,'Amuchina Gel','Gel igienizzante mani 80ml','scaf1',3,150,4.30,0),(7,'Aspirina','Acido acetilsalicilico 500mg, antidolorifico','scaf2',4,100,9.00,1),(8,'Imodium','Loperamide 2mg, antidiarroico','scaf2',5,75,7.50,0),(9,'Rinazina Spray','Spray nasale decongestionante. Avvertenze e precauzioni d\'uso: non utilizzare il prodotto per un periodo superiore ai 5 giorni.','scaf2',6,80,10.00,0),(10,'Maalox Plus','Anti-acido per disturbi gastrici','scaf3',7,56,8.50,0),(11,'Buscopan','Butilescopolamina bromuro 10mg, antispastico. Avvertenze e precauzioni d’uso: Evitare l\'uso di Buscopan in caso di glaucoma, ipertrofia prostatica, o altre condizioni legate alla ritenzione urinaria.','scaf3',8,90,6.80,1),(12,'Voltaren Emulgel','Diclofenac, gel antinfiammatorio. Avvertenze e precauzioni d’uso:Non applicare Voltaren Emulgel su ferite aperte o pelle danneggiata; evitare l\'esposizione al sole della zona trattata per ridurre il rischio di reazioni cutanee.','scaf3',9,40,12.00,0),(13,'Nurofen Febbre e Dolore','Ibuprofene 200mg, febbre e dolore','scaf1',10,110,5.70,0),(14,'Ferrograd','Ferroso solfato, integratore di ferro','scaf2',9,85,14.50,1),(15,'Cerotti Hansaplast','Cerotti medicati assortiti','scaf3',12,200,7.25,0),(16,'Laevolac','Lattulosio, sciroppo lassativo','scaf1',13,55,10.80,0),(17,'Zovirax Crema','Aciclovir 5%, crema per herpes labiale','scaf2',14,40,9.90,0),(18,'Gaviscon','Algeldrato e magnesio idrossido, reflusso gastroesofageo','scaf3',15,70,11.00,0),(19,'Augmentin','Antibiotico ad ampio spettro. Avvertenze e precauzioni d’uso:Augmentin può alterare la flora intestinale; consultare un medico in caso di diarrea severa, nausea o vomito persistente durante il trattamento.','scaf1',1,30,15.50,1),(20,'Symbicort','Spray per asma cronica','scaf2',17,25,56.00,1),(21,'Coumadin','Anticoagulante per prevenzione trombosi','scaf3',18,50,22.00,1),(22,'Seretide','Diskus per asma e BPCO','scaf1',17,37,69.00,1),(23,'Xanax','Benzodiazepina per ansia. Avvertenze e precauzioni d’uso: Xanax può causare sonnolenza e diminuire il livello di attenzione; evitare attività che richiedono concentrazione, come guidare o manovrare macchinari pesanti, durante l\'assunzione.','scaf2',18,60,25.00,1);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricetta`
--

DROP TABLE IF EXISTS `ricetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ricetta` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `medico` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricetta`
--

LOCK TABLES `ricetta` WRITE;
/*!40000 ALTER TABLE `ricetta` DISABLE KEYS */;
INSERT INTO `ricetta` VALUES (1,'2024-01-10','Dr. Giovanni Bianchi'),(2,'2024-01-15','Dr.ssa Maria Rossi'),(3,'2024-01-20','Dr. Luca Verdi'),(4,'2024-01-25','Dr.ssa Elena Neri'),(5,'2024-02-01','Dr. Marco Gialli'),(6,'2024-02-05','Dr.ssa Anna Viola'),(7,'2024-02-08','Dr. Luca Verdi');
/*!40000 ALTER TABLE `ricetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiesta`
--

DROP TABLE IF EXISTS `richiesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `richiesta` (
  `codice_ricetta` int NOT NULL,
  `codice_prodotto` int NOT NULL,
  `quantità` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`codice_ricetta`,`codice_prodotto`),
  KEY `codice_ricetta` (`codice_ricetta`),
  KEY `codice_prodotto` (`codice_prodotto`),
  CONSTRAINT `richiesta_1` FOREIGN KEY (`codice_prodotto`) REFERENCES `prodotto` (`codice`) ON UPDATE CASCADE,
  CONSTRAINT `richiesta_2` FOREIGN KEY (`codice_ricetta`) REFERENCES `ricetta` (`codice`) ON UPDATE CASCADE,
  CONSTRAINT `ck_quantità` CHECK (((`quantità` > 0) and (`quantità` < 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta`
--

LOCK TABLES `richiesta` WRITE;
/*!40000 ALTER TABLE `richiesta` DISABLE KEYS */;
INSERT INTO `richiesta` VALUES (1,4,1),(1,7,1),(2,7,2),(3,11,1),(4,14,1),(5,4,2),(6,7,1),(7,4,1),(7,14,1);
/*!40000 ALTER TABLE `richiesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_cliente`
--

DROP TABLE IF EXISTS `tel_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_cliente` (
  `cliente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `tel_cliente_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_cliente`
--

LOCK TABLES `tel_cliente` WRITE;
/*!40000 ALTER TABLE `tel_cliente` DISABLE KEYS */;
INSERT INTO `tel_cliente` VALUES ('BLTSTE66G07A271P','071 9876543'),('BLTSTE75R16A271Y','333 4567890'),('BNCMRC62C03A271L','322 3456789'),('BNCMRC62C03A271L','339 2345678'),('BNCMRC71N12A271U','329 0123456'),('FRRGIA63D04A271M','323 4567890'),('FRRGIA63D04A271M','340 3456789'),('FRRGIA72O13A271V','330 1234567'),('GRNFNC67H08A271Q','0721 234567'),('GRNFNC76S17A271Z','334 5678901'),('MRCLDA64E05A271N','071 2345678'),('MRCLDA64E05A271N','324 5678901'),('MRCLDA73P14A271W','331 2345678'),('PZZLIA68I09A271R','326 7890123'),('PZZLIA77T18A272A','335 6789012'),('RSSMRA60A01A271J','320 1234567'),('RSSMRA60A01A271J','338 1234567'),('RSSMRA69L10A271S','327 8901234'),('RSSMRA78U19A272B','336 7890123'),('SSTLRA65F06A271O','325 6789012'),('SSTLRA74Q15A271X','332 3456789'),('VRDGNL61B02A271K','071 1234567'),('VRDGNL61B02A271K','321 2345678'),('VRDGNL70M11A271T','328 9012345'),('VRDGNL79V20A272C','337 8901234');
/*!40000 ALTER TABLE `tel_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_corriere`
--

DROP TABLE IF EXISTS `tel_corriere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_corriere` (
  `corriere` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `corriere` (`corriere`),
  CONSTRAINT `tel_corriere_1` FOREIGN KEY (`corriere`) REFERENCES `corriere` (`partita_iva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_corriere`
--

LOCK TABLES `tel_corriere` WRITE;
/*!40000 ALTER TABLE `tel_corriere` DISABLE KEYS */;
INSERT INTO `tel_corriere` VALUES ('02456789012','071 2345601'),('02456789012','322 3456789'),('13567890123','323 4567890'),('24678901234','324 5678901'),('80234567890','071 9876501'),('80234567890','320 1234567'),('91345678901','321 2345678');
/*!40000 ALTER TABLE `tel_corriere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_dipendente`
--

DROP TABLE IF EXISTS `tel_dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_dipendente` (
  `dipendente` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `dipendente` (`dipendente`),
  CONSTRAINT `tel_dipendente_1` FOREIGN KEY (`dipendente`) REFERENCES `dipendente` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_dipendente`
--

LOCK TABLES `tel_dipendente` WRITE;
/*!40000 ALTER TABLE `tel_dipendente` DISABLE KEYS */;
INSERT INTO `tel_dipendente` VALUES ('ANCLMO76A01A271J','340 1234567'),('BLTFNC96A01G273J','341 2345678'),('CTNMRC85M04C615X','342 3456789'),('FBLGIO82A01B605Z','071 7654321'),('FBLGIO82A01B605Z','343 4567890'),('MRNLSA79A48A271K','344 5678901'),('PRSGDA88E05Z602S','345 6789012'),('PZZMNO01E42A271P','071 9123457'),('PZZMNO01E42A271P','346 7890123'),('RSSMRA93E08H501X','347 8901234'),('SNTLDA90M01D612K','348 9012345'),('VRNGLI98M41L736C','349 0123456');
/*!40000 ALTER TABLE `tel_dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_fornitore`
--

DROP TABLE IF EXISTS `tel_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_fornitore` (
  `fornitore` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fornitore` (`fornitore`),
  CONSTRAINT `tel_fornitore_1` FOREIGN KEY (`fornitore`) REFERENCES `fornitore` (`partita_iva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_fornitore`
--

LOCK TABLES `tel_fornitore` WRITE;
/*!40000 ALTER TABLE `tel_fornitore` DISABLE KEYS */;
INSERT INTO `tel_fornitore` VALUES ('01234567890','071 2345678'),('01234567890','350 1234567'),('12345678901','351 2345678'),('23456789012','352 3456789'),('34567890123','071 9876543'),('34567890123','353 4567890'),('45678901234','0733 1234567'),('45678901234','354 5678901'),('56789012345','355 6789012'),('67890123456','0732 2345678'),('67890123456','356 7890123'),('78901234567','357 8901234'),('89012345678','071 8765432'),('89012345678','358 9012345'),('90123456789','359 0123456');
/*!40000 ALTER TABLE `tel_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'farmacia'
--
/*!50003 DROP PROCEDURE IF EXISTS `CalcolaAggiornaImportoTotaleAcquisto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcolaAggiornaImportoTotaleAcquisto`(IN ordineAcquistoID INT)
BEGIN
    DECLARE totaleAcquisto DECIMAL(10,2);

    -- Calcola il totale dell'acquisto
    SELECT IFNULL(SUM(quantità * prezzo_acquisto), 0)
    INTO totaleAcquisto
    FROM elenc_acq
    WHERE ordine_acquisto = ordineAcquistoID;

    -- Aggiorna l'importo totale nell'ordine collegato all'ordine di acquisto
    UPDATE ordine
    SET importo_totale = totaleAcquisto
    WHERE numero_ordine = ordineAcquistoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcolaEAggiornaImportoTotale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcolaEAggiornaImportoTotale`(IN ordineID INT)
BEGIN
    DECLARE totaleProdotti DECIMAL(10,2) DEFAULT 0;
    DECLARE totaleServizi DECIMAL(10,2) DEFAULT 0;

    -- Calcola il totale dei prodotti
    SELECT IFNULL(SUM(quantita * (SELECT prezzo_vendita FROM prodotto WHERE codice = elenc_vend.prodotto) - quantita * (SELECT prezzo_vendita FROM prodotto WHERE codice = elenc_vend.prodotto) * elenc_vend.sconto / 100), 0)
    INTO totaleProdotti
    FROM elenc_vend
    WHERE ordine_vendita = ordineID;

    -- Calcola il totale dei servizi di assistenza (se applicabile)
    SELECT IFNULL(SUM(quantita * (SELECT prezzo FROM assistenza_sanitaria WHERE tipologia = elenc_ass.assistenza_sanitaria)), 0)
    INTO totaleServizi
    FROM elenc_ass
    WHERE ordine_vendita = ordineID;

    -- Aggiorna l'importo totale nell'ordine
    UPDATE ordine
    SET importo_totale = totaleProdotti + totaleServizi
    WHERE numero_ordine = ordineID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 20:15:31
