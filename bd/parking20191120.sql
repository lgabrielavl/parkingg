-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2019 a las 13:53:52
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parking`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcli` bigint(12) NOT NULL,
  `nomcli` varchar(60) DEFAULT NULL,
  `telcli` varchar(13) DEFAULT NULL,
  `emacli` varchar(60) DEFAULT NULL,
  `codubi` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf`
--

CREATE TABLE `conf` (
  `idconf` int(5) NOT NULL,
  `nitconf` int(12) DEFAULT NULL,
  `nomconf` varchar(40) DEFAULT NULL,
  `dirconf` varchar(80) DEFAULT NULL,
  `telconf` int(12) DEFAULT NULL,
  `logconf` varchar(100) NOT NULL,
  `emaconf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nofac` int(5) NOT NULL,
  `idcli` bigint(12) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `idtveh` int(2) NOT NULL,
  `feing` datetime NOT NULL,
  `fesal` datetime NOT NULL,
  `precio` bigint(15) NOT NULL,
  `iusu` bigint(12) NOT NULL,
  `idturn` int(5) NOT NULL,
  `codubi` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `pagid` bigint(11) NOT NULL,
  `pagnom` varchar(40) DEFAULT NULL,
  `pagarc` varchar(100) DEFAULT NULL,
  `pagmos` int(3) DEFAULT NULL,
  `pagord` int(3) NOT NULL,
  `pagmen` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`pagid`, `pagnom`, `pagarc`, `pagmos`, `pagord`, `pagmen`) VALUES
(200, 'Salir', 'vista/vsalir.php', 1, 50, 'Home'),
(201, 'Iniciar', 'vista/vini.php', 1, 1, 'Index'),
(203, 'Pagina', 'vista/vpag.php', 1, 31, 'Home'),
(204, 'Perfil', 'vista/vpef.php', 1, 32, 'Home'),
(205, 'Usuario', 'vista/vper.php', 1, 33, 'Home'),
(206, 'Configuracion', 'vista/vconf.php', 1, 4, 'Home'),
(300, 'Cliente', 'vista/vcli.php', 1, 6, 'Home'),
(301, 'Turno', 'vista/vtur.php', 1, 9, 'Home'),
(302, 'Factura', 'vista/vfac.php', 1, 10, 'Home'),
(303, 'Tipo Vehiculo', 'vista/vtveh.php', 1, 7, 'Home'),
(304, 'Tarifa', 'vista/vtar.php', 1, 8, 'Home'),
(305, 'Vigencia', 'vista/vvig.php', 1, 5, 'Home');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagper`
--

CREATE TABLE `pagper` (
  `pagid` bigint(11) DEFAULT NULL,
  `pefid` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagper`
--

INSERT INTO `pagper` (`pagid`, `pefid`) VALUES
(200, 1),
(201, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(200, 2),
(300, 2),
(301, 2),
(302, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `pefid` int(4) NOT NULL,
  `pefnom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`pefid`, `pefnom`) VALUES
