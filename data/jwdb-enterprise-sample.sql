-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jwdb
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `SHKActivities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivities` (
  `Id` varchar(100) NOT NULL,
  `ActivitySetDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Process` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) DEFAULT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ProcessId` varchar(200) NOT NULL,
  `ResourceId` varchar(100) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `BlockActivityId` varchar(100) DEFAULT NULL,
  `Performer` varchar(100) DEFAULT NULL,
  `IsPerformerAsynchronous` smallint(6) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Activated` bigint(20) NOT NULL,
  `ActivatedTZO` bigint(20) NOT NULL,
  `Accepted` bigint(20) DEFAULT NULL,
  `AcceptedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivities` (`Id`),
  KEY `SHKActivities_TheResource` (`TheResource`),
  KEY `SHKActivities_State` (`State`),
  KEY `I2_SHKActivities` (`Process`,`ActivitySetDefinitionId`,`ActivityDefinitionId`),
  KEY `I3_SHKActivities` (`Process`,`State`),
  CONSTRAINT `SHKActivities_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`),
  CONSTRAINT `SHKActivities_State` FOREIGN KEY (`State`) REFERENCES `SHKActivityStates` (`oid`),
  CONSTRAINT `SHKActivities_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivities`
--

LOCK TABLES `SHKActivities` WRITE;
/*!40000 ALTER TABLE `SHKActivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityData` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityData` (`CNT`),
  UNIQUE KEY `I2_SHKActivityData` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityData_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityData`
--

LOCK TABLES `SHKActivityData` WRITE;
/*!40000 ALTER TABLE `SHKActivityData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataBLOBs` (
  `ActivityDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataBLOBs` (`ActivityDataWOB`,`OrdNo`),
  CONSTRAINT `SHKActivityDataBLOBs_ActivityDataWOB` FOREIGN KEY (`ActivityDataWOB`) REFERENCES `SHKActivityDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityDataBLOBs`
--

LOCK TABLES `SHKActivityDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataWOB` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKActivityDataWOB` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityDataWOB_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityDataWOB`
--

LOCK TABLES `SHKActivityDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStateEventAudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityStateEventAudits`
--

LOCK TABLES `SHKActivityStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityStates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityStates`
--

LOCK TABLES `SHKActivityStates` WRITE;
/*!40000 ALTER TABLE `SHKActivityStates` DISABLE KEYS */;
INSERT INTO `SHKActivityStates` VALUES ('open.running','open.running',1000001,0),('open.not_running.not_started','open.not_running.not_started',1000003,0),('open.not_running.suspended','open.not_running.suspended',1000005,0),('closed.completed','closed.completed',1000007,0),('closed.terminated','closed.terminated',1000009,0),('closed.aborted','closed.aborted',1000011,0);
/*!40000 ALTER TABLE `SHKActivityStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAndJoinTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAndJoinTable` (
  `Process` decimal(19,0) NOT NULL,
  `BlockActivity` decimal(19,0) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAndJoinTable` (`CNT`),
  KEY `SHKAndJoinTable_BlockActivity` (`BlockActivity`),
  KEY `I2_SHKAndJoinTable` (`Process`,`BlockActivity`,`ActivityDefinitionId`),
  KEY `I3_SHKAndJoinTable` (`Activity`),
  CONSTRAINT `SHKAndJoinTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_BlockActivity` FOREIGN KEY (`BlockActivity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAndJoinTable`
--

LOCK TABLES `SHKAndJoinTable` WRITE;
/*!40000 ALTER TABLE `SHKAndJoinTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAndJoinTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAssignmentEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldResourceUsername` varchar(100) DEFAULT NULL,
  `OldResourceName` varchar(100) DEFAULT NULL,
  `NewResourceUsername` varchar(100) NOT NULL,
  `NewResourceName` varchar(100) DEFAULT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentEventAudits` (`CNT`),
  KEY `SHKAssignmentEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKAssignmentEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAssignmentEventAudits`
--

LOCK TABLES `SHKAssignmentEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAssignmentsTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentsTable` (
  `Activity` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityProcessId` varchar(100) NOT NULL,
  `ActivityProcessDefName` varchar(200) NOT NULL,
  `ResourceId` varchar(100) NOT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `IsValid` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentsTable` (`CNT`),
  UNIQUE KEY `I2_SHKAssignmentsTable` (`Activity`,`TheResource`),
  KEY `I3_SHKAssignmentsTable` (`TheResource`,`IsValid`),
  KEY `I4_SHKAssignmentsTable` (`ActivityId`),
  KEY `I5_SHKAssignmentsTable` (`ResourceId`),
  KEY `FK8024ACDEBBDE9A5E` (`ActivityId`),
  KEY `FK8024ACDE3A345885` (`ActivityProcessId`),
  CONSTRAINT `FK8024ACDE3A345885` FOREIGN KEY (`ActivityProcessId`) REFERENCES `SHKProcesses` (`Id`),
  CONSTRAINT `FK8024ACDEBBDE9A5E` FOREIGN KEY (`ActivityId`) REFERENCES `SHKActivities` (`Id`),
  CONSTRAINT `SHKAssignmentsTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAssignmentsTable_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAssignmentsTable`
--

LOCK TABLES `SHKAssignmentsTable` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentsTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentsTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKCounters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCounters` (
  `name` varchar(100) NOT NULL,
  `the_number` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCounters` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKCounters`
--

LOCK TABLES `SHKCounters` WRITE;
/*!40000 ALTER TABLE `SHKCounters` DISABLE KEYS */;
INSERT INTO `SHKCounters` VALUES ('_xpdldata_',5,1000204,3);
/*!40000 ALTER TABLE `SHKCounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKCreateProcessEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCreateProcessEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `PActivityId` varchar(100) DEFAULT NULL,
  `PProcessId` varchar(100) DEFAULT NULL,
  `PProcessName` varchar(254) DEFAULT NULL,
  `PProcessFactoryName` varchar(200) DEFAULT NULL,
  `PProcessFactoryVersion` varchar(20) DEFAULT NULL,
  `PActivityDefinitionId` varchar(90) DEFAULT NULL,
  `PActivityDefinitionName` varchar(90) DEFAULT NULL,
  `PProcessDefinitionId` varchar(90) DEFAULT NULL,
  `PProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PPackageId` varchar(90) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCreateProcessEventAudits` (`CNT`),
  KEY `SHKCreateProcessEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKCreateProcessEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKCreateProcessEventAudits`
--

LOCK TABLES `SHKCreateProcessEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKDataEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDataEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDataEventAudits` (`CNT`),
  KEY `SHKDataEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKDataEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKDataEventAudits`
--

LOCK TABLES `SHKDataEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKDataEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDataEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKDeadlines`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDeadlines` (
  `Process` decimal(19,0) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `TimeLimit` bigint(20) NOT NULL,
  `TimeLimitTZO` bigint(20) NOT NULL,
  `ExceptionName` varchar(100) NOT NULL,
  `IsSynchronous` smallint(6) NOT NULL,
  `IsExecuted` smallint(6) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDeadlines` (`CNT`),
  KEY `I2_SHKDeadlines` (`Process`,`TimeLimit`),
  KEY `I3_SHKDeadlines` (`Activity`,`TimeLimit`),
  CONSTRAINT `SHKDeadlines_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKDeadlines_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKDeadlines`
--

LOCK TABLES `SHKDeadlines` WRITE;
/*!40000 ALTER TABLE `SHKDeadlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDeadlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKEventTypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKEventTypes` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKEventTypes` (`KeyValue`),
  UNIQUE KEY `I2_SHKEventTypes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKEventTypes`
--

LOCK TABLES `SHKEventTypes` WRITE;
/*!40000 ALTER TABLE `SHKEventTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKEventTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupGroupTable` (
  `sub_gid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupGroupTable` (`sub_gid`,`groupid`),
  KEY `I2_SHKGroupGroupTable` (`groupid`),
  CONSTRAINT `SHKGroupGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKGroupGroupTable_sub_gid` FOREIGN KEY (`sub_gid`) REFERENCES `SHKGroupTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupGroupTable`
--

LOCK TABLES `SHKGroupGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupTable` (
  `groupid` varchar(100) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupTable` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupTable`
--

LOCK TABLES `SHKGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUser`
--

LOCK TABLES `SHKGroupUser` WRITE;
/*!40000 ALTER TABLE `SHKGroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUserPackLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUserPackLevelPart`
--

LOCK TABLES `SHKGroupUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUserProcLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserProcLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserProcLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserProcLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserProcLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserProcLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUserProcLevelPart`
--

LOCK TABLES `SHKGroupUserProcLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditData`
--

LOCK TABLES `SHKNewEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataBLOBs` (
  `NewEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataBLOBs` (`NewEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataBLOBs_NewEventAuditDataWOB` FOREIGN KEY (`NewEventAuditDataWOB`) REFERENCES `SHKNewEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditDataBLOBs`
--

LOCK TABLES `SHKNewEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditDataWOB`
--

LOCK TABLES `SHKNewEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNextXPDLVersions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNextXPDLVersions` (
  `XPDLId` varchar(90) NOT NULL,
  `NextVersion` varchar(20) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNextXPDLVersions` (`XPDLId`,`NextVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNextXPDLVersions`
--

LOCK TABLES `SHKNextXPDLVersions` WRITE;
/*!40000 ALTER TABLE `SHKNextXPDLVersions` DISABLE KEYS */;
INSERT INTO `SHKNextXPDLVersions` VALUES ('crm','2',1000201,0),('dashboard','2',1000400,0),('hr_expense','2',1000404,0),('isr','2',1000408,0);
/*!40000 ALTER TABLE `SHKNextXPDLVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNormalUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNormalUser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNormalUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNormalUser`
--

LOCK TABLES `SHKNormalUser` WRITE;
/*!40000 ALTER TABLE `SHKNormalUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNormalUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditData`
--

LOCK TABLES `SHKOldEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataBLOBs` (
  `OldEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataBLOBs` (`OldEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataBLOBs_OldEventAuditDataWOB` FOREIGN KEY (`OldEventAuditDataWOB`) REFERENCES `SHKOldEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditDataBLOBs`
--

LOCK TABLES `SHKOldEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditDataWOB`
--

LOCK TABLES `SHKOldEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelParticipant` (`PARTICIPANT_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelParticipant_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelParticipant_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelParticipant`
--

LOCK TABLES `SHKPackLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLApp` (`APPLICATION_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelXPDLApp_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelXPDLApp_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLApp`
--

LOCK TABLES `SHKPackLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetUsr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppDetUsr`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppDetail`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppUser`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppToolAgntApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppToolAgntApp`
--

LOCK TABLES `SHKPackLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelParticipant` (`PARTICIPANT_ID`,`PROCESSOID`),
  KEY `SHKProcLevelParticipant_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelParticipant_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLParticipantProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelParticipant`
--

LOCK TABLES `SHKProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLApp` (`APPLICATION_ID`,`PROCESSOID`),
  KEY `SHKProcLevelXPDLApp_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelXPDLApp_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLApplicationProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLApp`
--

LOCK TABLES `SHKProcLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetUsr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppDetUsr`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppDetail`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppUser`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppToolAgntApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppToolAgntApp`
--

LOCK TABLES `SHKProcLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessData` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessData` (`CNT`),
  UNIQUE KEY `I2_SHKProcessData` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessData_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessData`
--

LOCK TABLES `SHKProcessData` WRITE;
/*!40000 ALTER TABLE `SHKProcessData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataBLOBs` (
  `ProcessDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataBLOBs` (`ProcessDataWOB`,`OrdNo`),
  CONSTRAINT `SHKProcessDataBLOBs_ProcessDataWOB` FOREIGN KEY (`ProcessDataWOB`) REFERENCES `SHKProcessDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDataBLOBs`
--

LOCK TABLES `SHKProcessDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataWOB` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKProcessDataWOB` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessDataWOB_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDataWOB`
--

LOCK TABLES `SHKProcessDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDefinitions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDefinitions` (
  `Name` varchar(200) NOT NULL,
  `PackageId` varchar(90) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionCreated` bigint(20) NOT NULL,
  `ProcessDefinitionVersion` varchar(20) NOT NULL,
  `State` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDefinitions` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDefinitions`
--

LOCK TABLES `SHKProcessDefinitions` WRITE;
/*!40000 ALTER TABLE `SHKProcessDefinitions` DISABLE KEYS */;
INSERT INTO `SHKProcessDefinitions` VALUES ('crm#1#process1','crm','process1',1318821793760,'1',0,1000205,0),('dashboard#1#process1','dashboard','process1',1344926704846,'1',0,1000403,0),('hr_expense#1#process1','hr_expense','process1',1344926734065,'1',0,1000407,0),('isr#1#isr','isr','isr',1344926755718,'1',0,1000411,0);
/*!40000 ALTER TABLE `SHKProcessDefinitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessRequesters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessRequesters` (
  `Id` varchar(100) NOT NULL,
  `ActivityRequester` decimal(19,0) DEFAULT NULL,
  `ResourceRequester` decimal(19,0) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessRequesters` (`Id`),
  KEY `I2_SHKProcessRequesters` (`ActivityRequester`),
  KEY `I3_SHKProcessRequesters` (`ResourceRequester`),
  CONSTRAINT `SHKProcessRequesters_ActivityRequester` FOREIGN KEY (`ActivityRequester`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKProcessRequesters_ResourceRequester` FOREIGN KEY (`ResourceRequester`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessRequesters`
--

LOCK TABLES `SHKProcessRequesters` WRITE;
/*!40000 ALTER TABLE `SHKProcessRequesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessRequesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStateEventAudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessStateEventAudits`
--

LOCK TABLES `SHKProcessStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessStates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessStates`
--

LOCK TABLES `SHKProcessStates` WRITE;
/*!40000 ALTER TABLE `SHKProcessStates` DISABLE KEYS */;
INSERT INTO `SHKProcessStates` VALUES ('open.running','open.running',1000000,0),('open.not_running.not_started','open.not_running.not_started',1000002,0),('open.not_running.suspended','open.not_running.suspended',1000004,0),('closed.completed','closed.completed',1000006,0),('closed.terminated','closed.terminated',1000008,0),('closed.aborted','closed.aborted',1000010,0);
/*!40000 ALTER TABLE `SHKProcessStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcesses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcesses` (
  `SyncVersion` bigint(20) NOT NULL,
  `Id` varchar(100) NOT NULL,
  `ProcessDefinition` decimal(19,0) NOT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ActivityRequesterId` varchar(100) DEFAULT NULL,
  `ActivityRequesterProcessId` varchar(100) DEFAULT NULL,
  `ResourceRequesterId` varchar(100) NOT NULL,
  `ExternalRequesterClassName` varchar(254) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Created` bigint(20) NOT NULL,
  `CreatedTZO` bigint(20) NOT NULL,
  `Started` bigint(20) DEFAULT NULL,
  `StartedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcesses` (`Id`),
  KEY `I2_SHKProcesses` (`ProcessDefinition`),
  KEY `I3_SHKProcesses` (`State`),
  KEY `I4_SHKProcesses` (`ActivityRequesterId`),
  KEY `I5_SHKProcesses` (`ResourceRequesterId`),
  CONSTRAINT `SHKProcesses_ProcessDefinition` FOREIGN KEY (`ProcessDefinition`) REFERENCES `SHKProcessDefinitions` (`oid`),
  CONSTRAINT `SHKProcesses_State` FOREIGN KEY (`State`) REFERENCES `SHKProcessStates` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcesses`
--

LOCK TABLES `SHKProcesses` WRITE;
/*!40000 ALTER TABLE `SHKProcesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKResourcesTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKResourcesTable` (
  `Username` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKResourcesTable` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKResourcesTable`
--

LOCK TABLES `SHKResourcesTable` WRITE;
/*!40000 ALTER TABLE `SHKResourcesTable` DISABLE KEYS */;
INSERT INTO `SHKResourcesTable` VALUES ('admin',NULL,1000800,0);
/*!40000 ALTER TABLE `SHKResourcesTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKStateEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldProcessState` decimal(19,0) DEFAULT NULL,
  `NewProcessState` decimal(19,0) DEFAULT NULL,
  `OldActivityState` decimal(19,0) DEFAULT NULL,
  `NewActivityState` decimal(19,0) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKStateEventAudits` (`CNT`),
  KEY `SHKStateEventAudits_TheType` (`TheType`),
  KEY `SHKStateEventAudits_OldProcessState` (`OldProcessState`),
  KEY `SHKStateEventAudits_NewProcessState` (`NewProcessState`),
  KEY `SHKStateEventAudits_OldActivityState` (`OldActivityState`),
  KEY `SHKStateEventAudits_NewActivityState` (`NewActivityState`),
  CONSTRAINT `SHKStateEventAudits_NewActivityState` FOREIGN KEY (`NewActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_NewProcessState` FOREIGN KEY (`NewProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldActivityState` FOREIGN KEY (`OldActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldProcessState` FOREIGN KEY (`OldProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKStateEventAudits`
--

LOCK TABLES `SHKStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentApp` (
  `TOOL_AGENT_NAME` varchar(250) NOT NULL,
  `APP_NAME` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentApp` (`TOOL_AGENT_NAME`,`APP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentApp`
--

LOCK TABLES `SHKToolAgentApp` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetail` (
  `APP_MODE` decimal(10,0) NOT NULL,
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetail` (`APP_MODE`,`TOOLAGENT_APPOID`),
  KEY `SHKToolAgentAppDetail_TOOLAGENT_APPOID` (`TOOLAGENT_APPOID`),
  CONSTRAINT `SHKToolAgentAppDetail_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppDetail`
--

LOCK TABLES `SHKToolAgentAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppDetailUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetailUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetailUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppDetailUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppDetailUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKToolAgentAppDetailUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppDetailUser`
--

LOCK TABLES `SHKToolAgentAppDetailUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKToolAgentAppUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppUser`
--

LOCK TABLES `SHKToolAgentAppUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentUser` (
  `USERNAME` varchar(100) NOT NULL,
  `PWD` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentUser`
--

LOCK TABLES `SHKToolAgentUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserGroupTable` (
  `userid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserGroupTable` (`userid`,`groupid`),
  KEY `SHKUserGroupTable_groupid` (`groupid`),
  CONSTRAINT `SHKUserGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKUserGroupTable_userid` FOREIGN KEY (`userid`) REFERENCES `SHKUserTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserGroupTable`
--

LOCK TABLES `SHKUserGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKUserGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserPackLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserPackLevelPart`
--

LOCK TABLES `SHKUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserProcLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserProcLevelParticipant` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserProcLevelParticipant` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserProcLevelParticipant_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserProcLevelParticipant_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserProcLevelParticipant_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserProcLevelParticipant`
--

LOCK TABLES `SHKUserProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserTable` (
  `userid` varchar(100) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserTable` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserTable`
--

LOCK TABLES `SHKUserTable` WRITE;
/*!40000 ALTER TABLE `SHKUserTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLApplicationPackage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationPackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLApplicationPackage`
--

LOCK TABLES `SHKXPDLApplicationPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLApplicationProcess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationProcess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLApplicationProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLApplicationProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLApplicationProcess`
--

LOCK TABLES `SHKXPDLApplicationProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLData` (
  `XPDLContent` longblob,
  `XPDLClassContent` longblob,
  `XPDL` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLData` (`CNT`),
  UNIQUE KEY `I2_SHKXPDLData` (`XPDL`),
  CONSTRAINT `SHKXPDLData_XPDL` FOREIGN KEY (`XPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLData`
--

LOCK TABLES `SHKXPDLData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLData` DISABLE KEYS */;
INSERT INTO `SHKXPDLData` VALUES ('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"crm\" Name=\"CRM\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"requester\" Name=\"Requester\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"approver\" Name=\"Approver\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"system\" Name=\"System\">\n            <ParticipantType Type=\"SYSTEM\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"process1\" Name=\"Proposal Approval Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"approve_proposal\" Name=\"Approve Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"394,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"approval\" Name=\"Approval\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition3\"/>\n                                    <TransitionRef Id=\"transition6\"/>\n                                    <TransitionRef Id=\"transition5\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"566,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"activity1\" Name=\"Resubmit Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"738,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"send_proposal\" Name=\"Send Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"1082,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"parallel\" Name=\"Parallel\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"AND\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition7\"/>\n                                    <TransitionRef Id=\"transition8\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"738,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool1\" Name=\"Send Approval Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"1082,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool2\" Name=\"Send Reject Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"738,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"222,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"approve_proposal\" Id=\"transition2\" To=\"approval\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition3\" To=\"activity1\">\n                    <Condition Type=\"CONDITION\">status==\'resubmit\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"activity1\" Id=\"transition4\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition6\" Name=\"approved\" To=\"parallel\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition7\" To=\"send_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition8\" To=\"tool1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition5\" To=\"tool2\">\n                    <Condition Type=\"CONDITION\">status==\'rejected\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition1\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"requester;approver;system\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=1292,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=1292,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=948,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Workflow Designer 3.0-BETA - build 12\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"2.0-2(4?)-C-20080226-2126\"/>\n        <ExtendedAttribute Name=\"JaWE_CONFIGURATION\" Value=\"default\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xpv�pt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0\0�́q\0~\0\nt\0crmpt\0Namesq\0~\0\0q\0~\0sq\0~\0\0��q\0~\0\nt\0CRMpt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0]pq\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0Y��q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0\r�q\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0���q\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0\0��iq\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\0\0ܩq\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\0\0��/q\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0L��q\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0\nq\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0&��q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0\0�S�q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0|�Wq\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0)��q\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0\0��q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\09B\\q\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm�\0\0xq\0~\0\0q\0~\0isq\0~\0\03�Eq\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0�g8q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0\0�kq\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0�9q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0\0�LIq\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\0A��q\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0\0�:�q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0�2=q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0�pXq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\0�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0\0��q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~\0�t\0	requesterpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��4q\0~\0�t\0	Requesterpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0�+q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0E6�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0�~q\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0\0�a�q\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\0a�q\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\0\0}Xq\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0�-q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0\0AC�q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0\0�l�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�\0q\0~\0�t\0approverpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�q\0~\0�t\0Approverpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0�}�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0W�_q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0�D&q\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0�\\Gq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0>pq\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0%6�q\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\06��q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0\0��Cq\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xsq\0~\0�t\0Participantsq\0~\0�J�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��yq\0~t\0systempq\0~\0sq\0~\0\0q\0~\0sq\0~\0��;q\0~t\0Systempt\0ParticipantTypesq\0~\0�q\0~sq\0~\0�y�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0*�[q\0~ t\0SYSTEMsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~$xt\0Descriptionsq\0~\02\0q\0~)sq\0~\0\0*F�q\0~t\0\0t\0ExternalReferencesq\0~\0�\0q\0~-sq\0~\0�P�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Uq\0~.t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0��q\0~.t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~.t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~2q\0~5q\0~8xt\0ExtendedAttributessq\0~\0�\0q\0~<sq\0~\0\0�sq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~ q\0~*q\0~.q\0~=xxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~Csq\0~\0\0g�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0\0�Uiq\0~Et\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~Kt\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0���q\0~Kt\0\0pt\0Descriptionsq\0~\02\0q\0~Vsq\0~\0�xvq\0~Kt\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~Zsq\0~\0���q\0~Kt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0�� q\0~]t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�\0t\0ExternalReferencesq\0~\0\0qq\0~]t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0)	�q\0~ht\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\07/Cq\0~ht\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�q\0~ht\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~mq\0~pq\0~sxxq\0~bt\0ExtendedAttributessq\0~\0�\0q\0~wsq\0~\0\0���q\0~Kt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Pq\0~Sq\0~Wq\0~]q\0~xxxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~~sq\0~\0\05�3q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~�sq\0~\0�Nq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0\0�]Mq\0~�t\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\0\0��#q\0~�t\0process1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�\'q\0~�t\0Proposal Approval Processpt\0AccessLevelsq\0~\0\0q\0~�sq\0~\0���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~�sq\0~\0\0Ɨ\'q\0~�t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~�sq\0~\0�Tq\0~�t\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0\0��{q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0�q\0~�t\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0\0udq\0~�t\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0\02�q\0~�t\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0D�q\0~�t\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0\0�)q\0~�t\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0\0�\'�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~�sq\0~\0\0�q\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~�sq\0~\0\0Rc\0q\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~�sq\0~\0\0��`q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~�sq\0~\0\0e\\�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0\0�hq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~�sq\0~\0\0j�Sq\0~�t\0\0t\0Versionsq\0~\0[\0q\0~�sq\0~\0ۭ[q\0~�t\0\0t\0Codepagesq\0~\0`\0q\0~�sq\0~\0Rj�q\0~�t\0\0t\0\nCountrykeysq\0~\0e\0q\0~�sq\0~\0�}q\0~�t\0\0t\0Responsiblessq\0~\0j\0q\0~�sq\0~\0\0A[Fq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0FormalParameterssq\0~a\0q\0~sq\0~\0\0�v�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nDataFieldssq\0~\0q\0~sq\0~\0\0};�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0A��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0w8q\0~t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\0D�cq\0~t\0\0pt\0IsArraysq\0~\0\0q\0~sq\0~\04q\0~t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~ sq\0~\0\0�V8q\0~t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~\\q\0~&sq\0~\0�{�q\0~\"t\0\0sq\0~\0E\0\0\0	w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\0\08��q\0~(t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�A1q\0~-t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0\nq\0~2xsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0\0$Nq\0~(t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�a�q\0~?t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Dxsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0\0�p�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0t)�q\0~(t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0a�|q\0~Ot\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0H2q\0~Ot\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��\nq\0~Ot\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Tq\0~Wq\0~Zxsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0\0\n��q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\0\0��&q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0R=�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0\0\\Xyq\0~(t\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~ysq\0~\0\0���q\0~tt\0\0pt\0\nUpperIndexsq\0~\0q\0~}sq\0~\0�$�q\0~tt\0\0pq\0~&sq\0~\'q\0~&sq\0~\0\09V&q\0~tt\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~zq\0~~q\0~�xsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0\0F�q\0~(t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'q\0~&sq\0~\0��q\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~-xsq\0~\0E\0\0\0w\0\0\0\nq\0~(xt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~�sq\0~\0���q\0~t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~�sq\0~\0X�q\0~t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0��q\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0\n�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~\Zq\0~\"q\0~�q\0~�q\0~�q\0~�xxt\0Participantssq\0~\0�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Applicationssq\0~D\0q\0~�sq\0~\0��Qq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~�sq\0~\0d�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~�sq\0~\0\0�0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0�b}q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0s�q\0~�t\0approve_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�.�q\0~�t\0Approve Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0)��q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0�sq\0~�t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~\\q\0~\0�sq\0~\0\0�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\0\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~\\q\0~\0�sq\0~\0�Фq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0\0IՉq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\0bD�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��wq\0~�t\0\0pt\0	Executionsq\0~\0\0q\0~sq\0~\0\0Priq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~sq\0~\0�p�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~q\0~	xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~sq\0~\0\0¡zq\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~xxq\0~�t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~sq\0~\0�m�q\0~�t\0approvert\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~ sq\0~\0B��q\0~�t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~\\\0q\0~&sq\0~\0\0�Dnq\0~\"t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0ׁsq\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0s�-q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\0�C�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~-xsq\0~\0E\0\0\0w\0\0\0\nq\0~(xt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~Bsq\0~\0\0F\'q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0��_q\0~Dt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\0N�q\0~Ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0nߕq\0~Ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0�Fq\0~Ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Lxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hxt\0Prioritysq\0~�\0q\0~_sq\0~\0\0t�\"q\0~�t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~csq\0~\0\0a�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~jsq\0~\0`�q\0~�t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~psq\0~\0��\nq\0~lq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~vsq\0~\0�t�q\0~lt\0\0t\0TimeEstimationsq\0~�q\0~{sq\0~\0\0p0q\0~lt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0�9�q\0~|t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0��q\0~|t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0\0��Gq\0~|t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~qq\0~xq\0~|xt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~�sq\0~\0\0�F�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0&��q\0~�t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~�sq\0~\0:yq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0�.q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~�sq\0~\0\0\\��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split��~ѯWS\0\0xq\0~\0\0q\0~�sq\0~\0\\9�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�=0q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~�sq\0~\0\0�.�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0��1q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0\0�:q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�<�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~�sq\0~\0\0��q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0�C�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0fMq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0Ł�q\0~�t\0394,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~\"q\0~Dq\0~`q\0~eq\0~lq\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0V��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0approvalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��q\0~�t\0Approvalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�;tq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0�bdq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0/�Gq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0\0uJJq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\0\0`M�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0��:q\0~\rt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0\09��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0.:,q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0SubFlowsq\0~\0�5�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0l �q\0~\"t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0�`q\0~\"q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~-sq\0~\0\0$u=q\0~\"t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\'q\0~*q\0~.xxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~t\0\rBlockActivitysq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0\0�r}q\0~5t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~:xxq\0~t\0	Performersq\0~\0q\0~>sq\0~\0\0A�q\0~�t\0\0t\0	StartModesq\0~!\0q\0~Bsq\0~\0�*�q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0<3\nq\0~Ct\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\0�\n^q\0~Gt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0��Gq\0~Gt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0�v7q\0~Gt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Kxsq\0~\0E\0\0\0w\0\0\0\nq\0~Gxt\0\nFinishModesq\0~C\0q\0~^sq\0~\0|83q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0M��q\0~_t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\0\rR�q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0��sq\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0�>�q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~gxsq\0~\0E\0\0\0w\0\0\0\nq\0~cxt\0Prioritysq\0~�\0q\0~zsq\0~\0���q\0~�t\0\0t\0	Deadlinessq\0~d\0q\0~~sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0�,7q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~�sq\0~\0\0���q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\08�gq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0\0��kq\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0V�q\0~�t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0\0Gޏq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0d��q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0q\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0|ݒq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0�`\'q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~�sq\0~\0ߺq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\00Hq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0�g�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0\0aU�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0\0�Pq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�b|q\0~�t\0transition3pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�v�q\0~�t\0transition6pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0n��q\0~�t\0transition5pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�8q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\07�/q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�F1q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�`2q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0ҕ=q\0~�t\0566,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~\0q\0~q\0~?q\0~Cq\0~_q\0~{q\0~q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0D\nzq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�=wq\0~t\0	activity1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�q\0~t\0Resubmit Proposalpt\0Descriptionsq\0~\02\0q\0~sq\0~\0\0;\'q\0~t\0\0t\0Limitsq\0~�\0q\0~\Zsq\0~\0\0���q\0~t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\0L��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0ֈAq\0~(t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0\0�~�q\0~-t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0\0?9q\0~-t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0SubFlowsq\0~\0��Zq\0~-t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�X�q\0~=t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0�&Eq\0~=q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~Hsq\0~\0\0���q\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Bq\0~Eq\0~Ixxq\0~1xsq\0~\0E\0\0\0w\0\0\0\nq\0~-xsq\0~t\0\rBlockActivitysq\0~\0\0X^�q\0~t\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0�(�q\0~Pt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Uxxq\0~(t\0	Performersq\0~\0q\0~Ysq\0~\0\0�Xq\0~t\0	requestert\0	StartModesq\0~!\0q\0~]sq\0~\0\0�&�q\0~t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0 �q\0~^t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\0A?�q\0~bt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0���q\0~bt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0�	�q\0~bt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~fxsq\0~\0E\0\0\0w\0\0\0\nq\0~bxt\0\nFinishModesq\0~C\0q\0~ysq\0~\0;��q\0~t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0?�Vq\0~zt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\0��.q\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0m��q\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0 <q\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~~xt\0Prioritysq\0~�\0q\0~�sq\0~\0c�q\0~t\0\0t\0	Deadlinessq\0~d\0q\0~�sq\0~\0\04�zq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~�sq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0\0H��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~�sq\0~\0\0:D\"q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0ON�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0�N�q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0�5yq\0~�t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0.��q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0�9�q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0Ypq\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0�	�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0*V�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Eq\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�Kwq\0~�t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\n�}q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�ڦq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��q\0~�t\0738,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0{�q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~q\0~q\0~q\0~Zq\0~^q\0~zq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0=W�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0MdDq\0~�t\0\rsend_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0Z�<q\0~�t\0\rSend Proposalpt\0Descriptionsq\0~\02\0q\0~sq\0~\0\0���q\0~�t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0\0�ßq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0�bq\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\01)Bq\0~\nt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0Mq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0d�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0SubFlowsq\0~\0\0D�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�Tq\0~)t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0>��q\0~)q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~4sq\0~\0jxq\0~)t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~.q\0~1q\0~5xxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~t\0\rBlockActivitysq\0~\0�[q\0~\nt\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0\0�2�q\0~<t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Axxq\0~t\0	Performersq\0~\0q\0~Esq\0~\0Kϙq\0~�t\0	requestert\0	StartModesq\0~!\0q\0~Isq\0~\0\0*^q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0���q\0~Jt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0�Vq\0~Nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0T��q\0~Nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0|�q\0~Nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Rxsq\0~\0E\0\0\0w\0\0\0\nq\0~Nxt\0\nFinishModesq\0~C\0q\0~esq\0~\0\0P6�q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0D�q\0~ft\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0���q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0�)�q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\02��q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~nxsq\0~\0E\0\0\0w\0\0\0\nq\0~jxt\0Prioritysq\0~�\0q\0~�sq\0~\0\0n�q\0~�t\0\0t\0	Deadlinessq\0~d\0q\0~�sq\0~\0\0��tq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~�sq\0~\0� �q\0~�t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0\Z`q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~�sq\0~\0�rrq\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0\n̕q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0\0�[�q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0���q\0~�t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0\0�y%q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0R��q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0b\\Iq\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\Z?�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0K�hq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0f|�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0��uq\0~�t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0[[hq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�\"(q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0$��q\0~�t\01082,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0}��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0q[q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0�wq\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~q\0~q\0~\nq\0~Fq\0~Jq\0~fq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0t��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��!q\0~�t\0parallelpq\0~\0sq\0~\0\0q\0~\0sq\0~\0#<�q\0~�t\0Parallelpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0e�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0�+Kq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0�K�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0\0a�Hq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\0\0ļmq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0.�q\0~\0t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0m~�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0��xq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0SubFlowsq\0~\0f�Qq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0q\0~t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0��q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~ sq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\Zq\0~q\0~!xxq\0~	xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~t\0\rBlockActivitysq\0~\0\09vq\0~�t\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0\0M��q\0~(t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~-xxq\0~�t\0	Performersq\0~\0q\0~1sq\0~\0�(9q\0~�t\0\0t\0	StartModesq\0~!\0q\0~5sq\0~\0\0��hq\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0��q\0~6t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0k��q\0~:t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0&4\'q\0~:t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0*�q\0~:t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~>xsq\0~\0E\0\0\0w\0\0\0\nq\0~:xt\0\nFinishModesq\0~C\0q\0~Qsq\0~\0D{�q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0�Eq\0~Rt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0u��q\0~Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0�@�q\0~Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0�@�q\0~Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Zxsq\0~\0E\0\0\0w\0\0\0\nq\0~Vxt\0Prioritysq\0~�\0q\0~msq\0~\0��q\0~�t\0\0t\0	Deadlinessq\0~d\0q\0~qsq\0~\0\0�Fq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~wsq\0~\0�Eq\0~�t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0,�*q\0~xq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~sq\0~\0d�cq\0~xt\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0�D�q\0~xt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0\0�R�q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0\0��q\0~�t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0�wq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~|q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0(}q\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0�CLq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0�܎q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~�sq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�l�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0\0_�hq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~�t\0ANDsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0\05�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0\rTransitionRefsq\0~\0\0�Z�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�q�q\0~�t\0transition7pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0.o\0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0y�\'q\0~�t\0transition8pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0@I�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0}\Zzq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0U]�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0s@q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0=+q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�zyq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~�t\0738,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~2q\0~6q\0~Rq\0~nq\0~rq\0~xq\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0]�q\0~�t\0tool1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0`jVq\0~�t\0\ZSend Approval Notificationpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0�E8q\0~�t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0\0#��q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0\0�_�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\07��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\030q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0�d�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0�e�q\0~ t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~\'t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0zq\0~\'q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~\0q\0~4sq\0~\0���q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~:sq\0~\0\0!�Fq\0~\'t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~>sq\0~\0\0�Uq\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~,q\0~/q\0~5q\0~;q\0~?xxsq\0~�t\0SubFlowsq\0~\0\0�Pq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�aq\0~Et\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0�\0!q\0~Eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~Psq\0~\0\0풄q\0~Et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Jq\0~Mq\0~Qxxq\0~ xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~t\0\rBlockActivitysq\0~\0.O�q\0~t\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0���q\0~Xt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~]xxq\0~t\0	Performersq\0~\0q\0~asq\0~\0\0|^�q\0~�t\0systemt\0	StartModesq\0~!\0q\0~esq\0~\0!�Wq\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0�G�q\0~ft\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0^&9q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0��q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0+�\'q\0~jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~nxsq\0~\0E\0\0\0w\0\0\0\nq\0~jxt\0\nFinishModesq\0~C\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0�Y�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0��Wq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\09N-q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0;�mq\0~�t\0\0t\0	Deadlinessq\0~d\0q\0~�sq\0~\0+tq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0\0��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~�sq\0~\0\0�I�q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0/�xq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0�9q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0�?�q\0~�t\0\0t\0Durationsq\0~�\0q\0~�sq\0~\0\0�U�q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0�qq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0�yq\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0��\"q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0D�dq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0ݕ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�R q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0oՏq\0~�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0-ɑq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0e?q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0�E�q\0~�t\01082,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0F4q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�\Zq\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�~�q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~\0q\0~q\0~q\0~bq\0~fq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0}Uq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0tool2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0Y��q\0~�t\0Send Reject Notificationpt\0Descriptionsq\0~\02\0q\0~	\nsq\0~\0\06�q\0~�t\0\0t\0Limitsq\0~�\0q\0~	sq\0~\0\0��q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0(q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0E�q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\0�fBq\0~	t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0�w�q\0~	t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0\0���q\0~	!t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0\0�(q\0~	!t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~&t\0Toolsq\0~\0\0�Aq\0~	+t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0[�q\0~	1t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Óq\0~	1q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~2q\0~3xt\0ActualParameterssq\0~\0q\0~	<sq\0~\0���q\0~	1t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~	Bsq\0~\00�\\q\0~	1t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~	Fsq\0~\0\0N�q\0~	1t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	6q\0~	9q\0~	=q\0~	Cq\0~	Gxxsq\0~�t\0SubFlowsq\0~\0\0��\"q\0~	!t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�q\0~	Mt\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0KD:q\0~	Mq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~	Xsq\0~\0lz�q\0~	Mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~	Rq\0~	Uq\0~	Yxxq\0~	+xsq\0~\0E\0\0\0w\0\0\0\nq\0~	!xsq\0~t\0\rBlockActivitysq\0~\0\0�uGq\0~	t\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0��q\0~	`t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	exxq\0~	t\0	Performersq\0~\0q\0~	isq\0~\0\0��|q\0~�t\0systemt\0	StartModesq\0~!\0q\0~	msq\0~\0\0?��q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0	��q\0~	nt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0+lq\0~	rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0YHq\0~	rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0���q\0~	rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	vxsq\0~\0E\0\0\0w\0\0\0\nq\0~	rxt\0\nFinishModesq\0~C\0q\0~	�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0�4�q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0[D2q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0\0�b�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	�xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xt\0Prioritysq\0~�\0q\0~	�sq\0~\0\0�J�q\0~�t\0\0t\0	Deadlinessq\0~d\0q\0~	�sq\0~\0\0?�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~	�sq\0~\0�9�q\0~�t\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0\0�?�q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~	�sq\0~\0\0��q\0~	�t\0\0t\0TimeEstimationsq\0~�q\0~	�sq\0~\0|\Z�q\0~	�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~	�sq\0~\0\0��q\0~	�t\0\0t\0WorkingTimesq\0~�\0q\0~	�sq\0~\0\0I�q\0~	�t\0\0t\0Durationsq\0~�\0q\0~	�sq\0~\0�Oq\0~	�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xt\0Iconsq\0~�\0q\0~	�sq\0~\0\0&��q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~	�sq\0~\0�q\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~	�sq\0~\0\0�dq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~	�sq\0~\0\0�E�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0t\0�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Eq\0~	�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0P-Vq\0~	�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~�t\0ExtendedAttributesq\0~\0Ш�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�>�q\0~	�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0Ժfq\0~	�t\0738,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�`�q\0~	�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0z�Wq\0~	�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~\nxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	q\0~	q\0~	q\0~	q\0~	q\0~	jq\0~	nq\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�xsq\0~�t\0Activitysq\0~\0S�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~\nt\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0wP�q\0~\nt\0Route 1pt\0Descriptionsq\0~\02\0q\0~\nsq\0~\0\0b�q\0~\nt\0\0t\0Limitsq\0~�\0q\0~\nsq\0~\0\0��q\0~\nt\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0��eq\0~\nt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Routesq\0~\0y52q\0~\n\Zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Implementationsq\0~\0\0���q\0~\n\Zt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0$҉q\0~\n$t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Nosq\0~\0zJ�q\0~\n)t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�\0t\0Toolssq\0~\0�R�q\0~\n)t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0SubFlowsq\0~\0\0���q\0~\n)t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0r��q\0~\n9t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0/PGq\0~\n9q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~xt\0ActualParameterssq\0~\0q\0~\nDsq\0~\0?�7q\0~\n9t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n>q\0~\nAq\0~\nExxq\0~\n-xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n)xsq\0~t\0\rBlockActivitysq\0~\0\0c�q\0~\n\Zt\0\0sq\0~\0w\0\0\0q\0~sq\0~\0q\0~sq\0~\0\0@n�q\0~\nLt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nQxxq\0~\nt\0	Performersq\0~\0q\0~\nUsq\0~\0\0\"�q\0~\nt\0\0t\0	StartModesq\0~!\0q\0~\nYsq\0~\0���q\0~\nt\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0$�2q\0~\nZt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0��q\0~\n^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0�˥q\0~\n^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0\0x�q\0~\n^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\nbxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n^xt\0\nFinishModesq\0~C\0q\0~\nusq\0~\0d�Yq\0~\nt\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'\0q\0~&sq\0~\0\0�#�q\0~\nvt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~,\0t\0XMLEmptyChoiceElementsq\0~\0\01�Lq\0~\nzt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~3t\0	Automaticsq\0~\0N{�q\0~\nzt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~:t\0Manualsq\0~\0��q\0~\nzt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\n~xsq\0~\0E\0\0\0w\0\0\0\nq\0~\nzxt\0Prioritysq\0~�\0q\0~\n�sq\0~\0\0j�/q\0~\nt\0\0t\0	Deadlinessq\0~d\0q\0~\n�sq\0~\0u�q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~k\0q\0~\n�sq\0~\0\0h(�q\0~\nt\0\0sq\0~\0w\0\0\0q\0~psq\0~\0\0q\0~psq\0~\0\0P��q\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~tq\0~uxt\0Costsq\0~wq\0~\n�sq\0~\0x�$q\0~\n�t\0\0t\0TimeEstimationsq\0~�q\0~\n�sq\0~\0\03Qq\0~\n�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~\n�sq\0~\0+��q\0~\n�t\0\0t\0WorkingTimesq\0~�\0q\0~\n�sq\0~\0\0�QXq\0~\n�t\0\0t\0Durationsq\0~�\0q\0~\n�sq\0~\0\0i�q\0~\n�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�xt\0Iconsq\0~�\0q\0~\n�sq\0~\0���q\0~\nt\0\0t\0\rDocumentationsq\0~\07\0q\0~\n�sq\0~\0�	�q\0~\nt\0\0t\0TransitionRestrictionssq\0~�\0q\0~\n�sq\0~\06(�q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0\0�#�q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0E4q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�D�q\0~\n�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�[\rq\0~\n�t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�xsq\0~�t\0ExtendedAttributesq\0~\0I�(q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0i�	q\0~\n�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�	�q\0~\n�t\0222,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\nq\0~\nq\0~\nq\0~\nq\0~\n\Zq\0~\nVq\0~\nZq\0~\nvq\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~\n�sq\0~\0� �q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0\0wy�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0O�mq\0~\n�t\0transition2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\02��q\0~\n�t\0\0pt\0Fromsq\0~\0q\0~\n�sq\0~\0��q\0~\n�t\0approve_proposalpt\0Tosq\0~\0q\0~\n�sq\0~\0㻞q\0~\n�t\0approvalpt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~sq\0~\0\0�b�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0���q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0\nq\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0��q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0\0���q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0G�hq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0S2@q\0~\Zt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0,Uq\0~\Zt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\"xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~q\0~q\0~xsq\0~\n�t\0\nTransitionsq\0~\0��xq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0y��q\0~\'t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0k+Lq\0~\'t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0�W2q\0~\'t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0�ӱq\0~\'t\0	activity1pt\0	Conditionsq\0~\0q\0~8sq\0~\0\0���q\0~\'t\0status==\'resubmit\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��3q\0~9t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~=xt\0Descriptionsq\0~\02\0q\0~Bsq\0~\0\0���q\0~\'t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~Fsq\0~\0\03N�q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�^�q\0~Gt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0YM^q\0~Lt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�q\0~Lt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Qq\0~Txxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~,q\0~/q\0~2q\0~5q\0~9q\0~Cq\0~Gxsq\0~\n�t\0\nTransitionsq\0~\0\0�i�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~Yt\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�9Lq\0~Yt\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0�&Lq\0~Yt\0	activity1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0�r�q\0~Yt\0approve_proposalpt\0	Conditionsq\0~\0q\0~jsq\0~\0�q\0~Yt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�2q\0~kq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~oxt\0Descriptionsq\0~\02\0q\0~ssq\0~\0Ӓ�q\0~Yt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~wsq\0~\0E�q\0~Yt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0�B\\q\0~xt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\Z��q\0~}t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��Jq\0~}t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~^q\0~aq\0~dq\0~gq\0~kq\0~tq\0~xxsq\0~\n�t\0\nTransitionsq\0~\0\0��%q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0	=�q\0~�t\0transition6pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0���q\0~�t\0approvedpq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0Dq\0~�t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0��q\0~�t\0parallelpt\0	Conditionsq\0~\0q\0~�sq\0~\0V\rLq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�+�q\0~�t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0���q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0Cj�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0Dnq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�y�q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0�mq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0transition7pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0���q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0Fq\0~�t\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\0&}q\0~�t\0\rsend_proposalpt\0	Conditionsq\0~\0q\0~�sq\0~\0\0Q�_q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\03Q�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0<z�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0ГAq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0s��q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�{�q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0\0��<q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0transition8pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�F�q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0I��q\0~�t\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\0/��q\0~�t\0tool1pt\0	Conditionsq\0~\0q\0~�sq\0~\0\0)IDq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�#�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0���q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0\0-b�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0���q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�;q\0~t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~xsq\0~\n�t\0\nTransitionsq\0~\0B�eq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�M�q\0~t\0transition5pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\03L%q\0~t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0��Hq\0~t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0\0�=�q\0~t\0tool2pt\0	Conditionsq\0~\0q\0~/sq\0~\0�2q\0~t\0status==\'rejected\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~0t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~4xt\0Descriptionsq\0~\02\0q\0~9sq\0~\0�\0�q\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~=sq\0~\0�G6q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0#(�q\0~>t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0To�q\0~Ct\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0x&xq\0~Ct\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hq\0~Kxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~#q\0~&q\0~)q\0~,q\0~0q\0~:q\0~>xsq\0~\n�t\0\nTransitionsq\0~\0\0%��q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0\\�q\0~Pt\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0n�Iq\0~Pt\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0\02g�q\0~Pt\0route1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0A�q\0~Pt\0approve_proposalpt\0	Conditionsq\0~\0q\0~asq\0~\0\08�\0q\0~Pt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0.��q\0~bq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~fxt\0Descriptionsq\0~\02\0q\0~jsq\0~\0\0��q\0~Pt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~nsq\0~\0���q\0~Pt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0���q\0~ot\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0?g�q\0~tt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�ؘq\0~tt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~yq\0~|xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Uq\0~Xq\0~[q\0~^q\0~bq\0~kq\0~oxxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0̀q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0Z�q\0~�t\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~�sq\0~\0\0q\0~�sq\0~\0ed�q\0~�t\0requester;approver;systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\Z�Hq\0~�t\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0�E�q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�Y�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�ݲq\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=1292,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\r�9q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0\0Bq\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=1292,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�q�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�7�q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0]�yq\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=948,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~�q\0~�q\0~�q\0~�q\0~\n�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0�F\'q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0ėq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0EDITING_TOOLpq\0~�sq\0~\0\0q\0~�sq\0~\0\0kt�q\0~�t\0%Workflow Designer 3.0-BETA - build 12pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0Θ�q\0~�t\0EDITING_TOOL_VERSIONpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~�t\02.0-2(4?)-C-20080226-2126pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0v@�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�,Yq\0~�t\0JaWE_CONFIGURATIONpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~�t\0defaultpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~Eq\0~�q\0~�q\0~�x\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\0\0�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\0\0�H�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\01}�q\0~�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0\'\n�q\0~�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~\rxx',1000202,1,1000203,0),('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"dashboard\" Name=\"Dashboard\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"requester\" Name=\"Requester\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"approver\" Name=\"Approver\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"system\" Name=\"System\">\n            <ParticipantType Type=\"SYSTEM\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"process1\" Name=\"User Registration Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n                <DataField Id=\"username\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"activity1\" Name=\"Approve Registration\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"222,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"username\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition2\"/>\n                                    <TransitionRef Id=\"transition3\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"394,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool2\" Name=\"Send Rejection Email\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"566,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool3\" Name=\"Send User Registration Email\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"910,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"activity2\" Name=\"Create User\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"757,12\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"username\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"activity1\" Id=\"transition1\" To=\"route1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition2\" To=\"activity2\">\n                    <Condition Type=\"CONDITION\">status==\'approved\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition3\" Name=\"rejected\" To=\"tool2\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"437,347\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"activity2\" Id=\"transition4\" To=\"tool3\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"814,349\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"requester;approver;system\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=activity1,X_OFFSET=260,Y_OFFSET=51,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=715,Y_OFFSET=29,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool3,X_OFFSET=1120,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Workflow Designer 3.1-SNAPSHOT - build 493\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"2.0-2(4?)-C-20080226-2126\"/>\n        <ExtendedAttribute Name=\"JaWE_CONFIGURATION\" Value=\"default\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0]R�pt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0\0��q\0~\0\nt\0	dashboardpt\0Namesq\0~\0\0q\0~\0sq\0~\0\0|}�q\0~\0\nt\0	Dashboardpt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0�9q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0=��q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0S�tq\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0\0��q\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0��Wq\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\0�q\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\0\0��hq\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0\0�dq\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0\nq\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0l^q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0�`q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0�q\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0\0@�q\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0\0���q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\0\0�կq\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm�\0\0xq\0~\0\0q\0~\0isq\0~\0\0��q\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0\0�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0\0�q\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0�O�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0��q\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\0\0��q\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0\0Liq\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0ū�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0�sq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\0��Aq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0�Qq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0[9q\0~\0�t\0	requesterpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��q\0~\0�t\0	Requesterpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0\0?4�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0�i�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0_�Jq\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0}q\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\0r̙q\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\0�l9q\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0\0[&q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0�qq\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0\0P�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0D6q\0~\0�t\0approverpq\0~\0sq\0~\0\0q\0~\0sq\0~\04q\0~\0�t\0Approverpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0�2�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0>%�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0\0%P.q\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0�%q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0I��q\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�ܳq\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0)�Bq\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0\0č$q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xsq\0~\0�t\0Participantsq\0~\0\0�ewq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~t\0systempq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0e��q\0~t\0Systempt\0ParticipantTypesq\0~\0�q\0~sq\0~\0��Wq\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�8�q\0~ t\0SYSTEMsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~$xt\0Descriptionsq\0~\02\0q\0~)sq\0~\0\0sY�q\0~t\0\0t\0ExternalReferencesq\0~\0�\0q\0~-sq\0~\0n�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0ZBGq\0~.t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�vFq\0~.t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0h�q\0~.t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~2q\0~5q\0~8xt\0ExtendedAttributessq\0~\0�\0q\0~<sq\0~\0�%q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~ q\0~*q\0~.q\0~=xxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~Csq\0~\0M��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0\0�*�q\0~Et\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~Kt\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�Gq\0~Kt\0\0pt\0Descriptionsq\0~\02\0q\0~Vsq\0~\0��Lq\0~Kt\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~Zsq\0~\0\0z9�q\0~Kt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0\0pS�q\0~]t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�\0t\0ExternalReferencesq\0~\0\0�|q\0~]t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0_Mq\0~ht\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0���q\0~ht\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�o�q\0~ht\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~mq\0~pq\0~sxxq\0~bt\0ExtendedAttributessq\0~\0�\0q\0~wsq\0~\0\0���q\0~Kt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Pq\0~Sq\0~Wq\0~]q\0~xxxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~~sq\0~\0*��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~�sq\0~\0\0Q��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\0\0�lGq\0~�t\0process1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0NW�q\0~�t\0User Registration Processpt\0AccessLevelsq\0~\0\0q\0~�sq\0~\0a�7q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~�sq\0~\0��q\0~�t\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0L@fq\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0��q\0~�t\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0\0�jq\0~�t\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0\0N�q\0~�t\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0\0k�q\0~�t\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0\0i�$q\0~�t\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0\0�F�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~�sq\0~\0\0.t�q\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~�sq\0~\0��mq\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~�sq\0~\0\0^�rq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0��Rq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~�sq\0~\0\0X�Jq\0~�t\0\0t\0Versionsq\0~\0[\0q\0~�sq\0~\0\0�yq\0~�t\0\0t\0Codepagesq\0~\0`\0q\0~�sq\0~\05q\0~�t\0\0t\0\nCountrykeysq\0~\0e\0q\0~�sq\0~\0�s�q\0~�t\0\0t\0Responsiblessq\0~\0j\0q\0~�sq\0~\0�O�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0FormalParameterssq\0~a\0q\0~sq\0~\0PVq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nDataFieldssq\0~\0q\0~sq\0~\0+q�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0���q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�~&q\0~t\0\0pt\0IsArraysq\0~\0\0q\0~sq\0~\0+Sq\0~t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~ sq\0~\0\0f�q\0~t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~\\q\0~&sq\0~\0\0v^�q\0~\"t\0\0sq\0~\0E\0\0\0	w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\09WPq\0~(t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0�^oq\0~-t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0\nq\0~2xsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0\0��q\0~(t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�f�q\0~?t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Dxsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0��sq\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0�q\0~(t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0̈́lq\0~Ot\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0���q\0~Ot\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�wq\0~Ot\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Tq\0~Wq\0~Zxsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0i��q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\0\0��\\q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0��vq\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0\0�Uq\0~(t\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~ysq\0~\0\0v��q\0~tt\0\0pt\0\nUpperIndexsq\0~\0q\0~}sq\0~\0�,Kq\0~tt\0\0pq\0~&sq\0~\'q\0~&sq\0~\0\07�$q\0~tt\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~zq\0~~q\0~�xsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0�U�q\0~(t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'q\0~&sq\0~\0\0!\nq\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~-xsq\0~\0E\0\0\0w\0\0\0\nq\0~(xt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~�sq\0~\09q\0~t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~�sq\0~\0]T�q\0~t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0`Äq\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0�I�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~\Zq\0~\"q\0~�q\0~�q\0~�q\0~�xsq\0~\rt\0	DataFieldsq\0~\0\0\Zy�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0usernamepq\0~\0sq\0~\0\0q\0~\0sq\0~\0��q\0~�t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0�M�q\0~�t\0FALSEsq\0~\0E\0\0\0w\0\0\0q\0~q\0~xt\0DataTypesq\0~!q\0~�sq\0~\0\0:q�q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'q\0~&sq\0~\0\r��q\0~�t\0\0sq\0~\0E\0\0\0	w\0\0\0\nsq\0~,t\0	BasicTypesq\0~\0�N`q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\06��q\0~�t\0STRINGsq\0~\0E\0\0\0w\0\0\0q\0~6q\0~7q\0~8q\0~9q\0~:q\0~;q\0~<xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~>t\0DeclaredTypesq\0~\0�dKq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��5q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~Ht\0\nSchemaTypesq\0~\0L�Kq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0R��q\0~�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0�kq\0~�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0!�Qq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsq\0~^t\0\nRecordTypesq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0	UnionTypesq\0~\0\0��iq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~lt\0EnumerationTypesq\0~\0V]q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~st\0	ArrayTypesq\0~\0\0]�gq\0~�t\0\0sq\0~\0w\0\0\0q\0~ysq\0~\0q\0~ysq\0~\0\0e� q\0~�t\0\0pq\0~}sq\0~\0q\0~}sq\0~\0qb�q\0~�t\0\0pq\0~&sq\0~\'q\0~&sq\0~\0\0�e�q\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~xsq\0~�t\0ListTypesq\0~\0\0�a�q\0~�t\0\0sq\0~\0w\0\0\0q\0~&sq\0~\'q\0~&sq\0~\0�g\rq\0~t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0InitialValuesq\0~�\0q\0~sq\0~\0���q\0~�t\0\0t\0Lengthsq\0~�\0q\0~sq\0~\0\0	�q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~sq\0~\0\0�{q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0[�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~q\0~xxt\0Participantssq\0~\0�\0q\0~#sq\0~\0D�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Applicationssq\0~D\0q\0~)sq\0~\0\0�V	q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~/sq\0~\0\0ltq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~6sq\0~\0\0me�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0�>�q\0~8t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0#��q\0~>t\0	activity1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0z�:q\0~>t\0Approve Registrationpt\0Descriptionsq\0~\02\0q\0~Isq\0~\0\0l�7q\0~>t\0\0t\0Limitsq\0~�\0q\0~Msq\0~\0��q\0~>t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~\\q\0~\0�sq\0~\0\0�7Pq\0~>t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\0�}>q\0~Rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\0>�cq\0~Rt\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~\\q\0~\0�sq\0~\0\0�Z3q\0~^t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0��q\0~dt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\0AS�q\0~dt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\0�m�q\0~dt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��wq\0~wt\0\0pt\0	Executionsq\0~\0\0q\0~sq\0~\0\0���q\0~wq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~�sq\0~\0\0w�^q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~|q\0~�q\0~�xxq\0~ixsq\0~\0E\0\0\0w\0\0\0\nq\0~dxsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0�Oq\0~Rt\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~�sq\0~\0\0�\"Tq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~^t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~�sq\0~\0\0��.q\0~>t\0approvert\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~�sq\0~\0_tXq\0~>t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~\\\0q\0~�sq\0~\0�bq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0�k\\q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0V��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\0\0&�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~�sq\0~\0\0�_�q\0~>t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0\0[V�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0��+q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0c�xq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0��q\0~>t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~�sq\0~\0\0!�q\0~>t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~�sq\0~\0\r�\rq\0~>t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~�sq\0~\0\01�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~�sq\0~\0��q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0�?�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0\0���q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~sq\0~\0\0y4q\0~�t\0\0t\0Durationsq\0~�\0q\0~sq\0~\0�{Lq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~q\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~sq\0~\0�fq\0~>t\0\0t\0\rDocumentationsq\0~\07\0q\0~sq\0~\0�)�q\0~>t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~sq\0~\0\0�M�q\0~>t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0\0YF�q\0~>t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0\0�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Ǎq\0~#t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~+sq\0~\0/&q\0~#t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~(q\0~,xsq\0~\"t\0ExtendedAttributesq\0~\0\0|��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��Uq\0~0t\0JaWE_GRAPH_OFFSETpq\0~+sq\0~\0\0q\0~+sq\0~\0�\\�q\0~0t\0222,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~5q\0~8xsq\0~\"t\0ExtendedAttributesq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Z�q\0~<t\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0j�q\0~<t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~Aq\0~Dxsq\0~\"t\0ExtendedAttributesq\0~\0�0�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��xq\0~Ht\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0��:q\0~Ht\0usernamepxsq\0~\0E\0\0\0w\0\0\0\nq\0~Mq\0~Pxxpxsq\0~\0E\0\0\0w\0\0\0q\0~Cq\0~Fq\0~Jq\0~Nq\0~Rq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~q\0~xsq\0~=t\0Activitysq\0~\0\0��q\0~8t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�D�q\0~Ut\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��q\0~Ut\0Route 1pt\0Descriptionsq\0~\02\0q\0~`sq\0~\0��wq\0~Ut\0\0t\0Limitsq\0~�\0q\0~dsq\0~\0\0�I�q\0~Ut\0\0q\0~\0�sq\0~Qq\0~\0�sq\0~\0\0�\Zq\0~Ut\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~Vt\0Routesq\0~\0;�q\0~ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~]t\0Implementationsq\0~\0!��q\0~ht\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~cq\0~\0�sq\0~\0\0�ZHq\0~rt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~ht\0Nosq\0~\0�D�q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~o\0t\0Toolssq\0~\0\0��q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~vt\0SubFlowsq\0~\0\0-�Yq\0~wt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�jq\0~�t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0�jmq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0\\\Z�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~{xsq\0~\0E\0\0\0w\0\0\0\nq\0~wxsq\0~�t\0\rBlockActivitysq\0~\0�_q\0~ht\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0\0]3�q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~lt\0	Performersq\0~�\0q\0~�sq\0~\0\0��q\0~Ut\0\0t\0	StartModesq\0~�\0q\0~�sq\0~\0�~�q\0~Ut\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0O�eq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0��Gq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0\00�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~�\0q\0~�sq\0~\0\0hZq\0~Ut\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0��oq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0R��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0%J�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0\0X*�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\0O�q\0~Ut\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0�0�q\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\07q\0~Ut\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0sq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0Dqq\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0X��q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~�sq\0~\0?g�q\0~�t\0\0t\0WorkingTimesq\0~�\0q\0~�sq\0~\0��bq\0~�t\0\0t\0Durationsq\0~�\0q\0~sq\0~\0\0�	\rq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~\r\0q\0~sq\0~\0\0�6�q\0~Ut\0\0t\0\rDocumentationsq\0~\07\0q\0~sq\0~\0�q\0~Ut\0\0t\0TransitionRestrictionssq\0~\0q\0~sq\0~\0�Aq\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0�ۦq\0~t\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~sq\0~\0\Z��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�pq\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\"xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split��~ѯWS\0\0xq\0~\0\0q\0~(sq\0~\0\'h�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0M\rq\0~*t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~%q\0~&xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~2sq\0~\0K�q\0~*t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0��q\0~4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�٭q\0~:t\0transition2pxsq\0~\0E\0\0\0w\0\0\0\nq\0~?xsq\0~9t\0\rTransitionRefsq\0~\0\0i�q\0~4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0<fq\0~Ct\0transition3pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hxxxsq\0~\0E\0\0\0w\0\0\0\nq\0~.q\0~4xxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~*xxt\0ExtendedAttributessq\0~\0�\0q\0~Nsq\0~\0qq\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0��q\0~Ot\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Qq\0~Tt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~+sq\0~\0\0q\0~+sq\0~\0\0A�lq\0~Tt\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Yq\0~\\xsq\0~\"t\0ExtendedAttributesq\0~\0\0~6q\0~Ot\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0,x�q\0~`t\0JaWE_GRAPH_OFFSETpq\0~+sq\0~\0\0q\0~+sq\0~\0\0�\"#q\0~`t\0394,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~eq\0~hxxpxsq\0~\0E\0\0\0w\0\0\0q\0~Zq\0~]q\0~aq\0~eq\0~hq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~	q\0~\rq\0~q\0~Oxsq\0~=t\0Activitysq\0~\0\0,_�q\0~8t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~mt\0tool2pq\0~\0sq\0~\0\0q\0~\0sq\0~\04}�q\0~mt\0Send Rejection Emailpt\0Descriptionsq\0~\02\0q\0~xsq\0~\08(�q\0~mt\0\0t\0Limitsq\0~�\0q\0~|sq\0~\0��q\0~mt\0\0q\0~\0�sq\0~Qq\0~\0�sq\0~\0��q\0~mt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~Vt\0Routesq\0~\0\0n��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~]t\0Implementationsq\0~\0OLzq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~cq\0~\0�sq\0~\0&Cq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~ht\0Nosq\0~\0eI�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~o\0t\0Toolssq\0~\0\0�>q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0\0Kjlq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�1Xq\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\07��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~�\0q\0~�sq\0~\0\0gq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�t�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0f�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~vt\0SubFlowsq\0~\0:`Wq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0M;Qq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0q\\ q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rBlockActivitysq\0~\0W\\~q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0\0y_$q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0\0UBq\0~mt\0systemt\0	StartModesq\0~�\0q\0~�sq\0~\0d3�q\0~mt\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0��%q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\0!q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0cZ�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~�\0q\0~�sq\0~\0��q\0~mt\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0�\07q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\0M�}q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0{15q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~sq\0~\0\0ۡ�q\0~mt\0\0t\0	Deadlinessq\0~�\0q\0~\Zsq\0~\0[vDq\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~ sq\0~\0��q\0~mt\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0.d�q\0~!q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~(sq\0~\0���q\0~!t\0\0t\0TimeEstimationsq\0~�q\0~,sq\0~\0��q\0~!t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~1sq\0~\0	Q�q\0~-t\0\0t\0WorkingTimesq\0~�\0q\0~5sq\0~\0\0Ѕ�q\0~-t\0\0t\0Durationsq\0~�\0q\0~9sq\0~\0\0��q\0~-t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~2q\0~6q\0~:xxsq\0~\0E\0\0\0w\0\0\0\nq\0~%q\0~)q\0~-xt\0Iconsq\0~\r\0q\0~?sq\0~\0\0�/�q\0~mt\0\0t\0\rDocumentationsq\0~\07\0q\0~Csq\0~\0\0Jv)q\0~mt\0\0t\0TransitionRestrictionssq\0~\0q\0~Gsq\0~\0\0���q\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~Msq\0~\0\0:�q\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0\0�\0�q\0~Nt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��*q\0~St\0JaWE_GRAPH_PARTICIPANT_IDpq\0~+sq\0~\0\0q\0~+sq\0~\0\0���q\0~St\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~Xq\0~[xsq\0~\"t\0ExtendedAttributesq\0~\0\0�4q\0~Nt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~_t\0JaWE_GRAPH_OFFSETpq\0~+sq\0~\0\0q\0~+sq\0~\0{�q\0~_t\0566,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~dq\0~gxsq\0~\"t\0ExtendedAttributesq\0~\0\0�uq\0~Nt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Z�aq\0~kt\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0\0��4q\0~kt\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~pq\0~sxxpxsq\0~\0E\0\0\0w\0\0\0q\0~rq\0~uq\0~yq\0~}q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~!q\0~@q\0~Dq\0~Hq\0~Nxsq\0~=t\0Activitysq\0~\0�Gq\0~8t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�eq\0~xt\0tool3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0T�{q\0~xt\0Send User Registration Emailpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0C�;q\0~xt\0\0t\0Limitsq\0~�\0q\0~�sq\0~\05�rq\0~xt\0\0q\0~\0�sq\0~Qq\0~\0�sq\0~\0]~�q\0~xt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~Vt\0Routesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~]t\0Implementationsq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~cq\0~\0�sq\0~\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~ht\0Nosq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~o\0t\0Toolssq\0~\0:IMq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0Toolsq\0~\0\0�8q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0	\\�q\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0֜�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0�jgq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~�sq\0~\0t��q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0�`q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~vt\0SubFlowsq\0~\0�� q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0\0���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0�e�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rBlockActivitysq\0~\0\0�ŝq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0|�q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0�jq\0~xt\0systemt\0	StartModesq\0~�\0q\0~�sq\0~\0�&�q\0~xt\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\05\0�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\0t�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0nq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~�\0q\0~sq\0~\0\"w�q\0~xt\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0�uq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\0�dJq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0e�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0\0jZ�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~xt\0Prioritysq\0~�\0q\0~sq\0~\0\0{tZq\0~xt\0\0t\0	Deadlinessq\0~�\0q\0~\"sq\0~\0�Qq\0~xt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~(sq\0~\0��q\0~xt\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~)q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~0sq\0~\0\0g��q\0~)t\0\0t\0TimeEstimationsq\0~�q\0~4sq\0~\0D�q\0~)t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~9sq\0~\0�;q\0~5t\0\0t\0WorkingTimesq\0~�\0q\0~=sq\0~\0��q\0~5t\0\0t\0Durationsq\0~�\0q\0~Asq\0~\0l��q\0~5t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~:q\0~>q\0~Bxxsq\0~\0E\0\0\0w\0\0\0\nq\0~-q\0~1q\0~5xt\0Iconsq\0~\r\0q\0~Gsq\0~\0s�q\0~xt\0\0t\0\rDocumentationsq\0~\07\0q\0~Ksq\0~\0:�_q\0~xt\0\0t\0TransitionRestrictionssq\0~\0q\0~Osq\0~\0\n�&q\0~xt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~Usq\0~\0\0��q\0~xt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0s�Oq\0~Vt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0p��q\0~[t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~+sq\0~\0\0q\0~+sq\0~\0�Q�q\0~[t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~`q\0~cxsq\0~\"t\0ExtendedAttributesq\0~\0��q\0~Vt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�eq\0~gt\0JaWE_GRAPH_OFFSETpq\0~+sq\0~\0\0q\0~+sq\0~\0u��q\0~gt\0910,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~lq\0~oxsq\0~\"t\0ExtendedAttributesq\0~\0\0\"�q\0~Vt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�2.q\0~st\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0�;q\0~st\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~xq\0~{xxpxsq\0~\0E\0\0\0w\0\0\0q\0~}q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~#q\0~)q\0~Hq\0~Lq\0~Pq\0~Vxsq\0~=t\0Activitysq\0~\0 �`q\0~8t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0˧\'q\0~�t\0	activity2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�0Nq\0~�t\0Create Userpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0q�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0\0[]�q\0~�t\0\0q\0~\0�sq\0~Qq\0~\0�sq\0~\0\0tTwq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~Vt\0Routesq\0~\0U�bq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~]t\0Implementationsq\0~\0�E�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~cq\0~\0�sq\0~\0��~q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~ht\0Nosq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~o\0t\0Toolssq\0~\0VĨq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~vt\0SubFlowsq\0~\0�]q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0\0pq\0~sq\0~\0\0q\0~sq\0~\0A0q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0`)zq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rBlockActivitysq\0~\0\0C3Yq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0�@3q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0��q\0~�t\0approvert\0	StartModesq\0~�\0q\0~�sq\0~\08�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0@�Uq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\09D$q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0��Dq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0\0.�=q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~�\0q\0~�sq\0~\0�Yq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0\0�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0e�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	Automaticsq\0~\0\0�\n�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0Manualsq\0~\0\0�=�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~\nsq\0~\0\0�q\0~�t\0\0t\0	Deadlinessq\0~�\0q\0~sq\0~\0\0Jl�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~sq\0~\0\0,գq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0}��q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~sq\0~\0\0ip�q\0~t\0\0t\0TimeEstimationsq\0~�q\0~ sq\0~\0\0Z�q\0~t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~%sq\0~\0�(-q\0~!t\0\0t\0WorkingTimesq\0~�\0q\0~)sq\0~\0\0���q\0~!t\0\0t\0Durationsq\0~�\0q\0~-sq\0~\0\0��*q\0~!t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~&q\0~*q\0~.xxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~!xt\0Iconsq\0~\r\0q\0~3sq\0~\0\0�-q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~7sq\0~\0G�q\0~�t\0\0t\0TransitionRestrictionssq\0~\0q\0~;sq\0~\0\0�z�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~Asq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0\0�j�q\0~Bt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Fq\0~Gt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~+sq\0~\0\0q\0~+sq\0~\0\0D�Aq\0~Gt\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Lq\0~Oxsq\0~\"t\0ExtendedAttributesq\0~\0\0�cq\0~Bt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�F(q\0~St\0JaWE_GRAPH_OFFSETpq\0~+sq\0~\0\0q\0~+sq\0~\0�q\0~St\0757,12pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Xq\0~[xsq\0~\"t\0ExtendedAttributesq\0~\0\0o8pq\0~Bt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�}�q\0~_t\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0\0���q\0~_t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~dq\0~gxsq\0~\"t\0ExtendedAttributesq\0~\0�t5q\0~Bt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0flzq\0~kt\0VariableToProcess_UPDATEpq\0~+sq\0~\0\0q\0~+sq\0~\0\0[�:q\0~kt\0usernamepxsq\0~\0E\0\0\0w\0\0\0\nq\0~pq\0~sxxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~q\0~4q\0~8q\0~<q\0~Bxxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~xsq\0~\0\0C�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0\0� �q\0~zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�ۻq\0~�t\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0���q\0~�t\0\0pt\0Fromsq\0~\0q\0~�sq\0~\0\0d��q\0~�t\0	activity1pt\0Tosq\0~\0q\0~�sq\0~\0\0���q\0~�t\0route1pt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0U�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0��<q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0T�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0X-�q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~+sq\0~\0\0q\0~+sq\0~\0&�5q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~t\0\nTransitionsq\0~\0��nq\0~zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0j4jq\0~�t\0transition2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0+�Cq\0~�t\0\0pq\0~�sq\0~\0q\0~�sq\0~\0\0���q\0~�t\0route1pq\0~�sq\0~\0q\0~�sq\0~\0�/�q\0~�t\0	activity2pt\0	Conditionsq\0~�\0q\0~�sq\0~\0\0�ęq\0~�t\0status==\'approved\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0I(�q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\r�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�spq\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~+sq\0~\0\0q\0~+sq\0~\0\0��q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~t\0\nTransitionsq\0~\0\0���q\0~zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�nq\0~�t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0Z6q\0~�t\0rejectedpq\0~�sq\0~\0q\0~�sq\0~\0\0�Y�q\0~�t\0route1pq\0~�sq\0~\0q\0~�sq\0~\0��Yq\0~�t\0tool2pt\0	Conditionsq\0~�\0q\0~�sq\0~\0\0��eq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0{�q\0~�t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~	\0xt\0Descriptionsq\0~\02\0q\0~	sq\0~\0\0q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~		sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0\0C�*q\0~	\nt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~	t\0JaWE_GRAPH_BREAK_POINTSpq\0~+sq\0~\0\0q\0~+sq\0~\0@rzq\0~	t\0437,347pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~	xsq\0~\"t\0ExtendedAttributesq\0~\0\0�qq\0~	\nt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~	t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~+sq\0~\0\0q\0~+sq\0~\0�	q\0~	t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	 q\0~	#xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~	q\0~	\nxsq\0~t\0\nTransitionsq\0~\0�nq\0~zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�H�q\0~	(t\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�kq\0~	(t\0\0pq\0~�sq\0~\0q\0~�sq\0~\0\0���q\0~	(t\0	activity2pq\0~�sq\0~\0q\0~�sq\0~\0��.q\0~	(t\0tool3pt\0	Conditionsq\0~�\0q\0~	9sq\0~\0Ü�q\0~	(t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0d�]q\0~	:q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~	>xt\0Descriptionsq\0~\02\0q\0~	Bsq\0~\0\\N�q\0~	(t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~	Fsq\0~\0?��q\0~	(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0�hq\0~	Gt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�Fq\0~	Lt\0JaWE_GRAPH_BREAK_POINTSpq\0~+sq\0~\0\0q\0~+sq\0~\0,Kfq\0~	Lt\0814,349pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	Qq\0~	Txsq\0~\"t\0ExtendedAttributesq\0~\0\nGaq\0~	Gt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�C?q\0~	Xt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~+sq\0~\0\0q\0~+sq\0~\0\0�\Z�q\0~	Xt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	]q\0~	`xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	-q\0~	0q\0~	3q\0~	6q\0~	:q\0~	Cq\0~	Gxxt\0ExtendedAttributessq\0~\0�\0q\0~	esq\0~\0*7[q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0\0�}�q\0~	ft\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~	kt\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~+sq\0~\0\0q\0~+sq\0~\0\0C�Sq\0~	kt\0requester;approver;systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~	pq\0~	sxsq\0~\"t\0ExtendedAttributesq\0~\0���q\0~	ft\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0p�q\0~	wt\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~+sq\0~\0\0q\0~+sq\0~\0Buq\0~	wt\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=activity1,X_OFFSET=260,Y_OFFSET=51,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	|q\0~	xsq\0~\"t\0ExtendedAttributesq\0~\0\0S�|q\0~	ft\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�شq\0~	�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~+sq\0~\0\0q\0~+sq\0~\0\0E�q\0~	�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=715,Y_OFFSET=29,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~\"t\0ExtendedAttributesq\0~\0�ͩq\0~	ft\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0l1�q\0~	�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~+sq\0~\0\0q\0~+sq\0~\0\0=h_q\0~	�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool3,X_OFFSET=1120,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~$q\0~*q\0~1q\0~8q\0~zq\0~	fxxt\0ExtendedAttributessq\0~\0�\0q\0~	�sq\0~\0��,q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~\"t\0ExtendedAttributesq\0~\0ǀ\0q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��`q\0~	�t\0EDITING_TOOLpq\0~+sq\0~\0\0q\0~+sq\0~\0\0Ǫ�q\0~	�t\0*Workflow Designer 3.1-SNAPSHOT - build 493pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~\"t\0ExtendedAttributesq\0~\0\0�V=q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0ղq\0~	�t\0EDITING_TOOL_VERSIONpq\0~+sq\0~\0\0q\0~+sq\0~\0行q\0~	�t\02.0-2(4?)-C-20080226-2126pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~\"t\0ExtendedAttributesq\0~\0!��q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\Z��q\0~	�t\0JaWE_CONFIGURATIONpq\0~+sq\0~\0\0q\0~+sq\0~\0��q\0~	�t\0defaultpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~Eq\0~�q\0~�q\0~	�x\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\0\0��#q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\0�A�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��Xq\0~	�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0\"o�q\0~	�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xx',1000401,2,1000402,0),('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"hr_expense\" Name=\"HR Expense App\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"claimant\" Name=\"Claimant\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"approver\" Name=\"Approver\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"system\" Name=\"System\">\n            <ParticipantType Type=\"SYSTEM\"/>\n        </Participant>\n        <Participant Id=\"finance\" Name=\"Finance\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"process1\" Name=\"Expense Approval Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"approve_claim\" Name=\"Approve Claim\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"337,49\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition2\"/>\n                                    <TransitionRef Id=\"transition3\"/>\n                                    <TransitionRef Id=\"transition9\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"477,52\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"verify_claim\" Name=\"Verify Claim\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>finance</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"finance\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"595,47\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"resubmit_claim\" Name=\"Resubmit Claim\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>claimant</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"claimant\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"593,39\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route2\" Name=\"Route 2\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition7\"/>\n                                    <TransitionRef Id=\"transition8\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"finance\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"799,53\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool1\" Name=\"Notify Finance Verified\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"784,41\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool2\" Name=\"Notify Finance Rejection\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"1018,40\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool3\" Name=\"Notify Approver Rejection\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"460,36\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"new_claim\" Name=\"Edit Claim\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>claimant</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"claimant\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"125,36\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool4\" Name=\"Update Record Status to Submitted\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"192,30\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"approve_claim\" Id=\"transition1\" To=\"route1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition2\" To=\"resubmit_claim\">\n                    <Condition Type=\"CONDITION\">status==\'Resubmit\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"657,228\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition3\" Name=\"approved\" To=\"verify_claim\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"657,243\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"verify_claim\" Id=\"transition4\" To=\"route2\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"resubmit_claim\" Id=\"transition6\" To=\"tool4\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"263,69\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route2\" Id=\"transition7\" Name=\"verified\" To=\"tool1\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route2\" Id=\"transition8\" To=\"tool2\">\n                    <Condition Type=\"CONDITION\">status==\'Finance Rejected\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"1072,378\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition9\" To=\"tool3\">\n                    <Condition Type=\"CONDITION\">status==\'Rejected\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"new_claim\" Id=\"transition5\" To=\"tool4\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"164,517\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"tool4\" Id=\"transition10\" To=\"approve_claim\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"279,229\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"claimant;approver;finance;system\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=1167,Y_OFFSET=54,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=946,Y_OFFSET=50,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=claimant,CONNECTING_ACTIVITY_ID=new_claim,X_OFFSET=61,Y_OFFSET=49,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool3,X_OFFSET=610,Y_OFFSET=54,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Workflow Designer 3.0-BETA - build 120\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"2.0-2(4?)-C-20080226-2126\"/>\n        <ExtendedAttribute Name=\"JaWE_CONFIGURATION\" Value=\"default\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0�anpt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0\0���q\0~\0\nt\0\nhr_expensept\0Namesq\0~\0\0q\0~\0sq\0~\0\08�xq\0~\0\nt\0HR Expense Apppt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0\0g̓q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0\0���q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0\0��dq\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0\0��Nq\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0W$q\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\03��q\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\0��Iq\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0\0���q\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0\nq\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0\0Sd�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0\0�;�q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0\0.+\\q\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0 �q\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0�`q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\0��q\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm�\0\0xq\0~\0\0q\0~\0isq\0~\0�Eq\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0\0��q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0dJPq\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0K\0>q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0\0��q\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\0\0�1@q\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0\0�t�q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0�#�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0�Øq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0\\Z�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0���q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~\0�t\0claimantpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0DEq\0~\0�t\0Claimantpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0Zs\rq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\07k�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0xb2q\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0\0v��q\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\0��Vq\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\0n�*q\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0\0>��q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0\0��q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0ʢ�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�\'q\0~\0�t\0approverpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0���q\0~\0�t\0Approverpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0\0�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0�A�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0\0���q\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0\0��q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\08��q\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�q\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��bq\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0E��q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xsq\0~\0�t\0Participantsq\0~\0�/�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0+2�q\0~t\0systempq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�$3q\0~t\0Systempt\0ParticipantTypesq\0~\0�q\0~sq\0~\0\0�9q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0���q\0~ t\0SYSTEMsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~$xt\0Descriptionsq\0~\02\0q\0~)sq\0~\0\0|�fq\0~t\0\0t\0ExternalReferencesq\0~\0�\0q\0~-sq\0~\0\0�\n|q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�qq\0~.t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0��@q\0~.t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�q\0~.t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~2q\0~5q\0~8xt\0ExtendedAttributessq\0~\0�\0q\0~<sq\0~\0\0�\'5q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~ q\0~*q\0~.q\0~=xsq\0~\0�t\0Participantsq\0~\0\0�;q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0H�q\0~Ct\0financepq\0~\0sq\0~\0\0q\0~\0sq\0~\0)��q\0~Ct\0Financept\0ParticipantTypesq\0~\0�q\0~Nsq\0~\0��q\0~Ct\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�N�q\0~Ot\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~Sxt\0Descriptionsq\0~\02\0q\0~Xsq\0~\0� rq\0~Ct\0\0t\0ExternalReferencesq\0~\0�\0q\0~\\sq\0~\0\0�V�q\0~Ct\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0���q\0~]t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0:-Cq\0~]t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0q��q\0~]t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~aq\0~dq\0~gxt\0ExtendedAttributessq\0~\0�\0q\0~ksq\0~\0\0���q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hq\0~Kq\0~Oq\0~Yq\0~]q\0~lxxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~rsq\0~\0:��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0\0%�Kq\0~tt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0+Q�q\0~zt\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0Dq\0~zt\0\0pt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0>ٌq\0~zt\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~�sq\0~\0\0<��q\0~zt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�\0t\0ExternalReferencesq\0~\0�͐q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��q\0~�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0���q\0~�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��Xq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0���q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~�q\0~�q\0~�q\0~�xxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~�sq\0~\0\0k�-q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~�sq\0~\0\0�0q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0�$q\0~�t\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\03+	q\0~�t\0process1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0U$�q\0~�t\0Expense Approval Processpt\0AccessLevelsq\0~\0\0q\0~�sq\0~\0߼q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~�sq\0~\0�V�q\0~�t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~�sq\0~\0\0��q\0~�t\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0\0X�\'q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0���q\0~�t\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0�,�q\0~�t\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0\0E�q\0~�t\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0\0��q\0~�t\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0\0�\Z�q\0~�t\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0\ZS8q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~\0sq\0~\0M�@q\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~sq\0~\0,@*q\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~\nsq\0~\0\0(�6q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~sq\0~\0\0ҽ]q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0�]�q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~sq\0~\0�)�q\0~t\0\0t\0Versionsq\0~\0[\0q\0~sq\0~\0�q\0~t\0\0t\0Codepagesq\0~\0`\0q\0~!sq\0~\0��q\0~t\0\0t\0\nCountrykeysq\0~\0e\0q\0~%sq\0~\0\09�bq\0~t\0\0t\0Responsiblessq\0~\0j\0q\0~)sq\0~\0\0W+aq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\Zq\0~q\0~\"q\0~&q\0~*xt\0FormalParameterssq\0~�\0q\0~0sq\0~\0\0�\r@q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nDataFieldssq\0~�\0q\0~6sq\0~\0-.q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0\0���q\0~7t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0A!aq\0~=t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�q\0~=t\0\0pt\0IsArraysq\0~\0\0q\0~Hsq\0~\0\0��zq\0~=t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~Osq\0~\0�`tq\0~=t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~�q\0~Usq\0~\0�x7q\0~Qt\0\0sq\0~\0E\0\0\0	w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\0\0��q\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0���q\0~\\t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0\nq\0~axsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0\0z[q\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\r�q\0~nt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~sxsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0\0���q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0_q\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0N�q\0~~t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0��Nq\0~~t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�?q\0~~t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0ؒ�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\0}�Tq\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0\0�_�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0��q\0~Wt\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~�sq\0~\0\0?{�q\0~�t\0\0pt\0\nUpperIndexsq\0~\0q\0~�sq\0~\0�:�q\0~�t\0\0pq\0~Usq\0~Vq\0~Usq\0~\0\0m�pq\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0�+�q\0~Wt\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0��}q\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~\\xsq\0~\0E\0\0\0w\0\0\0\nq\0~Wxt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~�sq\0~\0\0��q\0~=t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~�sq\0~\0VTtq\0~=t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0���q\0~=t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0��q\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Bq\0~Eq\0~Iq\0~Qq\0~�q\0~�q\0~�q\0~�xxt\0Participantssq\0~\0�\0q\0~�sq\0~\0\0zƐq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Applicationssq\0~s\0q\0~�sq\0~\0\0�V�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~�sq\0~\0\r�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\nw\0\0\0\nsr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0\0�wq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0\'��q\0~�t\0\rapprove_claimpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�]q\0~�t\0\rApprove Claimpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0��Eq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0\0���q\0~�t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~�q\0~\0�sq\0~\0\Z:&q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\0\0߲q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\0\0$3/q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~�q\0~\0�sq\0~\0\0�nnq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0\0�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\0f�=q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�ىq\0~(t\0\0pt\0	Executionsq\0~\0\0q\0~0sq\0~\0\0��\'q\0~(q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~6sq\0~\0fM�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~-q\0~1q\0~8xxq\0~\Zxsq\0~\0E\0\0\0w\0\0\0\nq\0~xsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~Esq\0~\0C5gq\0~@t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Fxxq\0~t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~Jsq\0~\0g(�q\0~�t\0approvert\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~Osq\0~\0��Dq\0~�t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~�\0q\0~Usq\0~\0\0�9�q\0~Qt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0Z/q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0\0�S�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\0\0�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\\xsq\0~\0E\0\0\0w\0\0\0\nq\0~Wxt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~qsq\0~\0\0�h�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0)��q\0~st\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0G�q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0���q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0�q\0~wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~{xsq\0~\0E\0\0\0w\0\0\0\nq\0~wxt\0Prioritysq\0~�\0q\0~�sq\0~\0\0�q\0~�t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~�sq\0~\0ߊq\0~�t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~�sq\0~\0\0�ݘq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~�sq\0~\0\0U-�q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0\'tiq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0K��q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0v�{q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0d��q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~�sq\0~\0\0\Z�Iq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0��q\0~�t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~�sq\0~\0\0XZ�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0��\\q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ֽ�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~�sq\0~\0Nďq\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0J��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�Z#q\0~�t\0337,49pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�Nq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0+sq\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~q\0~Lq\0~Qq\0~sq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0r�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0g>�q\0~�t\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�iq\0~�t\0Route 1pt\0Descriptionsq\0~\02\0q\0~sq\0~\0)~�q\0~�t\0\0t\0Limitsq\0~�\0q\0~	sq\0~\0H��q\0~�t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0r��q\0~\rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0\0Ʒ�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0W�wq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0�Zq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0\0=`�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\'t\0SubFlowsq\0~\0��)q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0l�q\0~,t\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0�-�q\0~,q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~7sq\0~\0�&q\0~,t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~1q\0~4q\0~8xxq\0~ xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~?t\0\rBlockActivitysq\0~\0\0qb�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0\0��q\0~?t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Dxxq\0~t\0	Performersq\0~K\0q\0~Hsq\0~\0��3q\0~�t\0\0t\0	StartModesq\0~P\0q\0~Lsq\0~\0\0K�gq\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0��q\0~Mt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0g��q\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0% Mq\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0k�Wq\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Uxsq\0~\0E\0\0\0w\0\0\0\nq\0~Qxt\0\nFinishModesq\0~r\0q\0~hsq\0~\0N�uq\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0=�wq\0~it\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0Y��q\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0���q\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0��Tq\0~mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~qxsq\0~\0E\0\0\0w\0\0\0\nq\0~mxt\0Prioritysq\0~�\0q\0~�sq\0~\0\0]\Z�q\0~�t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0�$�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0\0�Yq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0�uq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0��q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0�-q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0E��q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0a�q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0p�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0Q�q\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~�sq\0~\0\0|Gq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0;q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split��~ѯWS\0\0xq\0~\0\0q\0~�sq\0~\0\0f�kq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~�sq\0~\0�<&q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0��Wq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\03��q\0~�t\0transition2pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0\0�m�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��&q\0~�t\0transition3pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0�~�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0c]�q\0~�t\0transition9pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0krq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0)�Yq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0&�\'q\0~t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0zq\0~t\0approverpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\nxsq\0~�t\0ExtendedAttributesq\0~\0\0�P5q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0>�q\0~t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�7�q\0~t\0477,52pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~q\0~q\0~\nq\0~\rq\0~Iq\0~Mq\0~iq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0Y�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~t\0verify_claimpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\Z�8q\0~t\0Verify Claimpt\0Descriptionsq\0~\02\0q\0~&sq\0~\0\0H�\rq\0~t\0\0t\0Limitsq\0~�\0q\0~*sq\0~\0\0S0�q\0~t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0{��q\0~.t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0��`q\0~.t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\\�q\0~8t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0�\r$q\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0ӟq\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\'t\0SubFlowsq\0~\0\0g��q\0~=t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~Mt\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0Byuq\0~Mq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~Xsq\0~\04\0[q\0~Mt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Rq\0~Uq\0~Yxxq\0~Axsq\0~\0E\0\0\0w\0\0\0\nq\0~=xsq\0~?t\0\rBlockActivitysq\0~\0y�q\0~.t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\05F�q\0~`t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~exxq\0~8t\0	Performersq\0~K\0q\0~isq\0~\0\0��3q\0~t\0financet\0	StartModesq\0~P\0q\0~msq\0~\0\0��3q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0�q\0~nt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\07Tq\0~rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0���q\0~rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0r]�q\0~rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~vxsq\0~\0E\0\0\0w\0\0\0\nq\0~rxt\0\nFinishModesq\0~r\0q\0~�sq\0~\0\0_mdq\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0�`�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0o�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\0D>7q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0P�Sq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0�,�q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0L��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0!q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0�Aq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0NAq\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0��[q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0�U�q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0j�q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0~!q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0|I�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0��Sq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0}��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0_q\0~�t\0financepxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0�-q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0`݀q\0~�t\0595,47pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0n�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�\n�q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0��:q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~ q\0~#q\0~\'q\0~+q\0~.q\0~jq\0~nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0Ie�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~t\0resubmit_claimpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��;q\0~t\0Resubmit Claimpt\0Descriptionsq\0~\02\0q\0~sq\0~\0\0��q\0~t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0\0�$qq\0~t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0��eq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0��Bq\0~\Zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0�q\0~\Zt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0O|�q\0~$t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0�cDq\0~)t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0�B.q\0~)t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\'t\0SubFlowsq\0~\0���q\0~)t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~9t\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0\0��q\0~9q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~Dsq\0~\0pvq\0~9t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~>q\0~Aq\0~Exxq\0~-xsq\0~\0E\0\0\0w\0\0\0\nq\0~)xsq\0~?t\0\rBlockActivitysq\0~\0\0�|�q\0~\Zt\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0�2q\0~Lt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Qxxq\0~$t\0	Performersq\0~K\0q\0~Usq\0~\0\np�q\0~t\0claimantt\0	StartModesq\0~P\0q\0~Ysq\0~\0\0l �q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0��!q\0~Zt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0�R�q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0�-q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0tIq\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~bxsq\0~\0E\0\0\0w\0\0\0\nq\0~^xt\0\nFinishModesq\0~r\0q\0~usq\0~\0�f�q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0���q\0~vt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0���q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0��q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0�{kq\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~~xsq\0~\0E\0\0\0w\0\0\0\nq\0~zxt\0Prioritysq\0~�\0q\0~�sq\0~\0��q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0IFxq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0���q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0��Yq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0��~q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0�pq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0U�q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0\\�0q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0TJEq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0�0�q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0^��q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0	ٯq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0~xq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0J�q\0~�t\0claimantpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0m�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�,�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\09�q\0~�t\0593,39pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\n��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0{��q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~q\0~q\0~\Zq\0~Vq\0~Zq\0~vq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0_��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0#�q\0~�t\0route2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��Hq\0~�t\0Route 2pt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0oq\0~�t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0\0!c�q\0~�t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0L�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0�K�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0f��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0.\"�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0��Pq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\'t\0SubFlowsq\0~\0�rq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~%t\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0\0�:�q\0~%q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~0sq\0~\0Y��q\0~%t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~*q\0~-q\0~1xxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~?t\0\rBlockActivitysq\0~\0\\}�q\0~t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0=h�q\0~8t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~=xxq\0~\nt\0	Performersq\0~K\0q\0~Asq\0~\0\0�xq\0~�t\0\0t\0	StartModesq\0~P\0q\0~Esq\0~\0\0��-q\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0��q\0~Ft\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0�T\Zq\0~Jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0�x�q\0~Jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0�33q\0~Jt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Nxsq\0~\0E\0\0\0w\0\0\0\nq\0~Jxt\0\nFinishModesq\0~r\0q\0~asq\0~\0\0L�<q\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0W�q\0~bt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0�.�q\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0��q\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0��q\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~jxsq\0~\0E\0\0\0w\0\0\0\nq\0~fxt\0Prioritysq\0~�\0q\0~}sq\0~\0\0r5�q\0~�t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0\'Yq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0\0�W�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0�`�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0�2;q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0��sq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0@� q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0&��q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0D~�q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0ΙKq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0�GYq\0~�t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0jLlq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0\0��hq\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�e�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0\0`c�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0+l�q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0\rTransitionRefsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�`�q\0~�t\0transition7pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0\0Ɍ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0F�q\0~�t\0transition8pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0�T\0q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0K��q\0~�t\0financepxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0ѻ�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0n�uq\0~�t\0799,53pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~q\0~q\0~Bq\0~Fq\0~bq\0~~q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0�]�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0z�~q\0~t\0tool1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0cDVq\0~t\0Notify Finance Verifiedpt\0Descriptionsq\0~\02\0q\0~sq\0~\0u�q\0~t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0ı�q\0~t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0sHMq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0��q\0~!t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0d��q\0~&t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0\0��q\0~&t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0\0�Qsq\0~0t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�\"�q\0~7t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0}�q\0~7q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~7\0q\0~Dsq\0~\0\0�Rq\0~7t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~Jsq\0~\0\0jO�q\0~7t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~Nsq\0~\0���q\0~7t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~<q\0~?q\0~Eq\0~Kq\0~Oxxsq\0~\'t\0SubFlowsq\0~\0\0]�#q\0~&t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Vq\0~Ut\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0}��q\0~Uq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~`sq\0~\0\0Bq\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Zq\0~]q\0~axxq\0~0xsq\0~\0E\0\0\0w\0\0\0\nq\0~&xsq\0~?t\0\rBlockActivitysq\0~\0\0���q\0~t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0\0&\nEq\0~ht\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~mxxq\0~!t\0	Performersq\0~K\0q\0~qsq\0~\0lgFq\0~t\0systemt\0	StartModesq\0~P\0q\0~usq\0~\0�HEq\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0�q\0~vt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0y�q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0b�q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0��3q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~~xsq\0~\0E\0\0\0w\0\0\0\nq\0~zxt\0\nFinishModesq\0~r\0q\0~�sq\0~\0\0�#q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0��Kq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0�{�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0�R;q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0��Pq\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0�r[q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0��Eq\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0|�tq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0D�q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0�7�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0��q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0Yq\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0Ǘiq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0��pq\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0��*q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0K��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0��\"q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0�m�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�r�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0t[Uq\0~�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0j�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\r�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0�q\0~�t\0784,41pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�u�q\0~	t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��q\0~	t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~	\nxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	q\0~q\0~q\0~q\0~q\0~rq\0~vq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0~2�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�|9q\0~	t\0tool2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\07��q\0~	t\0Notify Finance Rejectionpt\0Descriptionsq\0~\02\0q\0~	\Zsq\0~\0\0{Ցq\0~	t\0\0t\0Limitsq\0~�\0q\0~	sq\0~\0\0J�q\0~	t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0�`q\0~	t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0i�q\0~	\"t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0��!q\0~	\"t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0`q\0~	,t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\01��q\0~	1t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0\0x��q\0~	1t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~6t\0Toolsq\0~\0\0_V�q\0~	;t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0D�\"q\0~	At\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0(o�q\0~	Aq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Bq\0~Cxt\0ActualParameterssq\0~7\0q\0~	Lsq\0~\0��q\0~	At\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~	Rsq\0~\0\0��.q\0~	At\0\0t\0ExtendedAttributessq\0~\0�\0q\0~	Vsq\0~\0\0�//q\0~	At\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	Fq\0~	Iq\0~	Mq\0~	Sq\0~	Wxxsq\0~\'t\0SubFlowsq\0~\0\\�q\0~	1t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�ӂq\0~	]t\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0�2wq\0~	]q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~	hsq\0~\0�(�q\0~	]t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~	bq\0~	eq\0~	ixxq\0~	;xsq\0~\0E\0\0\0w\0\0\0\nq\0~	1xsq\0~?t\0\rBlockActivitysq\0~\0\0+�9q\0~	\"t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0���q\0~	pt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	uxxq\0~	,t\0	Performersq\0~K\0q\0~	ysq\0~\0\0�2�q\0~	t\0systemt\0	StartModesq\0~P\0q\0~	}sq\0~\0\0k��q\0~	t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0�:q\0~	~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\05hDq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0PR�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0g�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	�xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xt\0\nFinishModesq\0~r\0q\0~	�sq\0~\04|q\0~	t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0��q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\03�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0e�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0$�~q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	�xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xt\0Prioritysq\0~�\0q\0~	�sq\0~\06K�q\0~	t\0\0t\0	Deadlinessq\0~�\0q\0~	�sq\0~\0���q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~	�sq\0~\0\0�Cq\0~	t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0�q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~	�sq\0~\0�˹q\0~	�t\0\0t\0TimeEstimationsq\0~�q\0~	�sq\0~\0^�q\0~	�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~	�sq\0~\0\03�)q\0~	�t\0\0t\0WorkingTimesq\0~\0q\0~	�sq\0~\0\0�q\0~	�t\0\0t\0Durationsq\0~\0q\0~	�sq\0~\0\0�Eq\0~	�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xt\0Iconsq\0~�\0q\0~	�sq\0~\0Sg�q\0~	t\0\0t\0\rDocumentationsq\0~\07\0q\0~	�sq\0~\0\0�/�q\0~	t\0\0t\0TransitionRestrictionssq\0~�\0q\0~	�sq\0~\0�L�q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~	�sq\0~\0\0�0q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\07�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�-q\0~	�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0d�cq\0~	�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�xsq\0~�t\0ExtendedAttributesq\0~\0D7Rq\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�3q\0~	�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0@��q\0~	�t\01018,40pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nq\0~\nxsq\0~�t\0ExtendedAttributesq\0~\0\0���q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~\n\nt\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0>J�q\0~\n\nt\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nq\0~\nxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	q\0~	q\0~	q\0~	q\0~	\"q\0~	zq\0~	~q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�xsq\0~�t\0Activitysq\0~\0\0�m�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Nq\0~\nt\0tool3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��^q\0~\nt\0Notify Approver Rejectionpt\0Descriptionsq\0~\02\0q\0~\n\"sq\0~\0\0��q\0~\nt\0\0t\0Limitsq\0~�\0q\0~\n&sq\0~\0\0h��q\0~\nt\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0�	Kq\0~\nt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0TX�q\0~\n*t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0��q\0~\n*t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0-Iq\0~\n4t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0�q\0~\n9t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0\0�/�q\0~\n9t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~6t\0Toolsq\0~\0ޏ-q\0~\nCt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0/�Jq\0~\nIt\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~\nIq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Bq\0~Cxt\0ActualParameterssq\0~7\0q\0~\nTsq\0~\0��Vq\0~\nIt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~\nZsq\0~\0\0zӔq\0~\nIt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n^sq\0~\0شvq\0~\nIt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nNq\0~\nQq\0~\nUq\0~\n[q\0~\n_xxsq\0~\'t\0SubFlowsq\0~\0\0�)�q\0~\n9t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~\net\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0\0�q\0~\neq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~\npsq\0~\0�G:q\0~\net\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\njq\0~\nmq\0~\nqxxq\0~\nCxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n9xsq\0~?t\0\rBlockActivitysq\0~\05[�q\0~\n*t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0\0\Z�q\0~\nxt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n}xxq\0~\n4t\0	Performersq\0~K\0q\0~\n�sq\0~\0\0Q״q\0~\nt\0systemt\0	StartModesq\0~P\0q\0~\n�sq\0~\0(�Hq\0~\nt\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0��Bq\0~\n�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0��}q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0�	�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0��.q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\n�xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xt\0\nFinishModesq\0~r\0q\0~\n�sq\0~\0\0ǰwq\0~\nt\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\0b]q\0~\n�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0�*q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0�P�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0�l]q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\n�xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xt\0Prioritysq\0~�\0q\0~\n�sq\0~\0�Z�q\0~\nt\0\0t\0	Deadlinessq\0~�\0q\0~\n�sq\0~\0\0��q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~\n�sq\0~\0�q\0~\nt\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0֚tq\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~\n�sq\0~\06p�q\0~\n�t\0\0t\0TimeEstimationsq\0~�q\0~\n�sq\0~\0�.q\0~\n�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~\n�sq\0~\0`�q\0~\n�t\0\0t\0WorkingTimesq\0~\0q\0~\n�sq\0~\0\"seq\0~\n�t\0\0t\0Durationsq\0~\0q\0~\n�sq\0~\0\0���q\0~\n�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�xt\0Iconsq\0~�\0q\0~\n�sq\0~\0��q\0~\nt\0\0t\0\rDocumentationsq\0~\07\0q\0~\n�sq\0~\0\0i��q\0~\nt\0\0t\0TransitionRestrictionssq\0~�\0q\0~\n�sq\0~\0\0��q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0\0��q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0cZq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0eȋq\0~\n�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0Q4�q\0~\n�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~xsq\0~�t\0ExtendedAttributesq\0~\0\0k��q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��\rq\0~t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\02��q\0~t\0460,36pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xsq\0~�t\0ExtendedAttributesq\0~\0\0��,q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0}��q\0~t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0�\rQq\0~t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\Zxxpxsq\0~\0E\0\0\0w\0\0\0q\0~\nq\0~\nq\0~\n#q\0~\n\'q\0~\n*q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xsq\0~�t\0Activitysq\0~\0\02{Kq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�#Iq\0~t\0	new_claimpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0<�q\0~t\0\nEdit Claimpt\0Descriptionsq\0~\02\0q\0~*sq\0~\0:J/q\0~t\0\0t\0Limitsq\0~�\0q\0~.sq\0~\0ܔ�q\0~t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0���q\0~2t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0\0���q\0~2t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0h��q\0~<t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0��$q\0~At\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0;�dq\0~At\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\'t\0SubFlowsq\0~\0\0��q\0~At\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~Qt\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0�Dq\0~Qq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~\\sq\0~\0\0|��q\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Vq\0~Yq\0~]xxq\0~Exsq\0~\0E\0\0\0w\0\0\0\nq\0~Axsq\0~?t\0\rBlockActivitysq\0~\0\0�0Kq\0~2t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0��q\0~dt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~ixxq\0~<t\0	Performersq\0~K\0q\0~msq\0~\0%��q\0~t\0claimantt\0	StartModesq\0~P\0q\0~qsq\0~\0w\r�q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\")*q\0~rt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0�Мq\0~vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0��Aq\0~vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0M5\0q\0~vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~zxsq\0~\0E\0\0\0w\0\0\0\nq\0~vxt\0\nFinishModesq\0~r\0q\0~�sq\0~\0\0Ҹq\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0\03��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0H*�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0�z/q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0��bq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\r�q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0�]�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0	��q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0��3q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0~vq\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0��\0q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0��Pq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0�q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0C4aq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0$�q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0�0;q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0G�bq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0O�\\q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0g�jq\0~�t\0claimantpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0˳�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�t\0125,36pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��bq\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�?�q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~$q\0~\'q\0~+q\0~/q\0~2q\0~nq\0~rq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0ŏ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~t\0tool4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0l�q\0~t\0!Update Record Status to Submittedpt\0Descriptionsq\0~\02\0q\0~sq\0~\0�)nq\0~t\0\0t\0Limitsq\0~�\0q\0~\Zsq\0~\0}*q\0~t\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0R#�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0\0�l�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~t\0Implementationsq\0~\0\0N(�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0Kp�q\0~(t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0ъ�q\0~-t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~ \0t\0Toolssq\0~\0��7q\0~-t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~6t\0Toolsq\0~\0\0&%1q\0~7t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~=t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0SȎq\0~=q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Bq\0~Cxt\0ActualParameterssq\0~7\0q\0~Hsq\0~\0\0�\nq\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~Nsq\0~\0��.q\0~=t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~Rsq\0~\0\0x�q\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Bq\0~Eq\0~Iq\0~Oq\0~Sxxsq\0~\'t\0SubFlowsq\0~\0�.q\0~-t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�	q\0~Yt\0\0pq\0~0sq\0~\0\0q\0~0sq\0~\0�q\0~Yq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~4q\0~5xt\0ActualParameterssq\0~7\0q\0~dsq\0~\0\0$�q\0~Yt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~^q\0~aq\0~exxq\0~7xsq\0~\0E\0\0\0w\0\0\0\nq\0~-xsq\0~?t\0\rBlockActivitysq\0~\0\0�X&q\0~t\0\0sq\0~\0w\0\0\0q\0~Esq\0~\0q\0~Esq\0~\0\0f�q\0~lt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~qxxq\0~(t\0	Performersq\0~K\0q\0~usq\0~\0�ٺq\0~t\0systemt\0	StartModesq\0~P\0q\0~ysq\0~\0|t�q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0�Yq\0~zt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0\0�Pq\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0\0*#�q\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0���q\0~~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~~xt\0\nFinishModesq\0~r\0q\0~�sq\0~\0\0���q\0~t\0\0sq\0~\0w\0\0\0q\0~Usq\0~V\0q\0~Usq\0~\0�3�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~[\0t\0XMLEmptyChoiceElementsq\0~\0p�^q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~bt\0	Automaticsq\0~\0�brq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~it\0Manualsq\0~\0\0�B�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\0ۓ�q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0��|q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0��Eq\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0�Eq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0~t q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0u�q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0Y[oq\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0��q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0���q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0��q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0-}q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~�sq\0~\0\0l%q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0\05Xq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�0�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0\0�Bq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~\r\0xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0z��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0xa�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0L��q\0~\r\rt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0v�q\0~\r\rt\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rq\0~\rxsq\0~�t\0ExtendedAttributesq\0~\066�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0P<�q\0~\rt\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~\rt\0192,30pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rq\0~\r!xsq\0~�t\0ExtendedAttributesq\0~\0\0T�.q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�bq\0~\r%t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0��uq\0~\r%t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r*q\0~\r-xxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~q\0~q\0~q\0~vq\0~zq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~\rxxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~\r2sq\0~\0p2�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\nw\0\0\0\nsr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0�z�q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\08��q\0~\r:t\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��	q\0~\r:t\0\0pt\0Fromsq\0~\0q\0~\rEsq\0~\0�>q\0~\r:t\0\rapprove_claimpt\0Tosq\0~\0q\0~\rIsq\0~\04�kq\0~\r:t\0route1pt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~\rMsq\0~\0\0ʮ�q\0~\r:t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�Xq\0~\rOq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rSxt\0Descriptionsq\0~\02\0q\0~\r[sq\0~\0�Cq\0~\r:t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r_sq\0~\0\0�Gq\0~\r:t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0Oдq\0~\r`t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~\ret\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~\ret\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rjq\0~\rmxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r?q\0~\rBq\0~\rFq\0~\rJq\0~\rOq\0~\r\\q\0~\r`xsq\0~\r9t\0\nTransitionsq\0~\0��Uq\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�h�q\0~\rrt\0transition2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0l-�q\0~\rrt\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0ݚMq\0~\rrt\0route1pq\0~\rIsq\0~\0q\0~\rIsq\0~\0\0�e�q\0~\rrt\0resubmit_claimpt\0	Conditionsq\0~\rN\0q\0~\r�sq\0~\0\0<��q\0~\rrt\0status==\'Resubmit\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0���q\0~\r�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�xt\0Descriptionsq\0~\02\0q\0~\r�sq\0~\0��q\0~\rrt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r�sq\0~\0�qq\0~\rrt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\00��q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0P��q\0~\r�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�J�q\0~\r�t\0657,228pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xsq\0~�t\0ExtendedAttributesq\0~\0�FZq\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0k��q\0~\r�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\02��q\0~\r�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rwq\0~\rzq\0~\r}q\0~\r�q\0~\r�q\0~\r�q\0~\r�xsq\0~\r9t\0\nTransitionsq\0~\0\0��q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Lq\0~\r�t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�q\0~\r�t\0approvedpq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0�(q\0~\r�t\0route1pq\0~\rIsq\0~\0q\0~\rIsq\0~\0�ސq\0~\r�t\0verify_claimpt\0	Conditionsq\0~\rN\0q\0~\r�sq\0~\0��q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0X��q\0~\r�t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�xt\0Descriptionsq\0~\02\0q\0~\r�sq\0~\0\0�\"!q\0~\r�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r�sq\0~\0\0Z�kq\0~\r�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\01�?q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~\r�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0/Υq\0~\r�t\0657,243pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xsq\0~�t\0ExtendedAttributesq\0~\0\0�ذq\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�@q\0~\r�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0^U`q\0~\r�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�xsq\0~\r9t\0\nTransitionsq\0~\0\07;\\q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~\r�t\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�W�q\0~\r�t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0\Z:q\0~\r�t\0verify_claimpq\0~\rIsq\0~\0q\0~\rIsq\0~\0na\'q\0~\r�t\0route2pt\0	Conditionsq\0~\rN\0q\0~\r�sq\0~\0���q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0wq,q\0~\0q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0�=}q\0~\r�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0\0��q\0~\r�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0��q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\Zxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\0q\0~	q\0~\rxsq\0~\r9t\0\nTransitionsq\0~\0\0{\"�q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Oq\0~t\0transition6pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0]~q\0~t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0O�q\0~t\0resubmit_claimpq\0~\rIsq\0~\0q\0~\rIsq\0~\0\0ftq\0~t\0tool4pt\0	Conditionsq\0~\rN\0q\0~0sq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�K�q\0~1q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~5xt\0Descriptionsq\0~\02\0q\0~9sq\0~\0\0|�q\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~=sq\0~\0��Sq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0���q\0~>t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0Fb�q\0~Ct\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�>Oq\0~Ct\0263,69pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hq\0~Kxsq\0~�t\0ExtendedAttributesq\0~\0�Ϸq\0~>t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0y�q\0~Ot\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0㞿q\0~Ot\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Tq\0~Wxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~$q\0~\'q\0~*q\0~-q\0~1q\0~:q\0~>xsq\0~\r9t\0\nTransitionsq\0~\0\0��q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0ϻ�q\0~\\t\0transition7pq\0~\0sq\0~\0\0q\0~\0sq\0~\0��q\0~\\t\0verifiedpq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0Åq\0~\\t\0route2pq\0~\rIsq\0~\0q\0~\rIsq\0~\0$g�q\0~\\t\0tool1pt\0	Conditionsq\0~\rN\0q\0~msq\0~\0>=q\0~\\t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�O�q\0~nt\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~rxt\0Descriptionsq\0~\02\0q\0~wsq\0~\0\0�?8q\0~\\t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~{sq\0~\0\0��q\0~\\t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0;K�q\0~|t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�)�q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0ࡹq\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~aq\0~dq\0~gq\0~jq\0~nq\0~xq\0~|xsq\0~\r9t\0\nTransitionsq\0~\0��yq\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0Tx@q\0~�t\0transition8pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0VU>q\0~�t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0��9q\0~�t\0route2pq\0~\rIsq\0~\0q\0~\rIsq\0~\0�Y�q\0~�t\0tool2pt\0	Conditionsq\0~\rN\0q\0~�sq\0~\0�q6q\0~�t\0\Zstatus==\'Finance Rejected\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0���q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0�\'}q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0?�Hq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0T?q\0~�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~�t\01072,378pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�Sq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0<)�q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�e�q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\r9t\0\nTransitionsq\0~\0\0� [q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0c��q\0~�t\0transition9pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0ø�q\0~�t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0sqq\0~�t\0route1pq\0~\rIsq\0~\0q\0~\rIsq\0~\0\0�Rq\0~�t\0tool3pt\0	Conditionsq\0~\rN\0q\0~�sq\0~\0�q\0~�t\0status==\'Rejected\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�%�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0� q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0H�q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\r9t\0\nTransitionsq\0~\0�Oq\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0I�+q\0~�t\0transition5pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0?�wq\0~�t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0\0I�mq\0~�t\0	new_claimpq\0~\rIsq\0~\0q\0~\rIsq\0~\0\0��q\0~�t\0tool4pt\0	Conditionsq\0~\rN\0q\0~sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0\0#gq\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�(Rq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0JC�q\0~\"t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0��9q\0~\"t\0164,517pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\'q\0~*xsq\0~�t\0ExtendedAttributesq\0~\0��&q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0S;�q\0~.t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0�5q\0~.t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~3q\0~6xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~	q\0~q\0~q\0~q\0~xsq\0~\r9t\0\nTransitionsq\0~\0\0K��q\0~\r4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��.q\0~;t\0transition10pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0$e_q\0~;t\0\0pq\0~\rEsq\0~\0q\0~\rEsq\0~\0&�sq\0~;t\0tool4pq\0~\rIsq\0~\0q\0~\rIsq\0~\0X�Uq\0~;t\0\rapprove_claimpt\0	Conditionsq\0~\rN\0q\0~Lsq\0~\0{W�q\0~;t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0��3q\0~Mq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\rVq\0~\rWq\0~\rXq\0~\rYxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Qxt\0Descriptionsq\0~\02\0q\0~Usq\0~\0\0�C�q\0~;t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~Ysq\0~\0\0\r�_q\0~;t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�q\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��\0q\0~_t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��yq\0~_t\0279,229pxsq\0~\0E\0\0\0w\0\0\0\nq\0~dq\0~gxsq\0~�t\0ExtendedAttributesq\0~\0�y�q\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~kt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�$q\0~kt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~pq\0~sxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~@q\0~Cq\0~Fq\0~Iq\0~Mq\0~Vq\0~Zxxt\0ExtendedAttributessq\0~\0�\0q\0~xsq\0~\0\Z�4q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�kq\0~yt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~~t\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��Qq\0~~t\0 claimant;approver;finance;systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�0�q\0~yt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0:�q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0��bq\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=1167,Y_OFFSET=54,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�?	q\0~yt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�(�q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=946,Y_OFFSET=50,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��q\0~yt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\01Y�q\0~�t\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0�rq\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=claimant,CONNECTING_ACTIVITY_ID=new_claim,X_OFFSET=61,Y_OFFSET=49,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��Hq\0~yt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�úq\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0\0D��q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=tool3,X_OFFSET=610,Y_OFFSET=54,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~q\0~1q\0~7q\0~�q\0~�q\0~�q\0~�q\0~\r4q\0~yxxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0���q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\Z�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�g[q\0~�t\0EDITING_TOOLpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~�t\0&Workflow Designer 3.0-BETA - build 120pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0H�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��dq\0~�t\0EDITING_TOOL_VERSIONpq\0~�sq\0~\0\0q\0~�sq\0~\0\0��Cq\0~�t\02.0-2(4?)-C-20080226-2126pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�]q\0~�t\0JaWE_CONFIGURATIONpq\0~�sq\0~\0\0q\0~�sq\0~\0\0l3q\0~�t\0defaultpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~tq\0~�q\0~�q\0~�x\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\05m�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\0\0��nq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�Μq\0~�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0|�q\0~�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xx',1000405,3,1000406,0),('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"isr\" Name=\"ISR\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"requester\" Name=\"Requester\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"hod\" Name=\"HOD\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"assignee\" Name=\"Assignee\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"system\" Name=\"System\">\n            <ParticipantType Type=\"SYSTEM\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"isr\" Name=\"ISR Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n                <DataField Id=\"department\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n                <DataField Id=\"assignee\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"resolve_request\" Name=\"Resolve Request\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>hod</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"hod\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"222,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"department\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"assignee\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"resolve_assigned_request\" Name=\"Resolve Assigned Request\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>assignee</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"assignee\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"566,15\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"department\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"assignee\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"send_rejected_notifiction\" Name=\"Send Rejected Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"566,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition4\"/>\n                                    <TransitionRef Id=\"transition3\"/>\n                                    <TransitionRef Id=\"transition12\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"hod\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"394,18\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"verifiy_resolved_request\" Name=\"Verify Resolved Request\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"834,27\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"department\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"assignee\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route2\" Name=\"Route 2\">\n                    <Route/>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition10\"/>\n                                    <TransitionRef Id=\"transition9\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"987,35\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"send_verified_notification\" Name=\"Send Verified Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>system</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"system\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"1113,16\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"resolve_reopened_request\" Name=\"Resolve Reopened Request\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>hod</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"hod\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"1105,13\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"status\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"department\"/>\n                        <ExtendedAttribute Name=\"VariableToProcess_UPDATE\" Value=\"assignee\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"resolve_request\" Id=\"transition1\" To=\"route1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition3\" To=\"send_rejected_notifiction\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"417,494\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition4\" To=\"resolve_assigned_request\">\n                    <Condition Type=\"CONDITION\">status == \"Assigned\"</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"441,346\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"resolve_assigned_request\" Id=\"transition6\" To=\"verifiy_resolved_request\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"892,348\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"verifiy_resolved_request\" Id=\"transition8\" To=\"route2\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route2\" Id=\"transition9\" To=\"resolve_reopened_request\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"1027,57\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route2\" Id=\"transition10\" To=\"send_verified_notification\">\n                    <Condition Type=\"CONDITION\">status == \"Verified\"</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"1028,498\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition12\" To=\"verifiy_resolved_request\">\n                    <Condition Type=\"CONDITION\">status == \"Resolved\"</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_BREAK_POINTS\" Value=\"463,212\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"resolve_reopened_request\" Id=\"transition13\" To=\"route1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"hod;requester;assignee;system\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=resolve_request,X_OFFSET=120,Y_OFFSET=41,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=send_verified_notification,X_OFFSET=1289,Y_OFFSET=26,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=send_rejected_notifiction,X_OFFSET=776,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Workflow Designer 3.0-SNAPSHOT - build 221\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"2.0-2(4?)-C-20080226-2126\"/>\n        <ExtendedAttribute Name=\"JaWE_CONFIGURATION\" Value=\"default\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0�pt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0\0��q\0~\0\nt\0isrpt\0Namesq\0~\0\0q\0~\0sq\0~\0\0��uq\0~\0\nt\0ISRpt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0\0YY�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0\0��q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0U�Jq\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0\0���q\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0�2Hq\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\0\0^Rsq\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\0\0w,lq\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0\0g�q\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0\nq\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0\0�O�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0�\"�q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0֙q\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0B�q\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0\0\0��q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\0k�q\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm�\0\0xq\0~\0\0q\0~\0isq\0~\0Zgq\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0\0�5Cq\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0\0\0�q\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0\\��q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0��`q\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\0�^�q\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0�m�q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0\0�=�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0b�\"q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\0 �Mq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0V��q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~\0�t\0	requesterpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�q\0~\0�t\0	Requesterpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0\0�Wq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0*/q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0\0��q\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0��#q\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\0\0���q\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\0���q\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0���q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0\0щq\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0�F�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�מq\0~\0�t\0hodpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��oq\0~\0�t\0HODpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0#�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0r��q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0$��q\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0\07+aq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0\r0q\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0֟q\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0B��q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\03�q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xsq\0~\0�t\0Participantsq\0~\0��2q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0@~�q\0~t\0assigneepq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0n�vq\0~t\0Assigneept\0ParticipantTypesq\0~\0�q\0~sq\0~\0D��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0�n=q\0~ t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~$xt\0Descriptionsq\0~\02\0q\0~)sq\0~\0\0��Hq\0~t\0\0t\0ExternalReferencesq\0~\0�\0q\0~-sq\0~\0�s�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��Xq\0~.t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0(xq\0~.t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��iq\0~.t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~2q\0~5q\0~8xt\0ExtendedAttributessq\0~\0�\0q\0~<sq\0~\0\0J&�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~ q\0~*q\0~.q\0~=xsq\0~\0�t\0Participantsq\0~\0\0GDq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0H�q\0~Ct\0systempq\0~\0sq\0~\0\0q\0~\0sq\0~\0��q\0~Ct\0Systempt\0ParticipantTypesq\0~\0�q\0~Nsq\0~\0�^uq\0~Ct\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0o�bq\0~Ot\0SYSTEMsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~Sxt\0Descriptionsq\0~\02\0q\0~Xsq\0~\0U�}q\0~Ct\0\0t\0ExternalReferencesq\0~\0�\0q\0~\\sq\0~\0���q\0~Ct\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0E1\"q\0~]t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0��$q\0~]t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�wq\0~]t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~aq\0~dq\0~gxt\0ExtendedAttributessq\0~\0�\0q\0~ksq\0~\0��q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hq\0~Kq\0~Oq\0~Yq\0~]q\0~lxxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~rsq\0~\0\0�;q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0[��q\0~tt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0@_5q\0~zt\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0A��q\0~zt\0\0pt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0��]q\0~zt\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~�sq\0~\0\0��Sq\0~zt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0\0�u�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�\0t\0ExternalReferencesq\0~\0\0C;vq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��?q\0~�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0֐q\0~�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0���q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0���q\0~zt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~�q\0~�q\0~�q\0~�xxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~�sq\0~\0\0���q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~�sq\0~\0\0׏�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0u4Eq\0~�t\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\0~��q\0~�t\0isrpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��nq\0~�t\0ISR Processpt\0AccessLevelsq\0~\0\0q\0~�sq\0~\0��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~�sq\0~\0/Gqq\0~�t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~�sq\0~\0\0���q\0~�t\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0��Pq\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0f4q\0~�t\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0�0�q\0~�t\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0#�pq\0~�t\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0\0�kq\0~�t\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0\0=CPq\0~�t\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0\0N�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~\0sq\0~\0Zؙq\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~sq\0~\0B]�q\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~\nsq\0~\0\0$LEq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~sq\0~\0Rdq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0\0N`Kq\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~sq\0~\0��/q\0~t\0\0t\0Versionsq\0~\0[\0q\0~sq\0~\0cW�q\0~t\0\0t\0Codepagesq\0~\0`\0q\0~!sq\0~\0�q\0~t\0\0t\0\nCountrykeysq\0~\0e\0q\0~%sq\0~\0\05��q\0~t\0\0t\0Responsiblessq\0~\0j\0q\0~)sq\0~\0j`\'q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\Zq\0~q\0~\"q\0~&q\0~*xt\0FormalParameterssq\0~�\0q\0~0sq\0~\0\0ί�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nDataFieldssq\0~�\0q\0~6sq\0~\0e� q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0\0G9q\0~7t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�k�q\0~=t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0l8q\0~=t\0\0pt\0IsArraysq\0~\0\0q\0~Hsq\0~\0\0�9q\0~=t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~Osq\0~\0�7�q\0~=t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~�q\0~Usq\0~\0\0lLq\0~Qt\0\0sq\0~\0E\0\0\0	w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\0��%q\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0�Rq\0~\\t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0\nq\0~axsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0_�Sq\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0D��q\0~nt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~sxsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0\0�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0\0*��q\0~Wt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��,q\0~~t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0���q\0~~t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��q\0~~t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0��q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\0��	q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0~#�q\0~Wt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0\0PW�q\0~Wt\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~�sq\0~\0\0���q\0~�t\0\0pt\0\nUpperIndexsq\0~\0q\0~�sq\0~\0\04L�q\0~�t\0\0pq\0~Usq\0~Vq\0~Usq\0~\0��Jq\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0\0�_q\0~Wt\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0\0���q\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~\\xsq\0~\0E\0\0\0w\0\0\0\nq\0~Wxt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~�sq\0~\0\0(�hq\0~=t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~�sq\0~\0\0�\0(q\0~=t\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0�[q\0~=t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0�	�q\0~=t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Bq\0~Eq\0~Iq\0~Qq\0~�q\0~�q\0~�q\0~�xsq\0~<t\0	DataFieldsq\0~\0R2|q\0~7t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�J*q\0~�t\0\ndepartmentpq\0~\0sq\0~\0\0q\0~\0sq\0~\0Xg�q\0~�t\0\0pq\0~Hsq\0~\0\0q\0~Hsq\0~\0p�q\0~�t\0FALSEsq\0~\0E\0\0\0w\0\0\0q\0~Mq\0~Nxt\0DataTypesq\0~Pq\0~�sq\0~\0pr�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0}��q\0~�t\0\0sq\0~\0E\0\0\0	w\0\0\0\nsq\0~[t\0	BasicTypesq\0~\0\0Ͻ-q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0\0��q\0~�t\0STRINGsq\0~\0E\0\0\0w\0\0\0q\0~eq\0~fq\0~gq\0~hq\0~iq\0~jq\0~kxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~mt\0DeclaredTypesq\0~\0��8q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0w��q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~wt\0\nSchemaTypesq\0~\0\0�Lq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0\0�3q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Pq\0~t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0\0E,q\0~t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0O�Wq\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nq\0~\rq\0~xsq\0~�t\0\nRecordTypesq\0~\0\0%\rq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	UnionTypesq\0~\0\0G��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0EnumerationTypesq\0~\0\0�>�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	ArrayTypesq\0~\0=��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0\0;q\0~&t\0\0pq\0~�sq\0~\0q\0~�sq\0~\0\0H�{q\0~&t\0\0pq\0~Usq\0~Vq\0~Usq\0~\0u�q\0~&t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~+q\0~.q\0~1xsq\0~�t\0ListTypesq\0~\0\0VB�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0,�q\0~5t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~:xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0InitialValuesq\0~�\0q\0~?sq\0~\0�q\0~�t\0\0t\0Lengthsq\0~�\0q\0~Csq\0~\0�֯q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~Gsq\0~\0\0��q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~Ksq\0~\0�hq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~@q\0~Dq\0~Hq\0~Lxsq\0~<t\0	DataFieldsq\0~\0\0e;q\0~7t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��\\q\0~Rt\0assigneepq\0~\0sq\0~\0\0q\0~\0sq\0~\0�q\0~Rt\0\0pq\0~Hsq\0~\0\0q\0~Hsq\0~\0�rDq\0~Rt\0FALSEsq\0~\0E\0\0\0w\0\0\0q\0~Mq\0~Nxt\0DataTypesq\0~Pq\0~asq\0~\0\0�q\0~Rt\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0�q\0~bt\0\0sq\0~\0E\0\0\0	w\0\0\0\nsq\0~[t\0	BasicTypesq\0~\0\07Oq\0~ft\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0Qxkq\0~jt\0STRINGsq\0~\0E\0\0\0w\0\0\0q\0~eq\0~fq\0~gq\0~hq\0~iq\0~jq\0~kxxsq\0~\0E\0\0\0w\0\0\0\nq\0~oxsq\0~mt\0DeclaredTypesq\0~\0��Tq\0~ft\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Gt�q\0~tt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~yxsq\0~wt\0\nSchemaTypesq\0~\0\0Q�eq\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0�t\0ExternalReferencesq\0~\0��q\0~ft\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�q\0~�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0p��q\0~�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0ʲ;q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsq\0~�t\0\nRecordTypesq\0~\0{oq\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	UnionTypesq\0~\0\0��oq\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0EnumerationTypesq\0~\0���q\0~ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~�t\0	ArrayTypesq\0~\0��q\0~ft\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0hEq\0~�t\0\0pq\0~�sq\0~\0q\0~�sq\0~\0��/q\0~�t\0\0pq\0~Usq\0~Vq\0~Usq\0~\0g��q\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xsq\0~�t\0ListTypesq\0~\0&#+q\0~ft\0\0sq\0~\0w\0\0\0q\0~Usq\0~Vq\0~Usq\0~\0\0��Bq\0~�t\0\0ppxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~jxsq\0~\0E\0\0\0w\0\0\0\nq\0~fxt\0InitialValuesq\0~�\0q\0~�sq\0~\0G�Eq\0~Rt\0\0t\0Lengthsq\0~�\0q\0~�sq\0~\0�Ըq\0~Rt\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0ٕ�q\0~Rt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0��q\0~Rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Wq\0~Zq\0~]q\0~bq\0~�q\0~�q\0~�q\0~�xxt\0Participantssq\0~\0�\0q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Applicationssq\0~s\0q\0~�sq\0~\0i/q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~�sq\0~\0\0W,�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0\0v�mq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�v�q\0~�t\0resolve_requestpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�l�q\0~�t\0Resolve Requestpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�K�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0\0�q\0~�t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~�q\0~\0�sq\0~\0\0���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\0\0r!>q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\0\0�u�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~�q\0~\0�sq\0~\0\0�!�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0\0��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\0\0�V/q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\0Y8iq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��+q\0~$t\0\0pt\0	Executionsq\0~\0\0q\0~,sq\0~\0���q\0~$q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~2sq\0~\0\0EQq\0~$t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~)q\0~-q\0~4xxq\0~xsq\0~\0E\0\0\0w\0\0\0\nq\0~xsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0\0�Mq\0~�t\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~Asq\0~\0�%Uq\0~<t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Bxxq\0~t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~Fsq\0~\0#$�q\0~�t\0hodt\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~Ksq\0~\0\0Ba\nq\0~�t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~�\0q\0~Qsq\0~\0��q\0~Mt\0\0sq\0~\0E\0\0\0w\0\0\0\nsr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0\0�j�q\0~St\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0-\\+q\0~St\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\0\0�1�q\0~St\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~Xxsq\0~\0E\0\0\0w\0\0\0\nq\0~Sxt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~msq\0~\0\0k\0tq\0~�t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\0���q\0~ot\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0�Dq\0~st\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0���q\0~st\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0�R\rq\0~st\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~wxsq\0~\0E\0\0\0w\0\0\0\nq\0~sxt\0Prioritysq\0~�\0q\0~�sq\0~\0\0��Dq\0~�t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~�sq\0~\0.�;q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~�sq\0~\0�	-q\0~�t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~�sq\0~\0`��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~�sq\0~\0\0��Aq\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0,�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0�Hq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0]�q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0R1_q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~�sq\0~\0\'slq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\n�Bq\0~�t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~�sq\0~\0P�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0\0�Uqq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~�sq\0~\0kq�q\0~�t\0hodpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�pOq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�k�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�?Lq\0~�t\0222,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0��5q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ח�q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0�Syq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0;6%q\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0_��q\0~�t\0\ndepartmentpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�)q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Iq\0~t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�0sq\0~t\0assigneepxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~	xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~Hq\0~Mq\0~oq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0?)�q\0~t\0resolve_assigned_requestpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�ӡq\0~t\0Resolve Assigned Requestpt\0Descriptionsq\0~\02\0q\0~sq\0~\0\0�	qq\0~t\0\0t\0Limitsq\0~�\0q\0~sq\0~\0�q\0~t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0e�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0�}_q\0~!t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0�\0Wq\0~!t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0�`%q\0~+t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0�$Eq\0~0t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0>Ynq\0~0t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~#t\0SubFlowsq\0~\0\0aY�q\0~0t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0U��q\0~@t\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0��&q\0~@q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~Ksq\0~\0\0j�q\0~@t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Eq\0~Hq\0~Lxxq\0~4xsq\0~\0E\0\0\0w\0\0\0\nq\0~0xsq\0~;t\0\rBlockActivitysq\0~\0�0]q\0~!t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0\0yb�q\0~St\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~Xxxq\0~+t\0	Performersq\0~G\0q\0~\\sq\0~\0M/wq\0~t\0assigneet\0	StartModesq\0~L\0q\0~`sq\0~\0\0gI�q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0*�xq\0~at\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0�C~q\0~et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0a\\q\0~et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0>^q\0~et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~ixsq\0~\0E\0\0\0w\0\0\0\nq\0~ext\0\nFinishModesq\0~n\0q\0~|sq\0~\0\0p1�q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0���q\0~}t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0�%�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0,��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\00�Yq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0vX�q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0�Y�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0��q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0��Rq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0م�q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0�ROq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\0���q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0Q�Xq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0��q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0�Ćq\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0\0Obq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0[�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0&�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0��Gq\0~�t\0assigneepxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0�E=q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0�dq\0~�t\0566,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0=��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0eq\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0��\"q\0~�t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��\rq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0@�Zq\0~�t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0!<\'q\0~�t\0\ndepartmentpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~xsq\0~�t\0ExtendedAttributesq\0~\0�;q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Rzq\0~t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0�qGq\0~t\0assigneepxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nq\0~\rxxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~\Zq\0~q\0~!q\0~]q\0~aq\0~}q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0\0,�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0d~q\0~t\0send_rejected_notifictionpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�8�q\0~t\0\ZSend Rejected Notificationpt\0Descriptionsq\0~\02\0q\0~sq\0~\0�֜q\0~t\0\0t\0Limitsq\0~�\0q\0~!sq\0~\0\0>�Eq\0~t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0�Yq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0�q\0~%t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0\0+%�q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0�b�q\0~/t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0��q\0~4t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0>?�q\0~4t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0^��q\0~>t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Azq\0~Et\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��q\0~Eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~3\0q\0~Rsq\0~\0\0Z�Sq\0~Et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~Xsq\0~\0\0��Nq\0~Et\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\\sq\0~\0�&�q\0~Et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Jq\0~Mq\0~Sq\0~Yq\0~]xxsq\0~#t\0SubFlowsq\0~\0�	(q\0~4t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0*S>q\0~ct\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0�5�q\0~cq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~nsq\0~\0W8^q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~hq\0~kq\0~oxxq\0~>xsq\0~\0E\0\0\0w\0\0\0\nq\0~4xsq\0~;t\0\rBlockActivitysq\0~\05�tq\0~%t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0]��q\0~vt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~{xxq\0~/t\0	Performersq\0~G\0q\0~sq\0~\0���q\0~t\0systemt\0	StartModesq\0~L\0q\0~�sq\0~\0e}q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0�-�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0d��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0E�=q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0̭�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~n\0q\0~�sq\0~\0��1q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0\'��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0h�q\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0\0Id�q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0wE�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0���q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0�tHq\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0�ZPq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0�N�q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0\0R^�q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0��q\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0�c�q\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0(��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0E��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0��Rq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0M�`q\0~�t\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~\0xsq\0~�t\0ExtendedAttributesq\0~\0\0bӶq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\09{�q\0~t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~t\0566,15pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~\Zq\0~q\0~\"q\0~%q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0^�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0{-q\0~t\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0��^q\0~t\0Route 1pt\0Descriptionsq\0~\02\0q\0~sq\0~\0A�q\0~t\0\0t\0Limitsq\0~�\0q\0~ sq\0~\0�i�q\0~t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0?�Iq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0;Fq\0~$t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0\0t��q\0~$t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0���q\0~.t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0�$Oq\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0a�*q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~#t\0SubFlowsq\0~\0\0�R�q\0~3t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��2q\0~Ct\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0�Mq\0~Cq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~Nsq\0~\0F�&q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~Hq\0~Kq\0~Oxxq\0~7xsq\0~\0E\0\0\0w\0\0\0\nq\0~3xsq\0~;t\0\rBlockActivitysq\0~\0\0?��q\0~$t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0\0��q\0~Vt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~[xxq\0~(t\0	Performersq\0~G\0q\0~_sq\0~\0\0	�q\0~t\0\0t\0	StartModesq\0~L\0q\0~csq\0~\0B�q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\04�Fq\0~dt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\02��q\0~ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0d~Hq\0~ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0�Ъq\0~ht\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~lxsq\0~\0E\0\0\0w\0\0\0\nq\0~hxt\0\nFinishModesq\0~n\0q\0~sq\0~\0\0�I7q\0~t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\0���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0f�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0��jq\0~t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0�ܠq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0	��q\0~t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0M�.q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0�	?q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0s!�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0\0�,pq\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0V��q\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\05/�q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0\0�>Eq\0~t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0\0GVq\0~t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0�]q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0�TFq\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~�sq\0~\0\0N�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Ӷq\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split��~ѯWS\0\0xq\0~\0\0q\0~�sq\0~\0\'dq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0Wq\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~�sq\0~\0\06��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0\0\'Z�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�]q\0~�t\0transition4pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~�t\0\rTransitionRefsq\0~\0\0ѳ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0p�q\0~\0t\0transition3pxsq\0~\0E\0\0\0w\0\0\0\nq\0~xsq\0~�t\0\rTransitionRefsq\0~\0�W�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�m�q\0~	t\0transition12pxsq\0~\0E\0\0\0w\0\0\0\nq\0~xxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0I(�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0�J:q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�0�q\0~\Zt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�$�q\0~\Zt\0hodpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~\"xsq\0~�t\0ExtendedAttributesq\0~\0A��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0Z4�q\0~&t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0Lm�q\0~&t\0394,18pxsq\0~\0E\0\0\0w\0\0\0\nq\0~+q\0~.xxpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~q\0~!q\0~$q\0~`q\0~dq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~xsq\0~�t\0Activitysq\0~\0�k4q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�_q\0~3t\0verifiy_resolved_requestpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\"I�q\0~3t\0Verify Resolved Requestpt\0Descriptionsq\0~\02\0q\0~>sq\0~\0\0=q\0~3t\0\0t\0Limitsq\0~�\0q\0~Bsq\0~\0\0#�\"q\0~3t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\0p��q\0~3t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0� q\0~Ft\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0\0KN[q\0~Ft\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0j�q\0~Pt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0�N�q\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0�Mq\0~Ut\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~#t\0SubFlowsq\0~\0sFCq\0~Ut\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\n�q\0~et\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\06q�q\0~eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~psq\0~\0gcq\0~et\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~jq\0~mq\0~qxxq\0~Yxsq\0~\0E\0\0\0w\0\0\0\nq\0~Uxsq\0~;t\0\rBlockActivitysq\0~\0\0�lVq\0~Ft\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0\0>��q\0~xt\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~}xxq\0~Pt\0	Performersq\0~G\0q\0~�sq\0~\0�q\0~3t\0	requestert\0	StartModesq\0~L\0q\0~�sq\0~\0��&q\0~3t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\0���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0�JOq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0;Dq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~n\0q\0~�sq\0~\0\0��hq\0~3t\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0\0̀q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0r�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0\0��<q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\0�\rq\0~3t\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0\0�eq\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0�إq\0~3t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0I9�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0\0_�q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~�sq\0~\0\0�q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~�sq\0~\0���q\0~�t\0\0t\0WorkingTimesq\0~\0q\0~�sq\0~\0\06�Uq\0~�t\0\0t\0Durationsq\0~\0q\0~�sq\0~\0���q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xt\0Iconsq\0~�\0q\0~�sq\0~\0��mq\0~3t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0˫�q\0~3t\0\0t\0TransitionRestrictionssq\0~�\0q\0~�sq\0~\0\0jq\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0=}1q\0~�t\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~�sq\0~\0�;`q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0D#�q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Splitsq\0~�\0q\0~	sq\0~\0�		q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Q�q\0~	q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~	sq\0~\0\0�\r�q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~	xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~	xxt\0ExtendedAttributessq\0~\0�\0q\0~	sq\0~\0��^q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\00lHq\0~	t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~	t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0�Ƙq\0~	t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~	!xsq\0~�t\0ExtendedAttributesq\0~\0\0M2Aq\0~	t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0\\q\0~	%t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0+q@q\0~	%t\0834,27pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	*q\0~	-xsq\0~�t\0ExtendedAttributesq\0~\0B-q\0~	t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~	1t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0�Mq\0~	1t\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~	6q\0~	9xsq\0~�t\0ExtendedAttributesq\0~\0\0�qpq\0~	t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~	=t\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0%�3q\0~	=t\0\ndepartmentpxsq\0~\0E\0\0\0w\0\0\0\nq\0~	Bq\0~	Exsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~	t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�jfq\0~	It\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0.d`q\0~	It\0assigneepxsq\0~\0E\0\0\0w\0\0\0\nq\0~	Nq\0~	Qxxpxsq\0~\0E\0\0\0w\0\0\0q\0~8q\0~;q\0~?q\0~Cq\0~Fq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~	xsq\0~�t\0Activitysq\0~\0��cq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ITMq\0~	Vt\0route2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�`�q\0~	Vt\0Route 2pt\0Descriptionsq\0~\02\0q\0~	asq\0~\0\0�Arq\0~	Vt\0\0t\0Limitsq\0~�\0q\0~	esq\0~\0\0��q\0~	Vt\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0|��q\0~	Vt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0eRq\0~	it\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0&a�q\0~	it\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0ہ�q\0~	st\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0$3�q\0~	xt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0˯cq\0~	xt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~#t\0SubFlowsq\0~\0g��q\0~	xt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�e+q\0~	�t\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0�\0�q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~	�sq\0~\0 ��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xxq\0~	|xsq\0~\0E\0\0\0w\0\0\0\nq\0~	xxsq\0~;t\0\rBlockActivitysq\0~\0\0��vq\0~	it\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0\0�h\0q\0~	�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xxq\0~	mt\0	Performersq\0~G\0q\0~	�sq\0~\0\0�ޣq\0~	Vt\0\0t\0	StartModesq\0~L\0q\0~	�sq\0~\0w�<q\0~	Vt\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\"�q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0Ӭ�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0�8�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0T��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	�xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xt\0\nFinishModesq\0~n\0q\0~	�sq\0~\0\0�;�q\0~	Vt\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\0���q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0O�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\0n|Aq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0��2q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~	�xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�xt\0Prioritysq\0~�\0q\0~	�sq\0~\0\0�k�q\0~	Vt\0\0t\0	Deadlinessq\0~�\0q\0~	�sq\0~\0\0��q\0~	Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~	�sq\0~\0\0��q\0~	Vt\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~	�sq\0~\0\0u&gq\0~	�t\0\0t\0TimeEstimationsq\0~�q\0~	�sq\0~\0,c�q\0~	�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~	�sq\0~\0?�3q\0~	�t\0\0t\0WorkingTimesq\0~\0q\0~	�sq\0~\0\0�Jsq\0~	�t\0\0t\0Durationsq\0~\0q\0~\nsq\0~\0\0?��q\0~	�t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~\n\0q\0~\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~	�q\0~	�q\0~	�xt\0Iconsq\0~�\0q\0~\n	sq\0~\0\0�Gq\0~	Vt\0\0t\0\rDocumentationsq\0~\07\0q\0~\n\rsq\0~\0\0�Jdq\0~	Vt\0\0t\0TransitionRestrictionssq\0~�\0q\0~\nsq\0~\0\0�\nvq\0~	Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0TransitionRestrictionsq\0~\0� q\0~\nt\0\0sq\0~\0w\0\0\0t\0Joinsq\0~�\0q\0~\nsq\0~\0�q\0~\nt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0-bq\0~\nq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n!xt\0Splitsq\0~�\0q\0~\n%sq\0~\0\0a��q\0~\nt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�Qq\0~\n&t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0TransitionRefssq\0~�\0q\0~\n.sq\0~\0�^zq\0~\n&t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0\rTransitionRefsq\0~\0���q\0~\n/t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0塞q\0~\n4t\0transition10pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n9xsq\0~�t\0\rTransitionRefsq\0~\0\0�ͫq\0~\n/t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~\n=t\0transition9pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nBxxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n*q\0~\n/xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nq\0~\n&xxt\0ExtendedAttributessq\0~\0�\0q\0~\nHsq\0~\0|��q\0~	Vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0��)q\0~\nIt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�R�q\0~\nNt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0�)q\0~\nNt\0	requesterpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\nSq\0~\nVxsq\0~�t\0ExtendedAttributesq\0~\0��\Zq\0~\nIt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0[sKq\0~\nZt\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�A�q\0~\nZt\0987,35pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n_q\0~\nbxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	[q\0~	^q\0~	bq\0~	fq\0~	iq\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~\n\nq\0~\nq\0~\nq\0~\nIxsq\0~�t\0Activitysq\0~\0\0;�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�RFq\0~\ngt\0\Zsend_verified_notificationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0���q\0~\ngt\0\ZSend Verified Notificationpt\0Descriptionsq\0~\02\0q\0~\nrsq\0~\0��q\0~\ngt\0\0t\0Limitsq\0~�\0q\0~\nvsq\0~\0�EJq\0~\ngt\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0�kq\0~\ngt\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\0�9�q\0~\nzt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0\0��q\0~\nzt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\06�4q\0~\n�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0���q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0\0�<\0q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~Dt\0Toolsq\0~\0\0�l�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�45q\0~\n�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0���q\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Pq\0~Qxt\0ActualParameterssq\0~3\0q\0~\n�sq\0~\0\0�=q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0Descriptionsq\0~\02\0q\0~\n�sq\0~\0\0���q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0\0�)�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~#t\0SubFlowsq\0~\0kT�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0~\"q\0~\n�t\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0�Nq\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~\n�sq\0~\0\0{L�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�q\0~\n�q\0~\n�xxq\0~\n�xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xsq\0~;t\0\rBlockActivitysq\0~\0\0�\"2q\0~\nzt\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0�?�q\0~\n�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xxq\0~\n�t\0	Performersq\0~G\0q\0~\n�sq\0~\0/_�q\0~\ngt\0systemt\0	StartModesq\0~L\0q\0~\n�sq\0~\04�Pq\0~\ngt\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0�qq\0~\n�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0�AEq\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0?H	q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0�M�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\n�xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xt\0\nFinishModesq\0~n\0q\0~\n�sq\0~\0\0(�`q\0~\ngt\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0{�q\0~\n�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0&P9q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0]�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0T0�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~\n�xsq\0~\0E\0\0\0w\0\0\0\nq\0~\n�xt\0Prioritysq\0~�\0q\0~\rsq\0~\0\0N�3q\0~\ngt\0\0t\0	Deadlinessq\0~�\0q\0~sq\0~\02��q\0~\ngt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~sq\0~\0\0\"��q\0~\ngt\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0�yq\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~sq\0~\0\0��Xq\0~t\0\0t\0TimeEstimationsq\0~�q\0~#sq\0~\0+�q\0~t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~(sq\0~\0\0@FEq\0~$t\0\0t\0WorkingTimesq\0~\0q\0~,sq\0~\0ň@q\0~$t\0\0t\0Durationsq\0~\0q\0~0sq\0~\0t,�q\0~$t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~)q\0~-q\0~1xxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~ q\0~$xt\0Iconsq\0~�\0q\0~6sq\0~\0\00�q\0~\ngt\0\0t\0\rDocumentationsq\0~\07\0q\0~:sq\0~\0\0.�?q\0~\ngt\0\0t\0TransitionRestrictionssq\0~�\0q\0~>sq\0~\0\0��q\0~\ngt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~Dsq\0~\0\0�U�q\0~\ngt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0M�q\0~Et\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0x�|q\0~Jt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~Jt\0systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~Oq\0~Rxsq\0~�t\0ExtendedAttributesq\0~\0\0��q\0~Et\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0:~q\0~Vt\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0Y\"q\0~Vt\01113,16pxsq\0~\0E\0\0\0w\0\0\0\nq\0~[q\0~^xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\nlq\0~\noq\0~\nsq\0~\nwq\0~\nzq\0~\n�q\0~\n�q\0~\n�q\0~q\0~q\0~q\0~7q\0~;q\0~?q\0~Exsq\0~�t\0Activitysq\0~\0\0��%q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�\nq\0~ct\0resolve_reopened_requestpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0@�Kq\0~ct\0Resolve Reopened Requestpt\0Descriptionsq\0~\02\0q\0~nsq\0~\0\0>�Dq\0~ct\0\0t\0Limitsq\0~�\0q\0~rsq\0~\0\0;�q\0~ct\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0��q\0~ct\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Routesq\0~\09\\�q\0~vt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\nt\0Implementationsq\0~\0\0��q\0~vt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~q\0~\0�sq\0~\0\0�4�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~t\0Nosq\0~\0\0ћSq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~\0t\0Toolssq\0~\0,p�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~#t\0SubFlowsq\0~\0\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0\0pq\0~,sq\0~\0\0q\0~,sq\0~\0\0��_q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~0q\0~1xt\0ActualParameterssq\0~3\0q\0~�sq\0~\0\0s��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xsq\0~;t\0\rBlockActivitysq\0~\0\0��:q\0~vt\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0q\0~Asq\0~\0\0�һq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xxq\0~�t\0	Performersq\0~G\0q\0~�sq\0~\0�Uq\0~ct\0hodt\0	StartModesq\0~L\0q\0~�sq\0~\0\0ME�q\0~ct\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\Z��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0\0�a�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0D�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0\nFinishModesq\0~n\0q\0~�sq\0~\0\0�e�q\0~ct\0\0sq\0~\0w\0\0\0q\0~Qsq\0~R\0q\0~Qsq\0~\0\08j�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0\nsq\0~W\0t\0XMLEmptyChoiceElementsq\0~\0�|\0q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~^t\0	Automaticsq\0~\0\06�$q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxsq\0~et\0Manualsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxxq\0~�xsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Prioritysq\0~�\0q\0~�sq\0~\0\0�W$q\0~ct\0\0t\0	Deadlinessq\0~�\0q\0~�sq\0~\0k)q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0SimulationInformationsq\0~�\0q\0~�sq\0~\0\0��q\0~ct\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0Costsq\0~�q\0~�sq\0~\0�6q\0~�t\0\0t\0TimeEstimationsq\0~�q\0~sq\0~\0�88q\0~�t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~\0q\0~sq\0~\0�q\0~t\0\0t\0WorkingTimesq\0~\0q\0~sq\0~\0\0�(�q\0~t\0\0t\0Durationsq\0~\0q\0~sq\0~\0\0�Q�q\0~t\0\0xsq\0~\0E\0\0\0w\0\0\0\nq\0~	q\0~\rq\0~xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~\0q\0~xt\0Iconsq\0~�\0q\0~sq\0~\0\0\r,\"q\0~ct\0\0t\0\rDocumentationsq\0~\07\0q\0~\Zsq\0~\0\0̦�q\0~ct\0\0t\0TransitionRestrictionssq\0~�\0q\0~sq\0~\0��q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\nxt\0ExtendedAttributessq\0~\0�\0q\0~$sq\0~\0L��q\0~ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0m�q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0n]=q\0~*t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�tnq\0~*t\0hodpxsq\0~\0E\0\0\0w\0\0\0\nq\0~/q\0~2xsq\0~�t\0ExtendedAttributesq\0~\0\0h�}q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�J�q\0~6t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0^3q\0~6t\01105,13pxsq\0~\0E\0\0\0w\0\0\0\nq\0~;q\0~>xsq\0~�t\0ExtendedAttributesq\0~\0mT*q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��Qq\0~Bt\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0c��q\0~Bt\0statuspxsq\0~\0E\0\0\0w\0\0\0\nq\0~Gq\0~Jxsq\0~�t\0ExtendedAttributesq\0~\0\0֟1q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0mv�q\0~Nt\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0!�q\0~Nt\0\ndepartmentpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Sq\0~Vxsq\0~�t\0ExtendedAttributesq\0~\0\0�p	q\0~%t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0%}�q\0~Zt\0VariableToProcess_UPDATEpq\0~�sq\0~\0\0q\0~�sq\0~\0m�q\0~Zt\0assigneepxsq\0~\0E\0\0\0w\0\0\0\nq\0~_q\0~bxxpxsq\0~\0E\0\0\0w\0\0\0q\0~hq\0~kq\0~oq\0~sq\0~vq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~q\0~%xxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~gsq\0~\0<eq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0	w\0\0\0\nsr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0\0�_�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~ot\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�%�q\0~ot\0\0pt\0Fromsq\0~\0q\0~zsq\0~\0\0�>&q\0~ot\0resolve_requestpt\0Tosq\0~\0q\0~~sq\0~\0\0jG�q\0~ot\0route1pt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~�sq\0~\0�i�q\0~ot\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�&�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0�	q\0~ot\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0	/�q\0~ot\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0��Gq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0&gq\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\03E�q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~tq\0~wq\0~{q\0~q\0~�q\0~�q\0~�xsq\0~nt\0\nTransitionsq\0~\0\0#N~q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0n5q\0~�t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0�#\rq\0~�t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0�G�q\0~�t\0route1pq\0~~sq\0~\0q\0~~sq\0~\0�`�q\0~�t\0send_rejected_notifictionpt\0	Conditionsq\0~�\0q\0~�sq\0~\0�b+q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�\r�q\0~�t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0\0��Iq\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0Śeq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0	�_q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~�t\0417,494pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0���q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0\0;q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~nt\0\nTransitionsq\0~\0�?Lq\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0`wq\0~�t\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0M��q\0~�t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0B�}q\0~�t\0route1pq\0~~sq\0~\0q\0~~sq\0~\0���q\0~�t\0resolve_assigned_requestpt\0	Conditionsq\0~�\0q\0~�sq\0~\0���q\0~�t\0status == \"Assigned\"sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~�xt\0Descriptionsq\0~\02\0q\0~\r\0sq\0~\0S��q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0\0s�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0&`�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�\n=q\0~\r\nt\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0�l;q\0~\r\nt\0441,346pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rq\0~\rxsq\0~�t\0ExtendedAttributesq\0~\0f��q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\08��q\0~\rt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~\rt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rq\0~\rxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�q\0~�q\0~�q\0~�q\0~\rq\0~\rxsq\0~nt\0\nTransitionsq\0~\0��aq\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0g�q\0~\r#t\0transition6pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0i�q\0~\r#t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0\0�`�q\0~\r#t\0resolve_assigned_requestpq\0~~sq\0~\0q\0~~sq\0~\0\0�\0%q\0~\r#t\0verifiy_resolved_requestpt\0	Conditionsq\0~�\0q\0~\r4sq\0~\0tg�q\0~\r#t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0Qq\0~\r5q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r9xt\0Descriptionsq\0~\02\0q\0~\r=sq\0~\0���q\0~\r#t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\rAsq\0~\0\0�`\rq\0~\r#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0��Rq\0~\rBt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��Sq\0~\rGt\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0�L7q\0~\rGt\0892,348pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rLq\0~\rOxsq\0~�t\0ExtendedAttributesq\0~\0/�q\0~\rBt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\']�q\0~\rSt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~\rSt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rXq\0~\r[xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r(q\0~\r+q\0~\r.q\0~\r1q\0~\r5q\0~\r>q\0~\rBxsq\0~nt\0\nTransitionsq\0~\0\0�!�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~\r`t\0transition8pq\0~\0sq\0~\0\0q\0~\0sq\0~\0%q\0~\r`t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0�X9q\0~\r`t\0verifiy_resolved_requestpq\0~~sq\0~\0q\0~~sq\0~\0\0�q\0~\r`t\0route2pt\0	Conditionsq\0~�\0q\0~\rqsq\0~\0 ��q\0~\r`t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�`q\0~\rrq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\rvxt\0Descriptionsq\0~\02\0q\0~\rzsq\0~\0\0�$q\0~\r`t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r~sq\0~\0\0�M�q\0~\r`t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0�Ԅq\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ZVq\0~\r�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0�vq\0~\r�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\req\0~\rhq\0~\rkq\0~\rnq\0~\rrq\0~\r{q\0~\rxsq\0~nt\0\nTransitionsq\0~\0\0�?Lq\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��9q\0~\r�t\0transition9pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0dp�q\0~\r�t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0\0��!q\0~\r�t\0route2pq\0~~sq\0~\0q\0~~sq\0~\0���q\0~\r�t\0resolve_reopened_requestpt\0	Conditionsq\0~�\0q\0~\r�sq\0~\0\0��q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�L�q\0~\r�t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�xt\0Descriptionsq\0~\02\0q\0~\r�sq\0~\0\0]\0;q\0~\r�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r�sq\0~\0�!�q\0~\r�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0P�q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�K�q\0~\r�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0Npq\0~\r�t\01027,57pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xsq\0~�t\0ExtendedAttributesq\0~\0�Iq\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�!q\0~\r�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0�Չq\0~\r�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�xsq\0~nt\0\nTransitionsq\0~\0�5�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0U�q\0~\r�t\0transition10pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\0��q\0~\r�t\0\0pq\0~zsq\0~\0q\0~zsq\0~\0\0��q\0~\r�t\0route2pq\0~~sq\0~\0q\0~~sq\0~\0\03�/q\0~\r�t\0\Zsend_verified_notificationpt\0	Conditionsq\0~�\0q\0~\r�sq\0~\0H\0�q\0~\r�t\0status == \"Verified\"sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�.q\0~\r�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�xt\0Descriptionsq\0~\02\0q\0~\r�sq\0~\0P�2q\0~\r�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\r�sq\0~\0�zq\0~\r�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0ϒ2q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�Lq\0~\r�t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~\r�t\01028,498pxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�xsq\0~�t\0ExtendedAttributesq\0~\0\0la.q\0~\r�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0`0�q\0~\0t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0/<�q\0~\0t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�q\0~\r�xsq\0~nt\0\nTransitionsq\0~\00f�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0h��q\0~\rt\0transition12pq\0~\0sq\0~\0\0q\0~\0sq\0~\0K�\"q\0~\rt\0\0pq\0~zsq\0~\0q\0~zsq\0~\0\0��cq\0~\rt\0route1pq\0~~sq\0~\0q\0~~sq\0~\0o�<q\0~\rt\0verifiy_resolved_requestpt\0	Conditionsq\0~�\0q\0~sq\0~\0� �q\0~\rt\0status == \"Resolved\"sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\0�edq\0~t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~#xt\0Descriptionsq\0~\02\0q\0~(sq\0~\0\0���q\0~\rt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~,sq\0~\0\01�q\0~\rt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0��q\0~-t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�;nq\0~2t\0JaWE_GRAPH_BREAK_POINTSpq\0~�sq\0~\0\0q\0~�sq\0~\0\0E�)q\0~2t\0463,212pxsq\0~\0E\0\0\0w\0\0\0\nq\0~7q\0~:xsq\0~�t\0ExtendedAttributesq\0~\0�E q\0~-t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\00?�q\0~>t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~>t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Cq\0~Fxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~q\0~q\0~q\0~q\0~q\0~)q\0~-xsq\0~nt\0\nTransitionsq\0~\0�/�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0_ړq\0~Kt\0transition13pq\0~\0sq\0~\0\0q\0~\0sq\0~\0��q\0~Kt\0\0pq\0~zsq\0~\0q\0~zsq\0~\0T�3q\0~Kt\0resolve_reopened_requestpq\0~~sq\0~\0q\0~~sq\0~\00�eq\0~Kt\0route1pt\0	Conditionsq\0~�\0q\0~\\sq\0~\0\0���q\0~Kt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Giq\0~]q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0\nq\0~axt\0Descriptionsq\0~\02\0q\0~esq\0~\0\0\nBsq\0~Kt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~isq\0~\0��q\0~Kt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�_�q\0~jt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~ot\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0�Zq\0~ot\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0\nq\0~tq\0~wxxpxsq\0~\0E\0\0\0w\0\0\0\nq\0~Pq\0~Sq\0~Vq\0~Yq\0~]q\0~fq\0~jxxt\0ExtendedAttributessq\0~\0�\0q\0~|sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0A�q\0~}t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0��q\0~�t\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~�sq\0~\0\0q\0~�sq\0~\0/n�q\0~�t\0hod;requester;assignee;systempxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0#�q\0~}t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�Ԭq\0~�t\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0\0���q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=resolve_request,X_OFFSET=120,Y_OFFSET=41,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0_Y�q\0~}t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�V�q\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0t6q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=send_verified_notification,X_OFFSET=1289,Y_OFFSET=26,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0�B|q\0~}t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�Tq\0~�t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0ZX�q\0~�t\0�JaWE_GRAPH_PARTICIPANT_ID=system,CONNECTING_ACTIVITY_ID=send_rejected_notifiction,X_OFFSET=776,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~q\0~1q\0~7q\0~�q\0~�q\0~�q\0~�q\0~iq\0~}xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\0$cq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsq\0~�t\0ExtendedAttributesq\0~\0\0�~q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Dq\0~�t\0EDITING_TOOLpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�gq\0~�t\0*Workflow Designer 3.0-SNAPSHOT - build 221pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\0g��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0�X�q\0~�t\0EDITING_TOOL_VERSIONpq\0~�sq\0~\0\0q\0~�sq\0~\0\0�dQq\0~�t\02.0-2(4?)-C-20080226-2126pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0(6q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0g/Rq\0~�t\0JaWE_CONFIGURATIONpq\0~�sq\0~\0\0q\0~�sq\0~\0S�Kq\0~�t\0defaultpxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xxpxsq\0~\0E\0\0\0\rw\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~tq\0~�q\0~�q\0~�x\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\0�2q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0\nsr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\0\01�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��nq\0~�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0q q\0~�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0\nq\0~�q\0~�xx',1000409,4,1000410,0);
/*!40000 ALTER TABLE `SHKXPDLData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLHistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistory` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `XPDLHistoryUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistory` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLHistory`
--

LOCK TABLES `SHKXPDLHistory` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLHistoryData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistoryData` (
  `XPDLContent` mediumblob NOT NULL,
  `XPDLClassContent` mediumblob NOT NULL,
  `XPDLHistory` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistoryData` (`CNT`),
  KEY `SHKXPDLHistoryData_XPDLHistory` (`XPDLHistory`),
  CONSTRAINT `SHKXPDLHistoryData_XPDLHistory` FOREIGN KEY (`XPDLHistory`) REFERENCES `SHKXPDLHistory` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLHistoryData`
--

LOCK TABLES `SHKXPDLHistoryData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLParticipantPackage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantPackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLParticipantPackage`
--

LOCK TABLES `SHKXPDLParticipantPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLParticipantProcess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantProcess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLParticipantProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLParticipantProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLParticipantProcess`
--

LOCK TABLES `SHKXPDLParticipantProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLReferences`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLReferences` (
  `ReferredXPDLId` varchar(90) NOT NULL,
  `ReferringXPDL` decimal(19,0) NOT NULL,
  `ReferredXPDLNumber` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLReferences` (`ReferredXPDLId`,`ReferringXPDL`),
  KEY `SHKXPDLReferences_ReferringXPDL` (`ReferringXPDL`),
  CONSTRAINT `SHKXPDLReferences_ReferringXPDL` FOREIGN KEY (`ReferringXPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLReferences`
--

LOCK TABLES `SHKXPDLReferences` WRITE;
/*!40000 ALTER TABLE `SHKXPDLReferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLReferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLS` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLS` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLS`
--

LOCK TABLES `SHKXPDLS` WRITE;
/*!40000 ALTER TABLE `SHKXPDLS` DISABLE KEYS */;
INSERT INTO `SHKXPDLS` VALUES ('crm','1',1184650391000,'2011-10-17 11:23:13',1000202,0),('dashboard','1',1184650391000,'2012-08-14 06:45:04',1000401,0),('hr_expense','1',1184650391000,'2012-08-14 06:45:33',1000405,0),('isr','1',1184650391000,'2012-08-14 06:45:55',1000409,0);
/*!40000 ALTER TABLE `SHKXPDLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_app`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `license` text,
  `description` longtext,
  `meta` longtext,
  PRIMARY KEY (`appId`,`appVersion`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_app`
--

LOCK TABLES `app_app` WRITE;
/*!40000 ALTER TABLE `app_app` DISABLE KEYS */;
INSERT INTO `app_app` VALUES ('crm',1,'CRM','','2011-10-17 19:23:12','2012-08-14 14:46:12','Vfe6Df5AdlrGEPqFYgTt8XuGJ4XiTt2NnBLEovw3qoQ=',NULL,NULL),('dashboard',1,'Employee Portal','','2012-08-14 06:45:03','2012-08-14 14:45:20','EG7vI0pxpjL7ThQ8m9sQSeEfsbmWrC4TbI37BKjZlO5jbwy29bpHrw==',NULL,NULL),('hr_expense',1,'HR Expenses Claim App','','2012-08-14 06:45:31','2012-08-14 14:45:45','cggLRcAgu9fsi9+Evtai7+EX+Fx2lx0tRzfPsTbAfbQCrT5RWUgR7w==',NULL,NULL),('isr',1,'Internal Service Request','','2012-08-14 06:45:53','2012-08-14 14:46:06','BXiIDyi75K/balSfhqm1i7aycpqYcRKBBPMkO7zfnto=',NULL,NULL);
/*!40000 ALTER TABLE `app_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_datalist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_datalist` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK5E9247A6462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK5E9247A6462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_datalist`
--

LOCK TABLES `app_datalist` WRITE;
/*!40000 ALTER TABLE `app_datalist` DISABLE KEYS */;
INSERT INTO `app_datalist` VALUES ('crm',1,'crm_account_list','Account Listing','Account Listing','{\"id\":\"crm_account_list\",\"name\":\"Account Listing\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_account\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"rowActions\":[{\"id\":\"rowAction_0\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_list\",\"target\":\"_self\",\"hrefParam\":\"d-6304176-fn_account\",\"hrefColumn\":\"id\",\"label\":\"Contacts\",\"confirmation\":\"\",\"visible\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"},{\"id\":\"rowAction_1\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"fk_account\",\"hrefColumn\":\"id\",\"label\":\"New Contact\",\"confirmation\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"}],\"filters\":[{\"id\":\"filter_0\",\"label\":\"Account Name\",\"name\":\"accountName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_account\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"id\",\"label\":\"ID\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"ID\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_1\",\"name\":\"accountName\",\"label\":\"Account Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_5\",\"name\":\"country\",\"label\":\"Country\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_4\",\"name\":\"state\",\"label\":\"State\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2011-10-17 11:23:12','2014-03-18 18:14:15'),('crm',1,'crm_contact_list','Contact List','Contact List','{\"id\":\"crm_contact_list\",\"name\":\"Contact List\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_contact\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"rowActions\":[{\"id\":\"rowAction_0\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Edit\",\"confirmation\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"}],\"filters\":[{\"id\":\"filter_2\",\"name\":\"account\",\"label\":\"Account\",\"type\":{\"className\":\"org.joget.plugin.enterprise.SelectBoxDataListFilterType\",\"properties\":{\"multiple\":\"textfield\",\"size\":\"\",\"defaultValue\":\"\",\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"filter_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"type\":{\"className\":\"org.joget.apps.datalist.lib.TextFieldDataListFilterType\",\"properties\":{\"defaultValue\":\"\"}}},{\"id\":\"filter_1\",\"label\":\"Last Name\",\"name\":\"lastName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_contact\"}},\"columns\":[{\"id\":\"column_2\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"org.joget.plugin.enterprise.OptionsValueFormatter\",\"properties\":{\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"column_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Full Name\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"lastName\",\"label\":\"Last Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2011-10-17 11:23:12','2014-08-01 10:51:19'),('crm',1,'crm_inbox','Task Inbox','Task Inbox','{\"id\":\"crm_inbox\",\"name\":\"Task Inbox\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.WorkflowInboxDataListBinder\",\"properties\":{\"appFilter\":\"app\",\"processId\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"processName\",\"label\":\"Process Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\"\"},{\"id\":\"column_1\",\"name\":\"activityName\",\"label\":\"Activity Name\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"workflow_form\",\"target\":\"_self\",\"hrefParam\":\"activityId\",\"hrefColumn\":\"activityId\",\"label\":\"Activity Name\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_2\",\"name\":\"dateCreated\",\"label\":\"Date Created\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\"\"}]}','2011-10-17 11:23:12','2011-10-17 11:23:12'),('crm',1,'crm_opportunity_list','Opportunity List','Opportunity List','{\"id\":\"crm_opportunity_list\",\"name\":\"Opportunity List\",\"pageSize\":\"10\",\"order\":\"1\",\"orderBy\":\"dateModified\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_opportunity\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"rowActions\":[],\"filters\":[{\"id\":\"filter_1\",\"name\":\"account\",\"label\":\"Account\",\"type\":{\"className\":\"org.joget.plugin.enterprise.SelectBoxDataListFilterType\",\"properties\":{\"multiple\":\"textfield\",\"size\":\"\",\"defaultValue\":\"\",\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"filter_0\",\"label\":\"Title\",\"name\":\"title\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_opportunity\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"opportunity_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Title\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"org.joget.plugin.enterprise.OptionsValueFormatter\",\"properties\":{\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"column_2\",\"name\":\"amount\",\"label\":\"Amount\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_3\",\"name\":\"stage\",\"label\":\"Stage\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_1\",\"name\":\"dateModified\",\"label\":\"Date Modified\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2011-10-17 11:23:12','2014-08-01 10:46:54'),('dashboard',1,'user_list','User Registration List','User Registration List','{\"id\":\"user_list\",\"name\":\"User Registration List\",\"pageSize\":\"10\",\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[{\"id\":\"filter_0\",\"name\":\"username\",\"label\":\"Desired Username\"}],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"user_approval\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"IS NULL\",\"value\":\"\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_6\",\"label\":\"Desired Username\",\"name\":\"username\"},{\"id\":\"column_2\",\"label\":\"First Name\",\"name\":\"firstName\"},{\"id\":\"column_1\",\"label\":\"Last Name\",\"name\":\"lastName\"},{\"id\":\"column_3\",\"label\":\"Email\",\"name\":\"email\"},{\"id\":\"column_0\",\"label\":\"Status\",\"name\":\"status\"},{\"id\":\"column_4\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:03','2012-08-14 06:45:03'),('hr_expense',1,'hr_expenses_approved','HR Expenses Claim Approved List','HR Expenses Claim Approved List','{\"id\":\"hr_expenses_approved\",\"name\":\"HR Expenses Claim Approved List\",\"pageSize\":\"10\",\"order\":\"2\",\"orderBy\":\"dateCreated\",\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_approval\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Approved\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_2\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"last_approval_record\",\"label\":\"Approver\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"org.joget.apps.datalist.lib.DefaultFormatter\",\"properties\":{\"formatting\":\"\",\"size\":\"\",\"color\":\"\",\"formDefId\":\"hr_expenses_approval_entry\",\"field\":\"approver\"}}},{\"id\":\"column_3\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}],\"rowActions\":[],\"actions\":[],\"filters\":[]}','2012-08-14 06:45:31','2012-08-14 06:45:31'),('hr_expense',1,'hr_expenses_closed','HR Expenses Claim Closed List','HR Expenses Claim Closed List','{\"id\":\"hr_expenses_closed\",\"name\":\"HR Expenses Claim Closed List\",\"pageSize\":\"10\",\"order\":\"2\",\"orderBy\":\"dateCreated\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"rowActions\":[],\"actions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_approval\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Verified\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_4\",\"name\":\"last_approval_record\",\"label\":\"Approver\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"org.joget.apps.datalist.lib.DefaultFormatter\",\"properties\":{\"formatting\":\"\",\"size\":\"\",\"color\":\"\",\"formDefId\":\"hr_expenses_approval_entry\",\"field\":\"approver\"}}},{\"id\":\"column_2\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('hr_expense',1,'hr_expenses_finance','HR Expenses Claim Finance List','HR Expenses Claim Finance List','{\"id\":\"hr_expenses_finance\",\"name\":\"HR Expenses Claim Finance List\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_finance\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"IN\",\"value\":\"Verified;Finance Rejected\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_3\",\"label\":\"Submitted By\",\"name\":\"claimant\"},{\"id\":\"column_2\",\"label\":\"Total Amount\",\"name\":\"total\"},{\"id\":\"column_4\",\"label\":\"Date Created\",\"name\":\"dateCreated\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('hr_expense',1,'hr_expenses_rejected','HR Expenses Claim Rejected List','HR Expenses Claim Rejected List','{\"id\":\"hr_expenses_rejected\",\"name\":\"HR Expenses Claim Rejected List\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_approval\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"IN\",\"value\":\"Rejected;Finance Rejected\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_2\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('hr_expense',1,'hr_expenses_submitted','HR Expenses Claim Submitted List','HR Expenses Claim Submitted List','{\"id\":\"hr_expenses_submitted\",\"name\":\"HR Expenses Claim Submitted List\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_claim\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Submitted\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_1\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_0\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_2\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('hr_expense',1,'hr_expense_draft','HR Expenses Claim Draft List','HR Expenses Claim Draft List','{\"id\":\"hr_expense_draft\",\"name\":\"HR Expenses Claim Draft List\",\"pageSize\":\"10\",\"order\":\"2\",\"orderBy\":\"dateCreated\",\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_claim\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"New\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_2\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"name\":\"dateCreated\",\"label\":\"Date Created\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}],\"rowActions\":[],\"actions\":[],\"filters\":[]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('hr_expense',1,'hr_expense_list','Expense Claim List','Expense Claim List','{\"id\":\"hr_expense_list\",\"name\":\"Expense Claim List\",\"pageSize\":\"10\",\"order\":\"2\",\"orderBy\":\"dateCreated\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"rowActions\":[],\"actions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_claim\",\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_2\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_0\",\"name\":\"ref\",\"label\":\"Ref\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Submitted By\",\"name\":\"claimant\"},{\"id\":\"column_4\",\"label\":\"Total\",\"name\":\"total\"},{\"id\":\"column_1\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:32','2014-03-18 18:14:48'),('hr_expense',1,'hr_expense_resubmit','HR Expenses Claim Resubmit List','HR Expenses Claim Resubmit List','{\"id\":\"hr_expense_resubmit\",\"name\":\"HR Expenses Claim Resubmit List\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"hr_expense_approval\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Resubmit\"},{\"join\":\"AND\",\"field\":\"username\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Title\",\"name\":\"title\"},{\"id\":\"column_1\",\"label\":\"Ref\",\"name\":\"ref\"},{\"id\":\"column_2\",\"name\":\"last_approval_record\",\"label\":\"Approver\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"org.joget.apps.datalist.lib.DefaultFormatter\",\"properties\":{\"formatting\":\"\",\"size\":\"\",\"color\":\"\",\"formDefId\":\"hr_expenses_approval_entry\",\"field\":\"approver\"}}},{\"id\":\"column_3\",\"name\":\"total\",\"label\":\"Total\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"label\":\"Date Created\",\"name\":\"dateCreated\"}]}','2012-08-14 06:45:32','2012-08-14 06:45:32'),('isr',1,'isr_all_requests','ISR All Requests','ISR All Requests','{\"id\":\"isr_all_requests\",\"name\":\"ISR All Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_assigned_requests','ISR Assigned Requests','ISR Assigned Requests','{\"id\":\"isr_assigned_requests\",\"name\":\"ISR Assigned Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_resolve_request\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Assigned\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Assignee\",\"name\":\"assignee\"},{\"id\":\"column_4\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_5\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_attending_assigned_requests','ISR Attending Assigned Requests','ISR Attending Assigned Requests','{\"id\":\"isr_attending_assigned_requests\",\"name\":\"ISR Attending Assigned Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"IN\",\"value\":\"New;Assigned;Reopened\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_4\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_3\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_1\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_2\",\"label\":\"Requested Date\",\"name\":\"dateCreated\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_attending_submitted_requests','ISR Attending Submitted Requests','ISR Attending Submitted Requests','{\"id\":\"isr_attending_submitted_requests\",\"name\":\"ISR Attending Submitted Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Resolved\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"dateCreated\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_department_assigned','ISR Department Assigned Requests','ISR Department Assigned Requests','{\"id\":\"isr_department_assigned\",\"name\":\"ISR Department Assigned Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"attention\",\"operator\":\"=\",\"value\":\"#currentUser.department.id#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_department_report','ISR Department Report','ISR Department Report','{\"id\":\"isr_department_report\",\"name\":\"ISR Department Report\",\"pageSize\":\"10\",\"order\":\"1\",\"orderBy\":\"createdDate\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"rowActions\":[],\"actions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_resolve_assigned\",\"filters\":[{\"join\":\"AND\",\"field\":\"department\",\"operator\":\"=\",\"value\":\"#currentUser.department.id#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_5\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"},{\"id\":\"column_6\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}]}','2012-08-14 06:45:53','2012-08-14 06:45:53'),('isr',1,'isr_new_requests','ISR New Requests','ISR New Requests','{\"id\":\"isr_new_requests\",\"name\":\"ISR New Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"New\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:54','2012-08-14 06:45:54'),('isr',1,'isr_personal_submitted','ISR Personal Submitted Requests','ISR Personal Submitted Requests','{\"id\":\"isr_personal_submitted\",\"name\":\"ISR Personal Submitted Requests\",\"pageSize\":\"10\",\"order\":\"1\",\"orderBy\":\"createdDate\",\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"requester\",\"operator\":\"=\",\"value\":\"#currentUser.username#\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"},{\"id\":\"column_5\",\"name\":\"status\",\"label\":\"Status\",\"sortable\":\"false\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}}],\"rowActions\":[],\"actions\":[],\"filters\":[]}','2012-08-14 06:45:54','2012-08-14 06:45:54'),('isr',1,'isr_rejected_requests','ISR Rejected Requests','ISR Rejected Requests','{\"id\":\"isr_rejected_requests\",\"name\":\"ISR Rejected Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Rejected\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:54','2012-08-14 06:45:54'),('isr',1,'isr_reopened_requests','ISR Reopened Requests','ISR Reopened Requests','{\"id\":\"isr_reopened_requests\",\"name\":\"ISR Reopened Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Reopened\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:54','2012-08-14 06:45:54'),('isr',1,'isr_resolved_requests','ISR Resolved Requests','ISR Resolved Requests','{\"id\":\"isr_resolved_requests\",\"name\":\"ISR Resolved Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Resolved\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:54','2012-08-14 06:45:54'),('isr',1,'isr_verified_requests','ISR Verified Requests','ISR Verified Requests','{\"id\":\"isr_verified_requests\",\"name\":\"ISR Verified Requests\",\"pageSize\":10,\"order\":\"\",\"orderBy\":\"\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"false\",\"actions\":[],\"rowActions\":[],\"filters\":[],\"binder\":{\"className\":\"org.joget.plugin.enterprise.AdvancedFormRowDataListBinder\",\"properties\":{\"formDefId\":\"isr_verify_resolved\",\"filters\":[{\"join\":\"AND\",\"field\":\"status\",\"operator\":\"=\",\"value\":\"Verified\"}],\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"label\":\"Ref Id\",\"name\":\"ref_id\"},{\"id\":\"column_1\",\"label\":\"Subject\",\"name\":\"subject\"},{\"id\":\"column_2\",\"label\":\"Priority\",\"name\":\"priority\"},{\"id\":\"column_3\",\"label\":\"Requested By\",\"name\":\"requester_name\"},{\"id\":\"column_4\",\"label\":\"Requested Date\",\"name\":\"createdDate\"}]}','2012-08-14 06:45:54','2012-08-14 06:45:54');
/*!40000 ALTER TABLE `app_datalist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_env_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_env_variable` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` text,
  `remarks` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK740A62EC462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK740A62EC462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_env_variable`
--

LOCK TABLES `app_env_variable` WRITE;
/*!40000 ALTER TABLE `app_env_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_env_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_hr_expense_claim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_hr_expense_claim` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `c_finance_comments` longtext,
  `c_total` longtext,
  `c_ref` longtext,
  `c_approval_comments` longtext,
  `c_receipt` longtext,
  `c_title` longtext,
  `c_claimant` longtext,
  `c_status` longtext,
  `c_username` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_hr_expense_claim`
--

LOCK TABLES `app_fd_hr_expense_claim` WRITE;
/*!40000 ALTER TABLE `app_fd_hr_expense_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_hr_expense_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_form`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `formId` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `json` longtext,
  `description` longtext,
  PRIMARY KEY (`appId`,`appVersion`,`formId`),
  KEY `FK45957822462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK45957822462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_form`
--

LOCK TABLES `app_form` WRITE;
/*!40000 ALTER TABLE `app_form` DISABLE KEYS */;
INSERT INTO `app_form` VALUES ('crm',1,'crm_account','Account Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_account','{\n    \"className\": \"org.joget.apps.form.model.Form\",\n    \"properties\": {\n        \"id\": \"crm_account\",\n        \"loadBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        },\n        \"tableName\": \"crm_account\",\n        \"description\": \"\",\n        \"name\": \"Account Form\",\n        \"storeBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        }\n    },\n    \"elements\": [\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"id\",\n                                \"label\": \"Account ID\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"accountName\",\n                                \"label\": \"Account Name\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"99%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"account_details\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Account Details\"\n            }\n        },\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextArea\",\n                            \"properties\": {\n                                \"id\": \"address\",\n                                \"cols\": \"20\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Address\",\n                                \"readonly\": \"\",\n                                \"rows\": \"5\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                },\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"city\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"City\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"state\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"State\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.SelectBox\",\n                            \"properties\": {\n                                \"id\": \"country\",\n                                \"workflowVariable\": \"\",\n                                \"optionsBinder\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Country\",\n                                \"multiple\": \"\",\n                                \"readonly\": \"\",\n                                \"size\": \"\",\n                                \"options\": [\n                                    {\n                                        \"value\": \"\",\n                                        \"label\": \"\"\n                                    },\n                                    {\n                                        \"value\": \"local\",\n                                        \"label\": \"Local\"\n                                    },\n                                    {\n                                        \"value\": \"international\",\n                                        \"label\": \"International\"\n                                    }\n                                ]\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"address\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Address Details\"\n            }\n        }\n    ]\n}',NULL),('crm',1,'crm_contact','Contact Form','2011-10-17 11:23:12','2014-08-01 10:50:34','crm_contact','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_contact\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_contact\",\"name\":\"Contact Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"fullName\",\"workflowVariable\":\"\",\"readonlyLabel\":\"\",\"maxlength\":\"\",\"encryption\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"custom-regex\":\"\",\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"First Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"lastName\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Last Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"addressAvailable\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Available\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"no\",\"label\":\"No\"},{\"value\":\"yes\",\"label\":\"Yes\"}]}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"photo\",\"label\":\"Photo\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"contact_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Contact Details\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"address\",\"cols\":\"20\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"Address\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"city\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"City\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"state\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"State\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"address_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"addressAvailable\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Details\"}}]}',NULL),('crm',1,'crm_opportunity','Opportunity Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_opportunity','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_opportunity\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_opportunity\",\"name\":\"Opportunity Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"title\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Title\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"description\",\"cols\":\"15\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Description\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"amount\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Amount\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"stage\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Stage\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"open\",\"label\":\"Open\"},{\"value\":\"won\",\"label\":\"Won\"},{\"value\":\"lost\",\"label\":\"Lost\"}]}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"source\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Source\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"direct\",\"label\":\"Direct\"},{\"value\":\"indirect\",\"label\":\"Indirect\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"opportunity\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Opportunity\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"newAccount\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"New Account\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"yes\",\"label\":\"Yes\"},{\"value\":\"no\",\"label\":\"No\"}],\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"accountChoice\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_existing\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"no\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Existing Account\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"account\",\"formDefId\":\"crm_account\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"account\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"script1\",\"validator\":{\"className\":\"\",\"properties\":{}},\"value\":\"<script>\\nvar val = $(\\\"#account_crm_accountid\\\").val();\\nif (val != \'\') {\\n    $(\\\"#newAccount\\\").val(\\\"no\\\");\\n    $(\\\"#newAccount\\\").trigger(\\\"change\\\");\\n}\\n<\\/script>\",\"label\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_new\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\"}}]}',NULL),('crm',1,'crm_proposal_approval_form','Proposal Approval Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Approval Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"formDefId\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Approval\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"approved\",\"label\":\"Approved\"},{\"value\":\"resubmit\",\"label\":\"Resubmit\"},{\"value\":\"rejected\",\"label\":\"Rejected\"}]}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"comments\",\"cols\":\"20\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Approver Comments\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Approver Action\"}}]}',NULL),('crm',1,'crm_proposal_form','Proposal Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.IdGeneratorField\",\"properties\":{\"id\":\"refNo\",\"workflowVariable\":\"\",\"label\":\"Reference No\",\"format\":\"REF-??????\",\"envVariable\":\"refNo\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"title\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Title\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"description\",\"cols\":\"20\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Description\",\"readonly\":\"\",\"rows\":\"5\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"attachment\",\"label\":\"Attachment\",\"attachment\":\"true\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Form\"}}]}',NULL),('crm',1,'crm_proposal_resubmit_form','Proposal Resubmit Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_resubmit_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Resubmit Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval\",\"formDefId\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmit\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"formDefId\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"value\":\"pending\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmission\"}}]}',NULL),('crm',1,'crm_proposal_sending_form','Proposal Sending Form','2011-10-17 11:23:12','2011-10-17 11:23:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_sending_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Sending Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval\",\"formDefId\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Sending\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"notes\",\"cols\":\"20\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Notes\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}}]}',NULL),('dashboard',1,'user_approval','User Approval Form','2012-08-14 06:45:03','2012-08-14 06:45:03','user_registration','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"user_approval\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"user_registration\",\"name\":\"User Approval Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"elementUniqueKey\":\"493\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"registration\",\"readonlyLabel\":\"\",\"formDefId\":\"user_registration\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\",\"elementUniqueKey\":\"551\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"498\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"regex\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"elementUniqueKey\":\"494\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"readonlyLabel\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"mandatory\":\"true\",\"custom-regex\":\"\",\"type\":\"\"}},\"controlField\":\"\",\"label\":\"Status\",\"size\":\"\",\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"grouping\":\"\",\"value\":\"approved\",\"label\":\"Approved\"},{\"grouping\":\"\",\"value\":\"rejected\",\"label\":\"Rejected\"}],\"elementUniqueKey\":\"510\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"comments\",\"cols\":\"20\",\"readonlyLabel\":\"\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Comments\",\"readonly\":\"\",\"elementUniqueKey\":\"511\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"507\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"regex\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Approval Section\",\"elementUniqueKey\":\"501\"}}]}',NULL),('dashboard',1,'user_creation','User Creation Form','2012-08-14 06:45:03','2012-08-14 06:45:03','user_registration','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"user_creation\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"user_registration\",\"name\":\"User Creation Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"elementUniqueKey\":\"611\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"field2\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"User registration approved, please verify the user and login details below, and click on <b>Complete<\\/b> to finish the user registration process.\",\"label\":\"\",\"elementUniqueKey\":\"1859\"}},{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"field1\",\"readonlyLabel\":\"\",\"formDefId\":\"user_registration\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.plugin.enterprise.DirectoryUserFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\",\"elementUniqueKey\":\"1312\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"label\":\"Confirmation\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"regex\":\"\"}}]}',NULL),('dashboard',1,'user_registration','User Registration Form','2012-08-14 06:45:03','2012-08-14 06:45:03','user_registration','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"user_registration\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"user_registration\",\"name\":\"User Registration Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"elementUniqueKey\":\"129\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"firstName\",\"readonlyLabel\":\"\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"mandatory\":\"true\",\"custom-regex\":\"\",\"type\":\"\"}},\"value\":\"\",\"label\":\"First Name\",\"readonly\":\"\",\"elementUniqueKey\":\"142\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"lastName\",\"readonlyLabel\":\"\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Last Name\",\"readonly\":\"\",\"elementUniqueKey\":\"143\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"email\",\"readonlyLabel\":\"\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"mandatory\":\"true\",\"custom-regex\":\"\",\"type\":\"email\"}},\"value\":\"\",\"label\":\"Email\",\"readonly\":\"\",\"elementUniqueKey\":\"144\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"138\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"regex\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"User Details\",\"elementUniqueKey\":\"130\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"username\",\"readonlyLabel\":\"\",\"workflowVariable\":\"username\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.plugin.enterprise.DirectoryUserExistValidator\",\"properties\":{\"emptyMsg\":\"Invalid username.\",\"errorMsg\":\"Username already exists\"}},\"value\":\"\",\"label\":\"Desired Username\",\"readonly\":\"\",\"elementUniqueKey\":\"157\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.PasswordField\",\"properties\":{\"id\":\"password\",\"readonlyLabel\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"mandatory\":\"true\",\"custom-regex\":\"\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Password\",\"readonly\":\"\",\"elementUniqueKey\":\"158\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.PasswordField\",\"properties\":{\"id\":\"verify_password\",\"readonlyLabel\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.plugin.enterprise.EqualValueValidator\",\"properties\":{\"errorMsg\":\"Passwords do not match\",\"fieldId\":\"password\"}},\"value\":\"\",\"label\":\"Verify Password\",\"readonly\":\"\",\"elementUniqueKey\":\"159\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"active\",\"workflowVariable\":\"\",\"value\":\"1\",\"elementUniqueKey\":\"160\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"userRoles\",\"workflowVariable\":\"\",\"value\":\"ROLE_USER\",\"elementUniqueKey\":\"161\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"153\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"regex\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Login Details\",\"elementUniqueKey\":\"145\"}}]}',NULL),('hr_expense',1,'hr_expenses_approval_detail','HR Expenses Approval Detail','2012-08-14 06:45:32','2012-08-14 06:45:32','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expenses_approval_detail\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expenses Approval Detail\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"expenses_detail_form\",\"formDefId\":\"hr_expense_claim\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"label\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"approval_comments\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"hr_expenses_approval_entry\",\"foreignKey\":\"claim\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"approver\",\"label\":\"Approver\"},{\"value\":\"comment\",\"label\":\"Comment\"},{\"value\":\"dateCreated\",\"label\":\"Date\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"label\":\"Approval Comment(s)\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"readonly\":\"true\",\"multiple\":\"\",\"options\":[{\"value\":\"Verified\",\"label\":\"Verified\"},{\"value\":\"Finance Rejected\",\"label\":\"Rejected\"}],\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"finance_comments\",\"cols\":\"40\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Finance Comments\",\"readonly\":\"true\",\"rows\":\"8\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"label\":\"Finance Verification\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\"}}]}',NULL),('hr_expense',1,'hr_expenses_approval_entry','HR Expense Approval Entry','2012-08-14 06:45:32','2014-08-01 10:37:06','hr_expense_approval_entry','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expenses_approval_entry\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_approval_entry\",\"name\":\"HR Expense Approval Entry\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"claim\",\"workflowVariable\":\"\",\"value\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"username\",\"workflowVariable\":\"\",\"value\":\"#currentUser.username#\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"approver\",\"workflowVariable\":\"\",\"readonlyLabel\":\"true\",\"maxlength\":\"\",\"encryption\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"value\":\"#currentUser.firstName# #currentUser.lastName#\",\"label\":\"Approver\",\"readonly\":\"true\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"comment\",\"cols\":\"40\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Approver Comments\",\"readonly\":\"\",\"rows\":\"8\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}}]}',NULL),('hr_expense',1,'hr_expense_approval','HR Expense Approval Form','2012-08-14 06:45:32','2014-08-01 10:27:09','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_approval\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expense Approval Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"claim\",\"formDefId\":\"hr_expense_claim\",\"subFormParentId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Expense Claim\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Status\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"Approved\",\"label\":\"Approved\"},{\"value\":\"Resubmit\",\"label\":\"Resubmit\"},{\"value\":\"Rejected\",\"label\":\"Rejected\"}],\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval_form\",\"formDefId\":\"hr_expenses_approval_entry\",\"subFormParentId\":\"claim\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.BeanShellFormBinder\",\"properties\":{\"script\":\"import org.joget.apps.form.model.*;\\nreturn new FormRowSet();\"}},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"last_approval_record\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Approval\"}}]}',NULL),('hr_expense',1,'hr_expense_claim','HR Expense Claim Form','2012-08-14 06:45:32','2012-08-14 06:45:32','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_claim\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expense Claim Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"elementUniqueKey\":\"90536\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"expenses_detail\",\"formDefId\":\"hr_expense_new\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\",\"elementUniqueKey\":\"90543\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"90541\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"elementUniqueKey\":\"90537\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.plugin.enterprise.FormGrid\",\"properties\":{\"id\":\"entries\",\"formDefId\":\"hr_expense_claim_entry\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"hr_expense_claim_entry\",\"foreignKey\":\"claim\"}},\"submit-label-readonly\":\"Close\",\"submit-label-normal\":\"Submit\",\"storeBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"hr_expense_claim_entry\",\"foreignKey\":\"claim\"}},\"enableSorting\":\"\",\"label\":\"\",\"readonly\":\"\",\"options\":[{\"value\":\"date\",\"label\":\"Date\"},{\"value\":\"category\",\"label\":\"Category\"},{\"value\":\"purpose\",\"label\":\"Purpose\"},{\"value\":\"formattedAmount\",\"label\":\"Amount\"}],\"elementUniqueKey\":\"90623\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"90548\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Expenses Item(s)\",\"elementUniqueKey\":\"90544\"}},{\"elements\":[{\"elements\":[],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\",\"elementUniqueKey\":\"90556\"}},{\"elements\":[{\"className\":\"org.joget.plugin.enterprise.CalculationField\",\"properties\":{\"id\":\"total\",\"workflowVariable\":\"\",\"postfix\":\"\",\"useThousandSeparator\":\"true\",\"numOfDecimal\":\"2\",\"style\":\"us\",\"equation\":\"\",\"hidden\":\"\",\"prefix\":\"$\",\"label\":\"Total Amount\",\"variables\":[{\"operation\":\"sum\",\"variableName\":\"\",\"fieldId\":\"entries.formattedAmount\"}],\"elementUniqueKey\":\"90652\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\",\"elementUniqueKey\":\"90557\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"elementUniqueKey\":\"90551\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"receipt\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Receipt\",\"attachment\":\"true\",\"readonly\":\"\",\"size\":\"\",\"elementUniqueKey\":\"90566\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"90564\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section4\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"elementUniqueKey\":\"90560\"}}]}',NULL),('hr_expense',1,'hr_expense_claim_entry','HR Expense Claim Entry','2012-08-14 06:45:33','2012-08-14 06:45:33','hr_expense_claim_entry','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_claim_entry\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim_entry\",\"name\":\"HR Expense Claim Entry\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"elementUniqueKey\":\"90479\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"claim\",\"workflowVariable\":\"\",\"value\":\"\",\"elementUniqueKey\":\"90501\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"category\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Category\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"Medical\",\"label\":\"Medical\"},{\"value\":\"Mileage\",\"label\":\"Mileage\"},{\"value\":\"Entertainment\",\"label\":\"Entertainment\"},{\"value\":\"Travel Allowance\",\"label\":\"Travel Allowance\"}],\"size\":\"\",\"elementUniqueKey\":\"90502\"}},{\"className\":\"org.joget.apps.form.lib.DatePicker\",\"properties\":{\"id\":\"date\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Date\",\"format\":\"\",\"readonly\":\"\",\"elementUniqueKey\":\"90503\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"purpose\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Purpose\",\"readonly\":\"\",\"size\":\"\",\"elementUniqueKey\":\"90504\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"amount\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"numeric\"}},\"value\":\"\",\"label\":\"Amount\",\"readonly\":\"\",\"size\":\"\",\"elementUniqueKey\":\"90505\"}},{\"className\":\"org.joget.plugin.enterprise.CalculationField\",\"properties\":{\"id\":\"formattedAmount\",\"workflowVariable\":\"\",\"postfix\":\"\",\"useThousandSeparator\":\"true\",\"numOfDecimal\":\"2\",\"style\":\"us\",\"equation\":\"\",\"hidden\":\"true\",\"prefix\":\"$\",\"label\":\"Calculation Field\",\"variables\":[{\"operation\":\"sum\",\"variableName\":\"\",\"fieldId\":\"amount\"}],\"elementUniqueKey\":\"90507\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\",\"elementUniqueKey\":\"90494\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"General Expense Entry\",\"elementUniqueKey\":\"90480\"}}]}',NULL),('hr_expense',1,'hr_expense_finance','HR Expense Finance Form','2012-08-14 06:45:33','2012-08-14 06:45:33','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_finance\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"description\":\"\",\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expense Finance Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"expenses_form\",\"formDefId\":\"hr_expense_claim\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Status\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"Verified\",\"label\":\"Verified\"},{\"value\":\"Finance Rejected\",\"label\":\"Rejected\"}],\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"finance_comments\",\"cols\":\"40\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Finance Comments\",\"readonly\":\"\",\"rows\":\"8\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Verification\"}}]}',NULL),('hr_expense',1,'hr_expense_new','HR Expense New Claim Form','2012-08-14 06:45:33','2012-08-14 06:45:33','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_new\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expense New Claim Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.IdGeneratorField\",\"properties\":{\"id\":\"ref\",\"workflowVariable\":\"\",\"label\":\"Ref\",\"format\":\"REF-??????\",\"envVariable\":\"counter\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"title\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Title\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"claimant\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"#currentUser.firstName# #currentUser.lastName#\",\"label\":\"Submitted By\",\"readonly\":\"true\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"customhtml\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"<p>Note: The title should appear in this format, example, Jan 06<\\/p>\",\"label\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"username\",\"workflowVariable\":\"\",\"value\":\"#currentUser.username#\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"\",\"value\":\"New\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"label\":\"Expense Claim Details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\"}}]}',NULL),('hr_expense',1,'hr_expense_resubmit','HR Expense Claim Resubmission','2012-08-14 06:45:33','2012-08-14 06:45:33','hr_expense_claim','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"hr_expense_resubmit\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"hr_expense_claim\",\"name\":\"HR Expense Claim Resubmission\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"resubmit\",\"formDefId\":\"hr_expense_claim\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"label\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"approval_comments\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"hr_expenses_approval_entry\",\"foreignKey\":\"claim\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"approver\",\"label\":\"Approver\"},{\"value\":\"comment\",\"label\":\"Comment\"},{\"value\":\"dateCreated\",\"label\":\"Date\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Approval Comment(s)\"}}]}',NULL),('isr',1,'isr_new_request','ISR New Request','2012-08-14 06:45:54','2012-08-14 06:45:54','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_new_request\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_request\",\"name\":\"ISR New Request\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.IdGeneratorField\",\"properties\":{\"id\":\"ref_id\",\"workflowVariable\":\"\",\"label\":\"Ref Id\",\"format\":\"REF-??????\",\"envVariable\":\"counter\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"attention\",\"workflowVariable\":\"department\",\"optionsBinder\":{\"className\":\"org.joget.plugin.enterprise.DepartmentOptionsBinder\",\"properties\":{\"orgId\":\"\"}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Attention To\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[],\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"subject\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Subject\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"description\",\"cols\":\"40\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Description\",\"readonly\":\"\",\"rows\":\"5\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"priority\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Priority\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"Low\",\"label\":\"Low\"},{\"value\":\"Medium\",\"label\":\"Medium\"},{\"value\":\"High\",\"label\":\"High\"},{\"value\":\"Critical\",\"label\":\"Critical\"}],\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.DatePicker\",\"properties\":{\"id\":\"duedate\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Due Date\",\"format\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"attachment1\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Attachment 1\",\"attachment\":\"\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"attachment2\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Attachment 2\",\"attachment\":\"\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"attachment3\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Attachment 3\",\"attachment\":\"\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"\",\"value\":\"New\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"requester\",\"workflowVariable\":\"\",\"value\":\"#currentUser.username#\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"requester_name\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"#currentUser.firstName# #currentUser.lastName#\",\"label\":\"Requested By\",\"readonly\":\"true\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"department\",\"workflowVariable\":\"\",\"value\":\"#currentUser.department.id#\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"department_name\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"#currentUser.department.name#\",\"label\":\"Department\",\"readonly\":\"true\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"createdDate\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"#date.yyyy-MM-dd HH:mm:ss#\",\"label\":\"Requested Date\",\"readonly\":\"true\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Request Details\"}}]}',NULL),('isr',1,'isr_remark','ISR Remark','2012-08-14 06:45:54','2012-08-14 06:45:54','isr_remark','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_remark\",\"name\":\"ISR Remark\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"username\",\"workflowVariable\":\"\",\"value\":\"#currentUser.username#\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"name\",\"workflowVariable\":\"\",\"value\":\"#currentUser.firstName# #currentUser.lastName#\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"request_id\",\"workflowVariable\":\"\",\"value\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"remarks\",\"cols\":\"40\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Remarks\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}}]}',NULL),('isr',1,'isr_request_detail','ISR Request Detail','2012-08-14 06:45:54','2012-08-14 06:45:54','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_request_detail\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_request\",\"name\":\"ISR Request Detail\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"request_detail\",\"formDefId\":\"isr_new_request\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"\",\"maxlength\":\"\",\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"readonly\":\"true\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section4\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"status\",\"visibilityValue\":\"Assigned\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"remarks\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"isr_remark\",\"foreignKey\":\"request_id\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"name\",\"label\":\"Name\"},{\"value\":\"dateCreated\",\"label\":\"Date\"},{\"value\":\"remarks\",\"label\":\"Message\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Remarks\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"add_remarks\",\"formDefId\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"request_id\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"last_remark\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Add Remaks\"}}]}',NULL),('isr',1,'isr_resolve_assigned','ISR Resolve Assigned Request','2012-08-14 06:45:54','2012-08-14 06:45:54','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_resolve_assigned\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_request\",\"name\":\"ISR Resolve Assigned Request\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"request_detail\",\"formDefId\":\"isr_new_request\",\"subFormParentId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"Resolved\",\"label\":\"Resolved\"}]}},{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"add_remarks\",\"formDefId\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"request_id\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"Add Remarks\",\"parentSubFormId\":\"last_remark\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"remarks\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"isr_remark\",\"foreignKey\":\"request_id\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"name\",\"label\":\"Name\"},{\"value\":\"dateCreated\",\"label\":\"Date\"},{\"value\":\"remarks\",\"label\":\"Message\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Remarks\"}}]}',NULL),('isr',1,'isr_resolve_reopened','ISR Resolve Reopened','2012-08-14 06:45:54','2012-08-14 06:45:54','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_resolve_reopened\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_request\",\"name\":\"ISR Resolve Reopened\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"request_detail\",\"formDefId\":\"isr_new_request\",\"subFormParentId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"Resolved\",\"label\":\"Resolved\"},{\"value\":\"Assigned\",\"label\":\"Assign\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"assignee\",\"workflowVariable\":\"assignee\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.BeanShellFormBinder\",\"properties\":{\"script\":\"import org.joget.directory.model.*;\\nimport org.joget.apps.form.model.*;\\nimport org.joget.apps.app.service.AppUtil;\\nimport org.joget.apps.form.service.FormUtil;\\nimport org.joget.directory.model.service.ExtDirectoryManager;\\nimport org.springframework.context.ApplicationContext;\\n\\nApplicationContext ac = AppUtil.getApplicationContext();\\nExtDirectoryManager directoryManager = (ExtDirectoryManager) ac.getBean(\\\"directoryManager\\\");\\n\\nFormRowSet results = new FormRowSet();\\nresults.setMultiRow(true);\\n\\nCollection userList = directoryManager.getUsers(null, null, \\\"#variable.department#\\\", null, null, null, null, null, null, null, null);\\n\\nfor (User u : userList) {\\n    FormRow r = new FormRow();\\n    r.setProperty(FormUtil.PROPERTY_VALUE, u.getUsername());\\n    r.setProperty(FormUtil.PROPERTY_LABEL, u.getFirstName() + \\\" \\\" + u.getLastName() + \\\" (\\\" + u.getUsername() + \\\")\\\");\\n    results.add(r);\\n}\\n\\nreturn results;\"}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Assignee\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section4\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"status\",\"visibilityValue\":\"Assigned\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"add_remarks\",\"formDefId\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"request_id\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"Add Remarks\",\"parentSubFormId\":\"last_remark\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"remarks\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"isr_remark\",\"foreignKey\":\"request_id\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"name\",\"label\":\"Name\"},{\"value\":\"dateCreated\",\"label\":\"Date\"},{\"value\":\"remarks\",\"label\":\"Message\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Remarks\"}}]}',NULL),('isr',1,'isr_resolve_request','ISR Resolve Request','2012-08-14 06:45:55','2012-08-14 06:45:55','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_resolve_request\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"tableName\":\"isr_request\",\"description\":\"\",\"name\":\"ISR Resolve Request\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"field1\",\"formDefId\":\"isr_new_request\",\"subFormParentId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"Resolved\",\"label\":\"Resolve\"},{\"value\":\"Assigned\",\"label\":\"Assign \"},{\"value\":\"Rejected\",\"label\":\"Reject\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"assignee\",\"workflowVariable\":\"assignee\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.BeanShellFormBinder\",\"properties\":{\"script\":\"import org.joget.directory.model.*;\\nimport org.joget.apps.form.model.*;\\nimport org.joget.apps.app.service.AppUtil;\\nimport org.joget.apps.form.service.FormUtil;\\nimport org.joget.directory.model.service.ExtDirectoryManager;\\nimport org.springframework.context.ApplicationContext;\\n\\nApplicationContext ac = AppUtil.getApplicationContext();\\nExtDirectoryManager directoryManager = (ExtDirectoryManager) ac.getBean(\\\"directoryManager\\\");\\n\\nFormRowSet results = new FormRowSet();\\nresults.setMultiRow(true);\\n\\nCollection userList = directoryManager.getUsers(null, null, \\\"#variable.department#\\\", null, null, null, null, null, null, null, null);\\n\\nfor (User u : userList) {\\n    FormRow r = new FormRow();\\n    r.setProperty(FormUtil.PROPERTY_VALUE, u.getUsername());\\n    r.setProperty(FormUtil.PROPERTY_LABEL, u.getFirstName() + \\\" \\\" + u.getLastName() + \\\" (\\\" + u.getUsername() + \\\")\\\");\\n    results.add(r);\\n}\\n\\nreturn results;\"}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"Assignee\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"status\",\"visibilityValue\":\"Assigned\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"add_remarks\",\"formDefId\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"request_id\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"Add Remarks\",\"parentSubFormId\":\"last_remark\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section3\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}}]}',NULL),('isr',1,'isr_verify_resolved','ISR Verify Resolved Request','2012-08-14 06:45:55','2012-08-14 06:45:55','isr_request','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"isr_verify_resolved\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"isr_request\",\"name\":\"ISR Verify Resolved Request\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"request_detail\",\"formDefId\":\"isr_new_request\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"validator\":{\"className\":\"\",\"properties\":\"{}\"},\"value\":\"\",\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"Reopened\",\"label\":\"Reopen\"},{\"value\":\"Verified\",\"label\":\"Verified\"}]}},{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"add_remarks\",\"formDefId\":\"isr_remark\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"subFormParentId\":\"request_id\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":\"{}\"},\"label\":\"Add Remarks\",\"parentSubFormId\":\"last_remark\",\"readonly\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.Grid\",\"properties\":{\"id\":\"remarks\",\"loadBinder\":{\"className\":\"org.joget.plugin.enterprise.MultirowFormBinder\",\"properties\":{\"formDefId\":\"isr_remark\",\"foreignKey\":\"request_id\"}},\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"\",\"readonly\":\"true\",\"options\":[{\"value\":\"name\",\"label\":\"Name\"},{\"value\":\"dateCreated\",\"label\":\"Date\"},{\"value\":\"remarks\",\"label\":\"Message\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":\"{}\"},\"label\":\"Remarks\"}}]}',NULL);
/*!40000 ALTER TABLE `app_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_form_data_audit_trail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form_data_audit_trail` (
  `id` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` longtext,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_form_data_audit_trail`
--

LOCK TABLES `app_form_data_audit_trail` WRITE;
/*!40000 ALTER TABLE `app_form_data_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_form_data_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_message` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`appId`,`appVersion`,`ouid`),
  KEY `FKEE346FE9462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FKEE346FE9462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_message`
--

LOCK TABLES `app_message` WRITE;
/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package` (
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`packageId`,`packageVersion`),
  KEY `FK852EA428462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK852EA428462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package`
--

LOCK TABLES `app_package` WRITE;
/*!40000 ALTER TABLE `app_package` DISABLE KEYS */;
INSERT INTO `app_package` VALUES ('crm',1,'CRM','2011-10-17 11:23:13','2011-10-17 11:23:13','crm',1),('dashboard',1,'Dashboard','2012-08-14 06:45:06','2012-08-14 06:45:07','dashboard',1),('hr_expense',1,'HR Expenses Claim App','2012-08-14 06:45:34','2012-08-14 06:45:35','hr_expense',1),('isr',1,'Internal Service Request','2012-08-14 06:45:56','2012-08-14 06:45:57','isr',1);
/*!40000 ALTER TABLE `app_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_activity_form`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_form` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `formUrl` varchar(255) DEFAULT NULL,
  `formIFrameStyle` varchar(255) DEFAULT NULL,
  `autoContinue` bit(1) DEFAULT NULL,
  `disableSaveAsDraft` bit(1) DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKA8D741D5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKA8D741D5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_activity_form`
--

LOCK TABLES `app_package_activity_form` WRITE;
/*!40000 ALTER TABLE `app_package_activity_form` DISABLE KEYS */;
INSERT INTO `app_package_activity_form` VALUES ('isr','assign_request','isr',1,'isr::assign_request','SINGLE','isr_assign_request',NULL,NULL,'\0',NULL),('isr','resolve_assigned_request','isr',1,'isr::resolve_assigned_request','SINGLE','isr_resolve_assigned',NULL,NULL,'\0',NULL),('isr','resolve_reopened_request','isr',1,'isr::resolve_reopened_request','SINGLE','isr_resolve_reopened',NULL,NULL,'\0',NULL),('isr','resolve_request','isr',1,'isr::resolve_request','SINGLE','isr_resolve_request',NULL,NULL,'\0',NULL),('isr','runProcess','isr',1,'isr::runProcess','SINGLE','isr_new_request',NULL,NULL,'\0',NULL),('isr','verifiy_resolved_request','isr',1,'isr::verifiy_resolved_request','SINGLE','isr_verify_resolved',NULL,NULL,'\0',NULL),('process1','activity1','crm',1,'process1::activity1','SINGLE','crm_proposal_resubmit_form',NULL,NULL,'',NULL),('process1','activity1','dashboard',1,'process1::activity1','SINGLE','user_approval',NULL,NULL,'',NULL),('process1','activity2','dashboard',1,'process1::activity2','SINGLE','user_creation',NULL,NULL,'',NULL),('process1','approve_claim','hr_expense',1,'process1::approve_claim','SINGLE','hr_expense_approval',NULL,NULL,'\0',NULL),('process1','approve_proposal','crm',1,'process1::approve_proposal','SINGLE','crm_proposal_approval_form',NULL,NULL,'',NULL),('process1','new_claim','hr_expense',1,'process1::new_claim','SINGLE','hr_expense_claim',NULL,NULL,'',NULL),('process1','resubmit_claim','hr_expense',1,'process1::resubmit_claim','SINGLE','hr_expense_resubmit',NULL,NULL,'\0',NULL),('process1','runProcess','crm',1,'process1::runProcess','SINGLE','crm_proposal_form',NULL,NULL,'',NULL),('process1','runProcess','dashboard',1,'process1::runProcess','SINGLE','user_registration',NULL,NULL,'',NULL),('process1','runProcess','hr_expense',1,'process1::runProcess','SINGLE','hr_expense_new',NULL,NULL,'',NULL),('process1','send_proposal','crm',1,'process1::send_proposal','SINGLE','crm_proposal_sending_form',NULL,NULL,'',NULL),('process1','submit_proposal','crm',1,'process1::submit_proposal','SINGLE','crm_proposal_form',NULL,NULL,'',NULL),('process1','verify_claim','hr_expense',1,'process1::verify_claim','SINGLE','hr_expense_finance',NULL,NULL,'\0',NULL);
/*!40000 ALTER TABLE `app_package_activity_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_activity_plugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_plugin` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKADE8644C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKADE8644C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_activity_plugin`
--

LOCK TABLES `app_package_activity_plugin` WRITE;
/*!40000 ALTER TABLE `app_package_activity_plugin` DISABLE KEYS */;
INSERT INTO `app_package_activity_plugin` VALUES ('process1','tool1','crm',1,'process1::tool1','org.joget.apps.app.lib.EmailTool','{\"host\":\"mailserver\",\"port\":\"25\",\"needAuthentication\":\"\",\"username\":\"\",\"password\":\"\",\"from\":\"email@domain\",\"toSpecific\":\"#performer.runProcess.email#\",\"toParticipantId\":\"\",\"cc\":\"\",\"subject\":\"Proposal Approved: #form.crm_proposal.title#\",\"message\":\"Proposal Approved\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\\n\"}'),('process1','tool2','crm',1,'process1::tool2','org.joget.apps.app.lib.EmailTool','{\"host\":\"localhost\",\"port\":\"25\",\"needAuthentication\":\"\",\"username\":\"\",\"password\":\"\",\"from\":\"email@domain\",\"toSpecific\":\"#performer.runProcess.email#\",\"toParticipantId\":\"\",\"cc\":\"\",\"subject\":\"Proposal Rejected: #form.crm_proposal.title#\",\"message\":\"Proposal Rejected\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\\n\"}'),('process1','tool2','dashboard',1,'process1::tool2','org.joget.apps.app.lib.EmailTool','{\"host\":\"\",\"port\":\"\",\"needAuthentication\":\"\",\"username\":\"\",\"password\":\"\",\"from\":\"\",\"toSpecific\":\"#form.user_registration.email#\",\"toParticipantId\":\"\",\"cc\":\"\",\"subject\":\"User Registration Rejected: #form.user_registration.username#\",\"message\":\"This is to inform you that the user registration for \\\"#form.user_registration.username#\\\" has been rejected.\\n\\nThis is a system generated message.\\n\"}'),('process1','tool3','dashboard',1,'process1::tool3','org.joget.apps.app.lib.EmailTool','{\"host\":\"\",\"port\":\"\",\"needAuthentication\":\"\",\"username\":\"\",\"password\":\"\",\"from\":\"\",\"toSpecific\":\"#form.user_registration.email#\",\"toParticipantId\":\"\",\"cc\":\"\",\"subject\":\"User Registration Approved: #form.user_registration.username#\",\"message\":\"This is to inform you that the user registration for \\\"#form.user_registration.username#\\\" has been approved. \\n\\nLogin Details\\n=============\\nUsername: #form.user_registration.username#\\nPassword: #form.user_registration.password#\\n\\nThis is a system generated message.\"}'),('process1','tool4','hr_expense',1,'process1::tool4','org.joget.plugin.enterprise.FormDataUpdateTool','{\"formDefId\":\"hr_expense_new\",\"fields\":[{\"field\":\"status\",\"value\":\"Submitted\"}]}');
/*!40000 ALTER TABLE `app_package_activity_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_participant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_participant` (
  `processDefId` varchar(255) NOT NULL,
  `participantId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` text,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`participantId`,`packageId`,`packageVersion`),
  KEY `FK6D7BF59C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FK6D7BF59C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_participant`
--

LOCK TABLES `app_package_participant` WRITE;
/*!40000 ALTER TABLE `app_package_participant` DISABLE KEYS */;
INSERT INTO `app_package_participant` VALUES ('isr','applicant','isr',1,'isr::applicant','requester','runProcess',NULL),('isr','assignee','isr',1,'isr::assignee','workflowVariable','assignee,user',NULL),('isr','hod','isr',1,'isr::hod','workflowVariable','department,hod',NULL),('isr','requester','isr',1,'isr::requester','requester','runProcess',NULL),('process1','approver','dashboard',1,'process1::approver','user','admin',NULL),('process1','approver','hr_expense',1,'process1::approver','requesterHod','runProcess',NULL),('process1','claimant','hr_expense',1,'process1::claimant','requester','runProcess',NULL),('process1','finance','hr_expense',1,'process1::finance','user','admin',NULL);
/*!40000 ALTER TABLE `app_package_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plugin_default`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plugin_default` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginDescription` text,
  `pluginProperties` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK7A835713462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK7A835713462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plugin_default`
--

LOCK TABLES `app_plugin_default` WRITE;
/*!40000 ALTER TABLE `app_plugin_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plugin_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity` (
  `uuid` varchar(255) NOT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK5E33D79C918F93D` (`processUid`),
  CONSTRAINT `FK5E33D79C918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_activity`
--

LOCK TABLES `app_report_activity` WRITE;
/*!40000 ALTER TABLE `app_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_activity_instance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity_instance` (
  `instanceId` varchar(255) NOT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `due` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromCreatedTime` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `activityUid` varchar(255) DEFAULT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK9C6ABDD8B06E2043` (`activityUid`),
  KEY `FK9C6ABDD8D4610A90` (`processInstanceId`),
  CONSTRAINT `FK9C6ABDD8B06E2043` FOREIGN KEY (`activityUid`) REFERENCES `app_report_activity` (`uuid`),
  CONSTRAINT `FK9C6ABDD8D4610A90` FOREIGN KEY (`processInstanceId`) REFERENCES `app_report_process_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_activity_instance`
--

LOCK TABLES `app_report_activity_instance` WRITE;
/*!40000 ALTER TABLE `app_report_activity_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_app`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_app` (
  `uuid` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `appName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_app`
--

LOCK TABLES `app_report_app` WRITE;
/*!40000 ALTER TABLE `app_report_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_package` (
  `uuid` varchar(255) NOT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  `packageVersion` varchar(255) DEFAULT NULL,
  `appUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKBD580A19E475ABC` (`appUid`),
  CONSTRAINT `FKBD580A19E475ABC` FOREIGN KEY (`appUid`) REFERENCES `app_report_app` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_package`
--

LOCK TABLES `app_report_package` WRITE;
/*!40000 ALTER TABLE `app_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_process`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process` (
  `uuid` varchar(255) NOT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `packageUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKDAFFF442D40695DD` (`packageUid`),
  CONSTRAINT `FKDAFFF442D40695DD` FOREIGN KEY (`packageUid`) REFERENCES `app_report_package` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_process`
--

LOCK TABLES `app_report_process` WRITE;
/*!40000 ALTER TABLE `app_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_process_instance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process_instance` (
  `instanceId` varchar(255) NOT NULL,
  `requester` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK351D7BF2918F93D` (`processUid`),
  CONSTRAINT `FK351D7BF2918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_process_instance`
--

LOCK TABLES `app_report_process_instance` WRITE;
/*!40000 ALTER TABLE `app_report_process_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_userview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_userview` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FKE411D54E462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FKE411D54E462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_userview`
--

LOCK TABLES `app_userview` WRITE;
/*!40000 ALTER TABLE `app_userview` DISABLE KEYS */;
INSERT INTO `app_userview` VALUES ('crm',1,'crm_userview_sales','CRM: Sales Force Automation',NULL,'{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"crm_userview_sales\",\"name\":\"CRM: Sales Force Automation\",\"description\":\"\",\"welcomeMessage\":\"Sales Force Automation\",\"logoutText\":\"Logout\",\"footerMessage\":\"Powered by Joget\"},\"layout\":{\"className\":\"org.joget.apps.userview.model.UserviewLayout\",\"properties\":{\"customHeader\":\"\",\"customFooter\":\"\",\"beforeMenu\":\"\",\"afterMenu\":\"\",\"theme\":{\"className\":\"org.joget.apps.userview.lib.DefaultTheme\",\"properties\":{\"css\":\"\",\"js\":\"\"}}}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-9BE91A55FAAC4B5098841EA9E1994BE6\",\"label\":\"Home\",\"hide\":\"\",\"permission\":{\"className\":\"\",\"properties\":{\"allowedGroupIds\":\"\"}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"welcome\",\"customId\":\"welcome\",\"label\":\"Welcome\",\"content\":\"<div id=\\\"left_content\\\">\\n<div style=\\\"float: left; width: 400px; margin-right: 10px;\\\">\\n<h4 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\\\">More Leads, More Sales, More Customers<\\/h4>\\n<h1 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\\\"><span style=\\\"font-size: large;\\\"><strong>Business CRM<\\/strong><\\/span><\\/h1>\\n<p style=\\\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\\\">CRM helps your business communicate with prospects, share sales information, close deals and keep customers happy.<img src=\\\"http:\\/\\/www.joget.org\\/images\\/demo\\/phone_pad.png\\\" alt=\\\"\\\" width=\\\"382\\\" height=\\\"302\\\" \\/><\\/p>\\n<\\/div>\\n<\\/div>\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-7650DEEFC4CC4332AC25871B65BBDD48\",\"label\":\"Accounts\",\"hide\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"384344BD3E2946D097C6F5F17540C377\",\"customId\":\"account_list\",\"label\":\"Account List\",\"datalistId\":\"crm_account_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"account_form\",\"customId\":\"account_new\",\"label\":\"New Account\",\"formId\":\"crm_account\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"messageShowAfterComplete\":\"Account Updated\",\"redirectUrlAfterComplete\":\"account_list\",\"redirectUrlOnCancel\":\"account_list\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-E77D2050680D4DB0A85A5C0C3AC1C083\",\"label\":\"Contacts\",\"hide\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"D86B740C970C4B08B4D5CCD3DC0E9503\",\"customId\":\"contact_list\",\"label\":\"Contact List\",\"datalistId\":\"crm_contact_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"contact-form\",\"customId\":\"contact_new\",\"label\":\"New Contact\",\"formId\":\"crm_contact\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"contact_list\",\"redirectUrlOnCancel\":\"contact_list\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-A12DBDB14B4447A984E6095B77F28B42\",\"label\":\"Opportunities\",\"hide\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"A074397ABEA94CF78E2E8FA0843AB97B\",\"customId\":\"opportunity_list\",\"label\":\"Opportunity List\",\"datalistId\":\"crm_opportunity_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"0C7E36768A2F46BB945CEC50E62E0BE8\",\"customId\":\"opportunity_new\",\"label\":\"New Opportunity\",\"formId\":\"crm_opportunity\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"messageShowAfterComplete\":\"OK\",\"redirectUrlAfterComplete\":\"opportunity_list\",\"redirectUrlOnCancel\":\"opportunity_list\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-78EC0B8A1E8E483A93770714BB0D6F6E\",\"label\":\"Proposal Process\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.InboxMenu\",\"properties\":{\"id\":\"AA1445B29D904408B3F2B1B36E469E16\",\"customId\":\"workflow_inbox\",\"label\":\"Task Inbox\",\"appFilter\":\"all\",\"processId\":\"\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.apps.userview.lib.RunProcess\",\"properties\":{\"id\":\"2D27B3875F234315A7A3562BD0E35AB2\",\"customId\":\"proposal_process\",\"label\":\"New Proposal Approval\",\"processDefId\":\"process1\",\"runProcessDirectly\":\"Yes\",\"showInPopupDialog\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"\",\"keyName\":\"\"}}]}],\"setting\":{\"className\":\"org.joget.apps.userview.model.UserviewSetting\",\"properties\":{\"theme\":{\"className\":\"org.joget.apps.userview.lib.DefaultTheme\",\"properties\":{\"css\":\"\",\"js\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"pageTop\":\"\",\"pageBottom\":\"\",\"beforeContent\":\"\"}},\"permission\":{\"className\":\"\",\"properties\":{}}}}}','2011-10-17 11:23:12','2011-10-17 11:23:12'),('dashboard',1,'home','Employee Services Portal','Center for Employee Self Service','{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"home\",\"name\":\"Employee Services Portal\",\"description\":\"Center for Employee Self Service\",\"welcomeMessage\":\"#date.EEE, d MMM yyyy#\",\"logoutText\":\"Logout\",\"footerMessage\":\"Powered by Joget\"},\"setting\":{\"properties\":{\"theme\":{\"className\":\"org.joget.plugin.enterprise.CorporatiTheme\",\"properties\":{\"colorScheme\":\"silver\",\"cssUrl\":\"\\/home\\/landing\\/css\\/landing.css\",\"css\":\"\",\"js\":\"\",\"customHeader\":\"\",\"customBanner\":\"\"}},\"permission\":{\"className\":\"\",\"properties\":{}},\"loginPageTop\":\"\",\"loginPageBottom\":\"\"}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-F67068B033654C1D83A7E5A2D0567C37\",\"label\":\"Home\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"6A8979EEB21941BC80C87BB54D329BF8\",\"customId\":\"welcome\",\"label\":\"Welcome\",\"content\":\"<div id=\\\"landing\\\">\\n<div id=\\\"landing-title\\\">Welcome to the Employee Services Portal<\\/div>\\n<div id=\\\"container\\\">\\n<div id=\\\"slides\\\">\\n<div class=\\\"slides_container\\\"><img src=\\\"\\/jw\\/home\\/landing\\/images\\/slider_01.png\\\" alt=\\\"Slide 1\\\" width=\\\"639\\\" height=\\\"296\\\" \\/> <img src=\\\"\\/jw\\/home\\/landing\\/images\\/slider_02.png\\\" alt=\\\"Slide 2\\\" width=\\\"639\\\" height=\\\"296\\\" \\/> <img src=\\\"\\/jw\\/home\\/landing\\/images\\/slider_03.png\\\" alt=\\\"Slide 3\\\" width=\\\"639\\\" height=\\\"296\\\" \\/><\\/div>\\n<\\/div>\\n<\\/div>\\n<script src=\\\"\\/jw\\/home\\/landing\\/js\\/jquery.easing.1.3.js\\\" type=\\\"text\\/javascript\\\"><\\/script>\\n<script src=\\\"\\/jw\\/home\\/landing\\/js\\/slides.min.jquery.js\\\" type=\\\"text\\/javascript\\\"><\\/script>\\n<script src=\\\"\\/jw\\/home\\/landing\\/js\\/jquery.simplyscroll.min.js\\\" type=\\\"text\\/javascript\\\"><\\/script>\\n<script type=\\\"text\\/javascript\\\">\\/\\/ <![CDATA[\\n        $(function(){\\n            $(\'#slides\').slides({\\n                preload: true,\\n                preloadImage: \'images\\/loading.gif\',\\n                play: 5000,\\n                pause: 2500,\\n                hoverPause: false\\n            });\\n        });\\n        (function($) {\\n            $(function() {\\n                $(\\\"#scroller\\\").simplyScroll({\\n                    autoMode: \'loop\'\\n                });\\n            });\\n        })(jQuery);\\n\\/\\/ ]]><\\/script>\\n<!--\\n<div id=\\\"landing-splash\\\">\\n<div id=\\\"landing-splash-title\\\">Amazing Efficiency<\\/div>\\n<div id=\\\"landing-splash-subtitle\\\">Get things done right with workflow<\\/div>\\n&nbsp;<\\/div>\\n-->\\n<div id=\\\"landing-banner\\\">Fast, efficient online service for your needs<\\/div>\\n<div id=\\\"landing-table\\\">\\n<div class=\\\"landing-column\\\">\\n<div class=\\\"landing-column-bg\\\">\\n<h2>Published Apps<\\/h2>\\n<ul id=\\\"published-apps\\\" class=\\\"landing-ul\\\">\\n<li>\\n<h3>General Services<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li> <a href=\\\"#\\\"> <span class=\\\"landing-li-title\\\">Internal Service Request<\\/span> <span class=\\\"landing-li-description\\\">Make and track requests between departments<\\/span> <\\/a> <\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<h3>HR Apps<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li> <a href=\\\"#\\\"> <span class=\\\"landing-li-title\\\">HR Expenses Claims App<\\/span> <span class=\\\"landing-li-description\\\">Request and track expenses<\\/span> <\\/a> <\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<h3>Purchasing<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li> <a href=\\\"#\\\"> <span class=\\\"landing-li-title\\\">Purchase Requisition App<\\/span> <span class=\\\"landing-li-description\\\">Request and track purchases<\\/span> <\\/a> <\\/li>\\n<\\/ul>\\n<\\/li>\\n<\\/ul>\\n<\\/div>\\n<div id=\\\"my-inbox\\\">\\n<h2>My Inbox<\\/h2>\\n<div id=\\\"inbox1\\\"><img src=\\\"\\/jw\\/images\\/v3\\/portlet_loading.gif\\\" alt=\\\"\\\" \\/><\\/div>\\n<script type=\\\"text\\/javascript\\\">\\/\\/ <![CDATA[\\n                    $(document).ready(function(){ $.getScript(\'\\/jw\\/web\\/js\\/client\\/inbox.js?id=1&rows=5&divId=inbox1\',null); });\\n\\/\\/ ]]><\\/script>\\n<\\/div>\\n<\\/div>\\n<div class=\\\"landing-column\\\">\\n<div id=\\\"landing-col-image\\\">&nbsp;<\\/div>\\n<h2>Announcements<\\/h2>\\n<ul class=\\\"landing-ul\\\">\\n<li>\\n<h3>New Services Published<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li>New services are now available from the published apps on the left.<\\/li>\\n<li>Make requests, approvals and statuses at your convenience<\\/li>\\n<\\/ul>\\n<\\/li>\\n<\\/ul>\\n<div id=\\\"landing-col-image\\\">&nbsp;<\\/div>\\n<h2>Why Use This Portal?<\\/h2>\\n<ul class=\\\"landing-ul\\\">\\n<li>\\n<h3>Improve Communications<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li>Improve communications within the organization<\\/li>\\n<li>Foster better collaboration and efficiency<\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<h3>Reduce Costs<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li>Increase productivity<\\/li>\\n<li>Minimize paperwork and reduce operational costs<\\/li>\\n<\\/ul>\\n<\\/li>\\n<\\/ul>\\n<div id=\\\"landing-col-image\\\">&nbsp;<\\/div>\\n<h2>How This Portal Works<\\/h2>\\n<ul class=\\\"landing-ul\\\">\\n<li>\\n<h3>Self-Service Apps<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li>Login using your account<\\/li>\\n<li>Access the published apps to manage your requests and information<\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<h3>Workflow Inbox and Pending Tasks<\\/h3>\\n<ul class=\\\"landing-ul2\\\">\\n<li>Manage your task inbox<\\/li>\\n<li>Get notified of pending tasks<\\/li>\\n<li>Participate in workflow processes<\\/li>\\n<\\/ul>\\n<\\/li>\\n<\\/ul>\\n<\\/div>\\n<\\/div>\\n<\\/div>\\n<script type=\\\"text\\/javascript\\\">\\/\\/ <![CDATA[\\n    function loadApps() {\\n        \\/\\/ show loading icon\\n        $(\\\"#published-apps\\\").empty();\\n        var loading = $(\'<div id=\\\"apps-loading\\\"><img src=\\\"\\/jw\\/images\\/v3\\/portlet_loading.gif\\\" \\/><\\/div>\');\\n        $(\\\"#published-apps\\\").append(loading);\\n                                    \\n        \\/\\/ load JSON\\n        $.ajax({ \\n            url : \\\"\\/jw\\/web\\/json\\/apps\\/published\\/userviews\\\",\\n            dataType:\'jsonp\',\\n            success:function(data) {\\n                var content = \\\"\\\";\\n                var apps = data.apps;\\n                for( var i=0; i<apps.length; i++) {\\n                    \\/\\/ add app\\n                    var app = apps[i];\\n                    content += \'<li><h3>\' + app.name + \'<\\/h3><ul class=\\\"landing-ul2\\\">\';\\n                    \\/\\/ add userviews\\n                    var userviews = apps[i].userviews;\\n                    for( var j=0; j<userviews.length; j++){\\n                        var uv = userviews[j];\\n                        content += \'<li><a target=\\\"_blank\\\" href=\\\"\' + uv.url + \'\\\">\\\\\\n                                                        <span class=\\\"landing-li-title\\\">\' + uv.name + \'<\\/span>\\\\\\n                                                        <\\/a><\\/li>\';\\n                    }\\n                    content += \\\"<\\/ul>\\\";\\n                }\\n\\n                \\/\\/ show apps, hide loading icon\\n                $(loading).remove();\\n                $(\\\"#published-apps\\\").append($(content));\\n            }\\n        });\\n                                    \\n                                    \\n    }\\n    $(document).ready(loadApps);\\n\\/\\/ ]]><\\/script>\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-8300FFD168AC4A218781A9810D72F50B\",\"label\":\"Registration\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.plugin.enterprise.AnonymousUserviewPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.RunProcess\",\"properties\":{\"id\":\"D06EC51AA6B948718E4DAC615D434100\",\"customId\":\"registration\",\"label\":\"Register New User\",\"processDefId\":\"process1\",\"runProcessDirectly\":\"Yes\",\"showInPopupDialog\":\"Yes\",\"messageShowAfterComplete\":\"Thank you for your registration. You will receive a confirmation after approval.\\n\",\"redirectUrlAfterComplete\":\"\",\"keyName\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-1819E98628A94E23BFEDEE83FB1CB521\",\"label\":\"Inbox and Profile\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.UniversalInboxMenu\",\"properties\":{\"id\":\"12DD012EDB4F40C3BE20E234E07FB7E8\",\"customId\":\"myinbox\",\"label\":\"My Inbox\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.UserProfileMenu\",\"properties\":{\"id\":\"BA78D67C07034D6BB9C11C09AF52D8FF\",\"customId\":\"myprofile\",\"label\":\"My Profile\",\"showInPopupDialog\":\"Yes\",\"message\":\"Profile Updated\",\"redirectURL\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-02E30C12872748C39B76E323540CC888\",\"label\":\"Administration\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.plugin.enterprise.AdminUserviewPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.Link\",\"properties\":{\"id\":\"08731982435046A2BFA0DCC94CC583EE\",\"customId\":\"console\",\"label\":\"Web Console\",\"url\":\"\\/jw\\/web\\/console\\/home\",\"target\":\"blank\"}},{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"97CBD6A3C5DF47C983A70DCDD4117D52\",\"customId\":\"user_approval\",\"label\":\"User Registration Approval\",\"datalistId\":\"user_list\",\"appFilter\":\"process\",\"processId\":\"process1\",\"activityDefId\":\"\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}}]}]}','2012-08-14 06:45:03','2012-08-14 06:45:03'),('hr_expense',1,'hr_expense_userview','HR Expenses Claim App','','{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"hr_expense_userview\",\"name\":\"HR Expenses Claim App\",\"description\":\"\",\"welcomeMessage\":\"#date.EEE, d MMM yyyy#\",\"logoutText\":\"Logout\",\"footerMessage\":\"Powered by Joget\"},\"setting\":{\"properties\":{\"theme\":{\"className\":\"org.joget.plugin.enterprise.EnterpriseTheme\",\"properties\":{\"customHeader\":\"\",\"customFooter\":\"\",\"customBanner\":\"\",\"css\":\".menu-link span.rowCount {\\n    margin-left: 0px;\\n}\\n#welcome-body {\\n    width: 80%;\\n    height: 230px;\\n    background: #1BB6CA; \\/* for non-css3 browsers *\\/\\n    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#037987\', endColorstr=\'#1BB6CA\'); \\/* for IE *\\/\\n    background: -webkit-gradient(linear, left top, left bottom, from(#037987), to(#1BB6CA)); \\/* for webkit browsers *\\/\\n    background: -moz-linear-gradient(top,  #037987,  #1BB6CA); \\/* for firefox 3.6+ *\\/ \\n    padding: 20px;\\n    text-align: center;\\n    font-family: \\\"Trebuchet MS\\\", sans-serif ;\\n    font-size: 24px;\\n    color: white;\\n    margin-top: 10px;\\n    margin-bottom: 50px;\\n}\\n#welcome-heading2 {\\n    font-size: 28px;\\n    font-weight: bold;\\n}\\n#welcome-link {\\n    margin-top: 30px;\\n    margin-left: auto;\\n    margin-right: auto;\\n    padding: 8px 0px;\\n    background: #F8B708; \\/* for non-css3 browsers *\\/\\n    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#F8B708\', endColorstr=\'#FCE29A\'); \\/* for IE *\\/\\n    background: -webkit-gradient(linear, left top, left bottom, from(#F8B708), to(#FCE29A)); \\/* for webkit browsers *\\/\\n    background: -moz-linear-gradient(top,  #F8B708, #FCE29A); \\/* for firefox 3.6+ *\\/ \\n    -moz-border-radius: 10px;\\n    -webkit-border-radius: 10px;\\n    width: 190px;\\n}\\n#welcome-link a {\\n    font-size: 16px;\\n    text-decoration: none;\\n    padding-left: 20px;\\n    padding-right: 20px;\\n    color: black;\\n}\\n#welcome-image {\\n    margin-bottom: 20px;\\n}\",\"js\":\"\"}},\"permission\":{\"className\":\"\",\"properties\":{}}}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-C0E19762E8EA43E5A24B48CB1184C7FA\",\"label\":\"Welcome\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"982F8EC8C44043519AF0762BDDDC47B1\",\"customId\":\"home\",\"label\":\"Welcome\",\"content\":\"<div>\\n<p><strong><span>Welcome to MyCompanyName<\\/span><\\/strong><\\/p>\\n<p>This is a HR Expenses Claim app that will allow users to make expenses claims that goes through an approval cycle.<\\/p>\\n<\\/div>\\n<div id=\\\"welcome-body\\\">\\n<div><img src=\\\"http:\\/\\/www.joget.org\\/wp-content\\/uploads\\/2012\\/02\\/hr_expense-app.jpg\\\" alt=\\\"\\\" width=\\\"600\\\" height=\\\"287\\\" \\/><\\/div>\\n<\\/div>\\n<div>\\n<p>In this app, the Claimant can submit a New Expenses Claim. The claim will be routed to the Manager for approval followed by Finance.<\\/p>\\n<p>You will need to login before you can use the system.<\\/p>\\n<p>Participants in this process:<\\/p>\\n<ul>\\n<li>cat (Claimant)<\\/li>\\n<li>clark (Manager)<\\/li>\\n<li>admin (Finance)<\\/li>\\n<\\/ul>\\n<p>LOGIN with \\\"cat\\\" to start the Expenses Claim Process.<\\/p>\\n<p>&nbsp;<\\/p>\\n<\\/div>\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-36229EE7504B4413B491C0B6A25A973C\",\"label\":\"New Claim\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.RunProcess\",\"properties\":{\"id\":\"E43B1F0FE5094C7E808197F460A89C32\",\"customId\":\"new_claim\",\"label\":\"New Expenses Claim\",\"processDefId\":\"process1\",\"runProcessDirectly\":\"Yes\",\"showInPopupDialog\":\"\",\"messageShowAfterComplete\":\"Your expenses claim added.\",\"redirectUrlAfterComplete\":\"draft\",\"keyName\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-D62FA2A3376D4AB5B827BA57DB24B07A\",\"label\":\"Personal Expenses\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"5C43A5E8964143819280EADC413A1E24\",\"customId\":\"resubmit\",\"label\":\"Resubmission\",\"datalistId\":\"hr_expense_resubmit\",\"appFilter\":\"activity\",\"processId\":\"process1\",\"activityDefId\":\"resubmit_claim\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"CDA93E76489F400DA51DA8FD4ABF2A9B\",\"customId\":\"draft\",\"label\":\"Draft\",\"datalistId\":\"hr_expense_draft\",\"appFilter\":\"activity\",\"processId\":\"process1\",\"activityDefId\":\"new_claim\",\"rowCount\":\"true\",\"showDetail\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\",\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"75631E9B45DB4A41B53990DA89D8FAA3\",\"customId\":\"submitted\",\"label\":\"Submitted\",\"datalistId\":\"hr_expenses_submitted\",\"addFormId\":\"\",\"editFormId\":\"hr_expense_claim\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"yes\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"D83AC226AF0942A38871615635486253\",\"customId\":\"approved\",\"label\":\"Approved\",\"datalistId\":\"hr_expenses_approved\",\"addFormId\":\"\",\"editFormId\":\"hr_expense_resubmit\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"yes\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"029A00A017D343628FC97587B8877E70\",\"customId\":\"rejected\",\"label\":\"Rejected\",\"datalistId\":\"hr_expenses_rejected\",\"addFormId\":\"\",\"editFormId\":\"hr_expenses_approval_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"yes\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"69E90E0E603A4FD9B44EF9E701E11413\",\"customId\":\"closed\",\"label\":\"Closed\",\"datalistId\":\"hr_expenses_closed\",\"addFormId\":\"\",\"editFormId\":\"hr_expenses_approval_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"yes\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-C38AC98F3B144C5893891D41D5803FC9\",\"label\":\"Approver Task List\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"09AF19D0E3F14019BFBE5AD5BB41E2E6\",\"customId\":\"inbox\",\"label\":\"Approver Inbox\",\"datalistId\":\"hr_expense_list\",\"appFilter\":\"activity\",\"processId\":\"process1\",\"activityDefId\":\"approve_claim\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-B104E29437A44152958C4A59A8581D1F\",\"label\":\"Finance Department\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.plugin.enterprise.AdminUserviewPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"2C6656A448B34BB6A26F7CCAD0AFCE00\",\"customId\":\"finance\",\"label\":\"Claims Listing\",\"datalistId\":\"hr_expense_list\",\"appFilter\":\"activity\",\"processId\":\"process1\",\"activityDefId\":\"verify_claim\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"7BF1DCB4AB9349B18388E97765030DEE\",\"customId\":\"finance_all\",\"label\":\"Closed Expenses\",\"datalistId\":\"hr_expenses_finance\",\"addFormId\":\"\",\"editFormId\":\"hr_expenses_approval_detail\",\"rowCount\":\"\",\"buttonPosition\":\"bottomLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"yes\",\"edit-readonlyLabel\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}}]}]}','2012-08-14 06:45:33','2014-08-01 10:39:12'),('isr',1,'isr','Internal Service Request App','','{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"isr\",\"name\":\"Internal Service Request App\",\"description\":\"\",\"welcomeMessage\":\"#date.EEE, d MMM yyyy#\",\"logoutText\":\"Logout\",\"footerMessage\":\"Powered by Joget\"},\"setting\":{\"properties\":{\"theme\":{\"className\":\"org.joget.apps.userview.lib.DefaultTheme\",\"properties\":{\"css\":\"\",\"js\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"pageTop\":\"\",\"pageBottom\":\"\",\"beforeContent\":\"\"}},\"permission\":{\"className\":\"\",\"properties\":{}}}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-9D565CC4CF9346E99BECBC413AE06018\",\"label\":\"Home\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"5ECB552FB8AA48F2AE35980233EFE6D7\",\"customId\":\"home\",\"label\":\"Welcome\",\"content\":\"<p><strong><span>Welcome to MyCompanyName<\\/span><\\/strong><\\/p>\\n<p>This is an Internal Service Request (ISR) app that enables users to make and manage inter-departmental service requests.<\\/p>\\n<p><a href=\\\"http:\\/\\/www.joget.org\\/wp-content\\/uploads\\/2012\\/02\\/isr-app.jpg\\\" target=\\\"_blank\\\"><img title=\\\"Internal Service Request App - Joget Workflow\\\" src=\\\"http:\\/\\/www.joget.org\\/wp-content\\/uploads\\/2012\\/02\\/isr-app.jpg\\\" alt=\\\"Internal Service Request App - Joget Workflow\\\" width=\\\"600\\\" height=\\\"261\\\" \\/><\\/a><\\/p>\\n<p>Users will be able to make requests to specific head of department (HOD), who can then either resolve the request, or assign the task to a subordinate for further action. This app also provides overall ISR reporting.<\\/p>\\n<p>&nbsp;<\\/p>\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-4E37D35FDDE84BC1A395BD48D9778BF9\",\"label\":\"Personal\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.RunProcess\",\"properties\":{\"id\":\"E41C769DC65D4ECC9EEE103E88D105DF\",\"customId\":\"new_request\",\"label\":\"New Request\",\"processDefId\":\"isr\",\"runProcessDirectly\":\"Yes\",\"showInPopupDialog\":\"\",\"messageShowAfterComplete\":\"Your request submitted.\",\"redirectUrlAfterComplete\":\"my_requests\",\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"67064636246B4C4E9A7C55AD50E220DB\",\"customId\":\"attending_submitted\",\"label\":\"Attending Submitted Requests\",\"datalistId\":\"isr_attending_submitted_requests\",\"appFilter\":\"process\",\"processId\":\"isr\",\"activityDefId\":\"\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.DataListInboxMenu\",\"properties\":{\"id\":\"7BC1BF7DC26949E1A9FE5C3164048827\",\"customId\":\"attending_assigned\",\"label\":\"Attending Assigned Requests\",\"datalistId\":\"isr_attending_assigned_requests\",\"appFilter\":\"process\",\"processId\":\"isr\",\"activityDefId\":\"\",\"rowCount\":\"true\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"84B9D74F9B3A4905B8D574D31BD4A3C1\",\"customId\":\"my_requests\",\"label\":\"My Submitted Requests\",\"datalistId\":\"isr_personal_submitted\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-D6D39BDCD0144DA19FF1E5614B289774\",\"label\":\"Department Reports\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"B2DC04D80F9D4340A8028F3D6BCBD7BF\",\"customId\":\"department_submitted\",\"label\":\"All Submitted Requests\",\"datalistId\":\"isr_department_report\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"250FA5A3D9FC4279BF7A36B47FD6DC22\",\"customId\":\"department_assigned\",\"label\":\"All Assigned Requests\",\"datalistId\":\"isr_department_assigned\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}}]},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-B8F37ED7EE324362B477C93374366F1B\",\"label\":\"General Reports\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"53F2131358664011B5D22824283E8151\",\"customId\":\"all\",\"label\":\"All Requests\",\"datalistId\":\"isr_all_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"083A7F13D6C1454797C39EA56C0D38A4\",\"customId\":\"all_new_requests\",\"label\":\"All New Requests\",\"datalistId\":\"isr_new_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"FEA3CD02B43D4074B52BA31068E71F75\",\"customId\":\"all_reopened_requests\",\"label\":\"All Reopened Requests\",\"datalistId\":\"isr_reopened_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"A57A8D5D50E541569DE4597D5B798419\",\"customId\":\"all_resolved_requests\",\"label\":\"All Resolved Requests\",\"datalistId\":\"isr_resolved_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"702D4E6BEA354A8FA018ACC9BFE3BD21\",\"customId\":\"all_assigned_requests\",\"label\":\"All Assigned Requests\",\"datalistId\":\"isr_assigned_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-readonlyLabel\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"128ED1CCAB7A473FBCCC4E80E9B6A302\",\"customId\":\"all_rejected_requests\",\"label\":\"All Rejected Requests\",\"datalistId\":\"isr_rejected_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}},{\"className\":\"org.joget.plugin.enterprise.CrudMenu\",\"properties\":{\"id\":\"2F99D43FC91B449E9E55174B86514F70\",\"customId\":\"all_verified_requests\",\"label\":\"All Verified Requests\",\"datalistId\":\"isr_verified_requests\",\"addFormId\":\"\",\"editFormId\":\"isr_request_detail\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"list-editLinkLabel\":\"View\",\"list-newButtonLabel\":\"\",\"list-deleteButtonLabel\":\"\",\"list-showDeleteButton\":\"\",\"list-customHeader\":\"\",\"list-customFooter\":\"\",\"list-moreActions\":[],\"add-cancelButtonLabel\":\"\",\"add-saveButtonLabel\":\"\",\"add-customHeader\":\"\",\"add-customFooter\":\"\",\"add-messageShowAfterComplete\":\"\",\"add-afterSaved\":\"list\",\"add-afterSavedRedirectUrl\":\"\",\"add-afterSavedRedirectParamName\":\"\",\"add-afterSavedRedirectParamvalue\":\"\",\"edit-readonly\":\"\",\"edit-backButtonLabel\":\"\",\"edit-saveButtonLabel\":\"\",\"edit-allowRecordTraveling\":\"\",\"edit-firstButtonLabel\":\"\",\"edit-prevButtonLabel\":\"\",\"edit-nextButtonLabel\":\"\",\"edit-lastButtonLabel\":\"\",\"edit-customHeader\":\"\",\"edit-customFooter\":\"\",\"edit-messageShowAfterComplete\":\"\",\"edit-afterSaved\":\"list\",\"edit-afterSavedRedirectUrl\":\"\",\"edit-afterSavedRedirectParamName\":\"\",\"edit-afterSavedRedirectParamvalue\":\"\",\"edit-moreActions\":[],\"keyName\":\"\"}}]}]}','2012-08-14 06:45:55','2014-08-01 11:10:08');
/*!40000 ALTER TABLE `app_userview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_department`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_department` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  `hod` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEE8AA4418CEBAE1` (`organizationId`),
  KEY `FKEEE8AA44EF6BB2B7` (`parentId`),
  KEY `FKEEE8AA4480DB1449` (`hod`),
  CONSTRAINT `FKEEE8AA4418CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKEEE8AA4480DB1449` FOREIGN KEY (`hod`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FKEEE8AA44EF6BB2B7` FOREIGN KEY (`parentId`) REFERENCES `dir_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_department`
--

LOCK TABLES `dir_department` WRITE;
/*!40000 ALTER TABLE `dir_department` DISABLE KEYS */;
INSERT INTO `dir_department` VALUES ('D-001','CEO\'s Office','','ORG-001','4028808127f4ef840127f5efdbfb004f',NULL),('D-002','Human Resource & Admin','','ORG-001','4028808127f4ef840127f5f41d4b0091',NULL),('D-003','Finance','','ORG-001','4028808127f4ef840127f606242400b3',NULL),('D-004','Marketing','','ORG-001','4028808127f4ef840127f5f20f36007a',NULL),('D-005','Product Development','','ORG-001','4028808127f4ef840127f5f04dc2005a',NULL),('D-006','Training & Consulting','','ORG-001','4028808127f4ef840127f5f7c5b500a5',NULL),('D-007','Support & Services','','ORG-001','4028808127fb4d350127ff78d63300d1',NULL);
/*!40000 ALTER TABLE `dir_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_employment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment` (
  `id` varchar(255) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `gradeId` varchar(255) DEFAULT NULL,
  `departmentId` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `FKC6620ADE14CE02E9` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `FKC6620ADE18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKC6620ADE716AE35F` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `FKC6620ADECE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_employment`
--

LOCK TABLES `dir_employment` WRITE;
/*!40000 ALTER TABLE `dir_employment` DISABLE KEYS */;
INSERT INTO `dir_employment` VALUES ('4028808127f4ef840127f5efdbfb004f','terry',NULL,NULL,NULL,NULL,'G-001','D-001','ORG-001'),('4028808127f4ef840127f5f04dc2005a','clark',NULL,NULL,NULL,NULL,'G-002','D-005','ORG-001'),('4028808127f4ef840127f5f11cf60068','cat',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),('4028808127f4ef840127f5f194e20071','tana',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),('4028808127f4ef840127f5f20f36007a','roy',NULL,NULL,NULL,NULL,'G-002','D-004','ORG-001'),('4028808127f4ef840127f5f319720088','etta',NULL,NULL,NULL,NULL,'G-003','D-004','ORG-001'),('4028808127f4ef840127f5f41d4b0091','sasha',NULL,NULL,NULL,NULL,'G-002','D-002','ORG-001'),('4028808127f4ef840127f5f7c5b500a5','jack',NULL,NULL,NULL,NULL,'G-002','D-006','ORG-001'),('4028808127f4ef840127f606242400b3','tina',NULL,NULL,NULL,NULL,'G-002','D-003','ORG-001'),('4028808127fb4d350127ff78d63300d1','david',NULL,NULL,NULL,NULL,'G-002','D-007','ORG-001'),('4028808127fb4d350127ff84074600f2','julia',NULL,NULL,NULL,NULL,'G-003','D-002','ORG-001');
/*!40000 ALTER TABLE `dir_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_employment_report_to`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment_report_to` (
  `employmentId` varchar(255) NOT NULL,
  `reportToId` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employmentId`,`reportToId`),
  KEY `FK53622945F4068416` (`reportToId`),
  KEY `FK536229452787E613` (`employmentId`),
  CONSTRAINT `FK536229452787E613` FOREIGN KEY (`employmentId`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FK53622945F4068416` FOREIGN KEY (`reportToId`) REFERENCES `dir_employment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_employment_report_to`
--

LOCK TABLES `dir_employment_report_to` WRITE;
/*!40000 ALTER TABLE `dir_employment_report_to` DISABLE KEYS */;
INSERT INTO `dir_employment_report_to` VALUES ('4028808127f4ef840127f5f04dc2005a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f04e9b005f'),('4028808127f4ef840127f5f20f36007a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f20fb7007f'),('4028808127f4ef840127f5f41d4b0091','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f48eda009e'),('4028808127f4ef840127f5f7c5b500a5','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f7c60b00aa'),('4028808127f4ef840127f606242400b3','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f60624c100b8'),('4028808127fb4d350127ff78d63300d1','4028808127f4ef840127f5efdbfb004f','4028808127fb4d350127ff78d6fe00d6');
/*!40000 ALTER TABLE `dir_employment_report_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_grade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_grade` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A49A518CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A49A518CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_grade`
--

LOCK TABLES `dir_grade` WRITE;
/*!40000 ALTER TABLE `dir_grade` DISABLE KEYS */;
INSERT INTO `dir_grade` VALUES ('G-001','Board Members','','ORG-001'),('G-002','Managers','','ORG-001'),('G-003','Executives','','ORG-001');
/*!40000 ALTER TABLE `dir_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_group` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A804D18CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A804D18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_group`
--

LOCK TABLES `dir_group` WRITE;
/*!40000 ALTER TABLE `dir_group` DISABLE KEYS */;
INSERT INTO `dir_group` VALUES ('G-001','Managers','',NULL),('G-002','CxO','',NULL),('G-003','hrAdmin','',NULL);
/*!40000 ALTER TABLE `dir_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_organization` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55A15FA5961BD498` (`parentId`),
  CONSTRAINT `FK55A15FA5961BD498` FOREIGN KEY (`parentId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_organization`
--

LOCK TABLES `dir_organization` WRITE;
/*!40000 ALTER TABLE `dir_organization` DISABLE KEYS */;
INSERT INTO `dir_organization` VALUES ('ORG-001','Joget.Org','',NULL);
/*!40000 ALTER TABLE `dir_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_role`
--

LOCK TABLES `dir_role` WRITE;
/*!40000 ALTER TABLE `dir_role` DISABLE KEYS */;
INSERT INTO `dir_role` VALUES ('ROLE_ADMIN','Admin','Administrator'),('ROLE_USER','User','Normal User');
/*!40000 ALTER TABLE `dir_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user`
--

LOCK TABLES `dir_user` WRITE;
/*!40000 ALTER TABLE `dir_user` DISABLE KEYS */;
INSERT INTO `dir_user` VALUES ('admin','admin','21232f297a57a5a743894a0e4a801fc3','Admin','Admin',NULL,1,'0',NULL),('cat','cat','5f4dcc3b5aa765d61d8327deb882cf99','Cat','Grant','',1,'0',NULL),('clark','clark','5f4dcc3b5aa765d61d8327deb882cf99','Clark','Kent','',1,'0',NULL),('david','david','5f4dcc3b5aa765d61d8327deb882cf99','David','Cain','',1,'0',NULL),('etta','etta','5f4dcc3b5aa765d61d8327deb882cf99','Etta','Candy','',1,'0',NULL),('jack','jack','5f4dcc3b5aa765d61d8327deb882cf99','Jack','Drake','',1,'0',NULL),('julia','julia','5f4dcc3b5aa765d61d8327deb882cf99','Julia','Kapatelis','',1,'0',NULL),('roy','roy','5f4dcc3b5aa765d61d8327deb882cf99','Roy','Harper','',1,'0',NULL),('sasha','sasha','5f4dcc3b5aa765d61d8327deb882cf99','Sasha','Bordeaux','',1,'0',NULL),('tana','tana','5f4dcc3b5aa765d61d8327deb882cf99','Tana','Moon','',1,'0',NULL),('terry','terry','5f4dcc3b5aa765d61d8327deb882cf99','Terry','Berg','',1,'0',NULL),('tina','tina','5f4dcc3b5aa765d61d8327deb882cf99','Tina','Magee','',1,'0',NULL);
/*!40000 ALTER TABLE `dir_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_extra`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_extra` (
  `username` varchar(255) NOT NULL,
  `algorithm` varchar(255) DEFAULT NULL,
  `loginAttempt` int(11) DEFAULT NULL,
  `failedloginAttempt` int(11) DEFAULT NULL,
  `lastLogedInDate` datetime DEFAULT NULL,
  `lockOutDate` datetime DEFAULT NULL,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `requiredPasswordChange` bit(1) DEFAULT NULL,
  `noPasswordExpiration` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_extra`
--

LOCK TABLES `dir_user_extra` WRITE;
/*!40000 ALTER TABLE `dir_user_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_group` (
  `groupId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `FK2F0367FD159B6639` (`groupId`),
  KEY `FK2F0367FDCE539211` (`userId`),
  CONSTRAINT `FK2F0367FD159B6639` FOREIGN KEY (`groupId`) REFERENCES `dir_group` (`id`),
  CONSTRAINT `FK2F0367FDCE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_group`
--

LOCK TABLES `dir_user_group` WRITE;
/*!40000 ALTER TABLE `dir_user_group` DISABLE KEYS */;
INSERT INTO `dir_user_group` VALUES ('G-001','clark'),('G-001','david'),('G-001','jack'),('G-001','roy'),('G-001','sasha'),('G-001','tina'),('G-002','terry'),('G-003','julia'),('G-003','sasha');
/*!40000 ALTER TABLE `dir_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_password_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_password_history` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_password_history`
--

LOCK TABLES `dir_user_password_history` WRITE;
/*!40000 ALTER TABLE `dir_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_role` (
  `roleId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `FK5C5FE738C8FE3CA7` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `FK5C5FE738CE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_role`
--

LOCK TABLES `dir_user_role` WRITE;
/*!40000 ALTER TABLE `dir_user_role` DISABLE KEYS */;
INSERT INTO `dir_user_role` VALUES ('ROLE_ADMIN','admin'),('ROLE_USER','cat'),('ROLE_USER','clark'),('ROLE_USER','david'),('ROLE_USER','etta'),('ROLE_USER','jack'),('ROLE_USER','julia'),('ROLE_USER','roy'),('ROLE_USER','sasha'),('ROLE_USER','tana'),('ROLE_USER','terry'),('ROLE_USER','tina');
/*!40000 ALTER TABLE `dir_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectid` (
  `nextoid` decimal(19,0) NOT NULL,
  PRIMARY KEY (`nextoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectid`
--

LOCK TABLES `objectid` WRITE;
/*!40000 ALTER TABLE `objectid` DISABLE KEYS */;
INSERT INTO `objectid` VALUES (1001000);
/*!40000 ALTER TABLE `objectid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_audit_trail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_audit_trail` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `message` text,
  `timestamp` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_audit_trail`
--

LOCK TABLES `wf_audit_trail` WRITE;
/*!40000 ALTER TABLE `wf_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_process_link`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_process_link` (
  `processId` varchar(255) NOT NULL,
  `parentProcessId` varchar(255) DEFAULT NULL,
  `originProcessId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_process_link`
--

LOCK TABLES `wf_process_link` WRITE;
/*!40000 ALTER TABLE `wf_process_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report` (
  `activityInstanceId` varchar(255) NOT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `dateLimit` bigint(20) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `timeConsumingFromDateCreated` bigint(20) DEFAULT NULL,
  `timeConsumingFromDateStarted` bigint(20) DEFAULT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityInstanceId`),
  KEY `FKB943CCA47A4E8F48` (`packageId`),
  KEY `FKB943CCA4A39D6461` (`processDefId`),
  KEY `FKB943CCA4CB863F` (`activityDefId`),
  CONSTRAINT `FKB943CCA47A4E8F48` FOREIGN KEY (`packageId`) REFERENCES `wf_report_package` (`packageId`),
  CONSTRAINT `FKB943CCA4A39D6461` FOREIGN KEY (`processDefId`) REFERENCES `wf_report_process` (`processDefId`),
  CONSTRAINT `FKB943CCA4CB863F` FOREIGN KEY (`activityDefId`) REFERENCES `wf_report_activity` (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report`
--

LOCK TABLES `wf_report` WRITE;
/*!40000 ALTER TABLE `wf_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_activity` (
  `activityDefId` varchar(255) NOT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_activity`
--

LOCK TABLES `wf_report_activity` WRITE;
/*!40000 ALTER TABLE `wf_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_package` (
  `packageId` varchar(255) NOT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_package`
--

LOCK TABLES `wf_report_package` WRITE;
/*!40000 ALTER TABLE `wf_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_process`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_process` (
  `processDefId` varchar(255) NOT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_process`
--

LOCK TABLES `wf_report_process` WRITE;
/*!40000 ALTER TABLE `wf_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_resource_bundle_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_resource_bundle_message` (
  `id` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_resource_bundle_message`
--

LOCK TABLES `wf_resource_bundle_message` WRITE;
/*!40000 ALTER TABLE `wf_resource_bundle_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_resource_bundle_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_setup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_setup` (
  `id` varchar(255) NOT NULL,
  `property` varchar(255) DEFAULT NULL,
  `value` text,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_setup`
--

LOCK TABLES `wf_setup` WRITE;
/*!40000 ALTER TABLE `wf_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_setup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-30  4:27:26
