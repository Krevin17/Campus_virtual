-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para campus_virtual
CREATE DATABASE IF NOT EXISTS `campus_virtual` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `campus_virtual`;

-- Volcando estructura para tabla campus_virtual.archivo
CREATE TABLE IF NOT EXISTS `archivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_archivo_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_publicacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `archivo_FKIndex1` (`tipo_archivo_id`),
  KEY `archivo_FKIndex2` (`materia_id`),
  KEY `archivo_FKIndex3` (`usuario_id`),
  CONSTRAINT `FK_archivo_materia` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`),
  CONSTRAINT `FK_archivo_tipo_archivo` FOREIGN KEY (`tipo_archivo_id`) REFERENCES `tipo_archivo` (`id`),
  CONSTRAINT `FK_archivo_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.archivo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.area
CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.area: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`id`, `nombre_area`) VALUES
	(1, 'Tecnologias de la informacion');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.carrera
CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `nombre_carrera` varchar(50) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carrera_FKIndex1` (`area_id`),
  CONSTRAINT `FK_carrera_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.carrera: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` (`id`, `area_id`, `nombre_carrera`, `nivel`) VALUES
	(1, 1, 'Tecnologias de la informacion', 'Ingenieria'),
	(2, 1, 'Sistemas Informaticos', 'TSU');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.cuatrimestre
CREATE TABLE IF NOT EXISTS `cuatrimestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cuatrimestre` varchar(50) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.cuatrimestre: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `cuatrimestre` DISABLE KEYS */;
INSERT INTO `cuatrimestre` (`id`, `nombre_cuatrimestre`, `nivel`) VALUES
	(1, 'Primero', 'TSU'),
	(2, 'Segundo', 'TSU'),
	(3, 'Tercero', 'TSU'),
	(4, 'Cuarto', 'TSU'),
	(5, 'Quinto', 'TSU'),
	(6, 'Sexto', 'TSU'),
	(7, 'Septimo', 'ING'),
	(8, 'Octavo', 'ING'),
	(9, 'Noveno', 'ING'),
	(10, 'Decimo', 'ING'),
	(11, 'Onceavo', 'ING');
/*!40000 ALTER TABLE `cuatrimestre` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuatrimestre_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `nombre_materia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materia_FKIndex2` (`carrera_id`),
  KEY `materia_FKIndex1` (`cuatrimestre_id`),
  CONSTRAINT `FK_materia_carrera` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `FK_materia_cuatrimestre` FOREIGN KEY (`cuatrimestre_id`) REFERENCES `cuatrimestre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.materia: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`id`, `cuatrimestre_id`, `carrera_id`, `nombre_materia`) VALUES
	(1, 7, 1, 'Administracion de Tiempo'),
	(2, 7, 1, 'Administracion de proyectos de TI'),
	(7, 7, 1, 'Ingenieria economica'),
	(8, 7, 1, 'Matematicas para TI'),
	(9, 7, 1, 'Optativa'),
	(10, 7, 1, 'Sistemas de calidad de TI'),
	(13, 8, 1, 'Administracion de proyecto de TI II'),
	(14, 8, 1, 'Base de datos para aplicaciones'),
	(16, 8, 1, 'Estadistica aplicada'),
	(17, 8, 1, 'Planeacion y organizacion del trabajo'),
	(19, 8, 1, 'Redes convergentes'),
	(20, 9, 1, 'Auditoria de sistemas de TI'),
	(22, 9, 1, 'Aplicacion de las telecomunicaciones'),
	(24, 9, 1, 'Direccion de equipos de alto rendimiento'),
	(27, 9, 1, 'Integradora I'),
	(28, 9, 1, 'Optativa II'),
	(29, 9, 1, 'Programacion de aplicaciones'),
	(30, 10, 1, 'Desarrollo de aplicaciones web'),
	(31, 10, 1, 'Intregradora II'),
	(32, 10, 1, 'Modelado de proceso de negocios'),
	(33, 10, 1, 'Seguridad de la informacion'),
	(34, 10, 1, 'Topicos selectos de TI'),
	(35, 11, 1, 'Estadia Ingenieria');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `id_carrera` int(11) DEFAULT NULL,
  `id_cuatrimestre` int(11) DEFAULT NULL,
  `grupo` char(1) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_persona_carrera` (`id_carrera`),
  KEY `FK_persona_cuatrimestre` (`id_cuatrimestre`),
  CONSTRAINT `FK_persona_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id`),
  CONSTRAINT `FK_persona_cuatrimestre` FOREIGN KEY (`id_cuatrimestre`) REFERENCES `cuatrimestre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.persona: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`id`, `matricula`, `nombre`, `apellido`, `id_carrera`, `id_cuatrimestre`, `grupo`, `correo_electronico`, `telefono`, `eliminado`, `fecha_registro`) VALUES
	(1, 'R1567282', 'Admin', 'Admin', NULL, NULL, NULL, '', NULL, 0, '2018-11-20 11:58:27');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.rol: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `nombre_rol`) VALUES
	(1, 'Administrador'),
	(2, 'Usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.tipo_archivo
CREATE TABLE IF NOT EXISTS `tipo_archivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.tipo_archivo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_archivo` DISABLE KEYS */;
INSERT INTO `tipo_archivo` (`id`, `tipo`) VALUES
	(1, 'Ensayo'),
	(2, 'Articulo'),
	(3, 'Libro');
/*!40000 ALTER TABLE `tipo_archivo` ENABLE KEYS */;

-- Volcando estructura para tabla campus_virtual.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_FKIndex1` (`persona_id`),
  KEY `usuario_FKIndex2` (`rol_id`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla campus_virtual.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `rol_id`, `persona_id`, `nombre_usuario`, `password`, `estado`, `fecha_registro`) VALUES
	(1, 1, 1, 'Admin', 'Admin', 0, '2018-11-20 11:59:15');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
