-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cmss
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_category_parent_idx` (`parent_id`),
  CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Программирование','programming',NULL,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(2,'Дизайн','design',NULL,2,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(3,'Маркетинг','marketing',NULL,3,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(4,'Бизнес','business',NULL,4,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(5,'PHP','php',1,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(6,'JavaScript','javascript',1,2,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(7,'Python','python',1,3,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(8,'Java','java',1,4,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(9,'Базы данных','databases',1,5,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(10,'Веб-дизайн','web-design',2,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(11,'Графический дизайн','graphic-design',2,2,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(12,'UI/UX','ui-ux',2,3,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(13,'Логотипы','logos',2,4,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(14,'Laravel','laravel',5,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(15,'Symfony','symfony',5,2,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(16,'React','react',6,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(17,'Vue.js','vue-js',6,2,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(18,'Django','django',7,1,'2025-12-09 08:28:13','2025-12-09 08:28:13'),(19,'Flask','flask',7,2,'2025-12-09 08:28:13','2025-12-09 08:28:13');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(50) NOT NULL,
  `permission_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_code_UNIQUE` (`permission_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'SYS_ADMIN','Администрирование','Полный доступ к системе'),(2,'USER_MANAGE','Управление пользователями','Создание и редактирование пользователей'),(3,'CONTENT_CREATE','Создание контента','Добавление новых материалов'),(4,'CONTENT_EDIT','Редактирование контента','Изменение существующих материалов'),(5,'CONTENT_DELETE','Удаление контента','Удаление материалов'),(6,'CONTENT_PUBLISH','Публикация','Публикация и снятие с публикации'),(7,'PRODUCT_MANAGE','Управление товарами','Работа с товарами магазина'),(8,'ORDER_MANAGE','Управление заказами','Обработка заказов клиентов'),(9,'MEDIA_UPLOAD','Загрузка медиа','Загрузка файлов и изображений'),(10,'SETTINGS_VIEW','Просмотр настроек','Просмотр системных настроек');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `fk_tag_idx` (`tag_id`),
  CONSTRAINT `fk_post_tags_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tags_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(5,1),(6,1),(5,2),(6,2),(2,3),(7,3),(8,3),(7,4),(8,5),(4,6),(9,6),(12,6),(9,7),(4,8),(1,9),(11,9),(3,11),(14,11),(3,12),(13,12),(3,13),(14,13),(1,19),(2,19),(4,19),(11,19),(13,19),(3,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `view_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_post_author_idx` (`author_id`),
  KEY `fk_post_category_idx` (`category_id`),
  KEY `idx_status_published` (`status`,`published_at`),
  CONSTRAINT `fk_post_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,5,'Основы PHP для начинающих','osnovy-php-dlya-nachinayushchih','PHP - это популярный язык программирования...','published','2025-03-10 09:00:00','2025-12-09 08:28:28','2025-12-09 08:28:28',1250),(2,2,6,'Введение в JavaScript','vvedenie-v-javascript','JavaScript позволяет создавать интерактивные веб-страницы...','published','2025-03-12 11:30:00','2025-12-09 08:28:28','2025-12-09 08:28:28',890),(3,3,10,'Современный веб-дизайн 2025','sovremennyj-veb-dizajn-2025','Тренды веб-дизайна постоянно меняются...','published','2025-03-15 14:15:00','2025-12-09 08:28:28','2025-12-09 08:28:28',2100),(4,4,7,'Python для анализа данных','python-dlya-analiza-dannyh','Python и библиотеки Pandas, NumPy...','published','2025-03-01 10:00:00','2025-12-09 08:28:28','2025-12-09 08:28:28',3150),(5,1,11,'Полное руководство по Laravel','polnoe-rukovodstvo-po-laravel','Laravel - современный PHP фреймворк...','draft',NULL,'2025-12-09 08:28:28','2025-12-09 08:28:28',0),(6,2,12,'Symfony vs Laravel: что выбрать?','symfony-vs-laravel-chto-vybrat','Сравнение двух популярных PHP фреймворков...','draft',NULL,'2025-12-09 08:28:28','2025-12-09 08:28:28',0),(7,3,13,'React Hooks в деталях','react-hooks-v-detalyah','Хуки появились в React 16.8...','draft',NULL,'2025-12-09 08:28:28','2025-12-09 08:28:28',0),(8,4,14,'Vue.js 3: что нового','vue-js-3-chto-novogo','Vue.js 3 принес много улучшений...','draft','2025-04-01 08:00:00','2025-12-09 08:28:28','2025-12-09 08:28:28',0),(9,1,15,'Django для быстрой разработки','django-dlya-bystroj-razrabotki','Django - фреймворк для перфекционистов...','draft','2025-03-25 12:00:00','2025-12-09 08:28:28','2025-12-09 08:28:28',0),(10,2,8,'Java для веб-разработки','java-dlya-veb-razrabotki','Статья о использовании Java в вебе...','archived','2024-01-15 10:00:00','2025-12-09 08:28:28','2025-12-09 08:28:28',450),(11,3,9,'Основы MySQL','osnovy-mysql','Руководство по основам MySQL...','archived','2023-11-20 14:30:00','2025-12-09 08:28:28','2025-12-09 08:28:28',320),(12,4,16,'Flask: микрофреймворк для Python','flask-mikrofrejmvork-dlya-python','Flask - минималистичный фреймворк...','published','2025-03-05 16:45:00','2025-12-09 08:28:28','2025-12-09 08:28:28',780),(13,1,17,'UI/UX принципы для разработчиков','ui-ux-principy-dlya-razrabotchikov','Разработчикам важно понимать основы дизайна...','published','2025-03-08 13:20:00','2025-12-09 08:28:28','2025-12-09 08:28:28',1100),(14,2,18,'Создание логотипов в Figma','sozdanie-logotipov-v-figma','Figma отлично подходит для дизайна логотипов...','published','2025-02-28 09:15:00','2025-12-09 08:28:28','2025-12-09 08:28:28',950);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `granted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `fk_permission_idx` (`permission_id`),
  CONSTRAINT `fk_role_permissions_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_permissions_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1,'2025-12-08 13:09:44'),(1,2,'2025-12-08 13:09:44'),(1,3,'2025-12-08 13:09:44'),(1,4,'2025-12-08 13:09:44'),(1,5,'2025-12-08 13:09:44'),(1,6,'2025-12-08 13:09:44'),(1,7,'2025-12-08 13:09:44'),(1,8,'2025-12-08 13:09:44'),(1,9,'2025-12-08 13:09:44'),(1,10,'2025-12-08 13:09:44'),(2,2,'2025-12-08 13:09:44'),(2,3,'2025-12-08 13:09:44'),(2,4,'2025-12-08 13:09:44'),(2,5,'2025-12-08 13:09:44'),(2,6,'2025-12-08 13:09:44'),(2,7,'2025-12-08 13:09:44'),(2,8,'2025-12-08 13:09:44'),(3,3,'2025-12-08 13:09:44'),(3,4,'2025-12-08 13:09:44'),(3,6,'2025-12-08 13:09:44'),(3,9,'2025-12-08 13:09:44'),(3,10,'2025-12-08 13:09:44'),(4,3,'2025-12-08 13:09:44'),(4,4,'2025-12-08 13:09:44'),(4,9,'2025-12-08 13:09:44'),(5,10,'2025-12-08 13:09:44');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор','Полный доступ ко всем функциям CMS'),(2,'Менеджер','Управление контентом и магазином'),(3,'Редактор','Редактирование и публикация'),(4,'Автор','Создание контента'),(5,'Пользователь','Базовый доступ');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'PHP','php','2025-12-09 08:28:23'),(2,'Laravel','laravel','2025-12-09 08:28:23'),(3,'JavaScript','javascript','2025-12-09 08:28:23'),(4,'React','react','2025-12-09 08:28:23'),(5,'Vue.js','vue-js','2025-12-09 08:28:23'),(6,'Python','python','2025-12-09 08:28:23'),(7,'Django','django','2025-12-09 08:28:23'),(8,'Базы данных','databases','2025-12-09 08:28:23'),(9,'MySQL','mysql','2025-12-09 08:28:23'),(10,'PostgreSQL','postgresql','2025-12-09 08:28:23'),(11,'Веб-дизайн','web-design','2025-12-09 08:28:23'),(12,'UI/UX','ui-ux','2025-12-09 08:28:23'),(13,'Figma','figma','2025-12-09 08:28:23'),(14,'Adobe Photoshop','adobe-photoshop','2025-12-09 08:28:23'),(15,'Иллюстрация','illustration','2025-12-09 08:28:23'),(16,'Стартапы','startups','2025-12-09 08:28:23'),(17,'Маркетинг','marketing','2025-12-09 08:28:23'),(18,'SEO','seo','2025-12-09 08:28:23'),(19,'Аналитика','analytics','2025-12-09 08:28:23'),(20,'Обучающие материалы','tutorials','2025-12-09 08:28:23'),(21,'Новости','news','2025-12-09 08:28:23'),(22,'Советы','tips','2025-12-09 08:28:23'),(23,'Интервью','interview','2025-12-09 08:28:23');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_idx` (`role_id`),
  CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,'2025-12-08 13:09:44'),(2,2,'2025-12-08 13:09:44'),(3,2,'2025-12-08 13:09:44'),(4,3,'2025-12-08 13:09:44'),(5,3,'2025-12-08 13:09:44'),(6,4,'2025-12-08 13:09:44'),(7,4,'2025-12-08 13:09:44'),(8,5,'2025-12-08 13:09:44'),(9,5,'2025-12-08 13:09:44');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `fk_user_sessions_user_idx` (`user_id`),
  CONSTRAINT `fk_user_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (21,1,'2025-03-20 14:00:00','2025-03-20 14:25:00'),(22,2,'2025-03-19 16:00:00','2025-03-19 16:40:00'),(23,3,'2025-03-18 12:30:00','2025-03-18 13:20:00'),(24,4,'2025-03-17 09:45:00','2025-03-17 10:15:00'),(25,5,'2025-03-10 11:00:00','2025-03-10 12:30:00'),(26,6,'2025-03-19 17:00:00','2025-03-19 17:45:00'),(27,7,'2025-03-12 10:30:00','2025-03-12 11:20:00'),(28,8,'2025-02-28 14:00:00','2025-02-28 15:30:00'),(29,9,'2025-03-27 11:00:00','2025-05-28 15:45:00'),(30,10,'2025-03-20 08:30:00','2025-03-20 09:15:00');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` timestamp NULL DEFAULT NULL,
  `userscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@cms25.ru','+79161111111','hash_admin_2025','Александр','Иванов','2025-01-15 06:30:00',1,'2025-03-20 11:25:00',NULL),(2,'manager1','manager1@cms25.ru','+79161111112','hash_mgr1_2025','Екатерина','Петрова','2025-02-10 07:15:00',1,'2025-03-19 13:40:00',NULL),(3,'manager2','manager2@cms25.ru','+79161111113','hash_mgr2_2025','Михаил','Сидоров','2025-02-20 08:45:00',1,'2025-03-18 10:20:00',NULL),(4,'editor1','editor1@cms25.ru','+79161111114','hash_ed1_2025','Ольга','Кузнецова','2025-02-25 11:30:00',1,'2025-03-17 07:15:00',NULL),(5,'editor2','editor2@cms25.ru','+79161111115','hash_ed2_2025','Анна','Смирнова','2025-03-01 05:20:00',0,'2025-03-10 09:30:00',NULL),(6,'author1','author1@cms25.ru','+79161111116','hash_auth1_2025','Дмитрий','Попов','2025-03-05 06:00:00',1,'2025-03-19 14:45:00',NULL),(7,'author2','author2@cms25.ru','+79161111117','hash_auth2_2025','Мария','Васильева','2025-03-10 10:15:00',0,'2025-03-12 08:20:00',NULL),(8,'user1','user1@cms25.ru','+79161111118','hash_usr1_2025','Сергей','Федоров','2024-03-15 07:00:00',0,'2025-02-28 12:30:00',NULL),(9,'user2','user2@cms25.ru','+79161111119','hash_usr2_2025','Наталья','Морозова','2024-01-20 11:45:00',0,NULL,NULL),(10,'user3','user3@cms25.ru','+79161111120','hash_usr3_2025','Павел','Волков','2025-03-18 13:20:00',1,'2025-03-20 06:15:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cmss'
--

--
-- Dumping routines for database 'cmss'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11  9:56:13
