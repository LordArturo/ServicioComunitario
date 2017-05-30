-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2017 a las 10:49:47
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consejocomunalgramalote`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_comercial`
--

CREATE TABLE `act_comercial` (
  `COD_ACT_COM` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `act_comercial`
--

INSERT INTO `act_comercial` (`COD_ACT_COM`, `DESCRIPCION`) VALUES
(1, 'Dulces'),
(2, 'Helados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_com_vivienda`
--

CREATE TABLE `act_com_vivienda` (
  `ACT_COMERCIAL_COD_ACT_COM` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `act_com_vivienda`
--

INSERT INTO `act_com_vivienda` (`ACT_COMERCIAL_COD_ACT_COM`, `PLANILLA_ID_PLANILLA`) VALUES
(2, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `COD_ANIMAL` int(11) NOT NULL,
  `NOMBRE_ANIMAL` varchar(45) DEFAULT NULL,
  `TIPO_ANIMAL_COD_TIPO_ANIMAL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal_vivienda`
--

CREATE TABLE `animal_vivienda` (
  `ANIMAL_COD_ANIMAL` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

CREATE TABLE `calle` (
  `NRO_CALLE` int(11) NOT NULL,
  `NOMBRE_CALLE` varchar(45) DEFAULT NULL,
  `SECTOR_COD_SECTOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE `caracteristica` (
  `COD_CARACT_VIVIENDA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_CARACTERISTICA_COD_CARACTERISTICA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caract_vivienda`
--

CREATE TABLE `caract_vivienda` (
  `CARACTERISTICA_COD_CARACT_VIVIENDA` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `censo`
--

CREATE TABLE `censo` (
  `ID_CENSO` int(11) NOT NULL,
  `ANO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `censo`
--

INSERT INTO `censo` (`ID_CENSO`, `ANO`, `DESCRIPCION`) VALUES
(1, 2012, 'Censo del año 2012'),
(2, 2017, 'otro mas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `COD_ENF` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad_planilla`
--

CREATE TABLE `enfermedad_planilla` (
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `ENFERMEDAD_COD_ENF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres`
--

CREATE TABLE `enseres` (
  `COD_ENSERES` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres_vivienda`
--

CREATE TABLE `enseres_vivienda` (
  `ENSERES_COD_ENSERES` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `COD_EST_CIV` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`COD_EST_CIV`, `DESCRIPCION`) VALUES
(1, 'Soltero(a)'),
(2, 'Casado(a)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exclusion`
--

CREATE TABLE `exclusion` (
  `COD_EXCLUSION` int(11) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exclusion_planilla`
--

CREATE TABLE `exclusion_planilla` (
  `CANTIDAD` int(11) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `EXCLUSION_COD_EXCLUSION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_tenencia`
--

CREATE TABLE `forma_tenencia` (
  `COD_FORM_TEN` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_t_vivienda`
--

CREATE TABLE `forma_t_vivienda` (
  `FORMA_TENENCIA_COD_FORM_TEN` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `COD_GENERO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`COD_GENERO`, `DESCRIPCION`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_clasif`
--

CREATE TABLE `ingresos_clasif` (
  `COD_ING_FAM` int(11) NOT NULL,
  `VALOR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingresos_clasif`
--

INSERT INTO `ingresos_clasif` (`COD_ING_FAM`, `VALOR`) VALUES
(1, 'mucho'),
(2, 'poco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_instruccion`
--

CREATE TABLE `nivel_instruccion` (
  `COD_NIV_INST` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivel_instruccion`
--

INSERT INTO `nivel_instruccion` (`COD_NIV_INST`, `DESCRIPCION`) VALUES
(1, 'Sin instrucción'),
(2, 'Básica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `COD_PARENTESCO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`COD_PARENTESCO`, `DESCRIPCION`) VALUES
(1, 'Hermano'),
(2, 'Padre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `CEDULA` int(11) DEFAULT NULL,
  `APELLIDOS` varchar(45) DEFAULT NULL,
  `NOMBRES` varchar(45) DEFAULT NULL,
  `TELEF_CELULAR` varchar(45) DEFAULT NULL,
  `TELEF_HAB` varchar(45) DEFAULT NULL,
  `GENERO_COD_GENERO` int(11) DEFAULT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`CEDULA`, `APELLIDOS`, `NOMBRES`, `TELEF_CELULAR`, `TELEF_HAB`, `GENERO_COD_GENERO`, `ID_PERSONA`, `FECHA_NACIMIENTO`) VALUES
(1, '1', '1', NULL, NULL, NULL, 1, NULL),
(NULL, '', '', '', '', NULL, 2, NULL),
(NULL, '', '', '', '', NULL, 3, NULL),
(NULL, '', '', '', '', NULL, 4, NULL),
(NULL, '', '', '', '', NULL, 5, NULL),
(NULL, '', '', '', '', NULL, 6, NULL),
(NULL, '', '', '', '', NULL, 7, NULL),
(NULL, '', '', '', '', NULL, 8, NULL),
(NULL, '', '', '', '', NULL, 9, NULL),
(NULL, '', '', '', '', NULL, 10, NULL),
(NULL, '', '', '', '', NULL, 11, NULL),
(NULL, '', '', '', '', NULL, 12, NULL),
(NULL, '', '', '', '', NULL, 13, NULL),
(NULL, '', 'ar', '', '', NULL, 14, NULL),
(NULL, '', 'ar', '', '', NULL, 15, NULL),
(NULL, '', 'ar', '', '', NULL, 16, NULL),
(NULL, '', 'ar', '', '', NULL, 17, NULL),
(NULL, '', 'ar', '', '', NULL, 18, NULL),
(NULL, '', 'ar', '', '', NULL, 19, NULL),
(NULL, '', 'ar', '', '', NULL, 20, NULL),
(NULL, '', 'ar', '', '', NULL, 21, NULL),
(NULL, '', '', '', '', NULL, 22, NULL),
(NULL, '', '', '', '', NULL, 23, NULL),
(NULL, '', '', '', '', NULL, 24, NULL),
(NULL, '', '', '', '', NULL, 25, NULL),
(NULL, '', '', '', '', NULL, 26, NULL),
(NULL, '', 'arttt', '', '', NULL, 27, NULL),
(NULL, '', 'bb', NULL, NULL, NULL, 28, NULL),
(NULL, '', 'nn', NULL, NULL, NULL, 29, NULL),
(NULL, '', 'd', NULL, NULL, NULL, 30, NULL),
(NULL, '', '', '', '', NULL, 31, NULL),
(NULL, '', '', '', '', NULL, 32, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_planilla`
--

CREATE TABLE `persona_planilla` (
  `PLANILLA_ID_PLANILLA` int(11) DEFAULT NULL,
  `PERSONA_ID_PERSONA` int(11) DEFAULT NULL,
  `CORREO` varchar(45) DEFAULT NULL,
  `ESTADO_CIVIL_COD_EST_CIV` int(11) DEFAULT NULL,
  `NIVEL_INSTRUCCION_COD_NIV_INST` int(11) DEFAULT NULL,
  `PROFESION_COD_PROFESION` int(11) DEFAULT NULL,
  `TRABAJA` int(11) DEFAULT NULL,
  `TIPO_TRABAJO_COD_TIP_TRAB` int(11) DEFAULT NULL,
  `INGRESO` double DEFAULT NULL,
  `JEFE_FAMILIA` int(11) DEFAULT NULL,
  `PARENTESCO_COD_PARENTESCO` int(11) DEFAULT NULL,
  `ACTIVISTA_COMUNAL` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_planilla`
--

INSERT INTO `persona_planilla` (`PLANILLA_ID_PLANILLA`, `PERSONA_ID_PERSONA`, `CORREO`, `ESTADO_CIVIL_COD_EST_CIV`, `NIVEL_INSTRUCCION_COD_NIV_INST`, `PROFESION_COD_PROFESION`, `TRABAJA`, `TIPO_TRABAJO_COD_TIP_TRAB`, `INGRESO`, `JEFE_FAMILIA`, `PARENTESCO_COD_PARENTESCO`, `ACTIVISTA_COMUNAL`, `ID`) VALUES
(21, 1, '', NULL, NULL, NULL, 1, NULL, 1, 1, NULL, NULL, 3),
(22, 2, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4),
(23, 3, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5),
(24, 4, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6),
(NULL, NULL, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(25, 5, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8),
(25, 6, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(26, 7, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 10),
(27, 8, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11),
(28, 9, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 12),
(29, 10, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 13),
(30, 11, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 14),
(31, 12, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 15),
(32, 13, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 16),
(33, 14, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17),
(33, 15, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(33, 16, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19),
(33, 17, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20),
(33, 18, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(33, 19, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22),
(33, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23),
(33, 21, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24),
(34, 22, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 25),
(35, 23, '', NULL, NULL, NULL, NULL, NULL, 5000, 1, NULL, NULL, 26),
(36, 24, '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, 27),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 28),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 29),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 30),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34),
(37, 25, '', NULL, NULL, NULL, NULL, NULL, 44, 1, NULL, NULL, 35),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, 36),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, 37),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, 38),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42),
(38, 26, '', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 43),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 44),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 45),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 46),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 47),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 48),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50),
(39, 27, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 51),
(39, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52),
(39, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53),
(39, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54),
(40, 31, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 55),
(41, 32, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla`
--

CREATE TABLE `planilla` (
  `NRO_PLANILLA` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `VIVIENDA_COD_VIVIENDA` int(11) DEFAULT NULL,
  `ID_PLANILLA` int(11) NOT NULL,
  `INGRESOS_CLASIF_COD_ING_FAM` int(11) NOT NULL,
  `NUMERO_FAMILIAS` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(200) DEFAULT NULL,
  `OCV` int(11) DEFAULT NULL,
  `CANT_HAB` int(11) DEFAULT NULL,
  `AYUDA` int(11) DEFAULT NULL,
  `DESCRIPCION_AYUDA` varchar(150) DEFAULT NULL,
  `CENSO_ID_CENSO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planilla`
--

INSERT INTO `planilla` (`NRO_PLANILLA`, `FECHA`, `VIVIENDA_COD_VIVIENDA`, `ID_PLANILLA`, `INGRESOS_CLASIF_COD_ING_FAM`, `NUMERO_FAMILIAS`, `OBSERVACIONES`, `OCV`, `CANT_HAB`, `AYUDA`, `DESCRIPCION_AYUDA`, `CENSO_ID_CENSO`) VALUES
(43, NULL, 11, 20, 1, NULL, '', NULL, NULL, NULL, '', 1),
(43, NULL, 12, 21, 1, NULL, '', NULL, NULL, NULL, '', 1),
(435, NULL, 13, 22, 2, NULL, '', NULL, NULL, NULL, '', 1),
(435, NULL, 14, 23, 2, NULL, '', NULL, NULL, NULL, '', 1),
(435, NULL, 15, 24, 2, NULL, '', NULL, NULL, NULL, '', 1),
(12, NULL, 16, 25, 1, NULL, '', NULL, NULL, NULL, '', 1),
(5435, NULL, 17, 26, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5435, NULL, 18, 27, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5435, NULL, 19, 28, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5435, NULL, 20, 29, 1, NULL, '', NULL, NULL, NULL, '', 1),
(543, NULL, 21, 30, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5345, NULL, 22, 31, 1, NULL, '', NULL, NULL, NULL, '', 1),
(4444, NULL, 23, 32, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5435, NULL, 24, 33, 1, NULL, '', NULL, NULL, NULL, '', 1),
(3434, NULL, 25, 34, 1, NULL, '', NULL, NULL, NULL, '', 2),
(5345, NULL, 26, 35, 1, NULL, '', NULL, NULL, NULL, '', 2),
(56, NULL, 27, 36, 1, NULL, '', NULL, NULL, NULL, '', 1),
(4444, NULL, 28, 37, 1, NULL, '', NULL, NULL, NULL, '', 1),
(54, NULL, 29, 38, 1, NULL, '', NULL, NULL, NULL, '', 2),
(43534, NULL, 30, 39, 1, NULL, '', NULL, NULL, NULL, '', 1),
(534, NULL, 31, 40, 1, NULL, '', NULL, NULL, NULL, '', 1),
(534, NULL, 32, 41, 1, NULL, '', NULL, NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `COD_PROFESION` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`COD_PROFESION`, `DESCRIPCION`) VALUES
(1, 'Ingeniero'),
(2, 'Doctor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `COD_ROL` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`COD_ROL`, `DESCRIPCION`) VALUES
(1, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salubridad_vivienda`
--

CREATE TABLE `salubridad_vivienda` (
  `TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `COD_SECTOR` int(11) NOT NULL,
  `NOMBRE_SECTOR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `COD_SERVICIO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_SERVICIO_COD_TIPO_SERV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_vivienda`
--

CREATE TABLE `servicio_vivienda` (
  `SERVICIO_COD_SERVICIO` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_animal`
--

CREATE TABLE `tipo_animal` (
  `COD_TIPO_ANIMAL` int(11) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_caracteristica`
--

CREATE TABLE `tipo_caracteristica` (
  `COD_CARACTERISTICA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_caracteristica`
--

INSERT INTO `tipo_caracteristica` (`COD_CARACTERISTICA`, `DESCRIPCION`) VALUES
(1, 'Habitaciones de vivienda'),
(2, 'Tipo de Paredes'),
(3, 'Tipo de techos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salubridad`
--

CREATE TABLE `tipo_salubridad` (
  `COD_TIPO_SALUBRIDAD` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `COD_TIPO_SERV` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trabajo`
--

CREATE TABLE `tipo_trabajo` (
  `COD_TIP_TRAB` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_trabajo`
--

INSERT INTO `tipo_trabajo` (`COD_TIP_TRAB`, `DESCRIPCION`) VALUES
(1, 'Pública'),
(2, 'Privada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vivienda`
--

CREATE TABLE `tipo_vivienda` (
  `COD_TIPO_VIVIENDA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_vivienda`
--

INSERT INTO `tipo_vivienda` (`COD_TIPO_VIVIENDA`, `DESCRIPCION`) VALUES
(1, 'Quinta'),
(2, 'Casa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USER` int(11) NOT NULL,
  `NOM_USER` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `CLAVE` varchar(45) NOT NULL,
  `ROL_COD_ROL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `vivienda` (
  `COD_VIVIENDA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_VIVIENDA_COD_TIPO_VIVIENDA` int(11) DEFAULT NULL,
  `CALLE_NRO_CALLE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vivienda`
--

INSERT INTO `vivienda` (`COD_VIVIENDA`, `DESCRIPCION`, `TIPO_VIVIENDA_COD_TIPO_VIVIENDA`, `CALLE_NRO_CALLE`) VALUES
(4, '', NULL, NULL),
(5, 'nmflsdi', NULL, NULL),
(6, 'fsd', 1, NULL),
(7, 'casa', 1, NULL),
(8, 'casa1', 2, NULL),
(9, 'fsdf', 1, NULL),
(10, 'fsdf', 1, NULL),
(11, 'fsdf', 1, NULL),
(12, 'fsdf', 1, NULL),
(13, '', NULL, NULL),
(14, '', NULL, NULL),
(15, '', NULL, NULL),
(16, '', NULL, NULL),
(17, '', NULL, NULL),
(18, '', NULL, NULL),
(19, '', NULL, NULL),
(20, '', NULL, NULL),
(21, '', NULL, NULL),
(22, '', NULL, NULL),
(23, '', NULL, NULL),
(24, '', NULL, NULL),
(25, '', NULL, NULL),
(26, '', NULL, NULL),
(27, '', NULL, NULL),
(28, '', NULL, NULL),
(29, '', NULL, NULL),
(30, '', NULL, NULL),
(31, '', NULL, NULL),
(32, '', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `act_comercial`
--
ALTER TABLE `act_comercial`
  ADD PRIMARY KEY (`COD_ACT_COM`);

--
-- Indices de la tabla `act_com_vivienda`
--
ALTER TABLE `act_com_vivienda`
  ADD KEY `fk_ACT_COM_VIVIENDA_ACT_COMERCIAL1_idx` (`ACT_COMERCIAL_COD_ACT_COM`),
  ADD KEY `fk_ACT_COM_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`COD_ANIMAL`),
  ADD KEY `fk_ANIMAL_TIPO_ANIMAL1_idx` (`TIPO_ANIMAL_COD_TIPO_ANIMAL`);

--
-- Indices de la tabla `animal_vivienda`
--
ALTER TABLE `animal_vivienda`
  ADD KEY `fk_ANIMAL_VIVIENDA_ANIMAL1_idx` (`ANIMAL_COD_ANIMAL`),
  ADD KEY `fk_ANIMAL_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `calle`
--
ALTER TABLE `calle`
  ADD PRIMARY KEY (`NRO_CALLE`),
  ADD KEY `fk_CALLE_SECTOR1_idx` (`SECTOR_COD_SECTOR`);

--
-- Indices de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  ADD PRIMARY KEY (`COD_CARACT_VIVIENDA`),
  ADD KEY `fk_CARACTERISTICA_TIPO_CARACTERISTICA1_idx` (`TIPO_CARACTERISTICA_COD_CARACTERISTICA`);

--
-- Indices de la tabla `caract_vivienda`
--
ALTER TABLE `caract_vivienda`
  ADD KEY `fk_CARACT_VIVIENDA_CARACTERISTICA1_idx` (`CARACTERISTICA_COD_CARACT_VIVIENDA`),
  ADD KEY `fk_CARACT_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `censo`
--
ALTER TABLE `censo`
  ADD PRIMARY KEY (`ID_CENSO`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`COD_ENF`);

--
-- Indices de la tabla `enfermedad_planilla`
--
ALTER TABLE `enfermedad_planilla`
  ADD KEY `fk_ENFERMEDAD_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  ADD KEY `fk_ENFERMEDAD_PLANILLA_ENFERMEDAD1_idx` (`ENFERMEDAD_COD_ENF`);

--
-- Indices de la tabla `enseres`
--
ALTER TABLE `enseres`
  ADD PRIMARY KEY (`COD_ENSERES`);

--
-- Indices de la tabla `enseres_vivienda`
--
ALTER TABLE `enseres_vivienda`
  ADD KEY `fk_ENSERES_VIVIENDA_ENSERES1_idx` (`ENSERES_COD_ENSERES`),
  ADD KEY `fk_ENSERES_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`COD_EST_CIV`);

--
-- Indices de la tabla `exclusion`
--
ALTER TABLE `exclusion`
  ADD PRIMARY KEY (`COD_EXCLUSION`);

--
-- Indices de la tabla `exclusion_planilla`
--
ALTER TABLE `exclusion_planilla`
  ADD KEY `fk_EXCLUSION_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  ADD KEY `fk_EXCLUSION_PLANILLA_EXCLUSION1_idx` (`EXCLUSION_COD_EXCLUSION`);

--
-- Indices de la tabla `forma_tenencia`
--
ALTER TABLE `forma_tenencia`
  ADD PRIMARY KEY (`COD_FORM_TEN`);

--
-- Indices de la tabla `forma_t_vivienda`
--
ALTER TABLE `forma_t_vivienda`
  ADD KEY `fk_FORMA_T_VIVIENDA_FORMA_TENENCIA1_idx` (`FORMA_TENENCIA_COD_FORM_TEN`),
  ADD KEY `fk_FORMA_T_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`COD_GENERO`);

--
-- Indices de la tabla `ingresos_clasif`
--
ALTER TABLE `ingresos_clasif`
  ADD PRIMARY KEY (`COD_ING_FAM`);

--
-- Indices de la tabla `nivel_instruccion`
--
ALTER TABLE `nivel_instruccion`
  ADD PRIMARY KEY (`COD_NIV_INST`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`COD_PARENTESCO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID_PERSONA`),
  ADD KEY `fk_PERSONA_GENERO1_idx` (`GENERO_COD_GENERO`);

--
-- Indices de la tabla `persona_planilla`
--
ALTER TABLE `persona_planilla`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_PERSONA_PLANILLA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`),
  ADD KEY `fk_PERSONA_PLANILLA_PERSONA1_idx` (`PERSONA_ID_PERSONA`),
  ADD KEY `fk_PERSONA_PLANILLA_ESTADO_CIVIL1_idx` (`ESTADO_CIVIL_COD_EST_CIV`),
  ADD KEY `fk_PERSONA_PLANILLA_NIVEL_INSTRUCCION1_idx` (`NIVEL_INSTRUCCION_COD_NIV_INST`),
  ADD KEY `fk_PERSONA_PLANILLA_PROFESION1_idx` (`PROFESION_COD_PROFESION`),
  ADD KEY `fk_PERSONA_PLANILLA_TIPO_TRABAJO1_idx` (`TIPO_TRABAJO_COD_TIP_TRAB`),
  ADD KEY `fk_PERSONA_PLANILLA_PARENTESCO1_idx` (`PARENTESCO_COD_PARENTESCO`);

--
-- Indices de la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD PRIMARY KEY (`ID_PLANILLA`),
  ADD KEY `fk_PLANILLA_VIVIENDA1_idx` (`VIVIENDA_COD_VIVIENDA`),
  ADD KEY `fk_PLANILLA_INGRESOS_CLASIF1_idx` (`INGRESOS_CLASIF_COD_ING_FAM`),
  ADD KEY `fk_PLANILLA_CENSO1_idx` (`CENSO_ID_CENSO`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`COD_PROFESION`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`COD_ROL`);

--
-- Indices de la tabla `salubridad_vivienda`
--
ALTER TABLE `salubridad_vivienda`
  ADD KEY `fk_SALUBRIDAD_VIVIENDA_TIPO_SALUBRIDAD1_idx` (`TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD`),
  ADD KEY `fk_SALUBRIDAD_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`COD_SECTOR`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`COD_SERVICIO`),
  ADD KEY `fk_SERVICIO_TIPO_SERVICIO1_idx` (`TIPO_SERVICIO_COD_TIPO_SERV`);

--
-- Indices de la tabla `servicio_vivienda`
--
ALTER TABLE `servicio_vivienda`
  ADD KEY `fk_SERVICIO_VIVIENDA_SERVICIO1_idx` (`SERVICIO_COD_SERVICIO`),
  ADD KEY `fk_SERVICIO_VIVIENDA_PLANILLA1_idx` (`PLANILLA_ID_PLANILLA`);

--
-- Indices de la tabla `tipo_animal`
--
ALTER TABLE `tipo_animal`
  ADD PRIMARY KEY (`COD_TIPO_ANIMAL`);

--
-- Indices de la tabla `tipo_caracteristica`
--
ALTER TABLE `tipo_caracteristica`
  ADD PRIMARY KEY (`COD_CARACTERISTICA`);

--
-- Indices de la tabla `tipo_salubridad`
--
ALTER TABLE `tipo_salubridad`
  ADD PRIMARY KEY (`COD_TIPO_SALUBRIDAD`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`COD_TIPO_SERV`);

--
-- Indices de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  ADD PRIMARY KEY (`COD_TIP_TRAB`);

--
-- Indices de la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  ADD PRIMARY KEY (`COD_TIPO_VIVIENDA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `fk_USUARIO_ROL1_idx` (`ROL_COD_ROL`);

--
-- Indices de la tabla `vivienda`
--
ALTER TABLE `vivienda`
  ADD PRIMARY KEY (`COD_VIVIENDA`),
  ADD KEY `fk_VIVIENDA_TIPO_VIVIENDA_idx` (`TIPO_VIVIENDA_COD_TIPO_VIVIENDA`),
  ADD KEY `fk_VIVIENDA_CALLE1_idx` (`CALLE_NRO_CALLE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `act_comercial`
--
ALTER TABLE `act_comercial`
  MODIFY `COD_ACT_COM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `COD_ANIMAL` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `calle`
--
ALTER TABLE `calle`
  MODIFY `NRO_CALLE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  MODIFY `COD_CARACT_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `censo`
--
ALTER TABLE `censo`
  MODIFY `ID_CENSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `COD_ENF` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `enseres`
--
ALTER TABLE `enseres`
  MODIFY `COD_ENSERES` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `COD_EST_CIV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `forma_tenencia`
--
ALTER TABLE `forma_tenencia`
  MODIFY `COD_FORM_TEN` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `COD_GENERO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ingresos_clasif`
--
ALTER TABLE `ingresos_clasif`
  MODIFY `COD_ING_FAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `nivel_instruccion`
--
ALTER TABLE `nivel_instruccion`
  MODIFY `COD_NIV_INST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `COD_PARENTESCO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `persona_planilla`
--
ALTER TABLE `persona_planilla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `planilla`
--
ALTER TABLE `planilla`
  MODIFY `ID_PLANILLA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `COD_PROFESION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `COD_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `COD_SECTOR` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `COD_SERVICIO` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_animal`
--
ALTER TABLE `tipo_animal`
  MODIFY `COD_TIPO_ANIMAL` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_caracteristica`
--
ALTER TABLE `tipo_caracteristica`
  MODIFY `COD_CARACTERISTICA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_salubridad`
--
ALTER TABLE `tipo_salubridad`
  MODIFY `COD_TIPO_SALUBRIDAD` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `COD_TIPO_SERV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  MODIFY `COD_TIP_TRAB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  MODIFY `COD_TIPO_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `vivienda`
--
ALTER TABLE `vivienda`
  MODIFY `COD_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `act_com_vivienda`
--
ALTER TABLE `act_com_vivienda`
  ADD CONSTRAINT `fk_ACT_COM_VIVIENDA_ACT_COMERCIAL1` FOREIGN KEY (`ACT_COMERCIAL_COD_ACT_COM`) REFERENCES `act_comercial` (`COD_ACT_COM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ACT_COM_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_CARACTERISTICA_TIPO_CARACTERISTICA1` FOREIGN KEY (`TIPO_CARACTERISTICA_COD_CARACTERISTICA`) REFERENCES `tipo_caracteristica` (`COD_CARACTERISTICA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `caract_vivienda`
--
ALTER TABLE `caract_vivienda`
  ADD CONSTRAINT `fk_CARACT_VIVIENDA_CARACTERISTICA` FOREIGN KEY (`CARACTERISTICA_COD_CARACT_VIVIENDA`) REFERENCES `caracteristica` (`COD_CARACT_VIVIENDA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CARACT_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

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
