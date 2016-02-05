CREATE DATABASE  IF NOT EXISTS `portalatenas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `portalatenas`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: portalatenas
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `aluno_turma`
--

DROP TABLE IF EXISTS `aluno_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_turma` (
  `fk_codusuario` varchar(20) NOT NULL,
  `fk_codsemestre` varchar(6) NOT NULL,
  `fk_codturma` varchar(10) NOT NULL,
  `fk_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`fk_codusuario`,`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  KEY `fk_aluno_turmat_turma_disciplina1_idx` (`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  CONSTRAINT `fk_aluno_turmat_turma_disciplina1` FOREIGN KEY (`fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) REFERENCES `turma_disciplina` (`fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_turmat_usuario1` FOREIGN KEY (`fk_codusuario`) REFERENCES `usuario` (`codusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_turma`
--

LOCK TABLES `aluno_turma` WRITE;
/*!40000 ALTER TABLE `aluno_turma` DISABLE KEYS */;
INSERT INTO `aluno_turma` VALUES ('1','1-2015','SIS1ANA','1'),('1','1-2015','SIS1ANA','2');
/*!40000 ALTER TABLE `aluno_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `idauditoria` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idauditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `idavaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idavaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` longtext,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codcurso` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  PRIMARY KEY (`codcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'DIREITO'),(2,'ADMINISTRAÇÃO'),(3,'NUTRIÇÃO');
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
  `nome` varchar(100) NOT NULL,
  `fk_codcurso` int(11) NOT NULL,
  PRIMARY KEY (`coddisciplina`),
  KEY `fk_disciplina_curso1_idx` (`fk_codcurso`),
  CONSTRAINT `fk_disciplina_curso1` FOREIGN KEY (`fk_codcurso`) REFERENCES `curso` (`codcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('1','DISCIPLINA 1',1),('2','DISCIPLINA 2',1),('3','DISCIPLINA 3',1);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `falta_aluno`
--

DROP TABLE IF EXISTS `falta_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `falta_aluno` (
  `id` int(11) NOT NULL,
  `data_aula` datetime DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL,
  `fk_codusuario` varchar(20) NOT NULL,
  `fk_codsemestre` varchar(6) NOT NULL,
  `fk_codturma` varchar(10) NOT NULL,
  `fk_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_falta_aluno_aluno_turma1_idx` (`fk_codusuario`,`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  CONSTRAINT `fk_falta_aluno_aluno_turma1` FOREIGN KEY (`fk_codusuario`, `fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) REFERENCES `aluno_turma` (`fk_codusuario`, `fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `falta_aluno`
--

LOCK TABLES `falta_aluno` WRITE;
/*!40000 ALTER TABLE `falta_aluno` DISABLE KEYS */;
INSERT INTO `falta_aluno` VALUES (1,'2015-05-15 00:00:00','2015-05-15 00:00:00',1,'1','1-2015','SIS1ANA','1'),(2,'2015-05-16 00:00:00','2015-05-16 00:00:00',1,'1','1-2015','SIS1ANA','1'),(3,'2015-05-17 00:00:00','2015-05-17 00:00:00',1,'1','1-2015','SIS1ANA','2'),(4,'2015-05-18 00:00:00','2015-05-18 00:00:00',1,'1','1-2015','SIS1ANA','2'),(5,'2015-05-19 00:00:00','2015-05-19 00:00:00',2,'1','1-2015','SIS1ANA','1'),(6,'2015-05-20 00:00:00','2015-05-20 00:00:00',2,'1','1-2015','SIS1ANA','1'),(7,'2015-05-21 00:00:00','2015-05-21 00:00:00',2,'1','1-2015','SIS1ANA','2'),(8,'2015-05-22 00:00:00','2015-05-22 00:00:00',2,'1','1-2015','SIS1ANA','2'),(9,'2015-05-23 00:00:00','2015-05-23 00:00:00',3,'1','1-2015','SIS1ANA','1'),(10,'2015-05-24 00:00:00','2015-05-24 00:00:00',3,'1','1-2015','SIS1ANA','1'),(11,'2015-05-25 00:00:00','2015-05-25 00:00:00',3,'1','1-2015','SIS1ANA','2'),(12,'2015-05-26 00:00:00','2015-05-26 00:00:00',3,'1','1-2015','SIS1ANA','2'),(13,'2015-05-27 00:00:00','2015-05-27 00:00:00',4,'1','1-2015','SIS1ANA','1'),(14,'2015-05-28 00:00:00','2015-05-28 00:00:00',4,'1','1-2015','SIS1ANA','1'),(15,'2015-05-29 00:00:00','2015-05-29 00:00:00',4,'1','1-2015','SIS1ANA','2'),(16,'2015-05-30 00:00:00','2015-05-30 00:00:00',4,'1','1-2015','SIS1ANA','2'),(17,'2015-05-31 00:00:00','2015-05-31 00:00:00',5,'1','1-2015','SIS1ANA','1'),(18,'2015-06-01 00:00:00','2015-06-01 00:00:00',5,'1','1-2015','SIS1ANA','1'),(19,'2015-06-02 00:00:00','2015-06-02 00:00:00',5,'1','1-2015','SIS1ANA','2'),(20,'2015-06-03 00:00:00','2015-06-03 00:00:00',5,'1','1-2015','SIS1ANA','2'),(21,'2015-06-04 00:00:00','2015-06-04 00:00:00',6,'1','1-2015','SIS1ANA','1'),(22,'2015-06-05 00:00:00','2015-06-05 00:00:00',6,'1','1-2015','SIS1ANA','1'),(23,'2015-06-06 00:00:00','2015-06-06 00:00:00',6,'1','1-2015','SIS1ANA','2'),(24,'2015-06-07 00:00:00','2015-06-07 00:00:00',6,'1','1-2015','SIS1ANA','2'),(25,'2015-06-07 00:00:00','2015-06-07 00:00:00',6,'1','1-2015','SIS1ANA','1');
/*!40000 ALTER TABLE `falta_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_aluno`
--

DROP TABLE IF EXISTS `nota_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_aluno` (
  `id` int(11) NOT NULL,
  `etapa` int(11) DEFAULT NULL,
  `prova_trabalho` varchar(1) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `fk_codusuario` varchar(20) NOT NULL,
  `fk_codsemestre` varchar(6) NOT NULL,
  `fk_codturma` varchar(10) NOT NULL,
  `fk_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nota_aluno_aluno_turma1_idx` (`fk_codusuario`,`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  CONSTRAINT `fk_nota_aluno_aluno_turma1` FOREIGN KEY (`fk_codusuario`, `fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) REFERENCES `aluno_turma` (`fk_codusuario`, `fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_aluno`
--

LOCK TABLES `nota_aluno` WRITE;
/*!40000 ALTER TABLE `nota_aluno` DISABLE KEYS */;
INSERT INTO `nota_aluno` VALUES (1,1,'P',21,'2015-05-13 00:00:00','1','1-2015','SIS1ANA','1'),(2,1,'T',4,'2015-05-13 00:00:00','1','1-2015','SIS1ANA','1'),(3,2,'P',20,'2015-05-13 00:00:00','1','1-2015','SIS1ANA','1'),(4,2,'T',3,'2015-05-13 00:00:00','1','1-2015','SIS1ANA','1'),(5,1,'P',18,'2015-05-13 00:00:00','1','1-2015','SIS1ANA','2');
/*!40000 ALTER TABLE `nota_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `codperfil` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(70) NOT NULL,
  PRIMARY KEY (`codperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADMINISTRADOR'),(2,'PROFESSOR'),(3,'ALUNO');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pergunta` (
  `idpergunta` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(255) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idpergunta`),
  KEY `fk_pergunta_categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_pergunta_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perguntas_por_avalicao`
--

DROP TABLE IF EXISTS `perguntas_por_avalicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perguntas_por_avalicao` (
  `id_pergunta_avaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta_idpergunta` int(11) NOT NULL,
  `avaliacao_idavaliacao` int(11) NOT NULL,
  PRIMARY KEY (`id_pergunta_avaliacao`),
  KEY `fk_pergunta_has_avaliacao_avaliacao1_idx` (`avaliacao_idavaliacao`),
  KEY `fk_pergunta_has_avaliacao_pergunta1_idx` (`pergunta_idpergunta`),
  CONSTRAINT `fk_pergunta_has_avaliacao_avaliacao1` FOREIGN KEY (`avaliacao_idavaliacao`) REFERENCES `avaliacao` (`idavaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pergunta_has_avaliacao_pergunta1` FOREIGN KEY (`pergunta_idpergunta`) REFERENCES `pergunta` (`idpergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perguntas_por_avalicao`
--

LOCK TABLES `perguntas_por_avalicao` WRITE;
/*!40000 ALTER TABLE `perguntas_por_avalicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `perguntas_por_avalicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_turma`
--

DROP TABLE IF EXISTS `professor_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_turma` (
  `fk_codusuario` varchar(20) NOT NULL,
  `fk_codsemestre` varchar(6) NOT NULL,
  `fk_codturma` varchar(10) NOT NULL,
  `fk_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`fk_codusuario`,`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  KEY `fk_professor_turma_turma_disciplina1_idx` (`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  CONSTRAINT `fk_professor_turma_turma_disciplina1` FOREIGN KEY (`fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) REFERENCES `turma_disciplina` (`fk_codsemestre`, `fk_codturma`, `fk_coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_turma_usuario1` FOREIGN KEY (`fk_codusuario`) REFERENCES `usuario` (`codusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_turma`
--

LOCK TABLES `professor_turma` WRITE;
/*!40000 ALTER TABLE `professor_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resposta` (
  `idresposta` int(11) NOT NULL,
  `id_reposta_por_avaliacao` int(11) NOT NULL,
  `A` varchar(45) DEFAULT NULL,
  `B` varchar(45) DEFAULT NULL,
  `C` varchar(45) DEFAULT NULL,
  `D` varchar(45) DEFAULT NULL,
  `E` varchar(45) DEFAULT NULL,
  `NR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idresposta`),
  KEY `fk_resposta_perguntas_por_avalicao1_idx` (`id_reposta_por_avaliacao`),
  CONSTRAINT `fk_resposta_perguntas_por_avalicao1` FOREIGN KEY (`id_reposta_por_avaliacao`) REFERENCES `perguntas_por_avalicao` (`id_pergunta_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta`
--

LOCK TABLES `resposta` WRITE;
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `codsemestre` varchar(6) NOT NULL,
  `descricao` varchar(70) NOT NULL,
  PRIMARY KEY (`codsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES ('1-2015','1 SEMESTRE DE 2015');
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
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`codturma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES ('SIS1ANA','SISTEMAS DE INFORMAÇÃO 1 PERIODO ALFA NOTURNO A');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_disciplina`
--

DROP TABLE IF EXISTS `turma_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_disciplina` (
  `fk_codsemestre` varchar(6) NOT NULL,
  `fk_codturma` varchar(10) NOT NULL,
  `fk_coddisciplina` varchar(10) NOT NULL,
  PRIMARY KEY (`fk_codsemestre`,`fk_codturma`,`fk_coddisciplina`),
  KEY `fk_turma_disciplina_semestre1_idx` (`fk_codsemestre`),
  KEY `fk_turma_disciplina_turma1_idx` (`fk_codturma`),
  KEY `fk_turma_disciplina_disciplina1_idx` (`fk_coddisciplina`),
  CONSTRAINT `fk_turma_disciplina_disciplina1` FOREIGN KEY (`fk_coddisciplina`) REFERENCES `disciplina` (`coddisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_semestre1` FOREIGN KEY (`fk_codsemestre`) REFERENCES `semestre` (`codsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1` FOREIGN KEY (`fk_codturma`) REFERENCES `turma` (`codturma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_disciplina`
--

LOCK TABLES `turma_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
INSERT INTO `turma_disciplina` VALUES ('1-2015','SIS1ANA','1'),('1-2015','SIS1ANA','2');
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
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fk_codperfil` int(11) NOT NULL,
  PRIMARY KEY (`codusuario`),
  KEY `fk_usuario_perfil1_idx` (`fk_codperfil`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`fk_codperfil`) REFERENCES `perfil` (`codperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('1','ALUNO1','aluno@aluno.com','e10adc3949ba59abbe56e057f20f883e',3),('2','ALUNO2','aluno2@aluno.com','e10adc3949ba59abbe56e057f20f883e',3),('wesleyti','WESLEY','wesleyjcr@gmail.com','e10adc3949ba59abbe56e057f20f883e',1);
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

-- Dump completed on 2015-05-15 23:32:54
