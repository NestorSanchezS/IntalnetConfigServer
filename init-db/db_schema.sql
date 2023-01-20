CREATE DATABASE  IF NOT EXISTS `intalnet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `intalnet`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: intalnet
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('available'),('promotion'),('sale'),('top');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Montería -Córdoba'),(2,'Tierralta -Córdoba'),(3,'Valencia -Córdoba'),(5,'Los Córdoba -Córdoba');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_plans`
--

DROP TABLE IF EXISTS `cities_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_plans` (
  `city_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `price` double DEFAULT NULL,
  KEY `city_id` (`city_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `cities_plans_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `cities_plans_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_plans`
--

LOCK TABLES `cities_plans` WRITE;
/*!40000 ALTER TABLE `cities_plans` DISABLE KEYS */;
INSERT INTO `cities_plans` VALUES (1,1,400),(1,2,120),(2,5,120),(2,6,80),(2,7,60),(3,5,120),(3,6,80),(3,7,60),(5,8,60),(5,9,50),(1,10,90),(1,4,60);
/*!40000 ALTER TABLE `cities_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequent_questions`
--

DROP TABLE IF EXISTS `frequent_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequent_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answer` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequent_questions`
--

LOCK TABLES `frequent_questions` WRITE;
/*!40000 ALTER TABLE `frequent_questions` DISABLE KEYS */;
INSERT INTO `frequent_questions` VALUES (1,'¿Los servicios de internet y televisión son servicios esenciales?','SÍ. El MinTIC expide el Decreto 464 del 23 de marzo de 2020 declarando que los servicios de internet y televisión son esenciales (artículo 1º).'),(2,'¿Los operadores de internet y televisión pueden suspender labores de instalación, mantenimiento y adecuación de las redes requeridas para la operación del servicio?','NO. En el artículo 1º del Decreto 464 del 23 de marzo de 2020 expedido por el MinTIC se establece que los PRST “…no podrán suspender las labores de instalación, mantenimiento y adecuación de las redes requeridas para la operación del servicio.” '),(3,'¿Siendo los servicios de internet y televisión esenciales deben ser prestados por los operadores gratuitamente?','NO. La normatividad de emergencia no suspende lo dispuesto en el Artículo 2.1.12.1 del Capítulo 1 del Título II de la Resolución CRC 5050 de 2016. Así las cosas, los Usuarios están obligados a pagar oportunamente la factura por la prestación de los servicios de interne televisión por suscripción.'),(4,'¿Los operadores pueden cortar la prestación de los servicios de internet y televisión por falta de pago?','SÍ. La CRC mediante la Resolución No. 5951 del 26 de marzo de 2020 dispone que los usuarios de televisión por suscripción e internet tienen la obligación de pagar oportunamente la factura. Ahora bien, bajo la premisa que son servicios esenciales esta Comisión exhorta a los operadores a que les brinden a los Usuarios facilidades de pago.'),(5,'¿Los operadores de internet y televisión pueden cortar la prestación de los servicios cuando pese a las facilidades de pago los Usuarios se niegan a pagar?','La Resolución CRC No. 5951 del 26 de marzo de 2020 no releva a los Usuarios de la obligación de pago oportuno. INTALNET TELECOMUNICACIONES (Inversiones Zuluaga Sejin S.A.S) avisará a los Usuarios los cortes del servicio que realizará por falta de pago.'),(6,'¿Los operadores de internet y televisión están obligados a condonar las deudas de los usuarios?',' NO. En el artículo 4 de la Resolución CRC No. 5951 del 26 de marzo de 2020 se establece que durante el término que perdure la emergencia no podemos cobrar intereses por mora. Lo anterior no implica condonaciones de las sumas que los usuarios deben.'),(7,'¿La facturación y las respuestas a las PQRs pueden ser enviadas al correo electrónico del Usuario?','SÍ. La Resolución CRC No. 5956 del 19 de marzo de 2020 permite que el operador emita la respuesta a la PQRs por correo electrónico, aunque no haya sido el mismo medio por el que se presentó o el Usuario no lo haya autorizado expresamente. Esta misma norma faculta al operador a enviar la factura por correo electrónico aun cuando el Usuario no lo haya autorizado. Si no se cuenta con el correo electrónico INTALNET TELECOMUNICACIONES (Inversiones Zuluaga Sejin S.A.S) entregará la factura y la respuesta de la PQRs en físico.'),(8,'¿En caso de que el Usuario tenga inconvenientes con la prestación de sus servicios (televisión y/o internet) primero debe acudir a la Superintendencia de Industria y Comercio – SIC?','NO. La Resolución SIC No. 19012 de 2020 enfatiza que INTALNET TELECOMUNICACIONES (Inversiones Zuluaga Sejin S.A.S) es el primer canal de solución. Ahora bien, solo en el caso que no demos respuesta oportunamente el Usuario podrá acudir a la SIC.'),(9,'¿Qué es ancho de banda?','Dicho de forma muy simple, el ancho de banda es el caudal o capacidad de transmisión de datos que soporta un enlace. Suele ser un recurso compartido por numerosos usuarios (por ejemplo, todos los usuarios de un determinado proveedor).'),(10,'¿Qué es conexión WIFI?','Wifi o Wi-Fi es originalmente una abreviación de la marca comercial Wireless Fidelity, que en inglés significa \'fidelidad sin cables o inalámbrica\'. La comunicación inalámbrica, como tal, es aquella que prescinde de cables o medios físicos visibles de propagación, y que, por el contrario, emplea ondas electromagnéticas para su trasmisión, siendo que esta, no obstante, estará limitada a un radio específico de cobertura.'),(11,'¿Qué es una mega?','El megabyte (MB) es una unidad estándar en la informática y la tecnología digital que indica el tamaño de un archivo o la capacidad de una memoria de datos. Este término se compone de la palabra griega “mega” (millón) y “byte”. De esta manera, el byte es el volumen de datos más pequeño que un ordenador puede utilizar en el almacenamiento y procesamiento de datos.'),(12,'¿Qué es un router?','Un router es un dispositivo de red que se encarga de llevar por la ruta adecuada el tráfico. En tu casa seguramente tendrás uno que es el que te conecta con Internet. Los routers funcionan utilizando direcciones IP para saber a donde tienen que ir los paquetes de datos cuando se compra el servicio.');
/*!40000 ALTER TABLE `frequent_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'/products/product_1_img_1.jpg'),(2,'/products/product_1_img_2.webp'),(3,'/products/product_1_img_3.jpg'),(4,'/products/product_1_img_4.jpg'),(5,'/products/product_2_img_5.jpg'),(6,'/products/product_2_img_6.webp'),(7,'/products/product_2_img_7.webp'),(8,'/products/product_2_img_8.jpg'),(9,'/products/product_3_img_9.jpg'),(10,'/products/product_3_img_10.webp'),(11,'/products/product_3_img_11.jpg'),(12,'/products/product_3_img_12.webp'),(13,'/products/product_4_img_13.webp'),(14,'/products/product_4_img_14.webp'),(15,'/products/product_4_img_15.jpg'),(16,'/products/product_4_img_16.jpg'),(17,'/products/product_5_img_17.jpg'),(18,'/products/product_5_img_18.jpg'),(19,'/products/product_5_img_19.jpg'),(20,'/products/product_5_img_20.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `ui_params` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Insuperable','{\"img\": \"plan03\", \"bgcolor\": \"bg-maincolor\"}'),(2,'Premium','{\"img\": \"plan03\", \"bgcolor\": \"bg-maincolor2\"}'),(3,'Premium','{\"img\": \"plan02\", \"bgcolor\": \"bg-maincolor3\"}'),(4,'Básico','{\"img\": \"plan01\", \"bgcolor\": \"bg-maincolor4\"}'),(5,'Premium','{\"img\": \"plan03\", \"bgcolor\": \"bg-maincolor\"}'),(6,'Plus','{\"img\": \"plan02\", \"bgcolor\": \"bg-maincolor2\"}'),(7,'Básico','{\"img\": \"plan01\", \"bgcolor\": \"bg-maincolor3\"}'),(8,'Plus','{\"img\": \"plan02\", \"bgcolor\": \"bg-maincolor2\"}'),(9,'Básico','{\"img\": \"plan01\", \"bgcolor\": \"bg-maincolor3\"}'),(10,'Plus','{\"img\": \"plan02\", \"bgcolor\": \"bg-maincolor3\"}');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16),(5,17),(5,18),(5,19),(5,20);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `price` double NOT NULL,
  `previous_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tenda Router F9','Con el access point Tenda vas a poder interconectar redes inalámbricas logrando así una conexión estable y segura entre la red y el dispositivo de destino. Con el router Tenda F9 podrás establecer redes potentes para enviar y recibir información a gran velocidad. Con una banda de 2.4 Hz, el alcance de la señal será excelente para que puedas utilizar tus aparatos electrónicos en cualquier parte',156.186,186.186),(2,'Tenda Router N301','Con el router Tenda N301 podrás establecer redes potentes para enviar y recibir información a gran velocidad. Con el access point Tenda vas a poder interconectar redes inalámbricas logrando así una conexión estable y segura entre la red y el dispositivo de destino. Con una banda de 2.4 Hz, el alcance de la señal será excelente para que puedas utilizar tus aparatos electrónicos en cualquier parte.',50,0),(3,'ONU FTTH ZTE F663NV3','C Wifi 2.4 802.11 b/g/n, 1 Puerto Gigabit Ethernet, 3 Puerto Fast Ethernet',120,0),(4,'AP Tp-link Omada AC1350','Con la última generación de Wi-Fi 802.11ac Wave 2, el EAP225 da con facilidad velocidades WiFi en doble banda de hasta 1350Mbps a múltiples dispositivos al mismo tiempo. El controlador Omada OC200 y el Controlador Software hacen muy fácil la administración y monitorización de la red Omada completa en tiempo real, mientras que los servicios cloud posibilitan un acceso seguro y remoto, sin importar donde se encuentra fñisicamente usted.',417900,498900),(5,'ONU C-Data FD512','R310 1GE+1FE+WIFI XPON ONU – Interfaz Ethernet 1 * 10/100 / 1000M y 1 * 10 / 100M, 1 interfaz adaptable EPON / GPON, soporte wifi de 300mbps; carcasa de plástico, alimentación externa.',115,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `product_id` int NOT NULL,
  `category_name` varchar(100) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `category_name` (`category_name`),
  CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`category_name`) REFERENCES `categories` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES (1,'promotion'),(2,'available'),(2,'top'),(3,'available'),(3,'top'),(4,'promotion'),(5,'available');
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'500','bandwidth'),(2,'120','bandwidth'),(3,'100','bandwidth'),(4,'90','bandwidth'),(5,'80','bandwidth'),(6,'70','bandwidth'),(7,'60','bandwidth'),(8,'50','bandwidth'),(9,'40','bandwidth'),(10,'30','bandwidth'),(11,'20','bandwidth'),(12,'10','bandwidth'),(13,'5','bandwidth'),(14,'200','bandwidth'),(15,'Soporte Especializado','sorporte'),(16,'Canales Full HD y SD','canales'),(17,'75 Canales TV','tv'),(18,'62 Canales Tv','tv');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_plans`
--

DROP TABLE IF EXISTS `services_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_plans` (
  `plan_id` int NOT NULL,
  `service_id` int NOT NULL,
  KEY `plan_id` (`plan_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `services_plans_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `services_plans_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_plans`
--

LOCK TABLES `services_plans` WRITE;
/*!40000 ALTER TABLE `services_plans` DISABLE KEYS */;
INSERT INTO `services_plans` VALUES (1,1),(1,15),(1,16),(1,18),(2,2),(2,15),(2,16),(2,18),(3,5),(3,15),(3,16),(3,18),(5,5),(5,15),(5,16),(5,17),(7,10),(7,15),(7,16),(7,17),(8,12),(8,15),(9,13),(9,15),(6,8),(6,15),(6,16),(6,17),(4,9),(4,15),(4,16),(4,18),(10,5),(10,15),(10,16),(10,18);
/*!40000 ALTER TABLE `services_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(500) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Root','root@intalnet.com','$2a$10$PPH9bE37oYTijDD0dv.eYObs3muu/VdJSDxKpgMIav309UIErwaMW','superuser',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-20  0:23:32
