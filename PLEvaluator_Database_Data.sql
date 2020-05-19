-- MySQL dump 10.13  Distrib 5.1.37, for pc-linux-gnu (i686)
--
-- Host: localhost    Database: plevaluator
-- ------------------------------------------------------
-- Server version	5.1.37

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



drop database if exists plevaluator;
create database plevaluator;
use plevaluator;



--
-- Table structure for table `clientpersonal`
--

DROP TABLE IF EXISTS `clientpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientpersonal` (
  `Client_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `PAN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Client_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientpersonal`
--

LOCK TABLES `clientpersonal` WRITE;
/*!40000 ALTER TABLE `clientpersonal` DISABLE KEYS */;
INSERT INTO `clientpersonal` VALUES (1,'Rakesh Tripathi','# 1245\nSector 16, noida','022261243332','9288964442','CZ123Y6'),(2,'Anilesh Verma','# 190\nVPO sayunk, punjab, india','0197641243332','9888964444','CY123Y6'),(3,'Rajdeep Singh','# 1245\nSector 34, Chandigarh,india','0172261243332','9988963336','AZ34Y6');
/*!40000 ALTER TABLE `clientpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientprofessional`
--

DROP TABLE IF EXISTS `clientprofessional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientprofessional` (
  `Client_ID` int(11) NOT NULL,
  `Profession` varchar(45) DEFAULT NULL,
  `Designation` varchar(45) DEFAULT NULL,
  `Office_Phone` varchar(20) DEFAULT NULL,
  `Office_Address` varchar(300) DEFAULT NULL,
  `Annual_Income` double DEFAULT NULL,
  `Income_Other` double DEFAULT NULL,
  PRIMARY KEY (`Client_ID`),
  CONSTRAINT `fk_clientprofessional_clientpersonal1` FOREIGN KEY (`Client_ID`) REFERENCES `clientpersonal` (`Client_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientprofessional`
--

LOCK TABLES `clientprofessional` WRITE;
/*!40000 ALTER TABLE `clientprofessional` DISABLE KEYS */;
INSERT INTO `clientprofessional` VALUES (1,'Teaching','GCM Sec 11','GCM Sec 11','GCM Sec 11',600000,20000),(2,'Software Developer','Sr.Programmer','01722565555','IT Park Chandigarh',3025500,0),(3,'Developing','Developer','0173335466','GCM Sec 34',200000,30000);
/*!40000 ALTER TABLE `clientprofessional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientresponsibility`
--

DROP TABLE IF EXISTS `clientresponsibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientresponsibility` (
  `Client_ID` int(11) NOT NULL,
  `Tax_Deduction` double DEFAULT NULL,
  `Loan_EMI` double DEFAULT NULL,
  `Insurance_EMI` double DEFAULT NULL,
  `House_Rent` double DEFAULT NULL,
  `Dependents` int(11) DEFAULT NULL,
  `Personal_Expenditure` double DEFAULT NULL,
  `Health_Expenditure` double DEFAULT NULL,
  PRIMARY KEY (`Client_ID`),
  CONSTRAINT `fk_clientresponsbility_clientpersonal1` FOREIGN KEY (`Client_ID`) REFERENCES `clientpersonal` (`Client_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientresponsibility`
--

LOCK TABLES `clientresponsibility` WRITE;
/*!40000 ALTER TABLE `clientresponsibility` DISABLE KEYS */;
INSERT INTO `clientresponsibility` VALUES (1,20000,5000,1000,6000,0,1000,1000),(2,20500,0,1000,5000,2,1000,1000),(3,20100,0,1000,4000,1,1500,1200);
/*!40000 ALTER TABLE `clientresponsibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanfilemaster`
--

DROP TABLE IF EXISTS `loanfilemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanfilemaster` (
  `File_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Creation_Date` datetime DEFAULT NULL,
  `Plan_ID` int(11) DEFAULT NULL,
  `Client_ID` int(11) DEFAULT NULL,
  `Loan_Amount` double DEFAULT NULL,
  `Loan_Status` varchar(20) DEFAULT NULL,
  `Client_ID_Proof` tinyint(1) DEFAULT NULL,
  `Client_Residence_Proof` tinyint(1) DEFAULT NULL,
  `Client_Income_Proof` tinyint(1) DEFAULT NULL,
  `Client_Bank_Statement` tinyint(1) DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`File_ID`),
  KEY `fk_loanfilemaster_usermaster1` (`User_ID`),
  KEY `fk_loanfilemaster_planmaster1` (`Plan_ID`),
  KEY `fk_loanfilemaster_clientpersonal1` (`Client_ID`),
  CONSTRAINT `fk_loanfilemaster_clientpersonal1` FOREIGN KEY (`Client_ID`) REFERENCES `clientpersonal` (`Client_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loanfilemaster_planmaster1` FOREIGN KEY (`Plan_ID`) REFERENCES `planmaster` (`Plan_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loanfilemaster_usermaster1` FOREIGN KEY (`User_ID`) REFERENCES `usermaster` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanfilemaster`
--

LOCK TABLES `loanfilemaster` WRITE;
/*!40000 ALTER TABLE `loanfilemaster` DISABLE KEYS */;
INSERT INTO `loanfilemaster` VALUES (1,'2011-07-22 16:50:38',1,1,1000000,'Approved',1,1,1,1,'N/A',1),(2,'2011-07-22 13:52:36',2,2,8500,'Approved',1,1,1,1,'N/A',1),(3,'2011-07-22 13:52:54',3,3,10500,'Approved',1,1,1,1,'N/A',1),(4,'2011-07-22 13:39:13',2,3,100000,'Approved',1,1,1,1,'Remarks',1);
/*!40000 ALTER TABLE `loanfilemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanissuemaster`
--

DROP TABLE IF EXISTS `loanissuemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanissuemaster` (
  `Loan_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Issue_Date` datetime DEFAULT NULL,
  `Loan_Duration_Year` double DEFAULT NULL,
  `EMI` double DEFAULT NULL,
  `Check_No` varchar(25) DEFAULT NULL,
  `Check_Bank` varchar(45) DEFAULT NULL,
  `File_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Loan_ID`),
  KEY `fk_loanissuemaster_loanfilemaster1` (`File_ID`),
  CONSTRAINT `fk_loanissuemaster_loanfilemaster1` FOREIGN KEY (`File_ID`) REFERENCES `loanfilemaster` (`File_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanissuemaster`
--

LOCK TABLES `loanissuemaster` WRITE;
/*!40000 ALTER TABLE `loanissuemaster` DISABLE KEYS */;
INSERT INTO `loanissuemaster` VALUES (1,'2011-07-07 14:12:21',3,1200,'5645','SBI',1),(2,'2011-07-07 18:12:21',2,1300,'54457','HDFC',2),(3,'2011-05-05 00:00:00',3,1000,'polo12','bank',4),(4,'2011-02-02 00:00:00',5,10022,'uj098','HDFC',3);
/*!40000 ALTER TABLE `loanissuemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planmaster`
--

DROP TABLE IF EXISTS `planmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planmaster` (
  `Plan_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plan_Name` varchar(45) DEFAULT NULL,
  `Interest_Rate` double DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Plan_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planmaster`
--

LOCK TABLES `planmaster` WRITE;
/*!40000 ALTER TABLE `planmaster` DISABLE KEYS */;
INSERT INTO `planmaster` VALUES (1,'Home_Loan',8,'Loan for housing needs of people'),(2,'Education Loan',12,'Loan for education need of students'),(3,'Car Loan',10,'Loan for vehicle need of people');
/*!40000 ALTER TABLE `planmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermaster`
--

DROP TABLE IF EXISTS `usermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermaster` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `User_Type` varchar(20) DEFAULT NULL,
  `User_Status` varchar(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermaster`
--

LOCK TABLES `usermaster` WRITE;
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT INTO `usermaster` VALUES (1,'admin','admin','Administrator','Active','Rohan','01724565654','admin@gmail.com'),(2,'employee','employee','Employee','Active','Aakash','98888989898','employee@gmail.com'),(3,'User','user','Employee','Active','Rajpreet','9899988888','user@gmail.com');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-15  9:04:21
