-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2016 a las 07:57:02
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `consejocomunalgramalote`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_comercial`
--

CREATE TABLE IF NOT EXISTS `act_comercial` (
  `COD_ACT_COM` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_ACT_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_com_vivienda`
--

CREATE TABLE IF NOT EXISTS `act_com_vivienda` (
  `ACT_COMERCIAL_COD_ACT_COM` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_ACT_COM_VIVIENDA_ACT_COMERCIAL1_idx` (`ACT_COMERCIAL_COD_ACT_COM`),
  KEY `fk_ACT_COM_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `COD_ANIMAL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ANIMAL` varchar(45) DEFAULT NULL,
  `TIPO_ANIMAL_COD_TIPO_ANIMAL` int(11) NOT NULL,
  PRIMARY KEY (`COD_ANIMAL`),
  KEY `fk_ANIMAL_TIPO_ANIMAL1_idx` (`TIPO_ANIMAL_COD_TIPO_ANIMAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal_vivienda`
--

CREATE TABLE IF NOT EXISTS `animal_vivienda` (
  `ANIMAL_COD_ANIMAL` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_ANIMAL_VIVIENDA_ANIMAL1_idx` (`ANIMAL_COD_ANIMAL`),
  KEY `fk_ANIMAL_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

CREATE TABLE IF NOT EXISTS `calle` (
  `NRO_CALLE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CALLE` varchar(45) DEFAULT NULL,
  `SECTOR_COD_SECTOR` int(11) NOT NULL,
  PRIMARY KEY (`NRO_CALLE`),
  KEY `fk_CALLE_SECTOR1_idx` (`SECTOR_COD_SECTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE IF NOT EXISTS `caracteristica` (
  `COD_CARACT_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_CARACTERISTICA_COD_CARACTERISTICA` int(11) NOT NULL,
  PRIMARY KEY (`COD_CARACT_VIVIENDA`),
  KEY `fk_CARACTERISTICA_TIPO_CARACTERISTICA1_idx` (`TIPO_CARACTERISTICA_COD_CARACTERISTICA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caract_vivienda`
--

CREATE TABLE IF NOT EXISTS `caract_vivienda` (
  `CARACTERISTICA_COD_CARACT_VIVIENDA` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_CARACT_VIVIENDA_CARACTERISTICA1_idx` (`CARACTERISTICA_COD_CARACT_VIVIENDA`),
  KEY `fk_CARACT_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `censo`
--

CREATE TABLE IF NOT EXISTS `censo` (
  `ID_CENSO` int(11) NOT NULL AUTO_INCREMENT,
  `ANO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_CENSO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `censo`
--

INSERT INTO `censo` (`ID_CENSO`, `ANO`, `DESCRIPCION`) VALUES
(1, 2012, 'Censo del año 2012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE IF NOT EXISTS `enfermedad` (
  `COD_ENF` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_ENF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad_planilla`
--

CREATE TABLE IF NOT EXISTS `enfermedad_planilla` (
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `ENFERMEDAD_COD_ENF` int(11) NOT NULL,
  KEY `fk_ENFERMEDAD_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  KEY `fk_ENFERMEDAD_PLANILLA_ENFERMEDAD1_idx` (`ENFERMEDAD_COD_ENF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres`
--

CREATE TABLE IF NOT EXISTS `enseres` (
  `COD_ENSERES` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_ENSERES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres_vivienda`
--

CREATE TABLE IF NOT EXISTS `enseres_vivienda` (
  `ENSERES_COD_ENSERES` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_ENSERES_VIVIENDA_ENSERES1_idx` (`ENSERES_COD_ENSERES`),
  KEY `fk_ENSERES_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE IF NOT EXISTS `estado_civil` (
  `COD_EST_CIV` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_EST_CIV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exclusion`
--

CREATE TABLE IF NOT EXISTS `exclusion` (
  `COD_EXCLUSION` int(11) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_EXCLUSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exclusion_planilla`
--

CREATE TABLE IF NOT EXISTS `exclusion_planilla` (
  `CANTIDAD` int(11) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `EXCLUSION_COD_EXCLUSION` int(11) NOT NULL,
  KEY `fk_EXCLUSION_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  KEY `fk_EXCLUSION_PLANILLA_EXCLUSION1_idx` (`EXCLUSION_COD_EXCLUSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_tenencia`
--

CREATE TABLE IF NOT EXISTS `forma_tenencia` (
  `COD_FORM_TEN` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_FORM_TEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_t_vivienda`
--

CREATE TABLE IF NOT EXISTS `forma_t_vivienda` (
  `FORMA_TENENCIA_COD_FORM_TEN` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_FORMA_T_VIVIENDA_FORMA_TENENCIA1_idx` (`FORMA_TENENCIA_COD_FORM_TEN`),
  KEY `fk_FORMA_T_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `COD_GENERO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_GENERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_clasif`
--

CREATE TABLE IF NOT EXISTS `ingresos_clasif` (
  `COD_ING_FAM` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_ING_FAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_instruccion`
--

CREATE TABLE IF NOT EXISTS `nivel_instruccion` (
  `COD_NIV_INST` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_NIV_INST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE IF NOT EXISTS `parentesco` (
  `COD_PARENTESCO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`COD_PARENTESCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `CEDULA` int(11) NOT NULL,
  `APELLIDOS` varchar(45) DEFAULT NULL,
  `NOMBRES` varchar(45) DEFAULT NULL,
  `TELEF_CELULAR` varchar(45) DEFAULT NULL,
  `TELEF_HAB` varchar(45) DEFAULT NULL,
  `GENERO_COD_GENERO` int(11) NOT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  PRIMARY KEY (`ID_PERSONA`),
  KEY `fk_PERSONA_GENERO1_idx` (`GENERO_COD_GENERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_planilla`
--

CREATE TABLE IF NOT EXISTS `persona_planilla` (
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `PERSONA_ID_PERSONA` int(11) NOT NULL,
  `CORREO` varchar(45) DEFAULT NULL,
  `ESTADO_CIVIL_COD_EST_CIV` int(11) NOT NULL,
  `NIVEL_INSTRUCCION_COD_NIV_INST` int(11) NOT NULL,
  `PROFESION_COD_PROFESION` int(11) NOT NULL,
  `TRABAJA` int(11) DEFAULT NULL,
  `TIPO_TRABAJO_COD_TIP_TRAB` int(11) NOT NULL,
  `INGRESO` double DEFAULT NULL,
  `JEFE_FAMILIA` int(11) DEFAULT NULL,
  `PARENTESCO_COD_PARENTESCO` int(11) NOT NULL,
  `ACTIVISTA_COMUNAL` int(11) DEFAULT NULL,
  KEY `fk_PERSONA_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  KEY `fk_PERSONA_PLANILLA_PERSONA1_idx` (`PERSONA_ID_PERSONA`),
  KEY `fk_PERSONA_PLANILLA_ESTADO_CIVIL1_idx` (`ESTADO_CIVIL_COD_EST_CIV`),
  KEY `fk_PERSONA_PLANILLA_NIVEL_INSTRUCCION1_idx` (`NIVEL_INSTRUCCION_COD_NIV_INST`),
  KEY `fk_PERSONA_PLANILLA_PROFESION1_idx` (`PROFESION_COD_PROFESION`),
  KEY `fk_PERSONA_PLANILLA_TIPO_TRABAJO1_idx` (`TIPO_TRABAJO_COD_TIP_TRAB`),
  KEY `fk_PERSONA_PLANILLA_PARENTESCO1_idx` (`PARENTESCO_COD_PARENTESCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla`
--

CREATE TABLE IF NOT EXISTS `planilla` (
  `NRO_PLANILLA` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `VIVIENDA_COD_VIVIENDA` int(11) NOT NULL,
  `ID_PLANILLA` int(11) NOT NULL AUTO_INCREMENT,
  `INGRESOS_CLASIF_COD_ING_FAM` int(11) NOT NULL,
  `NUMERO_FAMILIAS` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(200) DEFAULT NULL,
  `OCV` int(11) DEFAULT NULL,
  `CANT_HAB` int(11) DEFAULT NULL,
  `AYUDA` int(11) DEFAULT NULL,
  `DESCRIPCION_AYUDA` varchar(150) DEFAULT NULL,
  `CENSO_ID_CENSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PLANILLA`),
  KEY `fk_PLANILLA_VIVIENDA1_idx` (`VIVIENDA_COD_VIVIENDA`),
  KEY `fk_PLANILLA_INGRESOS_CLASIF1_idx` (`INGRESOS_CLASIF_COD_ING_FAM`),
  KEY `fk_PLANILLA_CENSO1_idx` (`CENSO_ID_CENSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE IF NOT EXISTS `profesion` (
  `COD_PROFESION` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_PROFESION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `COD_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`COD_ROL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`COD_ROL`, `DESCRIPCION`) VALUES
(1, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salubridad_vivienda`
--

CREATE TABLE IF NOT EXISTS `salubridad_vivienda` (
  `TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_SALUBRIDAD_VIVIENDA_TIPO_SALUBRIDAD1_idx` (`TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD`),
  KEY `fk_SALUBRIDAD_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `COD_SECTOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_SECTOR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_SECTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `COD_SERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_SERVICIO_COD_TIPO_SERV` int(11) NOT NULL,
  PRIMARY KEY (`COD_SERVICIO`),
  KEY `fk_SERVICIO_TIPO_SERVICIO1_idx` (`TIPO_SERVICIO_COD_TIPO_SERV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_vivienda`
--

CREATE TABLE IF NOT EXISTS `servicio_vivienda` (
  `SERVICIO_COD_SERVICIO` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  KEY `fk_SERVICIO_VIVIENDA_SERVICIO1_idx` (`SERVICIO_COD_SERVICIO`),
  KEY `fk_SERVICIO_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_animal`
--

CREATE TABLE IF NOT EXISTS `tipo_animal` (
  `COD_TIPO_ANIMAL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_ANIMAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_caracteristica`
--

CREATE TABLE IF NOT EXISTS `tipo_caracteristica` (
  `COD_CARACTERISTICA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`COD_CARACTERISTICA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salubridad`
--

CREATE TABLE IF NOT EXISTS `tipo_salubridad` (
  `COD_TIPO_SALUBRIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_SALUBRIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `COD_TIPO_SERV` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_SERV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trabajo`
--

CREATE TABLE IF NOT EXISTS `tipo_trabajo` (
  `COD_TIP_TRAB` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_TIP_TRAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vivienda`
--

CREATE TABLE IF NOT EXISTS `tipo_vivienda` (
  `COD_TIPO_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_VIVIENDA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_USER` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `CLAVE` varchar(45) NOT NULL,
  `ROL_COD_ROL` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`),
  KEY `fk_USUARIO_ROL1_idx` (`ROL_COD_ROL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USER`, `NOM_USER`, `APELLIDO`, `USERNAME`, `CLAVE`, `ROL_COD_ROL`) VALUES
(1, 'admin', '', 'admin', 'admin', NULL),
(2, 'Arturo', 'Bernal', 'Lord_Arturo', 'Lord_Arturo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vivienda`
--

CREATE TABLE IF NOT EXISTS `vivienda` (
  `COD_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_VIVIENDA_COD_TIPO_VIVIENDA` int(11) NOT NULL,
  `CALLE_NRO_CALLE` int(11) NOT NULL,
  PRIMARY KEY (`COD_VIVIENDA`),
  KEY `fk_VIVIENDA_TIPO_VIVIENDA_idx` (`TIPO_VIVIENDA_COD_TIPO_VIVIENDA`),
  KEY `fk_VIVIENDA_CALLE1_idx` (`CALLE_NRO_CALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `act_com_vivienda`
--
ALTER TABLE `act_com_vivienda`
  ADD CONSTRAINT `fk_ACT_COM_VIVIENDA_ACT_COMERCIAL1` FOREIGN KEY (`ACT_COMERCIAL_COD_ACT_COM`) REFERENCES `act_comercial` (`COD_ACT_COM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ACT_COM_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_ANIMAL_TIPO_ANIMAL1` FOREIGN KEY (`TIPO_ANIMAL_COD_TIPO_ANIMAL`) REFERENCES `tipo_animal` (`COD_TIPO_ANIMAL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `animal_vivienda`
--
ALTER TABLE `animal_vivienda`
  ADD CONSTRAINT `fk_ANIMAL_VIVIENDA_ANIMAL1` FOREIGN KEY (`ANIMAL_COD_ANIMAL`) REFERENCES `animal` (`COD_ANIMAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ANIMAL_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calle`
--
ALTER TABLE `calle`
  ADD CONSTRAINT `fk_CALLE_SECTOR1` FOREIGN KEY (`SECTOR_COD_SECTOR`) REFERENCES `sector` (`COD_SECTOR`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  ADD CONSTRAINT `fk_CARACTERISTICA_TIPO_CARACTERISTICA1` FOREIGN KEY (`TIPO_CARACTERISTICA_COD_CARACTERISTICA`) REFERENCES `tipo_caracteristica` (`COD_CARACTERISTICA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caract_vivienda`
--
ALTER TABLE `caract_vivienda`
  ADD CONSTRAINT `fk_CARACT_VIVIENDA_CARACTERISTICA1` FOREIGN KEY (`CARACTERISTICA_COD_CARACT_VIVIENDA`) REFERENCES `caracteristica` (`COD_CARACT_VIVIENDA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CARACT_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enfermedad_planilla`
--
ALTER TABLE `enfermedad_planilla`
  ADD CONSTRAINT `fk_ENFERMEDAD_PLANILLA_ENFERMEDAD1` FOREIGN KEY (`ENFERMEDAD_COD_ENF`) REFERENCES `enfermedad` (`COD_ENF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENFERMEDAD_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enseres_vivienda`
--
ALTER TABLE `enseres_vivienda`
  ADD CONSTRAINT `fk_ENSERES_VIVIENDA_ENSERES1` FOREIGN KEY (`ENSERES_COD_ENSERES`) REFERENCES `enseres` (`COD_ENSERES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENSERES_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `exclusion_planilla`
--
ALTER TABLE `exclusion_planilla`
  ADD CONSTRAINT `fk_EXCLUSION_PLANILLA_EXCLUSION1` FOREIGN KEY (`EXCLUSION_COD_EXCLUSION`) REFERENCES `exclusion` (`COD_EXCLUSION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EXCLUSION_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `forma_t_vivienda`
--
ALTER TABLE `forma_t_vivienda`
  ADD CONSTRAINT `fk_FORMA_T_VIVIENDA_FORMA_TENENCIA1` FOREIGN KEY (`FORMA_TENENCIA_COD_FORM_TEN`) REFERENCES `forma_tenencia` (`COD_FORM_TEN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FORMA_T_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_PERSONA_GENERO1` FOREIGN KEY (`GENERO_COD_GENERO`) REFERENCES `genero` (`COD_GENERO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona_planilla`
--
ALTER TABLE `persona_planilla`
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_ESTADO_CIVIL1` FOREIGN KEY (`ESTADO_CIVIL_COD_EST_CIV`) REFERENCES `estado_civil` (`COD_EST_CIV`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_NIVEL_INSTRUCCION1` FOREIGN KEY (`NIVEL_INSTRUCCION_COD_NIV_INST`) REFERENCES `nivel_instruccion` (`COD_NIV_INST`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PARENTESCO1` FOREIGN KEY (`PARENTESCO_COD_PARENTESCO`) REFERENCES `parentesco` (`COD_PARENTESCO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PERSONA1` FOREIGN KEY (`PERSONA_ID_PERSONA`) REFERENCES `persona` (`ID_PERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PROFESION1` FOREIGN KEY (`PROFESION_COD_PROFESION`) REFERENCES `profesion` (`COD_PROFESION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_TIPO_TRABAJO1` FOREIGN KEY (`TIPO_TRABAJO_COD_TIP_TRAB`) REFERENCES `tipo_trabajo` (`COD_TIP_TRAB`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD CONSTRAINT `fk_PLANILLA_CENSO1` FOREIGN KEY (`CENSO_ID_CENSO`) REFERENCES `censo` (`ID_CENSO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLANILLA_INGRESOS_CLASIF1` FOREIGN KEY (`INGRESOS_CLASIF_COD_ING_FAM`) REFERENCES `ingresos_clasif` (`COD_ING_FAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLANILLA_VIVIENDA1` FOREIGN KEY (`VIVIENDA_COD_VIVIENDA`) REFERENCES `vivienda` (`COD_VIVIENDA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salubridad_vivienda`
--
ALTER TABLE `salubridad_vivienda`
  ADD CONSTRAINT `fk_SALUBRIDAD_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SALUBRIDAD_VIVIENDA_TIPO_SALUBRIDAD1` FOREIGN KEY (`TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD`) REFERENCES `tipo_salubridad` (`COD_TIPO_SALUBRIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_SERVICIO_TIPO_SERVICIO1` FOREIGN KEY (`TIPO_SERVICIO_COD_TIPO_SERV`) REFERENCES `tipo_servicio` (`COD_TIPO_SERV`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio_vivienda`
--
ALTER TABLE `servicio_vivienda`
  ADD CONSTRAINT `fk_SERVICIO_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SERVICIO_VIVIENDA_SERVICIO1` FOREIGN KEY (`SERVICIO_COD_SERVICIO`) REFERENCES `servicio` (`COD_SERVICIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_ROL1` FOREIGN KEY (`ROL_COD_ROL`) REFERENCES `rol` (`COD_ROL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vivienda`
--
ALTER TABLE `vivienda`
  ADD CONSTRAINT `fk_VIVIENDA_CALLE1` FOREIGN KEY (`CALLE_NRO_CALLE`) REFERENCES `calle` (`NRO_CALLE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VIVIENDA_TIPO_VIVIENDA` FOREIGN KEY (`TIPO_VIVIENDA_COD_TIPO_VIVIENDA`) REFERENCES `tipo_vivienda` (`COD_TIPO_VIVIENDA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
