CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `idBookings` int NOT NULL,
  `Staff_idStaff` int NOT NULL,
  `BookingsDate` date DEFAULT NULL,
  `BookingTime` time DEFAULT NULL,
  `total_people` int DEFAULT NULL,
  `Duration_for` time DEFAULT NULL,
  `Table_idTable` int NOT NULL,
  PRIMARY KEY (`idBookings`),
  KEY `fk_Bookings_Staff1_idx` (`Staff_idStaff`),
  KEY `fk_Bookings_Table1_idx` (`Table_idTable`),
  CONSTRAINT `fk_Bookings_Staff1` FOREIGN KEY (`Staff_idStaff`) REFERENCES `staff` (`idStaff`),
  CONSTRAINT `fk_Bookings_Table1` FOREIGN KEY (`Table_idTable`) REFERENCES `table` (`idTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idCustomers` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCustomers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_has_bookings`
--

DROP TABLE IF EXISTS `customers_has_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_has_bookings` (
  `Customers_idCustomers` int NOT NULL,
  `Bookings_idBookings` int NOT NULL,
  PRIMARY KEY (`Customers_idCustomers`,`Bookings_idBookings`),
  KEY `fk_Customers_has_Bookings_Bookings1_idx` (`Bookings_idBookings`),
  KEY `fk_Customers_has_Bookings_Customers1_idx` (`Customers_idCustomers`),
  CONSTRAINT `fk_Customers_has_Bookings_Bookings1` FOREIGN KEY (`Bookings_idBookings`) REFERENCES `bookings` (`idBookings`),
  CONSTRAINT `fk_Customers_has_Bookings_Customers1` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_has_bookings`
--

LOCK TABLES `customers_has_bookings` WRITE;
/*!40000 ALTER TABLE `customers_has_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_has_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `idDelivery` int NOT NULL,
  `Delivery_date` varchar(45) DEFAULT NULL,
  `Delivery_status` varchar(45) DEFAULT NULL,
  `Orders_idOrders1` int NOT NULL,
  PRIMARY KEY (`Orders_idOrders1`),
  UNIQUE KEY `Orders_idOrders1_UNIQUE` (`Orders_idOrders1`),
  KEY `fk_Delivery_Orders1_idx` (`Orders_idOrders1`),
  CONSTRAINT `fk_Delivery_Orders1` FOREIGN KEY (`Orders_idOrders1`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idMenu` int NOT NULL,
  `MenuITEM` varchar(45) DEFAULT NULL,
  `Price` int NOT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMenu`),
  UNIQUE KEY `Menu ITEM_UNIQUE` (`MenuITEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_has_orders`
--

DROP TABLE IF EXISTS `menu_has_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_has_orders` (
  `Menu_idMenu` int NOT NULL,
  `Orders_idOrders` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `SubTotal` int DEFAULT NULL,
  PRIMARY KEY (`Menu_idMenu`,`Orders_idOrders`),
  KEY `fk_Menu_has_Orders_Orders1_idx` (`Orders_idOrders`),
  KEY `fk_Menu_has_Orders_Menu1_idx` (`Menu_idMenu`),
  CONSTRAINT `fk_Menu_has_Orders_Menu1` FOREIGN KEY (`Menu_idMenu`) REFERENCES `menu` (`idMenu`),
  CONSTRAINT `fk_Menu_has_Orders_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_has_orders`
--

LOCK TABLES `menu_has_orders` WRITE;
/*!40000 ALTER TABLE `menu_has_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_has_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL,
  `Customers_idCustomers` int NOT NULL,
  `Staff_idStaff` int NOT NULL,
  `Mode` varchar(45) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Table_idTable` int NOT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_Orders_Customers_idx` (`Customers_idCustomers`),
  KEY `fk_Orders_Staff1_idx` (`Staff_idStaff`),
  KEY `fk_Orders_Table1_idx` (`Table_idTable`),
  CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`),
  CONSTRAINT `fk_Orders_Staff1` FOREIGN KEY (`Staff_idStaff`) REFERENCES `staff` (`idStaff`),
  CONSTRAINT `fk_Orders_Table1` FOREIGN KEY (`Table_idTable`) REFERENCES `table` (`idTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idStaff` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Post` varchar(45) DEFAULT NULL,
  `Salary` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `idTable` int NOT NULL,
  `TNumber` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 18:08:44
