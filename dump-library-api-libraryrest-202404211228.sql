-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: libraryrest
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add config',6,'add_config'),(22,'Can change config',6,'change_config'),(23,'Can delete config',6,'delete_config'),(24,'Can view config',6,'view_config'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add book',8,'add_book'),(30,'Can change book',8,'change_book'),(31,'Can delete book',8,'delete_book'),(32,'Can view book',8,'view_book'),(33,'Can add borrow',9,'add_borrow'),(34,'Can change borrow',9,'change_borrow'),(35,'Can delete borrow',9,'delete_borrow'),(36,'Can view borrow',9,'view_borrow'),(37,'Can add book borrow log',10,'add_bookborrowlog'),(38,'Can change book borrow log',10,'change_bookborrowlog'),(39,'Can delete book borrow log',10,'delete_bookborrowlog'),(40,'Can view book borrow log',10,'view_bookborrowlog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_borrow_log`
--

DROP TABLE IF EXISTS `book_borrow_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_borrow_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fine` int unsigned NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `borrow_id` bigint DEFAULT NULL,
  `config_id` bigint DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_borrow_log_book_id_c33ae82c_fk_books_id` (`book_id`),
  KEY `book_borrow_log_borrow_id_7f6d875a_fk_borrow_id` (`borrow_id`),
  KEY `book_borrow_log_config_id_3b52f151_fk_config_id` (`config_id`),
  CONSTRAINT `book_borrow_log_book_id_c33ae82c_fk_books_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_borrow_log_borrow_id_7f6d875a_fk_borrow_id` FOREIGN KEY (`borrow_id`) REFERENCES `borrow` (`id`),
  CONSTRAINT `book_borrow_log_config_id_3b52f151_fk_config_id` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  CONSTRAINT `book_borrow_log_chk_1` CHECK ((`fine` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_borrow_log`
--

LOCK TABLES `book_borrow_log` WRITE;
/*!40000 ALTER TABLE `book_borrow_log` DISABLE KEYS */;
INSERT INTO `book_borrow_log` VALUES (1,0,'2024-02-11 19:16:26.575382',1,1,NULL,NULL),(2,0,'2024-02-11 19:16:33.901711',2,2,NULL,NULL),(3,0,'2024-02-11 19:16:39.623930',6,3,NULL,NULL),(4,0,'2024-02-11 19:16:46.273581',2,4,NULL,NULL),(5,0,'2024-02-11 19:16:55.327215',4,5,NULL,NULL),(6,0,'2024-02-11 19:17:07.843574',6,6,NULL,NULL),(67,6,'2024-02-12 21:10:56.045080',2,4,1,'2024-02-08 00:00:00.000000'),(68,6,'2024-02-12 21:10:56.045080',2,4,1,'2024-02-09 00:00:00.000000'),(69,6,'2024-02-12 21:10:56.045080',2,4,1,'2024-02-10 00:00:00.000000'),(70,6,'2024-02-12 21:10:56.045080',2,4,1,'2024-02-11 00:00:00.000000'),(71,6,'2024-02-12 21:10:56.069405',4,5,1,'2024-02-08 00:00:00.000000'),(72,6,'2024-02-12 21:10:56.069405',4,5,1,'2024-02-09 00:00:00.000000'),(73,6,'2024-02-12 21:10:56.069405',4,5,1,'2024-02-10 00:00:00.000000'),(74,6,'2024-02-12 21:10:56.069405',4,5,1,'2024-02-11 00:00:00.000000'),(75,6,'2024-02-12 21:10:56.085018',6,6,1,'2024-02-08 00:00:00.000000'),(76,6,'2024-02-12 21:10:56.085018',6,6,1,'2024-02-09 00:00:00.000000'),(77,6,'2024-02-12 21:10:56.085018',6,6,1,'2024-02-10 00:00:00.000000'),(78,6,'2024-02-12 21:10:56.085018',6,6,1,'2024-02-11 00:00:00.000000');
/*!40000 ALTER TABLE `book_borrow_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `available` varchar(100) DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_id` bigint DEFAULT NULL,
  `updated_id` bigint DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_created_id_0d98a8f3` (`created_id`),
  KEY `books_updated_id_86de3c95` (`updated_id`),
  CONSTRAINT `books_created_id_0d98a8f3_fk_users_id` FOREIGN KEY (`created_id`) REFERENCES `users` (`id`),
  CONSTRAINT `books_updated_id_86de3c95_fk_users_id` FOREIGN KEY (`updated_id`) REFERENCES `users` (`id`),
  CONSTRAINT `books_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Koby Prosacco','Quod tempora quod ipsa quia officiis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 18:30:48.698796',1,1,NULL,NULL),(2,'Favian Ortiz','Neque accusamus at illo tenetur accusantium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(3,'Anabel Schumm','Et fuga quae quis modi ut earum.','1',2,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(4,'Simeon McDermott','Velit aspernatur numquam molestias reiciendis voluptatem reprehenderit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(5,'Brendon O\'Connell','Sequi voluptatibus sed omnis molestiae esse et iusto.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(6,'Lottie Mitchell','Fuga omnis dolorem doloribus enim et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(7,'Olin Kunde','Facere voluptates autem qui ipsum quidem nihil a at.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(8,'Ignatius Reichert','Est quae aliquid enim.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(9,'Mr. Nelson Waters','Quia dolorem nobis rem sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(10,'Kaela Koelpin Jr.','Ad eligendi tempore sunt sit voluptas delectus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(11,'Dr. Katheryn Upton','Est ducimus at qui sunt optio laboriosam illum placeat.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(12,'Dr. Olin Lind','Sunt atque debitis accusantium necessitatibus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(13,'Dr. Meagan Lang DDS','Sed ut sed sequi quaerat eius dolor quidem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(14,'Mr. Ralph Erdman DDS','Incidunt est in et nulla aut velit sit repudiandae.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(15,'Obie Howell','Nam ipsam et quibusdam aut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(16,'Karley Hagenes','Distinctio et et quia qui.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(17,'Michael Kuphal','Aspernatur aut accusantium et exercitationem saepe reiciendis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(18,'Jovanny Heidenreich','Laudantium repudiandae sunt placeat non reprehenderit commodi rerum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(19,'Erika Goldner','Aut molestiae nesciunt qui quibusdam dolorum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(20,'Stuart Schmeler','Qui esse est vero alias.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(21,'Mrs. Samantha Dietrich DDS','Facere voluptas hic reprehenderit ullam et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(22,'Prof. Cindy Howe DVM','Sunt nesciunt porro qui sint et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(23,'Gage Hayes','Nobis quisquam nihil quis rerum incidunt non doloribus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(24,'Randy Becker PhD','Ipsa excepturi illum qui est quis est enim.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(25,'Mr. Deshawn Orn III','Et et quaerat aut ea.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(26,'Prof. Keeley Ritchie IV','Ea eius nam est omnis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(27,'Anjali Doyle','Optio asperiores sunt commodi ut qui.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(28,'Miss Roselyn Morar','Earum fugiat ut error laborum esse autem nostrum nam.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(29,'Miss Elvie Littel IV','Officia suscipit ut incidunt laudantium sint commodi qui voluptas.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(30,'Destiney Cremin PhD','Laboriosam fuga recusandae distinctio distinctio debitis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(31,'Vada Morar','Soluta impedit molestiae assumenda beatae ducimus qui velit quia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(32,'Anya Walter','Velit harum non ratione.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(33,'Joey Lesch','Similique omnis at perspiciatis culpa.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(34,'Micaela Bode','Fugiat ipsa minima porro repellendus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(35,'Chelsie Hand','Molestiae aut et atque eius.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(36,'Van Lynch','Qui distinctio quaerat quo et quo qui corrupti.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(37,'Camille Abbott','Iste dolorem repellendus omnis nam debitis mollitia deleniti asperiores.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(38,'Ned Becker IV','Laboriosam earum atque quidem magni nostrum iure soluta.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(39,'Mr. Sherman Beer MD','Possimus non quis doloremque ex.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(40,'Alvis Bashirian','Assumenda adipisci earum et hic a.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(41,'Dr. Broderick Lesch DDS','Magnam blanditiis explicabo dolorum ut impedit quia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(42,'Wava Rice','Quis eaque perferendis molestiae veritatis quos expedita.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(43,'Miss Martine Bartoletti III','Aut nihil qui et eius voluptatem ex optio doloribus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(44,'Dr. Keaton McClure','Totam numquam consequatur doloribus non.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(45,'Mr. Francesco Stoltenberg V','Odit labore suscipit sunt.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(46,'Thea Hagenes','Et animi quia minus repudiandae.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(47,'Bruce Mertz','Quaerat sint necessitatibus quisquam quia provident et sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(48,'Marina Smith','Itaque qui suscipit veniam consequatur magni sed voluptatem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(49,'Carolyne Rogahn','Est et cum id rem et corporis ab.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(50,'Tyree Nienow','Reiciendis pariatur deserunt modi aut hic.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(51,'Nelle Batz','Facilis id eos quidem aut facilis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(52,'Art Gorczany','Quasi nulla consequatur est.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(53,'Milton Shanahan','Labore similique ut accusantium ullam nam quo soluta.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(54,'Aubree O\'Kon','Velit vero voluptatibus qui aut tempore consequatur ducimus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(55,'Coby Hagenes','Laudantium esse aliquam aliquam sint commodi sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(56,'Dr. Kiara Borer IV','Rerum neque voluptate velit animi sunt omnis aperiam.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(57,'Felicita Hickle','Aut porro repellat voluptatem dolores officiis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(58,'Trisha Rohan','Est quas ab et voluptatum voluptatem libero.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(59,'Marion Kerluke','Corporis dolor dignissimos enim minima officia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(60,'Mr. Colin Abbott','Deserunt voluptas at velit quidem ab tempore ipsa sed.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(61,'Christina Stroman','Eligendi quae sapiente dolores natus enim tempore.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(62,'Mohamed Hauck','Ex repellendus rem officia sed omnis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(63,'Miss Dandre Rippin','Rerum sunt ex sequi quia molestiae et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(64,'Johanna Gulgowski','Tenetur nemo quis cum et optio dicta expedita.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(65,'Dino Hill PhD','Recusandae beatae veritatis corporis id eaque aperiam maxime est.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(66,'Mrs. Kaitlyn Aufderhar','Inventore similique dolorum sed aut omnis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(67,'Mrs. Angelita Schaden DDS','Iusto autem molestiae est dolore aperiam est.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(68,'Laisha Parker III','Dignissimos et placeat voluptates officiis a nesciunt modi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(69,'Brooks Adams MD','Fuga ea et dicta ipsum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(70,'Helga Considine','Corrupti et quidem labore eveniet laborum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(71,'Samir Torp III','Tenetur maxime quam laboriosam necessitatibus nesciunt voluptas at.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(72,'Rosario Langosh','Autem nesciunt ipsum ab consequatur dignissimos et laborum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(73,'Allen Heidenreich','Aut nostrum ipsam quia maiores.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(74,'Dr. Milan Gibson I','Totam voluptatem aspernatur quia quos excepturi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(75,'Prof. Rafael Bergstrom DVM','Ducimus consequuntur laboriosam qui modi dicta eligendi quia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(76,'Carolanne Hoeger','Veniam quas molestias dolore et earum aut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(77,'Daryl Walker','Ut et rerum molestiae ratione in.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(78,'Earnestine Wolff','Quis quod earum mollitia cupiditate eius.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(79,'Mortimer Bins','Cum delectus omnis vero.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(80,'Hosea Reichel DDS','Et aperiam alias necessitatibus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(81,'Tressa Stiedemann','Similique esse inventore saepe minima accusamus et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(82,'Mr. Sam Krajcik DVM','Enim eum repudiandae commodi architecto veritatis nemo rerum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(83,'Mrs. Emelie White DVM','Et fuga omnis sunt aut sed.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(84,'Raheem Hahn','Ut praesentium quia voluptates quo.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(85,'Loren Leannon I','Corporis vitae porro consectetur a magnam natus ipsam.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(86,'Tara Stamm Jr.','Odit sunt magni qui molestiae in sed.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(87,'Emilio Nitzsche Sr.','Ratione impedit quasi architecto dicta maiores ea aut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(88,'Magali Torphy','Ratione et et quia deserunt neque quos.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(89,'Bryce Littel','Earum voluptatem fugiat ea aspernatur.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(90,'Marian Jacobi IV','Illo ea autem cum natus voluptatem praesentium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(91,'Prof. Selmer Jenkins','Ipsum veniam perferendis incidunt et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(92,'Jimmy Oberbrunner','Pariatur doloribus repellendus similique quia rerum veritatis eveniet nihil.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(93,'Idella Nienow','Sed eum dignissimos vero perspiciatis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(94,'Frances Runolfsson','Sapiente quos officia perferendis eum aspernatur.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(95,'Prof. Mellie Waelchi','Est possimus consequuntur odio ad nisi ea.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(96,'Taryn Farrell','Velit sed blanditiis perspiciatis voluptatem dicta et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(97,'Christy Schiller','Rerum earum eaque deleniti iste aut dolorem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(98,'Laury Kiehn','Aspernatur quis qui ipsum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(99,'Giovani Schultz IV','Nesciunt et est et quas.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(100,'Ludie Koelpin','Quam ab omnis sint ut voluptatem vel eum praesentium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(101,'Mr. Maxime Swift','Omnis esse rem ab rerum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(102,'Amani Lebsack','Beatae et et est libero officia laborum occaecati dolorem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(103,'Dr. Rhett Pouros DVM','Pariatur minima architecto inventore voluptatem rerum ab.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(104,'Yasmin Rippin','Animi quae consectetur ut facilis cum cumque possimus quia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(105,'Mathilde Hodkiewicz','In quisquam qui animi provident fugit consectetur autem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(106,'Rafael Osinski','Quibusdam provident nulla facilis optio sed sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(107,'Amari Maggio','Animi sunt nihil sequi quia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(108,'Skye Towne V','Deleniti est fugit facilis est beatae nihil aperiam et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(109,'Ivy Bosco Sr.','Sit velit accusamus odit aut enim itaque doloremque.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(110,'Lyla Funk Jr.','Sapiente qui eligendi facilis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(111,'Gunnar Brown','Nihil ipsam magni accusantium ratione aut vel consequatur.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(112,'Charlie Jacobs','Et molestiae repellat dolores est.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(113,'Prof. Elva Quigley','Tempora sunt voluptatem sed harum magni quasi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(114,'Brittany Weimann','Placeat soluta et quia necessitatibus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(115,'Wendy Dibbert','Ducimus dolores veniam suscipit dicta quia et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(116,'Selina Marquardt','Velit harum labore rerum explicabo.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(117,'Mrs. Oma Wolf Sr.','Dignissimos accusantium distinctio eum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(118,'Mr. Antone Yundt MD','Dolore qui minima sed ad vel.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(119,'Patience Kling DDS','Vel itaque dolor et iusto.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(120,'Rashawn Davis','Unde et dolor ut illum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(121,'Mae Hane Sr.','Ex soluta magni facilis est atque quam doloribus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(122,'Aliza Predovic','Et quis rerum et qui.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(123,'Otilia Nikolaus','Odio qui ea in odio minus doloribus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(124,'Dr. Samantha Carter DVM','Commodi fugit aut maxime aliquam nihil.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(125,'Ms. Heather Krajcik','Eius optio molestiae in repellendus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(126,'Dillon Walker','Nobis et enim reprehenderit odio ex deleniti.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(127,'Ressie Beer MD','Sapiente velit aut eaque ut cumque consequatur repudiandae.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(128,'Madisyn Waters','Placeat est sit enim id porro id similique.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(129,'Keven Kihn','Dolores at quis quasi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(130,'Dr. Gaston Terry','Ducimus cumque ea voluptate id quis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(131,'Prof. Leopoldo Christiansen I','Quis porro praesentium officiis atque.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(132,'Elliot Hudson','Et sint quibusdam dolorum et rerum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(133,'Emma Christiansen','Accusamus ut quod ab unde.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(134,'Deshaun Treutel','Qui qui non voluptatem ratione voluptas rerum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(135,'Dr. Thaddeus Walsh III','Accusantium in et aliquam illo ipsa id atque id.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(136,'Mrs. Sincere Gutmann IV','Sequi dolorum voluptatem blanditiis accusantium qui qui minima soluta.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(137,'Ellis Lubowitz','Aut quia reprehenderit iusto eaque sit delectus et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(138,'Dr. Emerson O\'Reilly','Odio saepe id non necessitatibus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(139,'Ellen Renner','Illum delectus sapiente nihil labore ea pariatur.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(140,'Mrs. Teresa Mitchell IV','Voluptatem doloribus qui dolorem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(141,'Mr. Norberto McLaughlin','Veniam hic consequatur similique totam quaerat vel veniam.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(142,'Megane Labadie','Non explicabo recusandae odio nemo mollitia molestias alias accusantium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(143,'Ashleigh Cassin II','Vero debitis exercitationem facilis quaerat.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(144,'Dr. Vincent Auer','Exercitationem dolor sint iusto.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(145,'Mariano Runolfsdottir','Corrupti magnam rerum tempora repellat vitae labore non.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(146,'Mr. Kim Kassulke','Nihil quia eligendi fuga illum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(147,'Mohamed Renner PhD','Velit consequuntur assumenda culpa.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(148,'Darrion Ruecker DDS','At nesciunt dolor reiciendis et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(149,'Eula Graham','Qui voluptatum assumenda delectus quae in illum molestias eveniet.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(150,'Ibrahim Batz','Accusamus molestiae aut impedit unde ut alias dolore.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(151,'Evelyn Herzog','Nobis nihil sint ea dolorem exercitationem nesciunt eum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(152,'Shaniya Larkin','Mollitia aspernatur modi accusantium nihil saepe.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(153,'Lillie Farrell V','Ducimus molestiae quis ab reprehenderit corporis nostrum qui praesentium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(154,'Jenifer Kozey','Et aut voluptatem itaque occaecati et ipsum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(155,'Cristian Heaney DDS','Ipsa animi exercitationem et ipsum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(156,'Solon Murazik','Quidem est aut iste quo.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(157,'Abelardo Leuschke','Distinctio aliquid cum itaque voluptatem non.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(158,'Ms. Brittany Powlowski DVM','Quos et magni sunt error voluptate sunt vel.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(159,'Keyshawn Goodwin','Tempora adipisci non et autem voluptatum molestiae mollitia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(160,'Prof. Fred Schmidt','Ad modi amet qui ut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(161,'Dr. Estelle Spencer MD','Eum commodi doloremque dolor repudiandae suscipit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(162,'Eloise Mayer','Cupiditate praesentium voluptas voluptas quidem voluptatem aut voluptatum.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(163,'Kaitlyn Feil','Pariatur unde quasi vel aut exercitationem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(164,'Mrs. Ollie Weber IV','Repellendus consequatur quidem est et nemo illum tempora.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(165,'Blanche Quitzon','Ea explicabo possimus est rerum modi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(166,'Fred O\'Hara','Et rem quos perferendis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(167,'Jeff Kiehn Sr.','Numquam non saepe aut officia.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(168,'Mr. Laron Prosacco','Sint sed consequatur perferendis ut quia impedit omnis repellendus.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(169,'Euna Hahn','Aspernatur recusandae sit placeat ipsum et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(170,'Zachary Sanford','Dolores dignissimos iure architecto dignissimos aspernatur magnam.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(171,'Prof. London Koepp','Magnam et nemo rerum in exercitationem non.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(172,'Prof. Oren Torphy','Laboriosam at eum nesciunt corporis provident ut dolorem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(173,'Meda Kemmer IV','Nam tempore sint sequi sequi odit recusandae.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(174,'Olga Friesen','Corrupti amet vel hic non quasi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(175,'Braden Wiegand','Dolorem provident numquam quis est.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(176,'Mitchel Sanford','Rerum eius consequatur quasi ipsa enim.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(177,'Lenora Skiles Sr.','Reprehenderit iste illum adipisci sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(178,'Carole Turner','Vitae suscipit nesciunt similique reprehenderit qui.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(179,'Drake Howe II','Animi libero voluptatem voluptas libero voluptatem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(180,'Prof. Sedrick Stiedemann V','Asperiores eius sunt inventore iure.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(181,'Madie Turcotte','Quibusdam qui ab qui beatae alias quam facilis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(182,'Ms. Phyllis Mosciski V','Quibusdam est perspiciatis voluptatem quaerat.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(183,'Myrtie Sipes','Tempora deleniti necessitatibus voluptas officiis.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(184,'Pamela Runolfsdottir III','Et natus cumque nemo alias.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(185,'Dr. Dillan Berge','Hic enim illum ut sit.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(186,'Owen O\'Conner','Voluptatem consequatur consectetur praesentium pariatur eum harum voluptatem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(187,'Hilda Kulas','Earum cum unde quo nisi.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(188,'Rocky Predovic MD','Qui iusto culpa laborum id.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(189,'Julio Murazik II','Qui sed sit qui molestiae itaque expedita.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(190,'Okey O\'Conner','Exercitationem est consequatur praesentium in eius eius.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(191,'Halle Boyle','Animi aut non quaerat.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(192,'Prof. Francesco Gerhold IV','Porro et doloribus aut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(193,'Rudolph Swift','Dignissimos et asperiores voluptas nihil vitae sed ratione.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(194,'Toni Runolfsdottir DDS','Ducimus ipsa quas magnam et voluptatem.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(195,'Genoveva Hackett','Dolores voluptas tempore tempora et provident.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(196,'Gardner O\'Hara','Eius id est est autem ad facilis adipisci.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(197,'Curtis Collier','Officia explicabo reprehenderit laborum sed voluptatibus praesentium.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(198,'Cale Heller','Suscipit aut tempora est ut.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(199,'Prof. Eulalia Wolff','Delectus dolorum cupiditate velit quae quam laboriosam et et.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(200,'Prof. Talon Gleason PhD','Iste distinctio expedita dolorem quis fuga cupiditate.','1',10,'2024-02-10 12:43:11.000000','2024-02-10 12:43:11.000000',1,1,NULL,NULL),(201,'\"The Lord of the Rings\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\"J.R.R. Tolkien\"','\"9780261103252\"');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `borrow_at` date NOT NULL,
  `return_at` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `total_fine` int unsigned NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `book_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrow_book_id_451370e3_fk_books_id` (`book_id`),
  KEY `borrow_user_id_3339d8e1_fk_users_id` (`user_id`),
  CONSTRAINT `borrow_book_id_451370e3_fk_books_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `borrow_user_id_3339d8e1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `borrow_chk_1` CHECK ((`total_fine` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,'2024-02-01','2024-02-07','2024-02-11 19:16:26.575382',0,0,1,5),(2,'2024-02-01','2024-02-07','2024-02-11 19:16:33.901711',0,0,2,5),(3,'2024-02-01','2024-02-07','2024-02-11 19:16:39.623930',0,0,6,5),(4,'2024-02-01','2024-02-07','2024-02-11 19:16:46.273581',24,1,2,4),(5,'2024-02-01','2024-02-07','2024-02-11 19:16:55.327215',24,1,4,4),(6,'2024-02-01','2024-02-07','2024-02-11 19:17:07.843574',24,1,6,4);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'fine','6'),(2,'fine_after_days','7'),(3,'max_books','3'),(5,'max_suspension','2');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'lib_api','book'),(10,'lib_api','bookborrowlog'),(9,'lib_api','borrow'),(6,'lib_api','config'),(7,'lib_api','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-18 15:11:30.566843'),(2,'contenttypes','0002_remove_content_type_name','2024-01-18 15:11:30.642968'),(3,'auth','0001_initial','2024-01-18 15:11:30.920554'),(4,'auth','0002_alter_permission_name_max_length','2024-01-18 15:11:30.975625'),(5,'auth','0003_alter_user_email_max_length','2024-01-18 15:11:30.982777'),(6,'auth','0004_alter_user_username_opts','2024-01-18 15:11:30.988936'),(7,'auth','0005_alter_user_last_login_null','2024-01-18 15:11:30.994715'),(8,'auth','0006_require_contenttypes_0002','2024-01-18 15:11:30.996769'),(9,'auth','0007_alter_validators_add_error_messages','2024-01-18 15:11:31.002752'),(10,'auth','0008_alter_user_username_max_length','2024-01-18 15:11:31.007761'),(11,'auth','0009_alter_user_last_name_max_length','2024-01-18 15:11:31.012390'),(12,'auth','0010_alter_group_name_max_length','2024-01-18 15:11:31.026690'),(13,'auth','0011_update_proxy_permissions','2024-01-18 15:11:31.034780'),(14,'auth','0012_alter_user_first_name_max_length','2024-01-18 15:11:31.039988'),(15,'lib_api','0001_initial','2024-01-18 15:11:31.819721'),(16,'admin','0001_initial','2024-01-18 15:11:31.925988'),(17,'admin','0002_logentry_remove_auto_add','2024-01-18 15:11:31.934094'),(18,'admin','0003_logentry_add_action_flag_choices','2024-01-18 15:11:31.941862'),(19,'sessions','0001_initial','2024-01-18 15:11:31.966538'),(20,'lib_api','0002_alter_book_unique_together','2024-01-18 15:13:16.976937'),(21,'lib_api','0003_alter_book_created_alter_book_updated_and_more','2024-01-20 11:03:18.774212'),(22,'lib_api','0004_alter_book_created_at_alter_book_updated_at_and_more','2024-01-20 12:11:56.998282'),(23,'lib_api','0005_bookborrowlog_created_at_user_status','2024-02-10 13:03:10.201568'),(25,'lib_api','0002_bookborrowlog_date','2024-02-12 15:05:10.290017'),(26,'lib_api','0003_alter_user_status','2024-02-12 15:45:41.697634'),(27,'lib_api','0004_user_overduecount','2024-02-12 15:52:18.443985');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `pcreated` int unsigned NOT NULL,
  `pupdated` int unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `overduecount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `users_chk_1` CHECK ((`pcreated` >= 0)),
  CONSTRAINT `users_chk_2` CHECK ((`pupdated` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-02-12 16:36:05.504471',1,'admin','',1,1,'2024-01-18 15:11:54.706734','admin','admin@gmail.com','admin','pbkdf2_sha256$720000$NVey0GspsgkkqqY2PIHizN$l1l7cTeS9gIfsKl8vZlR1Y2pTqrcMQpDTQAb4sOoIJg=',0,'admin','2024-01-18 15:11:55.145369','2024-01-18 15:11:55.145369',0,0,'regular',0),(2,NULL,0,'student 1','student 1',0,1,'2024-01-20 12:58:04.912953','student 1','student@gmail.com','student1','student1',0,'student','2024-01-20 18:43:04.902197','2024-01-20 18:43:04.902197',0,0,'regular',0),(4,NULL,0,'student 2','student 2',0,1,'2024-01-20 13:11:13.401454','student 2','student2@gmail.com','student2','pbkdf2_sha256$720000$9mxdoJo1dQhNIgxp38poIj$EGwJCtfnNj/UVk8t+AGr/TKBq2AAsk/S5YrR0RXojSM=',0,'student','2024-01-20 18:56:13.392128','2024-01-20 18:56:13.392128',0,0,'regular',1),(5,NULL,0,'student 3','student 3',0,1,'2024-01-20 13:14:07.877164','student 3','student3@gmail.com','student3','pbkdf2_sha256$720000$dIxf7NZEDI4Xp9QNu1S5jh$zfU0qb/879mPsauevPaFU5+ty82VsnCi7CxWnW/Nj00=',0,'student','2024-01-20 18:59:07.865286','2024-01-20 18:59:07.865286',0,0,'regular',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'libraryrest'
--
/*!50003 DROP PROCEDURE IF EXISTS `getusers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getusers`()
begin
	select name,email,user_type,created_at  from users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_book_json` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_book_json`(IN book_json JSON)
begin
	DECLARE v_title VARCHAR(255);
    DECLARE v_author VARCHAR(255);
    DECLARE v_isbn VARCHAR(20);
    
    SET v_title = JSON_EXTRACT(book_json, '$.name');
    SET v_author = JSON_EXTRACT(book_json, '$.author');
    SET v_isbn = JSON_EXTRACT(book_json, '$.isbn');
    
    -- Validate Data (Optional - add more validation as needed)
    IF v_title IS NULL OR v_author IS NULL OR v_isbn IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid JSON: Missing required fields';
    END IF;
    
    -- Insert into books table
    INSERT INTO books (name, author, isbn)
    VALUES (v_title, v_author, v_isbn);
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

-- Dump completed on 2024-04-21 12:28:40
