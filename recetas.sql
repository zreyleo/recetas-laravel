-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: localhost    Database: recetas
-- ------------------------------------------------------
-- Server version	5.7.30-log

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Mariscos','2021-05-16 06:54:43','2021-05-16 06:54:43'),(2,'Carnes','2021-05-16 06:54:43','2021-05-16 06:54:43'),(3,'Camida Rapida','2021-05-16 06:54:43','2021-05-16 06:54:43'),(4,'Postres','2021-05-16 06:54:43','2021-05-16 06:54:43'),(5,'Ensaladas','2021-05-16 06:54:43','2021-05-16 06:54:43'),(6,'Bebidas','2021-05-16 06:54:43','2021-05-16 06:54:43'),(7,'Sopas','2021-05-16 06:54:43','2021-05-16 06:54:43'),(8,'Desayunos','2021-05-20 20:55:17','2021-05-20 20:55:17');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_receta`
--

DROP TABLE IF EXISTS `likes_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_receta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `receta_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_receta_user_id_foreign` (`user_id`),
  KEY `likes_receta_receta_id_foreign` (`receta_id`),
  CONSTRAINT `likes_receta_receta_id_foreign` FOREIGN KEY (`receta_id`) REFERENCES `recetas` (`id`),
  CONSTRAINT `likes_receta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_receta`
--

LOCK TABLES `likes_receta` WRITE;
/*!40000 ALTER TABLE `likes_receta` DISABLE KEYS */;
INSERT INTO `likes_receta` VALUES (3,1,8,NULL,NULL),(4,1,9,NULL,NULL),(7,1,1,NULL,NULL),(8,2,1,NULL,NULL),(12,1,7,NULL,NULL);
/*!40000 ALTER TABLE `likes_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_05_12_153359_create_recetas_table',1),(5,'2021_05_16_011727_create_perfils_table',1),(6,'2021_05_19_160704_create_likes_receta_pivot_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfils`
--

DROP TABLE IF EXISTS `perfils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfils` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `biografia` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfils_user_id_foreign` (`user_id`),
  CONSTRAINT `perfils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfils`
--

