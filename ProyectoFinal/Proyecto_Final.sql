-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_final_tienda
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
-- Table structure for table `carro_compra`
--

DROP TABLE IF EXISTS `carro_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro_compra` (
  `correo_electronico` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`correo_electronico`,`Clave_Producto`),
  KEY `fk_CARRO_COMPRA_INVENTARIO1_idx` (`Clave_Producto`),
  CONSTRAINT `fk_CARRO_COMPRA_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CARRO_COMPRA_USUARIO1` FOREIGN KEY (`correo_electronico`) REFERENCES `usuario` (`correo_electronico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro_compra`
--

LOCK TABLES `carro_compra` WRITE;
/*!40000 ALTER TABLE `carro_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `carro_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Nombre_Cat` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Nombre_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_Producto` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Categoria_Producto` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Talla` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `Fotografia` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Piezas_Disponibles` int(11) NOT NULL,
  PRIMARY KEY (`Clave_Producto`),
  KEY `fk_INVENTARIO_CATEGORIA1_idx` (`Categoria_Producto`),
  CONSTRAINT `fk_INVENTARIO_CATEGORIA1` FOREIGN KEY (`Categoria_Producto`) REFERENCES `categoria` (`Nombre_Cat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `No_Transaccion` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`Clave_Producto`,`No_Transaccion`),
  KEY `fk_PRODUCTOS_TRANSACCION1_idx` (`No_Transaccion`),
  CONSTRAINT `fk_PRODUCTOS_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_TRANSACCION1` FOREIGN KEY (`No_Transaccion`) REFERENCES `transaccion` (`No_Transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `No_Transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `Correo_Cliente` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_cliente` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha-Hora` datetime NOT NULL,
  `Forma_Pago` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Monto_total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`No_Transaccion`),
  KEY `fk_TRANSACCION_USUARIO1_idx` (`Correo_Cliente`,`Nombre_cliente`),
  CONSTRAINT `fk_TRANSACCION_USUARIO1` FOREIGN KEY (`Correo_Cliente`, `Nombre_cliente`) REFERENCES `usuario` (`correo_electronico`, `Nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `correo_electronico` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contraseña` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Codigo_postal` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`correo_electronico`,`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26  0:04:17