(1, 'Administrador'),
(2, 'Facturador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `idtar` int(5) NOT NULL,
  `codvig` int(5) NOT NULL,
  `idtveh` int(2) NOT NULL,
  `precio` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoveh`
--

CREATE TABLE `tipoveh` (
  `idtveh` int(2) NOT NULL,
  `nomtveh` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `idturn` int(5) NOT NULL,
  `feinitur` varchar(15) NOT NULL,
  `fefintur` varchar(15) NOT NULL,
  `basetur` varchar(20) NOT NULL,
  `vefintur` int(20) NOT NULL,
  `vacietur` int(20) NOT NULL,
  `difetur` int(20) NOT NULL,
  `obstur` varchar(1000) NOT NULL,
  `idusu` bigint(12) NOT NULL,
  `acttur` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `codubi` bigint(11) NOT NULL,
  `nomubi` varchar(30) DEFAULT NULL,
  `depubi` int(11) DEFAULT NULL,
  `parqubi` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`codubi`, `nomubi`, `depubi`, `parqubi`) VALUES
(5, 'ANTIOQUIA', 0, 0),
(8, 'ATLANTICO', 0, 0),
(11, 'BOGOTÃ D.C.', 0, 0),
(13, 'BOLIVAR', 0, 0),
(15, 'BOYACA', 0, 0),
(17, 'CALDAS', 0, 0),
(18, 'CAQUETA', 0, 0),
(19, 'CAUCA', 0, 0),
(20, 'CESAR', 0, 0),
(23, 'CORDOBA', 0, 0),
(25, 'CUNDINAMARCA', 0, 0),
(27, 'CHOCO', 0, 0),
(41, 'HUILA', 0, 0),
(44, 'LA GUAJIRA', 0, 0),
(47, 'MAGDALENA', 0, 0),
(50, 'META', 0, 0),
(52, 'NARIÃ‘O', 0, 0),
(54, 'NORTE DE SANTANDER', 0, 0),
(63, 'QUINDIO', 0, 0),
(66, 'RISALDA', 0, 0),
(68, 'SANTANDER', 0, 0),
(70, 'SUCRE', 0, 0),
(73, 'TOLIMA', 0, 0),
(76, 'VALLE', 0, 0),
(81, 'ARAUCA', 0, 0),
(85, 'CASANARE', 0, 0),
(86, 'PUTUMAYO', 0, 0),
(88, 'SAN ANDRES Y PROVIDE', 0, 0),
(91, 'AMAZONAS', 0, 0),
(94, 'GUAINIA', 0, 0),
(97, 'VAUPES', 0, 0),
(99, 'VICHADA', 0, 0),
(5001, 'Medellin', 5, 0),
(5002, 'Abejorral', 5002, 0),
(5004, 'Abriaqui', 5, 0),
(5021, 'Alejandria', 5, 0),
(5030, 'Amaga', 5, 0),
(5031, 'Amalfi', 5, 0),
(5034, 'Andes', 5, 0),
(5036, 'Angelopolis', 5, 0),
(5038, 'Angostura', 5, 0),
(5040, 'Anori', 5, 0),
(5042, 'Antioquia', 5, 0),
(5044, 'Anza', 5, 0),
(5045, 'Apartado', 5, 0),
(5051, 'Arboletes', 5, 0),
(5055, 'Argelia', 5, 0),
(5059, 'Armenia', 5, 0),
(5079, 'Barbosa', 5, 0),
(5086, 'Belmira', 5, 0),
(5088, 'Bello', 5, 0),
(5091, 'Betania', 5, 0),
(5093, 'Betulia', 5, 0),
(5101, 'Bolivar', 5, 0),
(5107, 'Briceno', 5, 0),
(5113, 'Buritica', 5, 0),
(5120, 'Caceres', 5, 0),
(5125, 'Caicedo', 5, 0),
(5129, 'Caldas', 5, 0),
(5134, 'Campamento', 5, 0),
(5138, 'CaÃ±asgordas', 5, 0),
(5142, 'Caracoli', 5, 0),
(5145, 'Caramanta', 5, 0),
(5147, 'Carepa', 5, 0),
(5148, 'Carmen de Viboral', 5, 0),
(5150, 'Carolina', 5, 0),
(5154, 'Caucasia', 5, 0),
(5172, 'Chigorodo', 5, 0),
(5190, 'Cisneros', 5, 0),
(5197, 'Cocorna', 5, 0),
(5206, 'Concepcion', 5, 0),
(5209, 'Concordia', 5, 0),
(5212, 'Copacabana', 5, 0),
(5234, 'Dabeiba', 5, 0),
(5237, 'Don Matias', 5, 0),
(5240, 'Ebejico', 5, 0),
(5250, 'El Bagre', 5, 0),
(5264, 'Entrerrios', 5, 0),
(5266, 'Envigado', 5, 0),
(5282, 'Fredonia', 5, 0),
(5284, 'Frontino', 5, 0),
(5306, 'Giraldo', 5, 0),
(5308, 'Girardota', 5, 0),
(5310, 'Gomez Plata', 5, 0),
(5313, 'Granada', 5, 0),
(5315, 'Guadalupe', 5, 0),
(5318, 'Guarne', 5, 0),
(5321, 'Guatape', 5, 0),
(5347, 'Heliconia', 5, 0),
(5353, 'Hispania', 5, 0),
(5360, 'Itagui', 5, 0),
(5361, 'Ituango', 5, 0),
(5364, 'Jardin', 5, 0),
(5368, 'Jerico', 5, 0),
(5376, 'La Ceja', 5, 0),
(5380, 'La Estrella', 5, 0),
(5390, 'La Pintada', 5, 0),
(5400, 'La Union', 5, 0),
(5411, 'Liborina', 5, 0),
(5425, 'Maceo', 5, 0),
(5440, 'Marinilla', 5, 0),
(5467, 'Montebello', 5, 0),
(5475, 'Murindo', 5, 0),
(5480, 'Mutata', 5, 0),
(5483, 'NariÃ±o', 5, 0),
(5490, 'Necocli', 5, 0),
(5495, 'Nechi', 5, 0),
(5501, 'Olaya', 5, 0),
(5541, 'PeÃ±ol', 5, 0),
(5543, 'Peque', 5, 0),
(5576, 'Pueblorrico', 5, 0),
(5579, 'Puerto Berrio', 5, 0),
(5585, 'Puerto Nare (La Magd', 5, 0),
(5591, 'Puerto Triunfo', 5, 0),
(5604, 'Remedios', 5, 0),
(5607, 'Retiro', 5, 0),
(5615, 'Rionegro', 5, 0),
(5628, 'Sabanalarga', 5, 0),
(5631, 'Sabaneta', 5, 0),
(5642, 'Salgar', 5, 0),
(5647, 'San Andres', 5, 0),
(5649, 'San Carlos', 5, 0),
(5652, 'San Francisco', 5, 0),
(5656, 'San Jeronimo', 5, 0),
(5658, 'San Jose de la Monta', 5, 0),
(5659, 'San Juan de Uraba', 5, 0),
(5660, 'San Luis', 5, 0),
(5664, 'San Pedro', 5, 0),
(5665, 'San Pedro de Uraba', 5, 0),
(5667, 'San Rafael', 5, 0),
(5670, 'San Roque', 5, 0),
(5674, 'San Vicente', 5, 0),
(5679, 'Santa Barbara', 5, 0),
(5686, 'Santa Rosa de Osos', 5, 0),
(5690, 'Santo Domingo', 5, 0),
(5697, 'Santuario', 5, 0),
(5736, 'Segovia', 5, 0),
(5756, 'Sonson', 5, 0),
(5761, 'Sopetran', 5, 0),
(5789, 'Tamesis', 5, 0),
(5790, 'Taraza', 5, 0),
(5792, 'Tarso', 5, 0),
(5809, 'Titiribi', 5, 0),
(5819, 'Toledo', 5, 0),
(5837, 'Turbo', 5, 0),
(5842, 'Uramita', 5, 0),
(5847, 'Urrao', 5, 0),
(5854, 'Valdivia', 5, 0),
(5856, 'Valparaiso', 5, 0),
(5858, 'Vegachi', 5, 0),
(5861, 'Venecia', 5, 0),
(5873, 'Vigia del Fuerte', 5, 0),
(5885, 'Yali', 5, 0),
(5887, 'Yarumal', 5, 0),
(5890, 'Yolombo', 5, 0),
(5893, 'Yondo (Casabe)', 5, 0),
(5895, 'Zaragoza', 5, 0),
(8001, 'Barranquilla', 8, 0),
(8078, 'Baranoa', 8, 0),
(8137, 'Campo de la Cruz', 8, 0),
(8141, 'Candelaria', 8, 0),
(8296, 'Galapa', 8, 0),
(8372, 'Juan de Acosta', 8, 0),
(8421, 'Luruaco', 8, 0),
(8433, 'Malambo', 8, 0),
(8436, 'Manati', 8, 0),
(8520, 'Palmar de Varela', 8, 0),
(8549, 'Piojo', 8, 0),
(8558, 'Polo Nuevo', 8, 0),
(8560, 'Ponedera', 8, 0),
(8573, 'Puerto Colombia', 8, 0),
(8606, 'Repelon', 8, 0),
(8634, 'Sabanagrande', 8, 0),
(8638, 'Sabanalarga', 8, 0),
(8675, 'Santa Lucia', 8, 0),
(8685, 'Santo Tomas', 8, 0),
(8758, 'Soledad', 8, 0),
(8770, 'Suan', 8, 0),
(8832, 'Tubara', 8, 0),
(8849, 'Usiacuri', 8, 0),
(9001, 'Barranquilla', 9, 0),
(11001, 'Bogota', 11, 0),
(13006, 'Achi', 13, 0),
(13030, 'Altos del Rosario', 13, 0),
(13042, 'Arenal', 13, 0),
(13052, 'Arjona', 13, 0),
(13062, 'Arroyohondo', 13, 0),
(13074, 'Barranco de Loba', 13, 0),
(13140, 'Calamar', 13, 0),
(13160, 'Cantagallo', 13, 0),
(13188, 'Cicuco', 13, 0),
(13212, 'Cordoba', 13, 0),
(13222, 'Clemencia', 13, 0),
(13244, 'El Carmen de Bolivar', 13, 0),
(13248, 'El Guamo', 13, 0),
(13268, 'El PeÃ±on', 13, 0),
(13300, 'Hatillo de Loba', 13, 0),
(13430, 'Magangue', 13, 0),
(13433, 'Mahates', 13, 0),
(13440, 'Margarita', 13, 0),
(13442, 'Maria La Baja', 13, 0),
(13458, 'Montecristo', 13, 0),
(13468, 'Mompos', 13, 0),
(13473, 'Morales', 13, 0),
(13549, 'Pinillos', 13, 0),
(13580, 'Regidor', 13, 0),
(13600, 'Rio Viejo', 13, 0),
(13620, 'San Cristobal', 13, 0),
(13647, 'San Estanislao', 13, 0),
(13650, 'San Fernando', 13, 0),
(13654, 'San Jacinto', 13, 0),
(13655, 'San Jacinto del Cauc', 13, 0),
(13657, 'San Juan Nepomuceno', 13, 0),
(13667, 'San Martin de Loba', 13, 0),
(13670, 'San Pablo', 13, 0),
(13673, 'Santa Catalina', 13, 0),
(13683, 'Santa Rosa', 13, 0),
(13688, 'Santa Rosa del Sur', 13, 0),
(13744, 'Simiti', 13, 0),
(13760, 'Soplaviento', 13, 0),
(13780, 'Talaigua NUevo', 13, 0),
(13810, 'Tiquisio (Puerto Ric', 13, 0),
(13836, 'Turbaco', 13, 0),
(13838, 'Turbana', 13, 0),
(13873, 'Villanueva', 13, 0),
(13894, 'Zambrano', 13, 0),
(14001, 'Cartagena', 14, 0),
(15001, 'Tunja', 15, 0),
(15022, 'Almeida', 15, 0),
(15047, 'Aquitania', 15, 0),
(15051, 'Arcabuco', 15, 0),
(15087, 'Belen', 15, 0),
(15090, 'Berbeo', 15, 0),
(15092, 'Beteitiva', 15, 0),
(15097, 'Boavita', 15, 0),
(15104, 'Boyaca', 15, 0),
(15106, 'Briceno', 15, 0),
(15109, 'Buenavista', 15, 0),
(15114, 'Busbanza', 15, 0),
(15131, 'Caldas', 15, 0),
(15135, 'Campohermoso', 15, 0),
(15162, 'Cerinza', 15, 0),
(15172, 'Chinavita', 15, 0),
(15176, 'Chiquinquira', 15, 0),
(15180, 'Chiscas', 15, 0),
(15183, 'Chita', 15, 0),
(15185, 'Chitaraque', 15, 0),
(15187, 'Chivata', 15, 0),
(15189, 'Cienega', 15, 0),
(15204, 'Combita', 15, 0),
(15212, 'Coper', 15, 0),
(15215, 'Corrales', 15, 0),
(15218, 'Covarachia', 15, 0),
(15223, 'Cubara', 15, 0),
(15224, 'Cucaita', 15, 0),
(15226, 'Cuitiva', 15, 0),
(15232, 'Chiquiza', 15, 0),
(15236, 'Chivor', 15, 0),
(15238, 'Duitama', 15, 0),
(15244, 'El Cocuy', 15, 0),
(15248, 'El Espino', 15, 0),
(15272, 'Firavitoba', 15, 0),
(15276, 'Floresta', 15, 0),
(15293, 'Gachantiva', 15, 0),
(15296, 'Gameza', 15, 0),
(15299, 'Garagoa', 15, 0),
(15317, 'Guacamayas', 15, 0),
(15322, 'Guateque', 15, 0),
(15325, 'Guayata', 15, 0),
(15332, 'Guican', 15, 0),
(15362, 'Iza', 15, 0),
(15367, 'Jenesano', 15, 0),
(15368, 'Jerico', 15, 0),
(15377, 'Labranzagrande', 15, 0),
(15380, 'La Capilla', 15, 0),
(15401, 'La Victoria', 15, 0),
(15403, 'La Uvita', 15, 0),
(15407, 'VIlla de Leyva', 15, 0),
(15425, 'Macanal', 15, 0),
(15442, 'Maripi', 15, 0),
(15455, 'Miraflores', 15, 0),
(15464, 'Mongua', 15, 0),
(15466, 'Mongui', 15, 0),
(15469, 'Moniquira', 15, 0),
(15476, 'Motavita', 15, 0),
(15480, 'Muzo', 15, 0),
(15491, 'Nobsa', 15, 0),
(15494, 'Nuevo Colon', 15, 0),
(15500, 'Oicata', 15, 0),
(15507, 'Otanche', 15, 0),
(15511, 'Pachavita', 15, 0),
(15514, 'Paez', 15, 0),
(15516, 'Paipa', 15, 0),
(15518, 'Pajarito', 15, 0),
(15522, 'Panqueba', 15, 0),
(15531, 'Pauna', 15, 0),
(15533, 'Paya', 15, 0),
(15537, 'Paz de Rio', 15, 0),
(15542, 'Pesca', 15, 0),
(15550, 'Pisba', 15, 0),
(15572, 'Puerto Boyaca', 15, 0),
(15580, 'Quipama', 15, 0),
(15599, 'Ramiriqui', 15, 0),
(15600, 'Raquira', 15, 0),
(15621, 'Rondon', 15, 0),
(15632, 'Saboya', 15, 0),
(15638, 'Sachica', 15, 0),
(15646, 'Samaca', 15, 0),
(15660, 'San Eduardo', 15, 0),
(15664, 'San Jose de Pare', 15, 0),
(15667, 'San Luis de Gaceno', 15, 0),
(15673, 'San Mateo', 15, 0),
(15676, 'San Miguel de Sema', 15, 0),
(15681, 'San Pablo de Borbur', 15, 0),
(15686, 'Santana', 15, 0),
(15690, 'Santa Maria', 15, 0),
(15693, 'Santa Rosa de Viterb', 15, 0),
(15696, 'Santa Sofia', 15, 0),
(15720, 'Sativanorte', 15, 0),
(15723, 'Sativasur', 15, 0),
(15740, 'Siachoque', 15, 0),
(15753, 'Soata', 15, 0),
(15755, 'Socota', 15, 0),
(15757, 'Socha', 15, 0),
(15759, 'Sogamoso', 15, 0),
(15761, 'Somondoco', 15, 0),
(15762, 'Sora', 15, 0),
(15763, 'Sotaquira', 15, 0),
(15764, 'Soraca', 15, 0),
(15774, 'Susacon', 15, 0),
(15776, 'Sutamarchan', 15, 0),
(15778, 'Sutatenza', 15, 0),
(15790, 'Tasco', 15, 0),
(15798, 'Tenza', 15, 0),
(15804, 'Tibana', 15, 0),
(15806, 'Tibasosa', 15, 0),
(15808, 'Tinjaca', 15, 0),
(15810, 'Tipacoque', 15, 0),
(15814, 'Toca', 15, 0),
(15816, 'Togui', 15, 0),
(15820, 'Topaga', 15, 0),
(15822, 'Tota', 15, 0),
(15832, 'Tunungua', 15, 0),
(15835, 'Turmeque', 15, 0),
(15837, 'Tuta', 15, 0),
(15839, 'Tutaza', 15, 0),
(15842, 'Umbita', 15, 0),
(15861, 'Ventaquemada', 15, 0),
(15879, 'Viracacha', 15, 0),
(15897, 'Zetaquira', 15, 0),
(17001, 'Manizales', 17, 0),
(17013, 'Aguadas', 17, 0),
(17042, 'Anserma', 17, 0),
(17050, 'Aranzazu', 17, 0),
(17088, 'Belalcazar', 17, 0),
(17174, 'Chinchina', 17, 0),
(17272, 'Filadelfia', 17, 0),
(17380, 'La Dorada', 17, 0),
(17388, 'La Merced', 17, 0),
(17433, 'Manzanares', 17, 0),
(17442, 'Marmato', 17, 0),
(17444, 'Marquetalia', 17, 0),
(17446, 'Marulanda', 17, 0),
(17486, 'Neira', 17, 0),
(17495, 'Norcasia', 17, 0),
(17513, 'Pacora', 17, 0),
(17524, 'Palestina', 17, 0),
(17541, 'Pensilvania', 17, 0),
(17614, 'Riosucio', 17, 0),
(17616, 'Risaralda', 17, 0),
(17653, 'Salamina', 17, 0),
(17662, 'Samana', 17, 0),
(17665, 'San Jose', 17, 0),
(17777, 'Supia', 17, 0),
(17867, 'Victoria', 17, 0),
(17873, 'Villamaria', 17, 0),
(17877, 'Viterbo', 17, 0),
(18001, 'Florencia', 18, 0),
(18029, 'Albania', 18, 0),
(18094, 'Belen de los Andaqui', 18, 0),
(18150, 'Cartagena del Chaira', 18, 0),
(18205, 'Curillo', 18, 0),
(18247, 'El Doncello', 18, 0),
(18256, 'El Paujil', 18, 0),
(18410, 'La Montanita', 18, 0),
(18460, 'Milan', 18, 0),
(18479, 'Morelia', 18, 0),
(18592, 'Puerto Rico', 18, 0),
(18610, 'San Jose del Fragua', 18, 0),
(18753, 'San Vicente del Cagu', 18, 0),
(18756, 'Solano', 18, 0),
(18785, 'Solita', 18, 0),
(18860, 'Valparaiso', 18, 0),
(19001, 'Popayan', 19, 0),
(19022, 'Almaguer', 19, 0),
(19050, 'Argelia', 19, 0),
(19075, 'Balboa', 19, 0),
(19100, 'Bolivar', 19, 0),
(19110, 'Buenos Aires', 19, 0),
(19130, 'Cajibio', 19, 0),
(19137, 'Caldono', 19, 0),
(19142, 'Caloto', 19, 0),
(19212, 'Corinto', 19, 0),
(19256, 'El Tambo', 19, 0),
(19290, 'Florencia', 19, 0),
(19318, 'Guapi', 19, 0),
(19355, 'Inza', 19, 0),
(19364, 'Jambalo', 19, 0),
(19392, 'La Sierra', 19, 0),
(19397, 'La Vega', 19, 0),
(19418, 'Lopez (Micay)', 19, 0),
(19450, 'Mercaderes', 19, 0),
(19455, 'Miranda', 19, 0),
(19473, 'Morales', 19, 0),
(19513, 'Padilla', 19, 0),
(19517, 'Paez', 19, 0),
(19532, 'Patia (EL Bordo)', 19, 0),
(19533, 'Piamonte', 19, 0),
(19548, 'Piendamo', 19, 0),
(19573, 'Puerto Tejada', 19, 0),
(19585, 'Purace', 19, 0),
(19622, 'Rosas', 19, 0),
(19693, 'San Sebastian', 19, 0),
(19698, 'Santander de Quilich', 19, 0),
(19701, 'Santa Rosa', 19, 0),
(19743, 'Silvia', 19, 0),
(19760, 'Sotara', 19, 0),
(19780, 'Suarez', 19, 0),
(19785, 'Sucre', 19, 0),
(19807, 'Timbio', 19, 0),
(19809, 'Timbiqui', 19, 0),
(19821, 'Toribio', 19, 0),
(19824, 'ToToro', 19, 0),
(19845, 'Villarica', 19, 0),
(20001, 'Valledupar', 20, 0),
(20011, 'Aguachica', 20, 0),
(20013, 'Agustin Codazzi', 20, 0),
(20032, 'Astrea', 20, 0),
(20045, 'Becerril', 20, 0),
(20060, 'Bosconia', 20, 0),
(20175, 'Chimichagua', 20, 0),
(20178, 'Chiriguana', 20, 0),
(20228, 'Curumani', 20, 0),
(20238, 'El Copey', 20, 0),
(20250, 'El Paso', 20, 0),
(20295, 'Gamarra', 20, 0),
(20310, 'Gonzalez', 20, 0),
(20383, 'La Gloria', 20, 0),
(20400, 'La Jagua de Ibirico', 20, 0),
(20443, 'Manaure Balcon del C', 20, 0),
(20517, 'Pailitas', 20, 0),
(20550, 'Pelaya', 20, 0),
(20570, 'Pueblo Bello', 20, 0),
(20614, 'Rio de Oro', 20, 0),
(20621, 'Robles (La Paz)', 20, 0),
(20710, 'San Alberto', 20, 0),
(20750, 'San Diego', 20, 0),
(20770, 'San Martin', 20, 0),
(20787, 'Tamalameque', 20, 0),
(23001, 'Monteria', 23, 0),
(23068, 'Ayapel', 23, 0),
(23079, 'Buenavista', 23, 0),
(23090, 'Canalete', 23, 0),
(23162, 'Cerete', 23, 0),
(23168, 'Chima', 23, 0),
(23182, 'Chinu', 23, 0),
(23189, 'Cienaga de Oro', 23, 0),
(23300, 'Cotorra', 23, 0),
(23350, 'La Apartada', 23, 0),
(23417, 'Lorica', 23, 0),
(23419, 'Los Cordobas', 23, 0),
(23464, 'Momil', 23, 0),
(23466, 'Montelibano', 23, 0),
(23500, 'MoÃ±itos', 23, 0),
(23555, 'Planeta Rica', 23, 0),
(23570, 'Pueblo Nuevo', 23, 0),
(23574, 'Puerto Escondido', 23, 0),
(23580, 'Puerto Libertador', 23, 0),
(23586, 'Purisima', 23, 0),
(23660, 'Sahagun', 23, 0),
(23670, 'San Andres Sotavento', 23, 0),
(23672, 'San Antero', 23, 0),
(23675, 'San Bernardo del Vie', 23, 0),
(23678, 'San Carlos', 23, 0),
(23686, 'San Pelayo', 23, 0),
(23807, 'Tierralta', 23, 0),
(23855, 'Valencia', 23, 0),
(25001, 'Agua de Dios', 25, 0),
(25019, 'Alban', 25, 0),
(25035, 'Anapoima', 25, 0),
(25040, 'Anolaima', 25, 0),
(25053, 'Arbelaez', 25, 0),
(25086, 'Beltran', 25, 0),
(25095, 'Bituima', 25, 0),
(25099, 'Bojaca', 25, 0),
(25120, 'Cabrera', 25, 0),
(25123, 'Cachipay', 25, 0),
(25126, 'CajicÃ¡', 25, 0),
(25148, 'Caparrapi', 25, 0),
(25151, 'Caqueza', 25, 0),
(25154, 'Carmen de Carupa', 25, 0),
(25168, 'Chaguani', 25, 0),
(25175, 'ChÃ­a', 25, 0),
(25178, 'Chipaque', 25, 0),
(25181, 'Choachi', 25, 0),
(25183, 'Choconta', 25, 0),
(25200, 'Cogua', 25, 0),
(25214, 'Cota', 25, 0),
(25224, 'Cucunuba', 25, 0),
(25245, 'El Colegio', 25, 0),
(25258, 'El PeÃ±on', 25, 0),
(25260, 'El Rosal', 25, 0),
(25269, 'Facatativa', 25, 0),
(25279, 'Fomeque', 25, 0),
(25281, 'Fosca', 25, 0),
(25286, 'Funza', 25, 0),
(25288, 'Fuquene', 25, 0),
(25290, 'Fusagasuga', 25, 0),
(25293, 'Gachala', 25, 0),
(25295, 'Gachancipa', 25, 0),
(25297, 'Gacheta', 25, 0),
(25299, 'Gama', 25, 0),
(25307, 'Girardot', 25, 0),
(25312, 'Granada', 25, 0),
(25317, 'Guacheta', 25, 0),
(25320, 'Guaduas', 25, 0),
(25322, 'Guasca', 25, 0),
(25324, 'Guataqui', 25, 0),
(25326, 'Guatavita', 25, 0),
(25328, 'Guayabal de Siquima', 25, 0),
(25335, 'Guayabetal', 25, 0),
(25339, 'Gutierrez', 25, 0),
(25368, 'Jerusalen', 25, 0),
(25372, 'Junin', 25, 0),
(25377, 'La Calera', 25, 0),
(25386, 'La Mesa', 25, 0),
(25394, 'La Palma', 25, 0),
(25398, 'La PeÃ±a', 25, 0),
(25402, 'La Vega', 25, 0),
(25407, 'Lenguazaque', 25, 0),
(25426, 'Macheta', 25, 0),
(25430, 'Madrid', 25, 0),
(25436, 'Manta', 25, 0),
(25438, 'Medina', 25, 0),
(25473, 'Mosquera', 25, 0),
(25483, 'NariÃ±o', 25, 0),
(25486, 'Nemocon', 25, 0),
(25488, 'Nilo', 25, 0),
(25489, 'Nimaima', 25, 0),
(25491, 'Nocaima', 25, 0),
(25506, 'Ospina Perez (Veneci', 25, 0),
(25513, 'Pacho', 25, 0),
(25518, 'Paime', 25, 0),
(25524, 'Pandi', 25, 0),
(25530, 'Paratebueno', 25, 0),
(25535, 'Pasca', 25, 0),
(25572, 'Puerto Salgar', 25, 0),
(25580, 'Puli', 25, 0),
(25592, 'Quebradanegra', 25, 0),
(25594, 'Quetame', 25, 0),
(25596, 'Quipile', 25, 0),
(25599, 'Rafael Reyes (Apulo)', 25, 0),
(25612, 'Ricaurte', 25, 0),
(25645, 'San Antonio de Teque', 25, 0),
(25649, 'San Bernardo', 25, 0),
(25653, 'San Cayetano', 25, 0),
(25658, 'San Francisco', 25, 0),
(25662, 'San Juan de Rio Seco', 25, 0),
(25718, 'Sasaima', 25, 0),
(25736, 'Sesquile', 25, 0),
(25740, 'Sibate', 25, 0),
(25743, 'Silvania', 25, 0),
(25745, 'Simijaca', 25, 0),
(25754, 'Soacha', 25, 0),
(25758, 'Sopo', 25, 0),
(25769, 'Subachoque', 25, 0),
(25772, 'Suesca', 25, 0),
(25777, 'Supata', 25, 0),
(25779, 'Susa', 25, 0),
(25781, 'Sutatausa', 25, 0),
(25785, 'Tabio', 25, 0),
(25793, 'Tausa', 25, 0),
(25797, 'Tena', 25, 0),
(25799, 'Tenjo', 25, 0),
(25805, 'Tibacuy', 25, 0),
(25807, 'Tibirita', 25, 0),
(25815, 'Tocaima', 25, 0),
(25817, 'TocancipÃ¡', 25, 0),
(25823, 'Topaipi', 25, 0),
(25839, 'Ubala', 25, 0),
(25841, 'Ubaque', 25, 0),
(25843, 'Ubate', 25, 0),
(25845, 'Une', 25, 0),
(25851, 'Utica', 25, 0),
(25862, 'Vergara', 25, 0),
(25867, 'Viani', 25, 0),
(25871, 'Villagomez', 25, 0),
(25873, 'Villapinzon', 25, 0),
(25875, 'Villeta', 25, 0),
(25878, 'Viota', 25, 0),
(25885, 'Yacopi', 25, 0),
(25898, 'Zipacon', 25, 0),
(25899, 'ZipaquirÃ¡', 25, 0),
(27001, 'Quibdo', 27, 0),
(27006, 'Acandi', 27, 0),
(27025, 'Alto Baudo (Pie de P', 27, 0),
(27050, 'Atrato', 27, 0),
(27073, 'Bagado', 27, 0),
(27075, 'Bahia Solano (Mutis)', 27, 0),
(27077, 'Bajo Baudo (Pizarro)', 27, 0),
(27086, 'BelÃ©n de Bajira', 27, 0),
(27099, 'Bojaya (Bellavista)', 27, 0),
(27135, 'Canton de San Pablo ', 27, 0),
(27150, 'Carmen del Darien', 27, 0),
(27160, 'Certegui', 27, 0),
(27205, 'Condoto', 27, 0),
(27245, 'El Carmen de Atrato', 27, 0),
(27250, 'Litoral del Bajo San', 27, 0),
(27361, 'Itsmina', 27, 0),
(27372, 'Jurado', 27, 0),
(27413, 'Lloro', 27, 0),
(27425, 'Medio Atrato', 27, 0),
(27430, 'Medio Baudo (Boca de', 27, 0),
(27450, 'Medio San Juan', 27, 0),
(27491, 'Novita', 27, 0),
(27495, 'Nuqui', 27, 0),
(27580, 'Rio Iro', 27, 0),
(27600, 'Rioquito', 27, 0),
(27615, 'Riosucio', 27, 0),
(27660, 'San Jose del Palmar', 27, 0),
(27745, 'Sipi', 27, 0),
(27787, 'Tado', 27, 0),
(27800, 'Unguia', 27, 0),
(27810, 'Union Panamericana', 27, 0),
(41001, 'Neiva', 41, 0),
(41006, 'Acevedo', 41, 0),
(41013, 'Agrado', 41, 0),
(41016, 'Aipe', 41, 0),
(41020, 'Algeciras', 41, 0),
(41026, 'Altamira', 41, 0),
(41078, 'Baraya', 41, 0),
(41132, 'Campoalegre', 41, 0),
(41206, 'Colombia', 41, 0),
(41244, 'Elias', 41, 0),
(41298, 'Garzon', 41, 0),
(41306, 'Gigante', 41, 0),
(41319, 'Guadalupe', 41, 0),
(41349, 'Hobo', 41, 0),
(41357, 'Iquira', 41, 0),
(41359, 'Isnos (San Jose de I', 41, 0),
(41378, 'La Argentina', 41, 0),
(41396, 'La Plata', 41, 0),
(41483, 'Nataga', 41, 0),
(41503, 'Oporapa', 41, 0),
(41518, 'Paicol', 41, 0),
(41524, 'Palermo', 41, 0),
(41530, 'Palestina', 41, 0),
(41548, 'Pital', 41, 0),
(41551, 'Pitalito', 41, 0),
(41615, 'Rivera', 41, 0),
(41660, 'Saladoblanco', 41, 0),
(41668, 'San Agustin', 41, 0),
(41676, 'Santa Maria', 41, 0),
(41770, 'Suaza', 41, 0),
(41791, 'Tarqui', 41, 0),
(41797, 'Tesalia', 41, 0),
(41799, 'Tello', 41, 0),
(41801, 'Teruel', 41, 0),
(41807, 'Timana', 41, 0),
(41872, 'Villavieja', 41, 0),
(41885, 'Yaguara', 41, 0),
(44001, 'Riohacha', 44, 0),
(44035, 'Albania', 44, 0),
(44078, 'Barrancas', 44, 0),
(44090, 'Dibulla', 44, 0),
(44098, 'Distraccion', 44, 0),
(44110, 'El Molino', 44, 0),
(44279, 'Fonseca', 44, 0),
(44378, 'Hatonuevo', 44, 0),
(44420, 'La Jagua del Pilar', 44, 0),
(44430, 'Maicao', 44, 0),
(44560, 'Manaure', 44, 0),
(44650, 'San Juan del Cesar', 44, 0),
(44847, 'Uribia', 44, 0),
(44855, 'Urumita', 44, 0),
(44874, 'Villanueva', 44, 0),
(47001, 'Santa Marta', 47, 0),
(47030, 'Algarrobo', 47, 0),
(47053, 'Aracataca', 47, 0),
(47058, 'Ariguani (El Dificil', 47, 0),
(47161, 'Cerro San Antonio', 47, 0),
(47170, 'Chivolo', 47, 0),
(47189, 'Cienaga', 47, 0),
(47205, 'Concordia', 47, 0),
(47245, 'El Banco', 47, 0),
(47258, 'El PiÃ±on', 47, 0),
(47268, 'El Reten', 47, 0),
(47288, 'Fundacion', 47, 0),
(47318, 'Guamal', 47, 0),
(47460, 'Nueva Granada', 47, 0),
(47541, 'Pedraza', 47, 0),
(47545, 'PijiÃ±o del Carmen (P', 47, 0),
(47551, 'Pivijay', 47, 0),
(47555, 'Plato', 47, 0),
(47570, 'Puebloviejo', 47, 0),
(47605, 'Remolino', 47, 0),
(47660, 'Sabanas de San Angel', 47, 0),
(47675, 'Salamina', 47, 0),
(47692, 'San Sebastian de Bue', 47, 0),
(47703, 'San Zenon', 47, 0),
(47707, 'Santa Ana', 47, 0),
(47720, 'Santa Barbara de Pin', 47, 0),
(47745, 'Sitio Nuevo', 47, 0),
(47798, 'Tenerife', 47, 0),
(47960, 'Zapayan', 47, 0),
(47980, 'Zona Bananera', 47, 0),
(47981, 'CARTAGENA', 13, 0),
(47982, 'Catambuco', 52, 0),
(47983, 'Bordo', 19, 0),
(47984, 'BriceÃ±o', 25, 0),
(47985, 'Siberia', 25, 0),
(50001, 'Villavicencio', 50, 0),
(50006, 'Acacias', 50, 0),
(50110, 'Barranca de Upia', 50, 0),
(50124, 'Cabuyaro', 50, 0),
(50150, 'Castilla La Nueva', 50, 0),
(50223, 'Cubarral', 50, 0),
(50226, 'Cumaral', 50, 0),
(50245, 'El Calvario', 50, 0),
(50251, 'El Castillo', 50, 0),
(50270, 'El Dorado', 50, 0),
(50287, 'Fuente de Oro', 50, 0),
(50313, 'Granada', 50, 0),
(50318, 'Guamal', 50, 0),
(50325, 'Mapiripan', 50, 0),
(50330, 'Mesetas', 50, 0),
(50350, 'La Macarena', 50, 0),
(50370, 'La Uribe', 50, 0),
(50400, 'Lejanias', 50, 0),
(50450, 'Puerto Concordia', 50, 0),
(50517, 'pooooo', 11001, 0),
(50568, 'Puerto Gaitan', 50, 0),
(50573, 'Puerto Lopez', 50, 0),
(50577, 'Puerto Lleras', 50, 0),
(50590, 'Puerto Rico', 50, 0),
(50606, 'Restrepo', 50, 0),
(50680, 'San Carlos de Guaroa', 50, 0),
(50683, 'San Juan de Arama', 50, 0),
(50686, 'San Juanito', 50, 0),
(50689, 'San Martin', 50, 0),
(50711, 'Vistahermosa', 50, 0),
(51246, 'nose', 5001, 0),
(52001, 'Pasto', 52, 0),
(52019, 'Alban (San Jose)', 52, 0),
(52022, 'Aldana', 52, 0),
(52036, 'Ancuya', 52, 0),
(52051, 'Arboleda (Berruecos)', 52, 0),
(52079, 'Barbacoas', 52, 0),
(52083, 'Belen', 52, 0),
(52110, 'Buesaco', 52, 0),
(52203, 'Colon (Genova)', 52, 0),
(52207, 'Consaca', 52, 0),
(52210, 'Contadero', 52, 0),
(52215, 'Cordoba', 52, 0),
(52224, 'Cuaspud (Carlosama)', 52, 0),
(52227, 'Cumbal', 52, 0),
(52233, 'Cumbitara', 52, 0),
(52240, 'Chachagui', 52, 0),
(52250, 'El Charco', 52, 0),
(52254, 'El PeÃ±ol', 52, 0),
(52256, 'El Rosario', 52, 0),
(52258, 'El Tablon', 52, 0),
(52260, 'El Tambo', 52, 0),
(52287, 'Funes', 52, 0),
(52317, 'Guachucal', 52, 0),
(52320, 'Guaitarilla', 52, 0),
(52323, 'Gualmatan', 52, 0),
(52352, 'Iles', 52, 0),
(52354, 'Imues', 52, 0),
(52356, 'Ipiales', 52, 0),
(52378, 'La Cruz', 52, 0),
(52381, 'La Florida', 52, 0),
(52385, 'La Llanada', 52, 0),
(52390, 'La Tola', 52, 0),
(52399, 'La Union', 52, 0),
(52405, 'Leiva', 52, 0),
(52411, 'Linares', 52, 0),
(52418, 'Los Andes (Sotomayor', 52, 0),
(52427, 'Magui (Payan)', 52, 0),
(52435, 'Mallama (Piedrancha)', 52, 0),
(52473, 'Mosquera', 52, 0),
(52480, 'NariÃ±o', 52, 0),
(52490, 'Olaya Herrera(Bocas ', 52, 0),
(52506, 'Ospina', 52, 0),
(52520, 'Francisco Pizarro (S', 52, 0),
(52540, 'Policarpa', 52, 0),
(52560, 'Potosi', 52, 0),
(52565, 'Providencia', 52, 0),
(52573, 'Puerres', 52, 0),
(52585, 'Pupiales', 52, 0),
(52612, 'Ricaurte', 52, 0),
(52621, 'Roberto Payan (San J', 52, 0),
(52678, 'Samaniego', 52, 0),
(52683, 'Sandona', 52, 0),
(52685, 'San Bernardo', 52, 0),
(52687, 'San Lorenzo', 52, 0),
(52693, 'San Pablo', 52, 0),
(52694, 'San Pedro de Cartago', 52, 0),
(52696, 'Santa Barbara (Iscua', 52, 0),
(52699, 'Santa Cruz (Guachave', 52, 0),
(52720, 'Sapuyes', 52, 0),
(52786, 'Taminango', 52, 0),
(52788, 'Tangua', 52, 0),
(52835, 'Tumaco', 52, 0),
(52838, 'Tuquerres', 52, 0),
(52885, 'Yacuanquer', 52, 0),
(54001, 'Cucuta', 54, 0),
(54003, 'Abrego', 54, 0),
(54051, 'Arboledas', 54, 0),
(54099, 'Bochalema', 54, 0),
(54109, 'Bucarasica', 54, 0),
(54125, 'Cacota', 54, 0),
(54128, 'Cachira', 54, 0),
(54174, 'Chitaga', 54, 0),
(54206, 'Convencion', 54, 0),
(54223, 'Cucutilla', 54, 0),
(54239, 'Durania', 54, 0),
(54245, 'El Carmen', 54, 0),
(54250, 'El Tarra', 54, 0),
(54261, 'El Zulia', 54, 0),
(54313, 'Gramalote', 54, 0),
(54344, 'Hacari', 54, 0),
(54347, 'Herran', 54, 0),
(54377, 'Labateca', 54, 0),
(54385, 'La Esperanza', 54, 0),
(54398, 'La Playa', 54, 0),
(54405, 'Los Patios', 54, 0),
(54418, 'Lourdes', 54, 0),
(54480, 'Mutiscua', 54, 0),
(54498, 'OcaÃ±a', 54, 0),
(54518, 'Pamplona', 54, 0),
(54520, 'Pamplonita', 54, 0),
(54553, 'Puerto Santander', 54, 0),
(54599, 'Ragonvalia', 54, 0),
(54660, 'Salazar', 54, 0),
(54670, 'San Calixto', 54, 0),
(54673, 'San Cayetano', 54, 0),
(54680, 'Santiago', 54, 0),
(54720, 'Sardinata', 54, 0),
(54743, 'Silos', 54, 0),
(54800, 'Teorama', 54, 0),
(54810, 'Tibu', 54, 0),
(54820, 'Toledo', 54, 0),
(54871, 'Villa Caro', 54, 0),
(54874, 'Villa del Rosario', 54, 0),
(63001, 'Armenia', 63, 0),
(63111, 'Buenavista', 63, 0),
(63130, 'Calarca', 63, 0),
(63190, 'Circasia', 63, 0),
(63212, 'Cordoba', 63, 0),
(63272, 'Filandia', 63, 0),
(63302, 'Genova', 63, 0),
(63401, 'La Tebaida', 63, 0),
(63470, 'Montenegro', 63, 0),
(63548, 'Pijao', 63, 0),
(63594, 'Quimbaya', 63, 0),
(63690, 'Salento', 63, 0),
(66001, 'Pereira', 66, 0),
(66045, 'Apia', 66, 0),
(66075, 'Balboa', 66, 0),
(66088, 'Belen de Umbria', 66, 0),
(66170, 'Dosquebradas', 66, 0),
(66318, 'Guatica', 66, 0),
(66383, 'La Celia', 66, 0),
(66400, 'La Virginia', 66, 0),
(66440, 'Marsella', 66, 0),
(66456, 'Mistrato', 66, 0),
(66572, 'Pueblo Rico', 66, 0),
(66594, 'Quinchia', 66, 0),
(66682, 'Santa Rosa de Cabal', 66, 0),
(66687, 'Santuario', 66, 0),
(68001, 'Bucaramanga', 68, 0),
(68013, 'Aguada', 68, 0),
(68020, 'Albania', 68, 0),
(68051, 'Aratoca', 68, 0),
(68077, 'Barbosa', 68, 0),
(68079, 'Barichara', 68, 0),
(68081, 'Barrancabermeja', 68, 0),
(68092, 'Betulia', 68, 0),
(68101, 'Bolivar', 68, 0),
(68121, 'Cabrera', 68, 0),
(68132, 'California', 68, 0),
(68147, 'Capitanejo', 68, 0),
(68152, 'Carcasi', 68, 0),
(68160, 'Cepita', 68, 0),
(68162, 'Cerrito', 68, 0),
(68167, 'Charala', 68, 0),
(68169, 'Charta', 68, 0),
(68176, 'Chima', 68, 0),
(68179, 'Chipata', 68, 0),
(68190, 'Cimitarra', 68, 0),
(68207, 'Concepcion', 68, 0),
(68209, 'Confines', 68, 0),
(68211, 'Contratacion', 68, 0),
(68217, 'Coromoro', 68, 0),
(68229, 'Curiti', 68, 0),
(68235, 'El Carmen de Chucuri', 68, 0),
(68245, 'El Guacamayo', 68, 0),
(68250, 'El PeÃ±on', 68, 0),
(68255, 'El Playon', 68, 0),
(68264, 'Encino', 68, 0),
(68266, 'Enciso', 68, 0),
(68271, 'Florian', 68, 0),
(68276, 'Floridablanca', 68, 0),
(68296, 'Galan', 68, 0),
(68298, 'Gambita', 68, 0),
(68307, 'Giron', 68, 0),
(68318, 'Guaca', 68, 0),
(68320, 'Guadalupe', 68, 0),
(68322, 'Guapota', 68, 0),
(68324, 'Guavata', 68, 0),
(68327, 'Guepsa', 68, 0),
(68344, 'Hato', 68, 0),
(68368, 'Jesus Maria', 68, 0),
(68370, 'Jordan', 68, 0),
(68377, 'La Belleza', 68, 0),
(68385, 'Landazuri', 68, 0),
(68397, 'La Paz', 68, 0),
(68406, 'Lebrija', 68, 0),
(68418, 'Los Santos', 68, 0),
(68425, 'Macaravita', 68, 0),
(68432, 'Malaga', 68, 0),
(68444, 'Matanza', 68, 0),
(68464, 'Mogotes', 68, 0),
(68468, 'Molagavita', 68, 0),
(68498, 'Ocamonte', 68, 0),
(68500, 'Oiba', 68, 0),
(68502, 'Onzaga', 68, 0),
(68522, 'Palmar', 68, 0),
(68524, 'Palmas Socorro', 68, 0),
(68533, 'Paramo', 68, 0),
(68547, 'Piedecuesta', 68, 0),
(68549, 'Pinchote', 68, 0),
(68572, 'Puente Nacional', 68, 0),
(68573, 'Puerto Parra', 68, 0),
(68575, 'Puerto Wilches', 68, 0),
(68615, 'Rionegro', 68, 0),
(68655, 'Sabana de Torres', 68, 0),
(68669, 'San Andres', 68, 0),
(68673, 'San Benito', 68, 0),
(68679, 'San Gil', 68, 0),
(68682, 'San Joaquin', 68, 0),
(68684, 'San Jose de Miranda', 68, 0),
(68686, 'San Miguel', 68, 0),
(68689, 'San Vicente de Chucu', 68, 0),
(68705, 'Santa Barbara', 68, 0),
(68720, 'Santa Helena del Opo', 68, 0),
(68745, 'Simacota', 68, 0),
(68755, 'Socorro', 68, 0),
(68770, 'Suaita', 68, 0),
(68773, 'Sucre', 68, 0),
(68780, 'Surata', 68, 0),
(68820, 'Tona', 68, 0),
(68855, 'Valle de San Jose', 68, 0),
(68861, 'Velez', 68, 0),
(68867, 'Vetas', 68, 0),
(68872, 'Villanueva', 68, 0),
(68895, 'Zapatoca', 68, 0),
(70001, 'Sincelejo', 70, 0),
(70110, 'Buenavista', 70, 0),
(70124, 'Caimito', 70, 0),
(70204, 'Coloso (Ricaurte)', 70, 0),
(70215, 'Corozal', 70, 0),
(70221, 'CoveÃ±as', 70, 0),
(70230, 'Chalan', 70, 0),
(70233, 'El Roble', 70, 0),
(70235, 'Galeras (Nueva Grana', 70, 0),
(70265, 'Guaranda', 70, 0),
(70400, 'La Union', 70, 0),
(70418, 'Los Palmitos', 70, 0),
(70429, 'Majagual', 70, 0),
(70473, 'Morroa', 70, 0),
(70508, 'Ovejas', 70, 0),
(70523, 'Palmito', 70, 0),
(70670, 'Sampues', 70, 0),
(70678, 'San Benito Abad', 70, 0),
(70702, 'San Juan de Betulia', 70, 0),
(70708, 'San Marcos', 70, 0),
(70713, 'San Onofre', 70, 0),
(70717, 'San Pedro', 70, 0),
(70742, 'Since', 70, 0),
(70771, 'Sucre', 70, 0),
(70820, 'Tolu', 70, 0),
(70823, 'Toluviejo', 70, 0),
(73001, 'Ibague', 73, 0),
(73024, 'Alpujarra', 73, 0),
(73026, 'Alvarado', 73, 0),
(73030, 'Ambalema', 73, 0),
(73043, 'Anzoategui', 73, 0),
(73055, 'Armero (Guayabal)', 73, 0),
(73067, 'Ataco', 73, 0),
(73124, 'Cajamarca', 73, 0),
(73148, 'Carmen de Apicala', 73, 0),
(73152, 'Casabianca', 73, 0),
(73168, 'Chaparral', 73, 0),
(73200, 'Coello', 73, 0),
(73217, 'Coyaima', 73, 0),
(73226, 'Cunday', 73, 0),
(73236, 'Dolores', 73, 0),
(73268, 'Espinal', 73, 0),
(73270, 'Falan', 73, 0),
(73275, 'Flandes', 73, 0),
(73283, 'Fresno', 73, 0),
(73319, 'Guamo', 73, 0),
(73347, 'Herveo', 73, 0),
(73349, 'Honda', 73, 0),
(73352, 'Icononzo', 73, 0),
(73408, 'Lerida', 73, 0),
(73411, 'Libano', 73, 0),
(73443, 'Mariquita', 73, 0),
(73449, 'Melgar', 73, 0),
(73461, 'Murillo', 73, 0),
(73483, 'Natagaima', 73, 0),
(73504, 'Ortega', 73, 0),
(73520, 'Palocabildo', 73, 0),
(73547, 'Piedras', 73, 0),
(73555, 'Planadas', 73, 0),
(73563, 'Prado', 73, 0),
(73585, 'Purificacion', 73, 0),
(73616, 'Rioblanco', 73, 0),
(73622, 'Roncesvalles', 73, 0),
(73624, 'Rovira', 73, 0),
(73671, 'SaldaÃ±a', 73, 0),
(73675, 'San Antonio', 73, 0),
(73678, 'San Luis', 73, 0),
(73686, 'Santa Isabel', 73, 0),
(73770, 'Suarez', 73, 0),
(73854, 'Valle de San Juan', 73, 0),
(73861, 'Venadillo', 73, 0),
(73870, 'Villahermosa', 73, 0),
(73873, 'Villarica', 73, 0),
(75878, 'patty', 5042, 0),
(76001, 'Cali', 76, 0),
(76020, 'Alcala', 76, 0),
(76036, 'Andalucia', 76, 0),
(76041, 'Ansermanuevo', 76, 0),
(76054, 'Argelia', 76, 0),
(76100, 'Bolivar', 76, 0),
(76109, 'Buenaventura', 76, 0),
(76111, 'Buga', 76, 0),
(76113, 'Bugalagrande', 76, 0),
(76122, 'Caicedonia', 76, 0),
(76126, 'Darien', 76, 0),
(76130, 'Candelaria', 76, 0),
(76147, 'Cartago', 76, 0),
(76233, 'Dagua', 76, 0),
(76243, 'El Aguila', 76, 0),
(76246, 'El Cairo', 76, 0),
(76248, 'El Cerrito', 76, 0),
(76250, 'El Dovio', 76, 0),
(76275, 'Florida', 76, 0),
(76306, 'Ginebra', 76, 0),
(76318, 'Guacari', 76, 0),
(76364, 'Jamundi', 76, 0),
(76377, 'La Cumbre', 76, 0),
(76400, 'La Union', 76, 0),
(76403, 'La Victoria', 76, 0),
(76497, 'Obando', 76, 0),
(76520, 'Palmira', 76, 0),
(76563, 'Pradera', 76, 0),
(76606, 'Restrepo', 76, 0),
(76616, 'Riofrio', 76, 0),
(76622, 'Roldanillo', 76, 0),
(76670, 'San Pedro', 76, 0),
(76736, 'Sevilla', 76, 0),
(76823, 'Toro', 76, 0),
(76828, 'Trujillo', 76, 0),
(76834, 'Tulua', 76, 0),
(76845, 'Ulloa', 76, 0),
(76863, 'Versalles', 76, 0),
(76869, 'Vijes', 76, 0),
(76890, 'Yotoco', 76, 0),
(76892, 'Yumbo', 76, 0),
(76895, 'Zarzal', 76, 0),
(81001, 'Arauca', 81, 0),
(81065, 'Arauquita', 81, 0),
(81220, 'Cravo Norte', 81, 0),
(81300, 'Fortul', 81, 0),
(81591, 'Puerto Rondon', 81, 0),
(81736, 'Saravena', 81, 0),
(81794, 'Tame', 81, 0),
(85001, 'Yopal', 85, 0),
(85010, 'Aguazul', 85, 0),
(85015, 'Chameza', 85, 0),
(85125, 'Hato Corozal', 85, 0),
(85136, 'La Salina', 85, 0),
(85139, 'Mani', 85, 0),
(85162, 'Monterrey', 85, 0),
(85225, 'Nunchia', 85, 0),
(85230, 'Orocue', 85, 0),
(85250, 'Paz de Ariporo', 85, 0),
(85263, 'Pore', 85, 0),
(85279, 'Recetor', 85, 0),
(85300, 'Sabanalarga', 85, 0),
(85315, 'Sacama', 85, 0),
(85325, 'San Luis de Palenque', 85, 0),
(85400, 'Tamara', 85, 0),
(85410, 'Tauramena', 85, 0),
(85430, 'Trinidad', 85, 0),
(85440, 'Villanueva', 85, 0),
(86001, 'Mocoa', 86, 0),
(86219, 'Colon', 86, 0),
(86320, 'Orito', 86, 0),
(86568, 'Puerto Asis', 86, 0),
(86569, 'Puerto Caicedo', 86, 0),
(86571, 'Puerto Guzman', 86, 0),
(86573, 'Puerto Leguizamo', 86, 0),
(86749, 'Sibundoy', 86, 0),
(86755, 'San Francisco', 86, 0),
(86757, 'San Miguel (La Dorad', 86, 0),
(86760, 'Santiago', 86, 0),
(86865, 'Valle del Guamuez', 86, 0),
(86885, 'Villagarzon', 86, 0),
(88001, 'San Andres', 88, 0),
(88564, 'Providencia', 88, 0),
(91001, 'Leticia', 91, 0),
(91263, 'El Encanto (CD)', 91, 0),
(91405, 'La Chorrera (CD)', 91, 0),
(91407, 'La Pedrera (CD)', 91, 0),
(91430, 'La Victoria (CD)', 91, 0),
(91460, 'Miriti Parana (CD)', 91, 0),
(91530, 'Puerto Alegria (CD)', 91, 0),
(91536, 'Puerto Arica (CD)', 91, 0),
(91540, 'Puerto NariÃ±o', 91, 0),
(91669, 'Puerto Santander (CD', 91, 0),
(91798, 'Tarapaca (CD)', 91, 0),
(94001, 'Puerto Inirida', 94, 0),
(94343, 'Barranco Minas (CD)', 94, 0),
(94663, 'Mapiripana (CD)', 94, 0),
(94883, 'San Felipe (CD)', 94, 0),
(94884, 'Puerto Colombia (CD)', 94, 0),
(94885, 'La Guadalupe (CD)', 94, 0),
(94886, 'Cacahual (CD)', 94, 0),
(94887, 'Pana Pana (Campo Ale', 94, 0),
(94888, 'Morichal (Morichal N', 94, 0),
(95000, 'Guaviare', 94, 0),
(95001, 'San Jose del Guaviar', 94, 0),
(95015, 'Calamar', 94, 0),
(95025, 'El Retorno', 94, 0),
(95200, 'Miraflores', 94, 0),
(97001, 'Mitu', 97, 0),
(97161, 'Caruru', 97, 0),
(97511, 'Pacoa (CD)', 97, 0),
(97666, 'Taraira', 97, 0),
(97777, 'Papunaua (Morichal) ', 97, 0),
(97889, 'Yavarate (CD)', 97, 0),
(99001, 'Puerto CarreÃ±o', 99, 0),
(99524, 'La Primavera', 99, 0),
(99624, 'Santa Rosalia', 99, 0),
(99773, 'Cumaribo', 99, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusu` bigint(12) NOT NULL,
  `nomusu` varchar(30) NOT NULL,
  `apeusu` varchar(30) NOT NULL,
  `emausu` varchar(100) NOT NULL,
  `pasusu` varchar(100) NOT NULL,
  `pefid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusu`, `nomusu`, `apeusu`, `emausu`, `pasusu`, `pefid`) VALUES
