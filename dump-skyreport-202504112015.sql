-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: skyreport
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tabla_albergues`
--

DROP TABLE IF EXISTS `tabla_albergues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_albergues` (
  `id_albergue` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  `descripcion` varchar(64) DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_albergue`),
  KEY `id_colonia` (`id_colonia`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `tabla_albergues_ibfk_1` FOREIGN KEY (`id_colonia`) REFERENCES `tabla_colonias` (`id_colonia`),
  CONSTRAINT `tabla_albergues_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `tabla_estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_albergues`
--

LOCK TABLES `tabla_albergues` WRITE;
/*!40000 ALTER TABLE `tabla_albergues` DISABLE KEYS */;
INSERT INTO `tabla_albergues` VALUES (2,'Ites','fdsfs',234.000000,576.000000,1,1);
/*!40000 ALTER TABLE `tabla_albergues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_alertas`
--

DROP TABLE IF EXISTS `tabla_alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_alertas` (
  `id_alerta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) DEFAULT NULL,
  `id_tipo_alerta` int(11) DEFAULT NULL,
  `id_medicion` int(11) DEFAULT NULL,
  `id_albergue` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_tipo_alerta` (`id_tipo_alerta`),
  KEY `id_medicion` (`id_medicion`),
  KEY `id_albergue` (`id_albergue`),
  CONSTRAINT `tabla_alertas_ibfk_1` FOREIGN KEY (`id_tipo_alerta`) REFERENCES `tabla_tipo_alertas` (`id_tipo_alerta`),
  CONSTRAINT `tabla_alertas_ibfk_2` FOREIGN KEY (`id_medicion`) REFERENCES `tabla_mediciones` (`id_medicion`),
  CONSTRAINT `tabla_alertas_ibfk_3` FOREIGN KEY (`id_albergue`) REFERENCES `tabla_albergues` (`id_albergue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_alertas`
--

LOCK TABLES `tabla_alertas` WRITE;
/*!40000 ALTER TABLE `tabla_alertas` DISABLE KEYS */;
INSERT INTO `tabla_alertas` VALUES (2,'ddd',1,1,2,'2025-04-12');
/*!40000 ALTER TABLE `tabla_alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_bitacora`
--

DROP TABLE IF EXISTS `tabla_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_bitacora` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `tabla_afectada` varchar(64) DEFAULT NULL,
  `accion` varchar(32) DEFAULT NULL,
  `datos_anteriores` varchar(128) DEFAULT NULL,
  `datos_nuevos` varchar(128) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_bitacora`),
  KEY `fk_bitacora_usuario` (`id_usuario`),
  CONSTRAINT `fk_bitacora_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tabla_usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_bitacora`
--

