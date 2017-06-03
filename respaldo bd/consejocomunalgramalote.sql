-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2017 a las 06:02:49
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `COD_ANIMAL` int(11) NOT NULL,
  `NOMBRE_ANIMAL` varchar(45) DEFAULT NULL,
  `TIPO_ANIMAL_COD_TIPO_ANIMAL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `animal`
--

INSERT INTO `animal` (`COD_ANIMAL`, `NOMBRE_ANIMAL`, `TIPO_ANIMAL_COD_TIPO_ANIMAL`) VALUES
(1, 'perros', 1),
(2, 'gatos', 1),
(3, 'moscas', 2),
(4, 'hormigas', 2);

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
  `SECTOR_COD_SECTOR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `calle`
--

INSERT INTO `calle` (`NRO_CALLE`, `NOMBRE_CALLE`, `SECTOR_COD_SECTOR`) VALUES
(1, '54645', 2),
(2, '', NULL),
(3, '', NULL),
(4, '', 1),
(5, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE `caracteristica` (
  `COD_CARACT_VIVIENDA` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_CARACTERISTICA_COD_CARACTERISTICA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caracteristica`
--

INSERT INTO `caracteristica` (`COD_CARACT_VIVIENDA`, `DESCRIPCION`, `TIPO_CARACTERISTICA_COD_CARACTERISTICA`) VALUES
(1, 'frisadas', 2),
(2, 'sin frisar', 2),
(3, 'platabanda', 3),
(4, 'asbesto', 3),
(5, 'sala', 1),
(6, 'comedor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caract_vivienda`
--

CREATE TABLE `caract_vivienda` (
  `CARACTERISTICA_COD_CARACT_VIVIENDA` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caract_vivienda`
--

INSERT INTO `caract_vivienda` (`CARACTERISTICA_COD_CARACT_VIVIENDA`, `PLANILLA_ID_PLANILLA`) VALUES
(1, 4),
(3, 4),
(1, 6),
(3, 6),
(1, 8),
(3, 8),
(1, 9),
(3, 9),
(1, 10),
(3, 10);

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

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`COD_ENF`, `DESCRIPCION`) VALUES
(1, 'cáncer'),
(2, 'diabetes');

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

--
-- Volcado de datos para la tabla `enseres`
--

INSERT INTO `enseres` (`COD_ENSERES`, `DESCRIPCION`) VALUES
(1, 'nevera'),
(2, 'cocina');

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

--
-- Volcado de datos para la tabla `exclusion`
--

INSERT INTO `exclusion` (`COD_EXCLUSION`, `NOMBRE`) VALUES
(1, 'Niños de la calle'),
(2, 'Indigentes');

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

--
-- Volcado de datos para la tabla `forma_tenencia`
--

INSERT INTO `forma_tenencia` (`COD_FORM_TEN`, `DESCRIPCION`) VALUES
(1, 'Propia'),
(2, 'Alquilada');

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
(NULL, '', '', '', '', NULL, 33, NULL),
(NULL, '', '', '', '', NULL, 34, NULL),
(NULL, '', '', '', '', NULL, 35, NULL),
(NULL, '', '', '', '', NULL, 36, NULL),
(NULL, '', '', '', '', NULL, 37, NULL),
(NULL, '', '', '', '', NULL, 38, NULL),
(NULL, '', '', '', '', NULL, 39, NULL),
(NULL, '', '', '', '', NULL, 40, NULL),
(NULL, '', '', '', '', NULL, 41, NULL),
(NULL, '', '', '', '', NULL, 42, NULL),
(NULL, '', '', '', '', NULL, 43, NULL),
(NULL, '', '', '', '', NULL, 44, NULL),
(NULL, '', '', '', '', NULL, 45, NULL),
(NULL, '', '', '', '', 1, 46, NULL),
(NULL, '', '', '', '', NULL, 47, NULL),
(NULL, '', '', '', '', NULL, 48, NULL),
(NULL, '', '', '', '', NULL, 49, NULL),
(NULL, '', '', '', '', NULL, 50, NULL),
(NULL, '', '', '', '', NULL, 51, NULL),
(NULL, '', '', '', '', NULL, 52, NULL),
(NULL, '', '', '', '', NULL, 53, NULL),
(NULL, '', '', '', '', NULL, 54, NULL),
(NULL, '', '', '', '', NULL, 55, NULL),
(NULL, '', '', '', '', NULL, 56, NULL),
(NULL, '', '', '', '', NULL, 57, NULL),
(NULL, '', '', '', '', NULL, 58, NULL),
(NULL, '', '', '', '', NULL, 59, NULL),
(NULL, '', '', '', '', NULL, 60, NULL);

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
(4, 54, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4),
(6, 56, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6),
(8, 57, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7),
(9, 58, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8),
(10, 59, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 9);

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
  `CENSO_ID_CENSO` int(11) NOT NULL,
  `COD_SALUBRIDAD` int(11) DEFAULT NULL,
  `organizaciones_comunitarias` int(11) DEFAULT NULL,
  `organizaciones_comunitarias_cuales` varchar(150) DEFAULT NULL,
  `servicio_o_bien` varchar(150) DEFAULT NULL,
  `principales_potencialidades` varchar(150) DEFAULT NULL,
  `principales_problemas` varchar(150) DEFAULT NULL,
  `FORMA_TENENCIA_COD_FORM_TEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planilla`
--

INSERT INTO `planilla` (`NRO_PLANILLA`, `FECHA`, `VIVIENDA_COD_VIVIENDA`, `ID_PLANILLA`, `INGRESOS_CLASIF_COD_ING_FAM`, `NUMERO_FAMILIAS`, `OBSERVACIONES`, `OCV`, `CANT_HAB`, `AYUDA`, `DESCRIPCION_AYUDA`, `CENSO_ID_CENSO`, `COD_SALUBRIDAD`, `organizaciones_comunitarias`, `organizaciones_comunitarias_cuales`, `servicio_o_bien`, `principales_potencialidades`, `principales_problemas`, `FORMA_TENENCIA_COD_FORM_TEN`) VALUES
(5345, NULL, 54, 4, 1, NULL, '', NULL, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(543543, NULL, 56, 6, 1, NULL, '', NULL, NULL, NULL, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6546, '0000-00-00', NULL, 7, 1, NULL, '', NULL, NULL, NULL, '', 1, NULL, NULL, '', '', '', '', NULL),
(6546, '0000-00-00', 57, 8, 1, NULL, '', NULL, NULL, NULL, '', 1, NULL, NULL, '', '', '', '', NULL),
(64, '0000-00-00', 58, 9, 1, NULL, '', NULL, NULL, NULL, '', 1, NULL, NULL, '', '', '', '', NULL),
(543534, '2017-06-22', 59, 10, 1, NULL, '', NULL, NULL, NULL, '', 1, NULL, NULL, '', '', '', '', NULL);

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
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `COD_SECTOR` int(11) NOT NULL,
  `NOMBRE_SECTOR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`COD_SECTOR`, `NOMBRE_SECTOR`) VALUES
(1, 'Sector 1'),
(2, 'Sector 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `COD_SERVICIO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `TIPO_SERVICIO_COD_TIPO_SERV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`COD_SERVICIO`, `DESCRIPCION`, `TIPO_SERVICIO_COD_TIPO_SERV`) VALUES
(1, 'Acueducto', 1),
(2, 'Camión', 1),
(3, 'Cloacas', 2),
(4, 'Pozo séptico', 2);

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

--
-- Volcado de datos para la tabla `tipo_animal`
--

INSERT INTO `tipo_animal` (`COD_TIPO_ANIMAL`, `NOMBRE`) VALUES
(1, 'Animales domesticos'),
(2, 'Insectos y roedores');

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
(3, 'Tipo de techo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salubridad`
--

CREATE TABLE `tipo_salubridad` (
  `COD_TIPO_SALUBRIDAD` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_salubridad`
--

INSERT INTO `tipo_salubridad` (`COD_TIPO_SALUBRIDAD`, `DESCRIPCION`) VALUES
(1, 'limpia'),
(2, 'sucia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `COD_TIPO_SERV` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`COD_TIPO_SERV`, `DESCRIPCION`) VALUES
(1, 'Aguas blancas'),
(2, 'Aguas servidas');

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
(54, NULL, NULL, NULL),
(55, NULL, NULL, NULL),
(56, NULL, NULL, 1),
(57, NULL, NULL, 2),
(58, NULL, NULL, 3),
(59, NULL, NULL, 4),
(60, NULL, NULL, 5);

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
  ADD KEY `fk_PLANILLA_CENSO1_idx` (`CENSO_ID_CENSO`),
  ADD KEY `fk_PLANILLA_SALUBRIDAD1` (`COD_SALUBRIDAD`),
  ADD KEY `fk_PLANILLA_FORMA_TENENCIA1` (`FORMA_TENENCIA_COD_FORM_TEN`);

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
  MODIFY `COD_ANIMAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `calle`
--
ALTER TABLE `calle`
  MODIFY `NRO_CALLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  MODIFY `COD_CARACT_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `censo`
--
ALTER TABLE `censo`
  MODIFY `ID_CENSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `COD_ENF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `enseres`
--
ALTER TABLE `enseres`
  MODIFY `COD_ENSERES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `COD_EST_CIV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `exclusion`
--
ALTER TABLE `exclusion`
  MODIFY `COD_EXCLUSION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `forma_tenencia`
--
ALTER TABLE `forma_tenencia`
  MODIFY `COD_FORM_TEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `ID_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `persona_planilla`
--
ALTER TABLE `persona_planilla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `planilla`
--
ALTER TABLE `planilla`
  MODIFY `ID_PLANILLA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `COD_SECTOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `COD_SERVICIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_animal`
--
ALTER TABLE `tipo_animal`
  MODIFY `COD_TIPO_ANIMAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_caracteristica`
--
ALTER TABLE `tipo_caracteristica`
  MODIFY `COD_CARACTERISTICA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_salubridad`
--
ALTER TABLE `tipo_salubridad`
  MODIFY `COD_TIPO_SALUBRIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `COD_TIPO_SERV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `COD_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
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
  ADD CONSTRAINT `fk_ANIMAL_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_ENFERMEDAD_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `enseres_vivienda`
--
ALTER TABLE `enseres_vivienda`
  ADD CONSTRAINT `fk_ENSERES_VIVIENDA_ENSERES1` FOREIGN KEY (`ENSERES_COD_ENSERES`) REFERENCES `enseres` (`COD_ENSERES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENSERES_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `exclusion_planilla`
--
ALTER TABLE `exclusion_planilla`
  ADD CONSTRAINT `fk_EXCLUSION_PLANILLA_EXCLUSION1` FOREIGN KEY (`EXCLUSION_COD_EXCLUSION`) REFERENCES `exclusion` (`COD_EXCLUSION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EXCLUSION_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PERSONA1` FOREIGN KEY (`PERSONA_ID_PERSONA`) REFERENCES `persona` (`ID_PERSONA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_PROFESION1` FOREIGN KEY (`PROFESION_COD_PROFESION`) REFERENCES `profesion` (`COD_PROFESION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PERSONA_PLANILLA_TIPO_TRABAJO1` FOREIGN KEY (`TIPO_TRABAJO_COD_TIP_TRAB`) REFERENCES `tipo_trabajo` (`COD_TIP_TRAB`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD CONSTRAINT `fk_PLANILLA_CENSO1` FOREIGN KEY (`CENSO_ID_CENSO`) REFERENCES `censo` (`ID_CENSO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLANILLA_FORMA_TENENCIA1` FOREIGN KEY (`FORMA_TENENCIA_COD_FORM_TEN`) REFERENCES `forma_tenencia` (`COD_FORM_TEN`),
  ADD CONSTRAINT `fk_PLANILLA_INGRESOS_CLASIF1` FOREIGN KEY (`INGRESOS_CLASIF_COD_ING_FAM`) REFERENCES `ingresos_clasif` (`COD_ING_FAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLANILLA_SALUBRIDAD1` FOREIGN KEY (`COD_SALUBRIDAD`) REFERENCES `tipo_salubridad` (`COD_TIPO_SALUBRIDAD`),
  ADD CONSTRAINT `fk_PLANILLA_VIVIENDA1` FOREIGN KEY (`VIVIENDA_COD_VIVIENDA`) REFERENCES `vivienda` (`COD_VIVIENDA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_SERVICIO_TIPO_SERVICIO1` FOREIGN KEY (`TIPO_SERVICIO_COD_TIPO_SERV`) REFERENCES `tipo_servicio` (`COD_TIPO_SERV`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio_vivienda`
--
ALTER TABLE `servicio_vivienda`
  ADD CONSTRAINT `fk_SERVICIO_VIVIENDA_PLANILLA1` FOREIGN KEY (`PLANILLA_ID_PLANILLA`) REFERENCES `planilla` (`ID_PLANILLA`) ON DELETE CASCADE ON UPDATE CASCADE,
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