(80546098, 'Robinson', 'Rincon', 'admin', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigencia`
--

CREATE TABLE `vigencia` (
  `codvig` int(5) NOT NULL,
  `invig` date NOT NULL,
  `finvig` date NOT NULL,
  `activig` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcli`),
  ADD KEY `codubi` (`codubi`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nofac`),
  ADD KEY `idcli` (`idcli`),
  ADD KEY `tipoveh` (`idtveh`),
  ADD KEY `iusu` (`iusu`),
  ADD KEY `idturn` (`idturn`),
  ADD KEY `codubi` (`codubi`);

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`pagid`);

--
-- Indices de la tabla `pagper`
--
ALTER TABLE `pagper`
  ADD KEY `fk_pagxpaxper` (`pagid`),
  ADD KEY `fk_perxpaxper` (`pefid`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`pefid`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`idtar`),
  ADD KEY `codvig` (`codvig`),
  ADD KEY `idveh` (`idtveh`);

--
-- Indices de la tabla `tipoveh`
--
ALTER TABLE `tipoveh`
  ADD PRIMARY KEY (`idtveh`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`idturn`),
  ADD KEY `idusu` (`idusu`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`codubi`),
  ADD KEY `parqubi` (`parqubi`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusu`),
  ADD KEY `pefid` (`pefid`);