LOCK TABLES `tabla_bitacora` WRITE;
/*!40000 ALTER TABLE `tabla_bitacora` DISABLE KEYS */;
INSERT INTO `tabla_bitacora` VALUES (4,1,'tabla_usuarios','INSERT',NULL,'id_usuario: 3, nombre: hhh, apellido_p: fff, apellido_m: ff, id_colonia: 2','2025-04-01 07:16:47'),(5,1,'tabla_usuarios','DELETE','id_usuario: 3, nombre: hhh, apellido_p: fff, apellido_m: ff, id_colonia: 2',NULL,'2025-04-01 07:16:52'),(8,1,'tabla_usuarios','INSERT',NULL,'id_usuario: 4, nombre: bvbvbv, apellido_p: bnvnv, apellido_m: buyhjkh, id_colonia: 2','2025-04-02 03:36:36'),(9,1,'tabla_usuarios','INSERT',NULL,'id_usuario: 6, nombre: s, apellido_p: ss, apellido_m: kaka, id_colonia: 1','2025-04-12 00:42:18'),(12,1,'tabla_usuarios','INSERT',NULL,'id_usuario: 8, nombre: gus, apellido_p: ortiz, apellido_m: montes, id_colonia: 1','2025-04-12 00:46:41');
/*!40000 ALTER TABLE `tabla_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_colonias`
--

DROP TABLE IF EXISTS `tabla_colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_colonias` (
  `id_colonia` int(11) NOT NULL AUTO_INCREMENT,
  `colonia` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_colonia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_colonias`
--

LOCK TABLES `tabla_colonias` WRITE;
/*!40000 ALTER TABLE `tabla_colonias` DISABLE KEYS */;
INSERT INTO `tabla_colonias` VALUES (1,'caribean'),(2,'caribe alto'),(3,'caribe');
/*!40000 ALTER TABLE `tabla_colonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_estados`
--

DROP TABLE IF EXISTS `tabla_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_estados` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_estados`
--

LOCK TABLES `tabla_estados` WRITE;
/*!40000 ALTER TABLE `tabla_estados` DISABLE KEYS */;
INSERT INTO `tabla_estados` VALUES (1,'abierto');
/*!40000 ALTER TABLE `tabla_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_mediciones`
--

DROP TABLE IF EXISTS `tabla_mediciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_mediciones` (
  `id_medicion` int(11) NOT NULL AUTO_INCREMENT,
  `temperatura` decimal(5,2) DEFAULT NULL,
  `humedad` decimal(5,2) DEFAULT NULL,
  `presion` decimal(6,2) DEFAULT NULL,
  `velocidad_viento` decimal(5,2) DEFAULT NULL,
  `direccion_viento` varchar(64) DEFAULT NULL,
  `precipitacion` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_medicion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_mediciones`
--

LOCK TABLES `tabla_mediciones` WRITE;
/*!40000 ALTER TABLE `tabla_mediciones` DISABLE KEYS */;
INSERT INTO `tabla_mediciones` VALUES (1,4.00,5.00,5.00,3.00,'pa alla',2.00,'2025-04-12 07:36:05'),(2,4.00,5.00,5.00,3.00,'pa alla',2.00,'2025-04-12 07:36:05'),(3,0.00,0.00,0.00,0.00,'string',0.00,'2025-04-12 07:38:48');
/*!40000 ALTER TABLE `tabla_mediciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_recomendaciones`
--

DROP TABLE IF EXISTS `tabla_recomendaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_recomendaciones` (
  `id_recomendacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) DEFAULT NULL,
  `motivo` varchar(64) DEFAULT NULL,
  `id_tipo_recomendacion` int(11) DEFAULT NULL,
  `id_alerta` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_recomendacion`),
  KEY `id_tipo_recomendacion` (`id_tipo_recomendacion`),
  KEY `id_alerta` (`id_alerta`),
  CONSTRAINT `tabla_recomendaciones_ibfk_1` FOREIGN KEY (`id_tipo_recomendacion`) REFERENCES `tabla_tipo_recomendaciones` (`id_tipo_recomendacion`),
  CONSTRAINT `tabla_recomendaciones_ibfk_2` FOREIGN KEY (`id_alerta`) REFERENCES `tabla_alertas` (`id_alerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_recomendaciones`
--

LOCK TABLES `tabla_recomendaciones` WRITE;
/*!40000 ALTER TABLE `tabla_recomendaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_recomendaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_tipo_alertas`
--

DROP TABLE IF EXISTS `tabla_tipo_alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_tipo_alertas` (
  `id_tipo_alerta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_alerta` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_alerta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_tipo_alertas`
--

LOCK TABLES `tabla_tipo_alertas` WRITE;
/*!40000 ALTER TABLE `tabla_tipo_alertas` DISABLE KEYS */;
INSERT INTO `tabla_tipo_alertas` VALUES (1,'huracan');
/*!40000 ALTER TABLE `tabla_tipo_alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_tipo_recomendaciones`
--

DROP TABLE IF EXISTS `tabla_tipo_recomendaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_tipo_recomendaciones` (
  `id_tipo_recomendacion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_recomendacion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_recomendacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_tipo_recomendaciones`
--

LOCK TABLES `tabla_tipo_recomendaciones` WRITE;
/*!40000 ALTER TABLE `tabla_tipo_recomendaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_tipo_recomendaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_usuarios`
--

DROP TABLE IF EXISTS `tabla_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(16) DEFAULT NULL,
  `apellido_p` varchar(16) DEFAULT NULL,
  `apellido_m` varchar(16) DEFAULT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `contraseña` varchar(16) DEFAULT NULL,
  `pregunta` varchar(32) DEFAULT NULL,
  `respuesta` varchar(16) DEFAULT NULL,
  `permisos` decimal(1,0) DEFAULT NULL,
  `correo_electronico` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_colonia` (`id_colonia`),
  CONSTRAINT `tabla_usuarios_ibfk_1` FOREIGN KEY (`id_colonia`) REFERENCES `tabla_colonias` (`id_colonia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_usuarios`
--

LOCK TABLES `tabla_usuarios` WRITE;
/*!40000 ALTER TABLE `tabla_usuarios` DISABLE KEYS */;
INSERT INTO `tabla_usuarios` VALUES (1,'dd','dd','dd',1,'2','d','d',1,NULL),(4,'bvbvbv','bnvnv','buyhjkh',2,'fghfh','gdfgffg','gffgf',1,NULL),(6,'s','ss','kaka',1,'1','ss','ss',1,'gg'),(8,'gus','ortiz','montes',1,'123456','gg','gg',1,'gustavo@gmail.com');
/*!40000 ALTER TABLE `tabla_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_insertar_usuario
AFTER INSERT ON tabla_usuarios
FOR EACH ROW
BEGIN
    INSERT INTO tabla_bitacora (
        id_usuario, 
        tabla_afectada, 
        accion, 
        datos_anteriores, 
        datos_nuevos, 
        fecha_hora
    )
    VALUES (
        1, 
        'tabla_usuarios',
        'INSERT',
        NULL,
        CONCAT('id_usuario: ', NEW.id_usuario, ', nombre: ', NEW.nombre, ', apellido_p: ', NEW.apellido_p, ', apellido_m: ', NEW.apellido_m, ', id_colonia: ', NEW.id_colonia),
        NOW()
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_actualizar_usuario
AFTER UPDATE ON tabla_usuarios
FOR EACH ROW
BEGIN
    INSERT INTO tabla_bitacora (
        id_usuario, 
        tabla_afectada, 
        accion, 
        datos_anteriores, 
        datos_nuevos, 
        fecha_hora
    )
    VALUES (
        1, 
        'tabla_usuarios',
        'UPDATE',
        CONCAT('id_usuario: ', OLD.id_usuario, ', nombre: ', OLD.nombre, ', apellido_p: ', OLD.apellido_p, ', apellido_m: ', OLD.apellido_m, ', id_colonia: ', OLD.id_colonia),
        CONCAT('id_usuario: ', NEW.id_usuario, ', nombre: ', NEW.nombre, ', apellido_p: ', NEW.apellido_p, ', apellido_m: ', NEW.apellido_m, ', id_colonia: ', NEW.id_colonia),
        NOW()
    );
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_eliminar_usuario
AFTER DELETE ON tabla_usuarios
FOR EACH ROW
BEGIN
    INSERT INTO tabla_bitacora (
        id_usuario, 
        tabla_afectada, 
        accion, 
        datos_anteriores, 
        datos_nuevos, 
        fecha_hora
    )
    VALUES (
        1, 
        'tabla_usuarios',
        'DELETE',
        CONCAT('id_usuario: ', OLD.id_usuario, ', nombre: ', OLD.nombre, ', apellido_p: ', OLD.apellido_p, ', apellido_m: ', OLD.apellido_m, ', id_colonia: ', OLD.id_colonia),
        NULL, 
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_albergues`
--

DROP TABLE IF EXISTS `vista_albergues`;
/*!50001 DROP VIEW IF EXISTS `vista_albergues`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_albergues` AS SELECT 
 1 AS `id_albergue`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `latitud`,
 1 AS `longitud`,
 1 AS `id_colonia`,
 1 AS `id_estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_alertas`
--

DROP TABLE IF EXISTS `vista_alertas`;
/*!50001 DROP VIEW IF EXISTS `vista_alertas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_alertas` AS SELECT 
 1 AS `id_alerta`,
 1 AS `descripcion`,
 1 AS `id_tipo_alerta`,
 1 AS `id_medicion`,
 1 AS `id_albergue`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_bitacora`
--

DROP TABLE IF EXISTS `vista_bitacora`;
/*!50001 DROP VIEW IF EXISTS `vista_bitacora`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_bitacora` AS SELECT 
 1 AS `id_bitacora`,
 1 AS `id_usuario`,
 1 AS `tabla_afectada`,
 1 AS `accion`,
 1 AS `datos_anteriores`,
 1 AS `datos_nuevos`,
 1 AS `fecha_hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_colonias`
--

DROP TABLE IF EXISTS `vista_colonias`;
/*!50001 DROP VIEW IF EXISTS `vista_colonias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_colonias` AS SELECT 
 1 AS `id_colonia`,
 1 AS `colonia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estados`
--

DROP TABLE IF EXISTS `vista_estados`;
/*!50001 DROP VIEW IF EXISTS `vista_estados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estados` AS SELECT 
 1 AS `id_estado`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mediciones`
--

DROP TABLE IF EXISTS `vista_mediciones`;
/*!50001 DROP VIEW IF EXISTS `vista_mediciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mediciones` AS SELECT 
 1 AS `id_medicion`,
 1 AS `temperatura`,
 1 AS `humedad`,
 1 AS `presion`,
 1 AS `velocidad_viento`,
 1 AS `direccion_viento`,
 1 AS `precipitacion`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_recomendaciones`
--

DROP TABLE IF EXISTS `vista_recomendaciones`;
/*!50001 DROP VIEW IF EXISTS `vista_recomendaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_recomendaciones` AS SELECT 
 1 AS `id_recomendacion`,
 1 AS `descripcion`,
 1 AS `motivo`,
 1 AS `id_tipo_recomendacion`,
 1 AS `id_alerta`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipo_alertas`
--

DROP TABLE IF EXISTS `vista_tipo_alertas`;
/*!50001 DROP VIEW IF EXISTS `vista_tipo_alertas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipo_alertas` AS SELECT 
 1 AS `id_tipo_alerta`,
 1 AS `tipo_alerta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipo_recomendaciones`
--

DROP TABLE IF EXISTS `vista_tipo_recomendaciones`;
/*!50001 DROP VIEW IF EXISTS `vista_tipo_recomendaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipo_recomendaciones` AS SELECT 
 1 AS `id_tipo_recomendacion`,
 1 AS `tipo_recomendacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios`
--

DROP TABLE IF EXISTS `vista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre`,
 1 AS `apellido_p`,
 1 AS `apellido_m`,
 1 AS `correo_electronico`,
 1 AS `id_colonia`,
 1 AS `contraseña`,
 1 AS `pregunta`,
 1 AS `respuesta`,
 1 AS `permisos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'skyreport'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_albergue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_albergue`(
    IN p_id_albergue INT,
    IN p_nombre VARCHAR(64),
    IN p_descripcion VARCHAR(64),
    IN p_latitud DECIMAL(9,6),
    IN p_longitud DECIMAL(9,6),
    IN p_id_colonia INT,
    IN p_id_estado INT
)
BEGIN
    UPDATE tabla_albergues
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        latitud = p_latitud,
        longitud = p_longitud,
        id_colonia = p_id_colonia,
        id_estado = p_id_estado
    WHERE id_albergue = p_id_albergue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `actualizar_alerta`(
    IN p_id_alerta INT,
    IN p_descripcion VARCHAR(64),
    IN p_id_tipo_alerta INT,
    IN p_id_medicion INT,
    IN p_id_albergue INT,
    IN p_fecha DATE
)
BEGIN
    UPDATE tabla_alertas
    SET descripcion = p_descripcion,
        id_tipo_alerta = p_id_tipo_alerta,
        id_medicion = p_id_medicion,
        id_albergue = p_id_albergue,
        fecha = p_fecha
    WHERE id_alerta = p_id_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bitacora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bitacora`(
    IN p_id_bitacora INT,
    IN p_id_usuario INT,
    IN p_tabla_afectada VARCHAR(64),
    IN p_accion VARCHAR(32),
    IN p_datos_anteriores VARCHAR(128),
    IN p_datos_nuevos VARCHAR(128),
    IN p_fecha_hora TIMESTAMP
)
BEGIN
    UPDATE tabla_bitacora
    SET id_usuario = p_id_usuario,
        tabla_afectada = p_tabla_afectada,
        accion = p_accion,
        datos_anteriores = p_datos_anteriores,
        datos_nuevos = p_datos_nuevos,
        fecha_hora = p_fecha_hora
    WHERE id_bitacora = p_id_bitacora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_colonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_colonia`(
    IN p_id_colonia INT,
    IN p_colonia VARCHAR(64)
)
BEGIN
    UPDATE tabla_colonias
    SET colonia = p_colonia
    WHERE id_colonia = p_id_colonia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_estado`(
    IN p_id_estado INT,
    IN p_estado VARCHAR(32)
)
BEGIN
    UPDATE tabla_estados
    SET estado = p_estado
    WHERE id_estado = p_id_estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_medicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_medicion`(
    IN p_id_medicion INT,
    IN p_temperatura DECIMAL(5,2),
    IN p_humedad DECIMAL(5,2),
    IN p_presion DECIMAL(6,2),
    IN p_velocidad_viento DECIMAL(5,2),
    IN p_direccion_viento VARCHAR(64),
    IN p_precipitacion DECIMAL(5,2),
    IN p_fecha TIMESTAMP
)
BEGIN
    UPDATE tabla_mediciones
    SET temperatura = p_temperatura,
        humedad = p_humedad,
        presion = p_presion,
        velocidad_viento = p_velocidad_viento,
        direccion_viento = p_direccion_viento,
        precipitacion = p_precipitacion,
        fecha = p_fecha
    WHERE id_medicion = p_id_medicion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `actualizar_recomendacion`(
    IN p_id_recomendacion INT,
    IN p_descripcion VARCHAR(64),
    IN p_motivo VARCHAR(64),
    IN p_id_tipo_recomendacion INT,
    IN p_id_alerta INT,
    IN p_fecha DATE
)
BEGIN
    UPDATE tabla_recomendaciones
    SET descripcion = p_descripcion,
        motivo = p_motivo,
        id_tipo_recomendacion = p_id_tipo_recomendacion,
        id_alerta = p_id_alerta,
        fecha = p_fecha
    WHERE id_recomendacion = p_id_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_tipo_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_tipo_alerta`(
    IN p_id_tipo_alerta INT,
    IN p_tipo_alerta VARCHAR(32)
)
BEGIN
    UPDATE tabla_tipo_alertas
    SET tipo_alerta = p_tipo_alerta
    WHERE id_tipo_alerta = p_id_tipo_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_tipo_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_tipo_recomendacion`(
    IN p_id_tipo_recomendacion INT,
    IN p_tipo_recomendacion VARCHAR(32)
)
BEGIN
    UPDATE tabla_tipo_recomendaciones
    SET tipo_recomendacion = p_tipo_recomendacion
    WHERE id_tipo_recomendacion = p_id_tipo_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `actualizar_usuario`(
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(16),
    IN p_apellido_p VARCHAR(16),
    IN p_apellido_m VARCHAR(16),
    IN p_id_colonia INT,
    IN p_contraseña VARCHAR(16),
    IN p_pregunta VARCHAR(32),
    IN p_respuesta VARCHAR(16),
    IN p_permisos NUMERIC(1),
    IN p_correo_electronico VARCHAR(64)
)
BEGIN
    UPDATE tabla_usuarios
    SET nombre = p_nombre,
        apellido_p = p_apellido_p,
        apellido_m = p_apellido_m,
        id_colonia = p_id_colonia,
        contraseña = p_contraseña,
        pregunta = p_pregunta,
        respuesta = p_respuesta,
        permisos = p_permisos,
        correo_electronico = p_correo_electronico
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_albergue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_albergue`(
    IN p_id_albergue INT
)
BEGIN
    DELETE FROM tabla_albergues
    WHERE id_albergue = p_id_albergue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `eliminar_alerta`(
    IN p_id_alerta INT
)
BEGIN
    DELETE FROM tabla_alertas
    WHERE id_alerta = p_id_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_bitacora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_bitacora`(
    IN p_id_bitacora INT
)
BEGIN
    DELETE FROM tabla_bitacora
    WHERE id_bitacora = p_id_bitacora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_colonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_colonia`(
    IN p_id_colonia INT
)
BEGIN
    DELETE FROM tabla_colonias
    WHERE id_colonia = p_id_colonia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_estado`(
    IN p_id_estado INT
)
BEGIN
    DELETE FROM tabla_estados
    WHERE id_estado = p_id_estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_medicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_medicion`(
    IN p_id_medicion INT
)
BEGIN
    DELETE FROM tabla_mediciones
    WHERE id_medicion = p_id_medicion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `eliminar_recomendacion`(
    IN p_id_recomendacion INT
)
BEGIN
    DELETE FROM tabla_recomendaciones
    WHERE id_recomendacion = p_id_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_tipo_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_tipo_alerta`(
    IN p_id_tipo_alerta INT
)
BEGIN
    DELETE FROM tabla_tipo_alertas
    WHERE id_tipo_alerta = p_id_tipo_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_tipo_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_tipo_recomendacion`(
    IN p_id_tipo_recomendacion INT
)
BEGIN
    DELETE FROM tabla_tipo_recomendaciones
    WHERE id_tipo_recomendacion = p_id_tipo_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario`(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM tabla_usuarios
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_albergue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_albergue`(
    IN p_nombre VARCHAR(64),
    IN p_descripcion VARCHAR(64),
    IN p_latitud DECIMAL(9,6),
    IN p_longitud DECIMAL(9,6),
    IN p_id_colonia INT,
    IN p_id_estado INT
)
BEGIN
    INSERT INTO tabla_albergues (nombre, descripcion, latitud, longitud, id_colonia, id_estado)
    VALUES (p_nombre, p_descripcion, p_latitud, p_longitud, p_id_colonia, p_id_estado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insertar_alerta`(
    IN p_descripcion VARCHAR(64),
    IN p_id_tipo_alerta INT,
    IN p_id_medicion INT,
    IN p_id_albergue INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO tabla_alertas (descripcion, id_tipo_alerta, id_medicion, id_albergue, fecha)
    VALUES (p_descripcion, p_id_tipo_alerta, p_id_medicion, p_id_albergue, p_fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_bitacora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_bitacora`(
    IN p_id_usuario INT,
    IN p_tabla_afectada VARCHAR(64),
    IN p_accion VARCHAR(32),
    IN p_datos_anteriores VARCHAR(128),
    IN p_datos_nuevos VARCHAR(128),
    IN p_fecha_hora TIMESTAMP
)
BEGIN
    INSERT INTO tabla_bitacora (id_usuario, tabla_afectada, accion, datos_anteriores, datos_nuevos, fecha_hora)
    VALUES (p_id_usuario, p_tabla_afectada, p_accion, p_datos_anteriores, p_datos_nuevos, p_fecha_hora);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_colonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_colonia`(
    IN p_colonia VARCHAR(64)
)
BEGIN
    INSERT INTO tabla_colonias (colonia)
    VALUES (p_colonia);
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_estado`(
    IN p_estado VARCHAR(32)
)
BEGIN
    INSERT INTO tabla_estados (estado)
    VALUES (p_estado);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_medicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_medicion`(
    IN p_temperatura DECIMAL(5,2),
    IN p_humedad DECIMAL(5,2),
    IN p_presion DECIMAL(6,2),
    IN p_velocidad_viento DECIMAL(5,2),
    IN p_direccion_viento VARCHAR(64),
    IN p_precipitacion DECIMAL(5,2),
    IN p_fecha TIMESTAMP
)
BEGIN
    INSERT INTO tabla_mediciones (temperatura, humedad, presion, velocidad_viento, direccion_viento, precipitacion, fecha)
    VALUES (p_temperatura, p_humedad, p_presion, p_velocidad_viento, p_direccion_viento, p_precipitacion, p_fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insertar_recomendacion`(
    IN p_descripcion VARCHAR(64),
    IN p_motivo VARCHAR(64),
    IN p_id_tipo_recomendacion INT,
    IN p_id_alerta INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO tabla_recomendaciones (descripcion, motivo, id_tipo_recomendacion, id_alerta, fecha)
    VALUES (p_descripcion, p_motivo, p_id_tipo_recomendacion, p_id_alerta, p_fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_tipo_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tipo_alerta`(
    IN p_tipo_alerta VARCHAR(32)
)
BEGIN
    INSERT INTO tabla_tipo_alertas (tipo_alerta)
    VALUES (p_tipo_alerta);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_tipo_recomendacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tipo_recomendacion`(
    IN p_tipo_recomendacion VARCHAR(32)
)
BEGIN
    INSERT INTO tabla_tipo_recomendaciones (tipo_recomendacion)
    VALUES (p_tipo_recomendacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insertar_usuario`(
    IN p_nombre VARCHAR(16),
    IN p_apellido_p VARCHAR(16),
    IN p_apellido_m VARCHAR(16),
    IN p_id_colonia INT,
    IN p_contraseña VARCHAR(16),
    IN p_pregunta VARCHAR(32),
    IN p_respuesta VARCHAR(16),
    IN p_permisos NUMERIC(1),
    IN p_correo_electronico VARCHAR(64)
)
BEGIN
    INSERT INTO tabla_usuarios (nombre, apellido_p, apellido_m, id_colonia, contraseña, pregunta, respuesta, permisos, correo_electronico)
    VALUES (p_nombre, p_apellido_p, p_apellido_m, p_id_colonia, p_contraseña, p_pregunta, p_respuesta, p_permisos, p_correo_electronico);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistaa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistaa`(
    IN p_id_alerta INT
)
BEGIN
    SELECT id_alerta, descripcion, id_tipo_alerta, id_medicion, id_albergue, fecha
    FROM tabla_alertas
    WHERE id_alerta = p_id_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistab`(
    IN p_id_bitacora INT
)
BEGIN
    SELECT id_bitacora, id_usuario, tabla_afectada, accion, datos_anteriores, datos_nuevos, fecha_hora
    FROM tabla_bitacora
    WHERE id_bitacora = p_id_bitacora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistamd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistamd`(
    IN p_id_medicion INT
)
BEGIN
    SELECT id_medicion, temperatura, humedad, presion, velocidad_viento, direccion_viento, precipitacion, fecha
    FROM tabla_mediciones
    WHERE id_medicion = p_id_medicion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistar`(
    IN p_id_recomendacion INT
)
BEGIN
    SELECT id_recomendacion, descripcion, motivo, id_tipo_recomendacion, id_alerta, fecha
    FROM tabla_recomendaciones
    WHERE id_recomendacion = p_id_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistata`(
    IN p_id_tipo_alerta INT
)
BEGIN
    SELECT id_tipo_alerta, tipo_alerta
    FROM tabla_tipo_alertas
    WHERE id_tipo_alerta = p_id_tipo_alerta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vistatr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vistatr`(
    IN p_id_tipo_recomendacion INT
)
BEGIN
    SELECT id_tipo_recomendacion, tipo_recomendacion
    FROM tabla_tipo_recomendaciones
    WHERE id_tipo_recomendacion = p_id_tipo_recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vista_albergue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vista_albergue`(
    IN p_id_albergue INT
)
BEGIN
    SELECT id_albergue, nombre, descripcion, latitud, longitud, id_colonia, id_estado
    FROM tabla_albergues
    WHERE id_albergue = p_id_albergue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vista_colonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vista_colonia`(
    IN p_id_colonia INT
)
BEGIN
    SELECT id_colonia, colonia
    FROM tabla_colonias
    WHERE id_colonia = p_id_colonia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vista_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vista_estado`(
    IN p_id_estado INT
)
BEGIN
    SELECT id_estado, estado
    FROM tabla_estados
    WHERE id_estado = p_id_estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vista_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `vista_usuario`(
    IN p_id_usuario INT
)
BEGIN
    SELECT id_usuario, nombre, apellido_p, apellido_m, id_colonia, contraseña, pregunta, respuesta, permisos, correo_electronico
    FROM tabla_usuarios
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_albergues`
--

/*!50001 DROP VIEW IF EXISTS `vista_albergues`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_albergues` AS select `tabla_albergues`.`id_albergue` AS `id_albergue`,`tabla_albergues`.`nombre` AS `nombre`,`tabla_albergues`.`descripcion` AS `descripcion`,`tabla_albergues`.`latitud` AS `latitud`,`tabla_albergues`.`longitud` AS `longitud`,`tabla_albergues`.`id_colonia` AS `id_colonia`,`tabla_albergues`.`id_estado` AS `id_estado` from `tabla_albergues` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_alertas`
--

/*!50001 DROP VIEW IF EXISTS `vista_alertas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_alertas` AS select `tabla_alertas`.`id_alerta` AS `id_alerta`,`tabla_alertas`.`descripcion` AS `descripcion`,`tabla_alertas`.`id_tipo_alerta` AS `id_tipo_alerta`,`tabla_alertas`.`id_medicion` AS `id_medicion`,`tabla_alertas`.`id_albergue` AS `id_albergue`,`tabla_alertas`.`fecha` AS `fecha` from `tabla_alertas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_bitacora`
--

/*!50001 DROP VIEW IF EXISTS `vista_bitacora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_bitacora` AS select `tabla_bitacora`.`id_bitacora` AS `id_bitacora`,`tabla_bitacora`.`id_usuario` AS `id_usuario`,`tabla_bitacora`.`tabla_afectada` AS `tabla_afectada`,`tabla_bitacora`.`accion` AS `accion`,`tabla_bitacora`.`datos_anteriores` AS `datos_anteriores`,`tabla_bitacora`.`datos_nuevos` AS `datos_nuevos`,`tabla_bitacora`.`fecha_hora` AS `fecha_hora` from `tabla_bitacora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_colonias`
--

/*!50001 DROP VIEW IF EXISTS `vista_colonias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_colonias` AS select `tabla_colonias`.`id_colonia` AS `id_colonia`,`tabla_colonias`.`colonia` AS `colonia` from `tabla_colonias` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estados`
--

/*!50001 DROP VIEW IF EXISTS `vista_estados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estados` AS select `tabla_estados`.`id_estado` AS `id_estado`,`tabla_estados`.`estado` AS `estado` from `tabla_estados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mediciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_mediciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mediciones` AS select `tabla_mediciones`.`id_medicion` AS `id_medicion`,`tabla_mediciones`.`temperatura` AS `temperatura`,`tabla_mediciones`.`humedad` AS `humedad`,`tabla_mediciones`.`presion` AS `presion`,`tabla_mediciones`.`velocidad_viento` AS `velocidad_viento`,`tabla_mediciones`.`direccion_viento` AS `direccion_viento`,`tabla_mediciones`.`precipitacion` AS `precipitacion`,`tabla_mediciones`.`fecha` AS `fecha` from `tabla_mediciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_recomendaciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_recomendaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_recomendaciones` AS select `tabla_recomendaciones`.`id_recomendacion` AS `id_recomendacion`,`tabla_recomendaciones`.`descripcion` AS `descripcion`,`tabla_recomendaciones`.`motivo` AS `motivo`,`tabla_recomendaciones`.`id_tipo_recomendacion` AS `id_tipo_recomendacion`,`tabla_recomendaciones`.`id_alerta` AS `id_alerta`,`tabla_recomendaciones`.`fecha` AS `fecha` from `tabla_recomendaciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipo_alertas`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipo_alertas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipo_alertas` AS select `tabla_tipo_alertas`.`id_tipo_alerta` AS `id_tipo_alerta`,`tabla_tipo_alertas`.`tipo_alerta` AS `tipo_alerta` from `tabla_tipo_alertas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipo_recomendaciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipo_recomendaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipo_recomendaciones` AS select `tabla_tipo_recomendaciones`.`id_tipo_recomendacion` AS `id_tipo_recomendacion`,`tabla_tipo_recomendaciones`.`tipo_recomendacion` AS `tipo_recomendacion` from `tabla_tipo_recomendaciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios` AS select `tabla_usuarios`.`id_usuario` AS `id_usuario`,`tabla_usuarios`.`nombre` AS `nombre`,`tabla_usuarios`.`apellido_p` AS `apellido_p`,`tabla_usuarios`.`apellido_m` AS `apellido_m`,`tabla_usuarios`.`correo_electronico` AS `correo_electronico`,`tabla_usuarios`.`id_colonia` AS `id_colonia`,`tabla_usuarios`.`contraseña` AS `contraseña`,`tabla_usuarios`.`pregunta` AS `pregunta`,`tabla_usuarios`.`respuesta` AS `respuesta`,`tabla_usuarios`.`permisos` AS `permisos` from `tabla_usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11 19:15:36
