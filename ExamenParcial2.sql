CREATE DATABASE  IF NOT EXISTS `examen2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `examen2`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: examen2
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `nombrec` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encarg` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nombrec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Crepas','Receta europea de origen Francés hecha fundamentalmente de harina de trigo, con la que se elabora una masa en forma de disco. Se sirve habitualmente como base de un plato o postre, aplicándole todo tipo de ingredientes ','Fernanda Alcocer'),('Pastas','La pasta es un conjunto de alimentos preparados con una masa cuyo ingrediente básico es la harina, mezclada con agua, y a la cual se puede añadir sal, huevo u otros ingredientes, conformando un producto que generalmente se cuece en agua hirviendo.','Ignacio Benítez');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingred`
--

DROP TABLE IF EXISTS `ingred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingred` (
  `nombrei` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidades` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almacen` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nombrei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingred`
--

LOCK TABLES `ingred` WRITE;
/*!40000 ALTER TABLE `ingred` DISABLE KEYS */;
INSERT INTO `ingred` VALUES ('Aceite de oliva','Mililitros','ALMC-1010'),('Carne molida','Gramos','ALMC-1010'),('Cebolla','Piezas','ALMC-2020'),('Espaguetti','Gramos','ALMC-1010'),('Espinaca','Gramos','ALMC-2020'),('Harina','Gramos','ALMC-1010'),('Huevos completos','Piezas','ALMC-2020'),('Jamón','Gramos','ALMC-2020'),('Láminas de pasta','Piezas','ALMC-1010'),('Leche','Mililitros','ALMC-2020'),('Panceta','Gramos','ALMC-1010'),('Papas','Gramos','ALMC-1010'),('Queso Parmesano','Gramos','ALMC-1010'),('Sal','Pizcas','ALMC-1010'),('Salsa de tomate','Gramos','ALMC-1010'),('Yemas huevo','Piezas','ALMC-1010');
/*!40000 ALTER TABLE `ingred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS `plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato` (
  `nombrep` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nombrep`),
  KEY `fk_PLATO_CATEGORIA_idx` (`categoria`),
  CONSTRAINT `fk_PLATO_CATEGORIA` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombrec`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato`
--

LOCK TABLES `plato` WRITE;
/*!40000 ALTER TABLE `plato` DISABLE KEYS */;
INSERT INTO `plato` VALUES ('Crepas con espinaca y jamón','El tradicional platillo francés con 2 de los ingredientes salados de la familia mexicana: Espinacas y jamón!!','Intermedio','https://img-global.cpcdn.com/recipes/1f92b6880478eedc/751x532cq70/crepes-de-espinaca-rellenos-de-jamon-y-queso-foto-principal.jpg',142.00,'Crepas'),('Espagueti a la carbonara','Carbonara es un plato de pasta italiano originario del Lacio, y más concretamente de Roma. La receta original se basa en huevos, queso (Pecorino Romano y parmesano), guanciale,pimienta negra tocinera.','Básico','https://t1.rg.ltmcdn.com/es/images/3/2/8/img_espaguetis_a_la_carbonara_51823_600_square.jpg',152.50,'Pastas'),('Gnocchi','Los gnocchis son un tipo de pasta italiana. Se elaboran con patatas, harina (puede ser de maíz, castaña, pulpa de calabaza, de espinaca​) y queso de ricota (con o sin espinaca).','Avanzado','https://www.acouplecooks.com/wp-content/uploads/2019/10/Gnocchi-Sauce-007.jpg',212.50,'Pastas'),('Lasaña','La lasaña es un tipo de pasta que se sirve en láminas, además de denominarse así también a un plato que tiene pasta en láminas intercaladas con carne y bechamel llamado lasaña al horno Se trata de un plato de origen italiano.','Intermedio','https://dam.cocinafacil.com.mx/wp-content/uploads/2018/03/lasana.jpg',100.00,'Pastas');
/*!40000 ALTER TABLE `plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_utiliza_ingred`
--

DROP TABLE IF EXISTS `plato_utiliza_ingred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato_utiliza_ingred` (
  `nombrep` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrei` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int(5) NOT NULL,
  PRIMARY KEY (`nombrep`,`nombrei`),
  KEY `fk_PLATO_UTILIZA_INGRED_INGRED1_idx` (`nombrei`),
  CONSTRAINT `fk_PLATO_UTILIZA_INGRED_INGRED1` FOREIGN KEY (`nombrei`) REFERENCES `ingred` (`nombrei`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLATO_UTILIZA_INGRED_PLATO1` FOREIGN KEY (`nombrep`) REFERENCES `plato` (`nombrep`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_utiliza_ingred`
--

LOCK TABLES `plato_utiliza_ingred` WRITE;
/*!40000 ALTER TABLE `plato_utiliza_ingred` DISABLE KEYS */;
INSERT INTO `plato_utiliza_ingred` VALUES ('Crepas con espinaca y jamón','Aceite de oliva',10),('Crepas con espinaca y jamón','Cebolla',1),('Crepas con espinaca y jamón','Espinaca',450),('Crepas con espinaca y jamón','Harina',500),('Crepas con espinaca y jamón','Huevos completos',4),('Crepas con espinaca y jamón','Jamón',250),('Crepas con espinaca y jamón','Leche',250),('Crepas con espinaca y jamón','Sal',3),('Espagueti a la carbonara','Aceite de oliva',10),('Espagueti a la carbonara','Espaguetti',300),('Espagueti a la carbonara','Huevos completos',4),('Espagueti a la carbonara','Panceta',120),('Espagueti a la carbonara','Queso Parmesano',250),('Espagueti a la carbonara','Sal',3),('Gnocchi','Harina',250),('Gnocchi','Papas',750),('Gnocchi','Sal',3),('Gnocchi','Yemas huevo',3),('Lasaña','Carne molida',350),('Lasaña','Láminas de pasta',10),('Lasaña','Queso Parmesano',250),('Lasaña','Salsa de tomate',600);
/*!40000 ALTER TABLE `plato_utiliza_ingred` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 12:02:18