--
-- Indices de la tabla `vigencia`
--
ALTER TABLE `vigencia`
  ADD PRIMARY KEY (`codvig`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nofac` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `pefid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `idtar` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `idturn` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codubi`) REFERENCES `ubicacion` (`codubi`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idcli`) REFERENCES `cliente` (`idcli`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idtveh`) REFERENCES `tipoveh` (`idtveh`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idturn`) REFERENCES `turno` (`idturn`),
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`iusu`) REFERENCES `usuario` (`idusu`),
  ADD CONSTRAINT `factura_ibfk_5` FOREIGN KEY (`codubi`) REFERENCES `ubicacion` (`codubi`);

--
-- Filtros para la tabla `pagper`
--
ALTER TABLE `pagper`
  ADD CONSTRAINT `pagper_ibfk_1` FOREIGN KEY (`pagid`) REFERENCES `pagina` (`pagid`),
  ADD CONSTRAINT `pagper_ibfk_2` FOREIGN KEY (`pefid`) REFERENCES `perfil` (`pefid`);

--
-- Filtros para la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD CONSTRAINT `tarifa_ibfk_1` FOREIGN KEY (`codvig`) REFERENCES `vigencia` (`codvig`),
  ADD CONSTRAINT `tarifa_ibfk_2` FOREIGN KEY (`idtveh`) REFERENCES `tipoveh` (`idtveh`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`pefid`) REFERENCES `perfil` (`pefid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
