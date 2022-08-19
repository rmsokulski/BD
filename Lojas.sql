CREATE DATABASE IF NOT EXISTS `lojas` DEFAULT CHARACTER SET utf8mb4;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: lojas
-- ------------------------------------------------------
-- Server version	8.0.30	'

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
-- Table structure for table `Fornecedores`
--
USE `lojas`;
DROP TABLE IF EXISTS `Fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `Fornecedores` (
  `cnpj` varchar(20) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedores`
--

LOCK TABLES `Fornecedores` WRITE;
/*!40000 ALTER TABLE `Fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `nome` varchar(20) DEFAULT NULL,
  `cpf` char(15) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `id_loja` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `id_loja` (`id_loja`),
  CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`id_loja`) REFERENCES `Lojas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lojas`
--

DROP TABLE IF EXISTS `Lojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lojas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `tipo` enum('Eletronicos','Roupas','Outros') DEFAULT NULL,
  `nomeShopping` varchar(20) NOT NULL,
  `cidadeShopping` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nomeShopping` (`nomeShopping`,`cidadeShopping`),
  CONSTRAINT `Lojas_ibfk_1` FOREIGN KEY (`nomeShopping`, `cidadeShopping`) REFERENCES `Shoppings` (`nome`, `cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lojas`
--

LOCK TABLES `Lojas` WRITE;
/*!40000 ALTER TABLE `Lojas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lojas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LxF`
--

DROP TABLE IF EXISTS `LxF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LxF` (
  `Loja` int DEFAULT NULL,
  `Fornecedor` char(20) DEFAULT NULL,
  KEY `Loja` (`Loja`),
  KEY `Fornecedor` (`Fornecedor`),
  CONSTRAINT `LxF_ibfk_1` FOREIGN KEY (`Loja`) REFERENCES `Lojas` (`id`),
  CONSTRAINT `LxF_ibfk_2` FOREIGN KEY (`Fornecedor`) REFERENCES `Fornecedores` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LxF`
--

LOCK TABLES `LxF` WRITE;
/*!40000 ALTER TABLE `LxF` DISABLE KEYS */;
/*!40000 ALTER TABLE `LxF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shoppings`
--

DROP TABLE IF EXISTS `Shoppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shoppings` (
  `nome` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  PRIMARY KEY (`nome`,`cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shoppings`
--

LOCK TABLES `Shoppings` WRITE;
/*!40000 ALTER TABLE `Shoppings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Shoppings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-17 17:07:12