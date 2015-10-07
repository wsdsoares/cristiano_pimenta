CREATE DATABASE  IF NOT EXISTS `portal_atenas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `portal_atenas`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: portal_atenas
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `aluno_turmat`
--

DROP TABLE IF EXISTS `aluno_turmat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_turmat` (
  `codusuario` varchar(20) NOT NULL,
  `codsemestre` varchar(6) NOT NULL,
  `codturma` varchar(10) NOT NULL,
  `coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`codusuario`,`codsemestre`,`codturma`,`coddisciplina`),
  KEY `fk_aluno_turmat_turma_disciplina1_idx` (`codsemestre`,`codturma`,`coddisciplina`),
  CONSTRAINT `fk_aluno_turmat_turma_disciplina1` FOREIGN KEY (`codsemestre`, `codturma`, `coddisciplina`) REFERENCES `turma_disciplina` (`codsemestre`, `codturma`, `coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_turmat_usuario1` FOREIGN KEY (`codusuario`) REFERENCES `usuario` (`codusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_turmat`
--

LOCK TABLES `aluno_turmat` WRITE;
/*!40000 ALTER TABLE `aluno_turmat` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_turmat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codcurso` int(11) NOT NULL,
  `nome` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`codcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `coddisciplina` varchar(10) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `codcurso` int(11) NOT NULL,
  PRIMARY KEY (`coddisciplina`),
  KEY `fk_disciplina_curso1_idx` (`codcurso`),
  CONSTRAINT `fk_disciplina_curso1` FOREIGN KEY (`codcurso`) REFERENCES `curso` (`codcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `codperfil` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`codperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_turma`
--

DROP TABLE IF EXISTS `professor_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_turma` (
  `usuario_codusuario` varchar(20) NOT NULL,
  `turma_disciplina_codsemestre` varchar(6) NOT NULL,
  `turma_disciplina_codturma` varchar(10) NOT NULL,
  `turma_disciplina_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`usuario_codusuario`,`turma_disciplina_codsemestre`,`turma_disciplina_codturma`,`turma_disciplina_coddisciplina`),
  KEY `fk_professor_turma_turma_disciplina1_idx` (`turma_disciplina_codsemestre`,`turma_disciplina_codturma`,`turma_disciplina_coddisciplina`),
  CONSTRAINT `fk_professor_turma_turma_disciplina1` FOREIGN KEY (`turma_disciplina_codsemestre`, `turma_disciplina_codturma`, `turma_disciplina_coddisciplina`) REFERENCES `turma_disciplina` (`codsemestre`, `codturma`, `coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_turma_usuario1` FOREIGN KEY (`usuario_codusuario`) REFERENCES `usuario` (`codusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_turma`
--

LOCK TABLES `professor_turma` WRITE;
/*!40000 ALTER TABLE `professor_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `codsemestre` varchar(6) NOT NULL,
  `descricao` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`codsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `codturma` varchar(10) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codturma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_disciplina`
--

DROP TABLE IF EXISTS `turma_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_disciplina` (
  `codsemestre` varchar(6) NOT NULL,
  `codturma` varchar(10) NOT NULL,
  `coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`codsemestre`,`codturma`,`coddisciplina`),
  KEY `fk_turma_disciplina_semestre1_idx` (`codsemestre`),
  KEY `fk_turma_disciplina_turma1_idx` (`codturma`),
  KEY `fk_turma_disciplina_disciplina1_idx` (`coddisciplina`),
  CONSTRAINT `fk_turma_disciplina_disciplina1` FOREIGN KEY (`coddisciplina`) REFERENCES `disciplina` (`coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_semestre1` FOREIGN KEY (`codsemestre`) REFERENCES `semestre` (`codsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1` FOREIGN KEY (`codturma`) REFERENCES `turma` (`codturma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_disciplina`
--

LOCK TABLES `turma_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codusuario` varchar(20) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `codperfil` int(11) NOT NULL,
  PRIMARY KEY (`codusuario`),
  KEY `fk_usuario_perfil1_idx` (`codperfil`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`codperfil`) REFERENCES `perfil` (`codperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

-- Dump completed on 2015-04-30 17:35:45
