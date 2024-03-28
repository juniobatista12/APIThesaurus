CREATE DATABASE  IF NOT EXISTS `poc` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `poc`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: poc
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitstreams`
--

DROP TABLE IF EXISTS `bitstreams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitstreams` (
  `idbitstreams` int NOT NULL AUTO_INCREMENT,
  `nomeArquivo` varchar(45) DEFAULT NULL,
  `pacote` varchar(45) DEFAULT NULL,
  `itens_iditens` int NOT NULL,
  PRIMARY KEY (`idbitstreams`),
  KEY `fk_bitstreams_itens1_idx` (`itens_iditens`),
  CONSTRAINT `fk_bitstreams_itens1` FOREIGN KEY (`itens_iditens`) REFERENCES `itens` (`iditens`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitstreams`
--

LOCK TABLES `bitstreams` WRITE;
/*!40000 ALTER TABLE `bitstreams` DISABLE KEYS */;
INSERT INTO `bitstreams` VALUES (1,'doom.exe','instalador',1),(2,'doom.jpg','thumbnail',1),(3,'doom.ico','icone',1),(4,'goldeneyen64.exe','instalador',2),(5,'goldeneye.jpg','thumbnail',2),(6,'goldeneye.ico','icone',2),(7,'thesurge.exe','instalador',3),(8,'thesurge.png','thumbnail',3),(9,'thesurge.ico','icone',3),(10,'eldenring.exe','instalador',4),(11,'eldenring.png','thumbnail',4),(12,'eldenring.ico','icone',4),(13,'naruto.mp4','trailer',5),(14,'naruto.gif','wallpapper',5),(15,'naruto.png','thumbnail',5),(16,'weare.mp4','trailer',6),(17,'nami.gif','wallpapper',6),(18,'goingMerry.png','thumbnail',6),(19,'marcas.mp4','trailer',7),(20,'marcas.txt','fichaTecnica',7),(21,'marcas.png','thumbnail',7),(22,'mestreDosDesejos.mp4','trailer',8),(23,'mestreDosDesejos.html','fichaTecnica',8),(24,'mestreDosDesejos.png','thumbnail',8),(25,'borat.mxf','trailer',9),(26,'borat.html','fichaTecnica',9),(27,'borat.jpg','thumbnail',9);
/*!40000 ALTER TABLE `bitstreams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecoes`
--

DROP TABLE IF EXISTS `colecoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecoes` (
  `idcolecoes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `comunidades_idcomunidades` int NOT NULL,
  PRIMARY KEY (`idcolecoes`),
  KEY `fk_colecoes_comunidades_idx` (`comunidades_idcomunidades`),
  CONSTRAINT `fk_colecoes_comunidades` FOREIGN KEY (`comunidades_idcomunidades`) REFERENCES `comunidades` (`idcomunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecoes`
--

LOCK TABLES `colecoes` WRITE;
/*!40000 ALTER TABLE `colecoes` DISABLE KEYS */;
INSERT INTO `colecoes` VALUES (1,'FPS',1),(2,'Soulslike',1),(3,'Shonen',2),(4,'Terror',3),(5,'Comédia',3);
/*!40000 ALTER TABLE `colecoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidades`
--

DROP TABLE IF EXISTS `comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidades` (
  `idcomunidades` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (1,'Jogos'),(2,'Animes'),(3,'Filmes');
/*!40000 ALTER TABLE `comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `iditens` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `colecoes_idcolecoes` int NOT NULL,
  PRIMARY KEY (`iditens`),
  KEY `fk_itens_colecoes1_idx` (`colecoes_idcolecoes`),
  CONSTRAINT `fk_itens_colecoes1` FOREIGN KEY (`colecoes_idcolecoes`) REFERENCES `colecoes` (`idcolecoes`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,'Doom',1),(2,'007 - GoldenEye',1),(3,'The Surge',2),(4,'Elden Ring',2),(5,'Naruto',3),(6,'One Piece',3),(7,'Marcas da maldição',4),(8,'Mestre dos desejos',4),(9,'Borat',5);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 18:07:02
