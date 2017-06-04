-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2017 a las 08:12:44
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
(2, 'Helados'),
(3, 'Empanadas'),
(4, 'Refrescos'),
(5, 'Cervezas'),
(6, 'Malta'),
(7, 'Hielo'),
(8, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_com_vivienda`
--

CREATE TABLE `act_com_vivienda` (
  `ACT_COMERCIAL_COD_ACT_COM` int(11) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `act_com_vivienda`
--

INSERT INTO `act_com_vivienda` (`ACT_COMERCIAL_COD_ACT_COM`, `PLANILLA_ID_PLANILLA`) VALUES
(2, 12),
(3, 12),
(1, 13),
(8, 13);

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
(4, 'hormigas', 2),
(5, 'ratones', 2),
(6, 'cucarachas', 2),
(7, 'ciempiés', 2),
(8, 'otros', 2),
(9, 'pájaros', 1),
(10, 'gallinas', 1),
(11, 'patos', 1),
(12, 'cochinos', 1),
(13, 'otros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal_vivienda`
--

CREATE TABLE `animal_vivienda` (
  `ANIMAL_COD_ANIMAL` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `animal_vivienda`
--

INSERT INTO `animal_vivienda` (`ANIMAL_COD_ANIMAL`, `DESCRIPCION`, `PLANILLA_ID_PLANILLA`) VALUES
(9, NULL, 12),
(4, NULL, 12);

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
(7, 'calle 25', 1),
(8, 'asfsdfdsfsdf', 2);

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
(6, 'comedor', 1),
(7, 'cocina', 1),
(8, 'baño', 1),
(9, 'tablas', 2),
(10, 'bahareque o adobe', 2),
(11, 'zinc', 2),
(12, 'catón de piedra', 2),
(13, 'otro', 2),
(14, 'tejas', 3),
(15, 'madera', 3),
(16, 'zinc', 3),
(17, 'machihembrado', 3),
(18, 'raso', 3),
(19, 'otro', 3);

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
(5, 12),
(8, 12),
(10, 12),
(17, 12),
(11, 13),
(16, 13);

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
(2, 'diabetes'),
(3, 'sida'),
(4, 'corazón'),
(5, 'hepatitis'),
(6, 'leucemia'),
(7, 'epilepsia'),
(8, 'tubérculos'),
(9, 'hipertensión'),
(10, 'asma'),
(11, 'otras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad_planilla`
--

CREATE TABLE `enfermedad_planilla` (
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `ENFERMEDAD_COD_ENF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedad_planilla`
--

INSERT INTO `enfermedad_planilla` (`PLANILLA_ID_PLANILLA`, `ENFERMEDAD_COD_ENF`) VALUES
(12, 4),
(12, 5);

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
(2, 'cocina'),
(3, 'gabinetes'),
(4, 'camas'),
(5, 'aire acondicionado'),
(6, 'ventilador'),
(7, 'juego de comedor'),
(8, 'muebles de sala'),
(9, 'utensilios de cocina'),
(10, 'tv'),
(11, 'otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres_vivienda`
--

CREATE TABLE `enseres_vivienda` (
  `ENSERES_COD_ENSERES` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enseres_vivienda`
--

INSERT INTO `enseres_vivienda` (`ENSERES_COD_ENSERES`, `PLANILLA_ID_PLANILLA`) VALUES
(2, 12),
(8, 12),
(2, 13);

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
(2, 'Casado(a)'),
(3, 'Divorciado(a)'),
(4, 'Viudo(a)'),
(5, 'Concubino(a)');

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
(2, 'Indigentes'),
(3, 'Enfermos terminales'),
(4, 'Discapacitados'),
(5, 'Tercera edad'),
(6, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exclusion_planilla`
--

CREATE TABLE `exclusion_planilla` (
  `CANTIDAD` int(11) DEFAULT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL,
  `EXCLUSION_COD_EXCLUSION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `exclusion_planilla`
--

INSERT INTO `exclusion_planilla` (`CANTIDAD`, `PLANILLA_ID_PLANILLA`, `EXCLUSION_COD_EXCLUSION`) VALUES
(12, 12, 1),
(12, 12, 4);

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
(2, 'Alquilada'),
(3, 'Compartida'),
(4, 'Invadida'),
(5, 'Traspasada'),
(6, 'Prestada'),
(7, 'Otra');

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
(1, 'Diario'),
(2, 'Semanal'),
(3, 'Quincenal'),
(4, 'Mensual'),
(5, 'Por trabajo realizado');

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
(2, 'Básica'),
(3, 'Bachiller'),
(4, 'Técnico medio'),
(5, 'Técnico superior'),
(6, 'Universitario'),
(7, 'Post Grado');

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
(2, 'Padre'),
(3, 'Primo'),
(4, 'Tío'),
(5, 'Abuelo'),
(6, 'Nieto');

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
(19925695, 'Bernal', 'Arturo', '43242543', '', 1, 62, '1992-06-22'),
(21341880, 'Bernal', 'Raul', NULL, NULL, 1, 63, '2017-06-14'),
(21341881, 'Bernal', 'Julio', NULL, NULL, 1, 64, '2017-06-22'),
(423423, 'sdfsd', 'sdf', '534534543', '', 1, 65, '2017-06-15');

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
(12, 62, 'arturo@arutro.cm', 1, 3, 2, 0, 4, 100000, 1, NULL, 1, 11),
(12, 63, NULL, NULL, 4, 3, NULL, NULL, 20000, NULL, 1, NULL, 12),
(12, 64, NULL, NULL, 7, 4, NULL, NULL, 20000, NULL, 1, NULL, 13),
(13, 65, '', 3, 2, 3, 0, 5, 5345345, 1, NULL, 1, 14);

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
(12, '2017-06-20', 62, 12, 4, 2, 'nada aún', 0, 34, 0, 'njo', 2, 3, 0, 'dfs', 'si', 'no', 'si', 5),
(45, '2017-06-21', 63, 13, 4, 2, 'ffsfsd', 1, 34, 1, 'gfdsfsd', 2, 2, 1, '', '', '', '', NULL);

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
(2, 'Médico'),
(3, 'Docente'),
(4, 'Otra');

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
(4, 'Pozo séptico', 2),
(5, 'Pila pública', 1),
(6, 'Del río', 1),
(7, 'Otros', 1),
(8, 'Letrinas', 2),
(9, 'Al aire libre', 2),
(10, 'Depositada en bolsas', 2),
(11, 'Otros', 2),
(12, 'Bombona', 3),
(13, 'Tubería', 3),
(14, 'No posee', 3),
(15, 'Electrificado público', 4),
(16, 'Planta eléctrica propia', 4),
(17, 'No tiene', 4),
(18, 'Tiene medidor', 4),
(19, 'Aseo urbano', 5),
(20, 'Container', 5),
(21, 'Bajantes', 5),
(22, 'Camión', 5),
(23, 'Al aire libre', 5),
(24, 'Quemada', 5),
(25, 'Otros', 5),
(26, 'Domiciliaria', 6),
(27, 'Celular', 6),
(28, 'Prepago', 6),
(29, 'Centro de conexión', 6),
(30, 'No posee', 6),
(31, 'Otros', 6),
(32, 'Propio', 7),
(33, 'Público', 7),
(34, 'Bestias', 7),
(35, 'Otros', 7),
(36, 'Televisión', 8),
(37, 'Radio', 8),
(38, 'Prensa', 8),
(39, 'Internet', 8),
(40, 'Medios alternativos comunitarios', 8),
(41, 'Otros', 8),
(42, 'Mercado', 9),
(43, 'Abastos', 9),
(44, 'Bodega', 9),
(45, 'Farmacia', 9),
(46, 'Plazas y parques', 9),
(47, 'Preescolar', 9),
(48, 'Escuelas', 9),
(49, 'Liceos', 9),
(50, 'Centro de salud', 9),
(51, 'Canchas', 9),
(52, 'Casa comunal', 9),
(53, 'Iglesias', 9),
(54, 'Otros', 9),
(55, 'Ribas', 10),
(56, 'Sucre', 10),
(57, 'Vuelvan caras', 10),
(58, 'Identidad', 10),
(59, 'Barrio adentro', 10),
(60, 'Mercal', 10),
(61, 'Ezequiel Zamora', 10),
(62, 'Otros', 10),
(63, 'Contraloría seguimiento', 11),
(64, 'Relaciones públicas y medios', 11),
(65, 'Seguridad ciudadana', 11),
(66, 'Infraestructura y servicios públicos', 11),
(67, 'Formación y conciencia ideológica', 11),
(68, 'Elaboración de proyectos comunitarios', 11),
(69, 'Alimentación y nutrición', 11),
(70, 'Educación, cultura y tecnología', 11),
(71, 'Salud, deporte y saneamiento ambiental', 11),
(72, 'Ejecución de programas sociales y misiones', 11),
(73, 'Otros', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_vivienda`
--

CREATE TABLE `servicio_vivienda` (
  `SERVICIO_COD_SERVICIO` int(11) NOT NULL,
  `PLANILLA_ID_PLANILLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio_vivienda`
--

INSERT INTO `servicio_vivienda` (`SERVICIO_COD_SERVICIO`, `PLANILLA_ID_PLANILLA`) VALUES
(5, 12),
(8, 12),
(14, 12),
(15, 12),
(19, 12),
(27, 12),
(33, 12),
(41, 12),
(42, 12),
(61, 12),
(68, 12),
(71, 12);

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
(2, 'sucia'),
(3, 'medianamente limpia'),
(4, 'medianamente sucia'),
(5, 'otro');

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
(2, 'Aguas servidas'),
(3, 'Gas'),
(4, 'Sistema eléctrico'),
(5, 'Recolección de basuras'),
(6, 'Telefonía'),
(7, 'Transporte'),
(8, 'Mecanismos de información'),
(9, 'Servicios comunales'),
(10, '¿Cuáles misiones se están implementando?'),
(11, '¿En cuál vocería le gustaría participar?');

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
(2, 'Privada'),
(3, 'Comercial'),
(4, 'Por cuenta propia'),
(5, 'Buhonería'),
(6, 'Otro');

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
(2, 'Casa'),
(3, 'Apartamento'),
(4, 'Rancho'),
(5, 'Barranco'),
(6, 'Habitación o anexo'),
(7, 'Otro');

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
(62, NULL, 4, 7),
(63, NULL, NULL, 8);

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
  MODIFY `COD_ACT_COM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `COD_ANIMAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `calle`
--
ALTER TABLE `calle`
  MODIFY `NRO_CALLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  MODIFY `COD_CARACT_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `censo`
--
ALTER TABLE `censo`
  MODIFY `ID_CENSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `COD_ENF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `enseres`
--
ALTER TABLE `enseres`
  MODIFY `COD_ENSERES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `COD_EST_CIV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `exclusion`
--
ALTER TABLE `exclusion`
  MODIFY `COD_EXCLUSION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `forma_tenencia`
--
ALTER TABLE `forma_tenencia`
  MODIFY `COD_FORM_TEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `COD_GENERO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ingresos_clasif`
--
ALTER TABLE `ingresos_clasif`
  MODIFY `COD_ING_FAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `nivel_instruccion`
--
ALTER TABLE `nivel_instruccion`
  MODIFY `COD_NIV_INST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `COD_PARENTESCO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT de la tabla `persona_planilla`
--
ALTER TABLE `persona_planilla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `planilla`
--
ALTER TABLE `planilla`
  MODIFY `ID_PLANILLA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `COD_PROFESION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `COD_SERVICIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
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
  MODIFY `COD_TIPO_SALUBRIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `COD_TIPO_SERV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  MODIFY `COD_TIP_TRAB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  MODIFY `COD_TIPO_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `vivienda`
--
ALTER TABLE `vivienda`
  MODIFY `COD_VIVIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
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
