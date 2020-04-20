-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Paper_Reviews
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (1,'Anusha','Dogiparthy','anush@gmail.com'),(2,'Kiran','Bethi','kiranmaie@gmail.com'),(3,'Samhit','Vemula','krishna@gmail.com'),(4,'Saanvi','Vemula','Saanvi@gmail.com'),(5,'Deepu','Cheetirala','Deepu@gmail.com');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paper` (
  `Paper_id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Abstract` varchar(255) NOT NULL,
  `FileName` varchar(255) NOT NULL,
  `Author_id` int NOT NULL,
  PRIMARY KEY (`Paper_id`),
  KEY `Author_id` (`Author_id`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`Author_id`) REFERENCES `Author` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper`
--

LOCK TABLES `Paper` WRITE;
/*!40000 ALTER TABLE `Paper` DISABLE KEYS */;
INSERT INTO `Paper` VALUES (1,'Extinction of Dinosaurs','Study of the Extinction of Dinosaurs','The_Dinosaurs',5),(2,'Legendary Cricketer','Auto Biography of the cricketer Sachin','The_Cricketer',3),(3,'Northern Lights','Green lights over the sky in Alaska','The_Northern_Lights',4),(4,'Yosemite National Park','Best national parks in california','The_Yosemite',2),(5,'Donald Trump','President of America','The_President',1);
/*!40000 ALTER TABLE `Paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paper_Reviewer`
--

DROP TABLE IF EXISTS `Paper_Reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paper_Reviewer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Paper_id` int NOT NULL,
  `Reviewer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Paper_id` (`Paper_id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `paper_reviewer_ibfk_1` FOREIGN KEY (`Paper_id`) REFERENCES `Paper` (`Paper_id`),
  CONSTRAINT `paper_reviewer_ibfk_2` FOREIGN KEY (`Reviewer_id`) REFERENCES `REVIEWER` (`Reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper_Reviewer`
--

LOCK TABLES `Paper_Reviewer` WRITE;
/*!40000 ALTER TABLE `Paper_Reviewer` DISABLE KEYS */;
INSERT INTO `Paper_Reviewer` VALUES (1,1,5),(2,2,3),(3,3,4),(4,4,2),(5,5,1);
/*!40000 ALTER TABLE `Paper_Reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW` (
  `Review_id` int NOT NULL AUTO_INCREMENT,
  `Recommendation` varchar(255) NOT NULL,
  `MeritScore` int NOT NULL,
  `Paper_id` int NOT NULL,
  `ReadabilityScore` int NOT NULL,
  `Reviewer_id` int NOT NULL,
  `OriginalityScore` int NOT NULL,
  `RelevanceScore` int NOT NULL,
  PRIMARY KEY (`Review_id`),
  KEY `Paper_id` (`Paper_id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Paper_id`) REFERENCES `Paper` (`Paper_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Reviewer_id`) REFERENCES `REVIEWER` (`Reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` VALUES (6,'Highly Recommended',9,1,8,5,9,9),(7,'Best Recommended',8,2,8,3,9,8),(8,'Useful Recommendation',7,3,9,4,8,7),(9,'Wise Recommendation',8,4,9,2,7,9),(10,'Great',9,5,9,1,9,10);
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer` (
  `Reviewer_id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Author_feedback` varchar(255) NOT NULL,
  `Commitee_feedback` varchar(255) NOT NULL,
  `Phone_num` varchar(20) NOT NULL,
  `Email_id` varchar(20) NOT NULL,
  `Affiliation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Reviewer_id`,`Email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (1,'Sarath','Sunku','The Best Source','Very Knowledgeful','234-234-3421','sara@gmail.com','University of Maryland'),(2,'Sravan','Sunku','Amazing','Very Useful','233-234-3441','srav@gmail.com','University of Toronto'),(3,'Nirvaan','Sunku','Excellent','Very Catchy','213-234-3491','Nirv@gmail.com','University of California'),(4,'Harika','Sunku','Captivating','Very Good','234-473-3421','Hari@gmail.com','University of Waterloo'),(5,'Anush','Sunku','The Outstanding Source','Brilliant Writeup','234-234-3421','sara@gmail.com','Harvard University');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Topic`
--

DROP TABLE IF EXISTS `Topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Topic` (
  `Topic_id` int NOT NULL AUTO_INCREMENT,
  `Topic_name` varchar(255) NOT NULL,
  `Reviewer_id` int NOT NULL,
  PRIMARY KEY (`Topic_id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`Reviewer_id`) REFERENCES `REVIEWER` (`Reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Topic`
--

LOCK TABLES `Topic` WRITE;
/*!40000 ALTER TABLE `Topic` DISABLE KEYS */;
INSERT INTO `Topic` VALUES (1,'Dinosaurs',5),(2,'Cricketer',3),(3,'Northern Lights',4),(4,'National Park',2),(5,'President of America',1);
/*!40000 ALTER TABLE `Topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-15 11:02:18