LOCK TABLES `perfils` WRITE;
/*!40000 ALTER TABLE `perfils` DISABLE KEYS */;
INSERT INTO `perfils` VALUES (1,1,'<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent finibus turpis id feugiat pretium. Cras fermentum velit fringilla diam fermentum, eget placerat dolor gravida. Donec in libero fermentum, convallis nisi non, pellentesque mauris.<br>Proin porttitor nec sapien ac interdum. Praesent congue bibendum turpis a imperdiet. Ut hendrerit est sed faucibus facilisis. Aenean convallis felis eu enim maximus, nec dictum diam euismod. Aenean semper venenatis elit ac lacinia.<br>Mauris porttitor arcu vitae leo viverra, vitae scelerisque mi malesuada. Nunc iaculis mollis velit sit amet posuere. <strong>Maecenas libero nisi</strong>, venenatis in metus id, pharetra mollis purus.</div>','uploads-perfiles/3F7hNXYwWosZfv1d5928OlDDKnrooSg532AO6p9v.png','2021-05-16 06:54:43','2021-05-18 19:13:09'),(2,2,'<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-perfiles/0GfEbmcmzj2qNtTEa6yDgLJlvNNrPfinjB2WJ2GG.jpg','2021-05-16 06:54:43','2021-05-19 03:49:25'),(3,3,NULL,NULL,'2021-05-20 21:48:18','2021-05-20 21:48:18');
/*!40000 ALTER TABLE `perfils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preparacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recetas_categoria_id_foreign` (`categoria_id`),
  KEY `recetas_user_id_foreign` (`user_id`),
  CONSTRAINT `recetas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `recetas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,'Pescado Apanado','<ul><li>Pescado Picudo</li><li>Pan Molido</li><li>Sal</li><li>Huevo</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat interdum est a faucibus. Nullam mattis, tellus et sagittis aliquet, ex nisi eleifend libero, vel iaculis risus sem eget metus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean dictum convallis pulvinar. Nunc sem nisi, vulputate nec tellus ultrices, iaculis commodo odio. In facilisis leo urna, in ornare ante efficitur id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum nec erat nunc. Quisque dictum nisl in ex porta, sed congue lacus rhoncus. Praesent dui mi, interdum aliquet consectetur ac, volutpat in dui. Morbi justo tellus, maximus id dapibus vitae, accumsan eu risus. Sed blandit sollicitudin sollicitudin.</div>','uploads-recetas/m0y8iT20HJkMyXDhMn4WRaXn0EXbXsyu8B6AnYRU.jpg',1,1,'2021-05-18 20:30:06','2021-05-20 22:41:31'),(3,'Carne Asada','<ul><li>Carne de Res</li><li>Sal</li><li>Salsa BBQ</li><li>Mostaza</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/66UwVXgHGlR7yG6PShRYoK0bszZU70wZvtF5riB4.jpg',2,2,'2021-05-19 03:32:59','2021-05-19 03:32:59'),(4,'Pancakes con Miel','<ul><li>Harina</li><li>Huevos</li><li>Sal</li><li>Azucar</li><li>Leche</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/BxguQyKIRpWLL6vcc4BOYfubSpQl2k7EawKAaCgn.jpg',4,2,'2021-05-19 03:34:23','2021-05-19 03:34:23'),(5,'Ensalada de Esparragos','<ul><li>Esparragos</li><li>Huevos</li><li>Sal</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/PHESOeWctKMHQR87zSZQMJlS6cM1k4IH3CFaxf8B.jpg',5,1,'2021-05-19 03:35:42','2021-05-19 03:35:42'),(6,'Huevos con Jamon','<ul><li>Huevos</li><li>Jamon</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/jebCo3XoU3L3OBHDX7pCIc37pc1PO58U0aZKNIPV.jpg',3,1,'2021-05-19 03:36:39','2021-05-19 03:36:39'),(7,'Hamburguesas','<ul><li>Carne Molida</li><li>Sal</li><li>Lechuga</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/JERkcWnPgXPA6gfECokJbIwMaqsa4qWXtrGy50DF.jpg',3,1,'2021-05-19 03:37:52','2021-05-19 03:37:52'),(8,'Pizza Tradicional','<ul><li>Harina</li><li>Huevos</li><li>Agua</li><li>Jam├│n</li><li>Queso</li><li>Champi├▒├│n</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/GmC4IyCiW6mR2qMeTGWI91ExAidSImg9ljjBwqIe.jpg',3,1,'2021-05-19 03:38:57','2021-05-19 03:38:57'),(9,'Parrillada Argentina','<ul><li>Carne de Res</li><li>Carne de Cerdo</li><li>Chorizo</li><li>Pollo</li><li>Cebolla</li></ul>','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a erat ut ante porttitor aliquet ac placerat justo. Pellentesque malesuada mi ut lacinia mattis. Duis magna neque, mollis sed sapien sed, vehicula ullamcorper sem. Suspendisse non pellentesque nisi, a eleifend tellus. Vivamus semper eleifend leo sed semper. Nam aliquam nulla tellus. Proin mollis lorem ac iaculis dignissim. Sed aliquet tortor eget risus rhoncus, nec hendrerit erat lobortis. Sed vitae tortor feugiat, iaculis purus ut, vestibulum neque. Aliquam nunc felis, fermentum vitae viverra at, euismod eu mi. Pellentesque ac est auctor, tempus odio vel, bibendum lectus. Aliquam ut libero ligula. Nulla ac urna convallis nibh gravida sodales sed id neque. In ultricies dapibus molestie.</div>','uploads-recetas/SS1jIoWlmEHqD7x3OQBhpp01xEBXggkDnBM1FC8a.jpg',2,2,'2021-05-19 03:40:08','2021-05-19 03:40:08'),(10,'Desayuno Continental','<ul><li>Huevos</li><li>Caf├®</li><li>Leche</li><li>Harina</li><li>Cocoa</li><li>Azucar</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.<br>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.<br>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/yWiEd5SJpXrj33px4MQbic2FT0uInCRG6AnH9VMy.jpg',8,3,'2021-05-20 21:51:50','2021-05-20 21:51:50'),(11,'Jugo de Naranja con Alcohol','<ul><li>Naranja</li><li>Agua</li><li>Vodka</li><li>Hielo</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/631YiKDnoLij0MWoL851fkF6zbmIn6LJP57CEWHB.jpg',6,3,'2021-05-20 22:10:54','2021-05-20 22:10:54'),(12,'Tortilla de Harina con Moras','<ul><li>Harina</li><li>Agua</li><li>Moras</li><li>Azucar</li><li>Miel</li><li>Mermelada de Frutos Rojos (Fresas o Moras)</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/m6DG2cFezLHwRxhO1PZGggBWVJq00BSHpmkLLMc6.jpg',4,3,'2021-05-20 22:14:03','2021-05-20 22:14:03'),(13,'Sopa de Pollo de la Abuelita','<ul><li>Agua</li><li>Pollo</li><li>Sal</li><li>Condimento para Sopas</li><li>Arroz</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/y6VrCFAo52LuoaNXrJBJm8ArsCUvo3UeoE2bAIOt.jpg',7,3,'2021-05-20 22:18:43','2021-05-20 22:18:43'),(14,'Snacks Estilo Europeo','<ul><li>Jam├│n</li><li>Salami</li><li>Queso</li><li>Pan tostado</li><li>Mostaza</li><li>Picante</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/KytP6LfgcSsGixheaN8aajs7jrbLlGJ6x96KGD7O.jpg',3,3,'2021-05-20 22:21:10','2021-05-20 22:48:58'),(15,'Salmon al Vapor','<ul><li>Salm├│n</li><li>Lechuga</li><li>Sal</li><li>Pimienta</li><li>Pimiento</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/CpWEyQUQxUZP5wLuG6vNIdLDMkDJ4jzYZsAI5IVR.jpg',1,3,'2021-05-20 22:22:18','2021-05-20 22:22:18'),(16,'Tarta de Queso con Mermelada','<ul><li>Harina</li><li>Queso</li><li>Mermelada de frutos rojos</li><li>Sal</li><li>Mantequilla</li></ul>','<div>Ut lobortis ultricies ex ac rutrum. Suspendisse dapibus nisi id hendrerit congue. Etiam posuere aliquam accumsan. Pellentesque eleifend id odio vitae mattis. Nunc interdum posuere libero id interdum. Mauris ornare faucibus cursus. Curabitur mattis ultricies ante. Nullam gravida sem non ex malesuada, a pretium augue luctus.</div>','uploads-recetas/qbt5JeCab1diqj1gNyywwXqVXmKElXnoBXFz3Nyp.jpg',4,3,'2021-05-20 22:39:18','2021-05-20 22:39:18'),(17,'Encebollado de Albacora','<ul><li>Albcora</li><li>Yuca</li><li>Sal</li><li>Pimienta</li><li>Cilantro</li><li>Cebolla</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/JOnS1zqMQzCZhF5YGpYWKfHNZN8ihrRSEQuOF2SV.jpg',7,2,'2021-05-20 22:48:11','2021-05-20 22:48:11'),(18,'Estofado de Carne','<ul><li>Carne de res</li><li>Sal</li><li>Pimiento</li><li>Chile</li><li>Pimienta</li><li>Papa</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/SoBAA3hoMjmFJIywHgtMLjquhfFj3hQlTaNxxdFU.jpg',2,2,'2021-05-20 22:51:36','2021-05-20 22:51:36'),(19,'Crema de Espinaca','<ul><li>Zanahoria</li><li>Brocoli</li><li>Espinaca</li><li>Leche</li><li>Sal</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/jedBtSnkYEDEXPhaiwNM8jHkozQAKVi9gFgfapiD.jpg',7,2,'2021-05-20 22:56:00','2021-05-20 22:56:00'),(20,'Camotillo Ecuatoriano','<ul><li>Camotillo</li><li>Lechuga</li><li>Lim├│n</li><li>Sal</li><li>Pimienta</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/Z11YMMZFSCVfqNvXiRIrEBb9yXfkxgeGEyNuQqV3.jpg',1,2,'2021-05-20 22:59:17','2021-05-20 22:59:17'),(21,'Ensalada de At├║n','<ul><li>At├║n</li><li>Lechuga</li><li>Lim├│n</li><li>Sal</li><li>Pimienta</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/PMFyet5Z3Kjcahbpa9JPVbBdqFZrfOoB3mCyOYGL.jpg',5,2,'2021-05-20 23:00:44','2021-05-20 23:00:44'),(22,'Ensalada de Pollo','<ul><li>Pollo</li><li>Lechuga</li><li>Sal</li><li>Pimienta</li><li>Tomate</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/66KdesA5Gqn9VKzTBzQxd38OdBFAT0Rwa2GGcZUC.jpg',5,2,'2021-05-20 23:03:12','2021-05-20 23:03:12'),(23,'Jugo para Bajar de Peso','<ul><li>Lim├│n</li><li>Pepino</li><li>Manzana</li><li>Agua</li><li>Stevia</li><li>Apio</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/imPZIYk18uBUi5KXqdJ1jFteujZcI5Sbiwn1PCJo.jpg',6,1,'2021-05-20 23:05:47','2021-05-20 23:05:47'),(24,'Marini de Sand├¡a','<ul><li>Sandia</li><li>Hielo</li><li>Azucar</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/7hFvOn2o6hfWa9P3jVjTXUETuVKRuUIDx9HhVnPo.jpg',6,1,'2021-05-20 23:08:38','2021-05-20 23:08:38'),(25,'Desayuno Americano','<ul><li>Huevos</li><li>Tocino</li><li>Sal</li><li>Pan</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/ReRJWUGcLGySbqxw3Q0Ta05mXH7HHZ7lMJvMdWd8.jpg',8,3,'2021-05-20 23:11:01','2021-05-20 23:11:01'),(26,'Desayuno Saludable','<ul><li>Zanahoria</li><li>Manzana</li><li>T├® verde</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/1X2Q6ZVeNcjL4hqzSwyif93lk8yGHdeQ932dlFwm.jpg',8,3,'2021-05-20 23:11:41','2021-05-20 23:11:41'),(27,'Caf├® Expresso','<ul><li>Caf├®</li><li>Az├║car (opcional)</li></ul>','<div>Maecenas aliquam mattis massa ut euismod. Aliquam consectetur leo a faucibus vehicula. Nunc eget consequat ipsum. Nam ullamcorper felis eget magna pulvinar, et congue leo blandit. Quisque ut elit id ante ultricies tempor eu eu eros. Duis nisl orci, placerat at arcu non, dapibus finibus urna. Maecenas volutpat lobortis risus in venenatis. Quisque aliquam tortor at eleifend lobortis. Ut sit amet est vitae nibh viverra lacinia.</div>','uploads-recetas/1ZRzWfOdcxg7ZEWxpvzPPQDDQ7SaRpspvr5OjLHD.jpg',6,1,'2021-05-20 23:13:23','2021-05-20 23:13:23');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Regynald Zambrano','correo@correo.com',NULL,'$2y$10$g6L3ZeK.IFmGH3AAK0F/h.b7HuZ64f469Lc3LDEJP.ITKHL0uau7q','http://zreyleo-code.com',NULL,'2021-05-16 06:54:43','2021-05-18 18:49:33'),(2,'Leonardo','correo2@correo.com',NULL,'$2y$10$stKfDbzr1pXBW4UHLz6bOucorVXaNf.d0X8ph0sFvHPx8EuRTUKDe','http://zreyleo-code.com',NULL,'2021-05-16 06:54:43','2021-05-19 03:49:25'),(3,'Andr├®s Salvador','correo3@correo.com',NULL,'$2y$10$UBIFYR2C0kcDsqd4fv0ZbuxM0RIa5NwbCqob1ByqGzdgmLft3s3gO',NULL,NULL,'2021-05-20 21:48:18','2021-05-20 21:48:18');
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

-- Dump completed on 2021-05-20 13:26:53
