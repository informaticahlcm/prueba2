SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `AABS_CAR` (
  `codigo_aabs` int(11) NOT NULL DEFAULT '0',
  `nombre_aabs` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_aabs`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CIRUGIA_CARDIOMEMO` (
  `id_accion_cirugia_cardiomemo` int(11) NOT NULL AUTO_INCREMENT,
  `id_cirugia_cardiomemo` varchar(50) NOT NULL DEFAULT '',
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_protocolo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_accion_cirugia_cardiomemo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

CREATE TABLE IF NOT EXISTS `ACCION_CIRUGIA_CEC` (
  `id_accion_cirugia_cec` int(11) NOT NULL AUTO_INCREMENT,
  `id_cirugia_cec` varchar(50) NOT NULL DEFAULT '',
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_protocolo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_accion_cirugia_cec`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

CREATE TABLE IF NOT EXISTS `ACCION_CIRUGIA_PROTOCOLO` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_tratamiento` int(11) DEFAULT NULL,
  `codigo_hospital` int(11) DEFAULT NULL,
  `cirugia_cec` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CLINICA` (
  `codigo_accion_clinica` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) unsigned NOT NULL DEFAULT '0',
  `nombre_accion_clinica` text NOT NULL,
  `guarismo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigo_estado` smallint(2) DEFAULT NULL,
  `codigo_item_cirugia` int(11) NOT NULL DEFAULT '0',
  `codigo_agrupacion_cuenta` int(11) NOT NULL DEFAULT '0',
  `incluye_sesion` tinyint(5) NOT NULL DEFAULT '0',
  `uso_frecuente` int(11) DEFAULT NULL,
  `incluye_lente` tinyint(5) NOT NULL DEFAULT '0',
  `desgloce_item` tinyint(3) NOT NULL DEFAULT '0',
  `examen_ficha` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_accion_clinica`,`codigo_hospital`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CLINICA_PACIENTE` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `codigo_protocolo_operatorio` int(11) DEFAULT NULL,
  `numero_accion` int(11) NOT NULL DEFAULT '0',
  `cantidad` int(11) DEFAULT NULL,
  `codigo_cuenta` int(11) DEFAULT NULL,
  `codigo_prevision` int(11) DEFAULT NULL,
  `codigo_estado_accion_clinica` int(11) DEFAULT NULL,
  `rut_funcionario_solicitante` int(11) DEFAULT NULL,
  `rut_funcionario_realizador` int(11) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `fecha_agenda` datetime DEFAULT NULL,
  `fecha_realizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_accion_clinica`,`codigo_hospital`,`numero_accion`),
  KEY `fk_reference_97` (`codigo_accion_clinica`,`codigo_hospital`),
  KEY `fk_reference_98` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_protocolo_operatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CLINICA_PRESUPUESTO` (
  `codigo_accion_clinica` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_presupuesto` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_cuenta` int(11) DEFAULT NULL,
  `codigo_paquete_cirugia` int(11) DEFAULT NULL,
  `odi` tinyint(1) DEFAULT NULL,
  `orden` int(1) NOT NULL DEFAULT '0',
  `codigo_tipo_lente` int(11) DEFAULT NULL,
  `otro_lente` char(50) DEFAULT NULL,
  `valor_lente` decimal(11,2) DEFAULT NULL,
  `pabellon` decimal(10,2) DEFAULT NULL,
  `recuperacion` decimal(10,2) DEFAULT NULL,
  `lentes_intraocular` decimal(10,2) DEFAULT NULL,
  `medicamentos_insumos` decimal(10,2) DEFAULT NULL,
  `otros` decimal(10,2) DEFAULT NULL,
  `primer_cirujano` decimal(10,2) DEFAULT NULL,
  `ayudante` decimal(10,2) DEFAULT NULL,
  `anestesista` decimal(10,2) DEFAULT NULL,
  `arsenalera` decimal(10,2) DEFAULT NULL,
  `total_hmq` decimal(10,2) DEFAULT NULL,
  `total_clinica` decimal(10,2) DEFAULT NULL,
  `total_presupuesto` decimal(10,2) DEFAULT NULL,
  `medicamentos` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insumos` decimal(10,2) DEFAULT NULL,
  `laser_intraoperatorio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_accion_clinica`,`codigo_hospital`,`codigo_presupuesto`,`orden`),
  KEY `fk_reference_169` (`codigo_presupuesto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CLINICA_RESERVA` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_tratamiento` int(11) DEFAULT NULL,
  `codigo_hospital` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_CLINICA_SALA` (
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `duracion` int(11) DEFAULT NULL,
  `codigo_lugar_atencion` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rut_profesional`,`codigo_accion_clinica`,`codigo_hospital`,`codigo_lugar_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ACCION_PPV` (
  `codigo_accion_ppv` int(11) NOT NULL DEFAULT '0',
  `nombre_accion_ppv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_accion_ppv`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `AGRUPACION_ACCION_CLINICA` (
  `codigo_accion_clinica` int(11) DEFAULT NULL,
  `codigo_accion_ppv` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `AGRUPACION_PATOLOGIA` (
  `codigo_agrupacion_patologia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_agrupacion_patologia` char(50) DEFAULT NULL,
  `cofigo_estado` int(11) DEFAULT NULL,
  `impuesto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_agrupacion_patologia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ALERTA` (
  `id_alerta` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_alerta` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `fecha_creacion_alerta` datetime DEFAULT NULL,
  `rut_creacion_alerta` int(11) NOT NULL DEFAULT '0',
  `fecha_confirmacion` datetime DEFAULT NULL,
  `rut_confirmacion` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_alerta`),
  KEY `fk_reference_105` (`codigo_tipo_alerta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ALMACEN` (
  `codigo_bodega` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `minimo` int(11) NOT NULL DEFAULT '0',
  `maximo` int(11) NOT NULL DEFAULT '0',
  `stock_actual` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_articulo`,`codigo_bodega`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ANESTESIA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` char(10) NOT NULL DEFAULT '',
  `codigo_tipo_anestesia` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`codigo_reserva_atencion`,`codigo_tipo_anestesia`),
  KEY `fk_reference_130` (`codigo_tipo_anestesia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ANTECEDENTE_FC` (
  `codigo_antecedente_fc` int(11) NOT NULL DEFAULT '0',
  `nombre_antecedente_fc` varchar(255) DEFAULT NULL,
  `codigo_tipo_antecedente` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_antecedente_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ANTECEDENTE_PACIENTE` (
  `id_antecedente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_antecedente_fc` int(11) NOT NULL DEFAULT '0',
  `rut_pnatural` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `otro_antecedente` varchar(255) DEFAULT NULL,
  `codigo_estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_antecedente`,`codigo_reserva_atencion`,`codigo_antecedente_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ARTICULO` (
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `nombre_articulo` varchar(100) DEFAULT NULL,
  `precio_articulo` decimal(10,2) DEFAULT NULL,
  `codigo_tipo_articulo` int(10) unsigned DEFAULT NULL,
  `codigo_tipo_cargo` int(11) DEFAULT NULL,
  `codigo_presentacion` int(5) unsigned NOT NULL DEFAULT '0',
  `vigente` smallint(6) NOT NULL DEFAULT '1',
  `codigo_agrupacion_cuenta` int(6) DEFAULT NULL,
  `precio_compra` int(11) DEFAULT NULL,
  `ppp` bigint(15) NOT NULL DEFAULT '0',
  `codigo_articulo_realizable` int(11) NOT NULL DEFAULT '0',
  `uso_frecuente` int(11) DEFAULT NULL,
  `consignacion` smallint(4) NOT NULL DEFAULT '0',
  `controlado` int(11) NOT NULL DEFAULT '0',
  `codigo_cuenta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ARTICULO_ACCION_CLINICA` (
  `codigo_articulo` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_articulo`,`codigo_accion_clinica`,`codigo_hospital`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ARTICULO_PACIENTE` (
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `intervencion` int(5) NOT NULL DEFAULT '0',
  `cantidad_articulo` decimal(5,2) DEFAULT NULL,
  `cantidad_reusable` decimal(10,2) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `precio_unitario_reusable` decimal(10,2) DEFAULT NULL,
  `fecha_solicitud_articulo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_cuenta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `codigo_estado_articulo` int(10) unsigned DEFAULT NULL,
  `codigo_servicio_solicitud` int(11) unsigned DEFAULT NULL,
  `numero_accion` int(11) unsigned NOT NULL DEFAULT '1',
  `codigo_prevision` int(11) DEFAULT NULL,
  `codigo_pago_cuenta` int(11) NOT NULL DEFAULT '0',
  `codigo_estado_pago` int(11) DEFAULT NULL,
  `procesado_cuentas` smallint(6) DEFAULT NULL,
  `codigo_tipo_realizacion` int(11) DEFAULT NULL,
  `articulo_reutilizado` int(11) NOT NULL DEFAULT '0',
  `porcentaje_descuento` int(11) NOT NULL DEFAULT '0',
  `total_descuento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `monto_nc` decimal(10,2) DEFAULT NULL,
  `codigo_movimiento` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_articulo`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`numero_accion`,`codigo_cuenta`,`codigo_pago_cuenta`),
  KEY `clinica` (`rut_paciente`,`numero_hermano_gemelo`,`evento`),
  KEY `fk_reference_63` (`codigo_estado_articulo`),
  KEY `fk_reference_83` (`codigo_prevision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ASIST_ECMO_CAR` (
  `codigo_asist` int(11) NOT NULL DEFAULT '0',
  `nombre_asist` varchar(255) DEFAULT NULL,
  `codigo_estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_asist`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ATENCION_CONSULTA` (
  `codigo_atencion_consulta` int(11) NOT NULL DEFAULT '0',
  `nombre_atencion_consulta` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `color_reservado` varchar(7) DEFAULT NULL,
  `color_sobrecupo` varchar(7) DEFAULT NULL,
  `color_anulado` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`codigo_atencion_consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ATENCION_CONSULTA_PROFESIONAL` (
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  `codigo_especialidad` int(11) NOT NULL DEFAULT '0',
  `codigo_atencion_consulta` int(11) NOT NULL DEFAULT '0',
  `valor_particular` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`rut_profesional`,`codigo_especialidad`,`codigo_atencion_consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `AUTORIZA_DESCUENTO` (
  `codigo_autoriza_descuento` int(11) NOT NULL DEFAULT '0',
  `nombre_autoriza_descuento` char(50) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_autoriza_descuento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `AUTORIZA_OC` (
  `codigo_autoriza_oc` int(11) NOT NULL DEFAULT '0',
  `nombre_autoriza_oc` varchar(50) DEFAULT NULL,
  `codigo_estado` smallint(4) DEFAULT '1',
  PRIMARY KEY (`codigo_autoriza_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `BECADO_PACIENTE` (
  `codigo_becado` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_protocolo` int(11) DEFAULT NULL,
  `glosa_becado` text,
  PRIMARY KEY (`codigo_becado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `BLOCK_MSG` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` text,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_mensaje`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

CREATE TABLE IF NOT EXISTS `BLOQUEO_AGENDA` (
  `id_bloqueo_agenda` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) DEFAULT '0',
  `codigo_lugar_atencion` int(11) DEFAULT '0',
  `dia` tinyint(4) NOT NULL DEFAULT '0',
  `fecha_bloqueo` datetime DEFAULT NULL,
  `rut_funcionario` int(11) DEFAULT '0',
  `descripcion_bloqueo` text,
  `fecha_inicio_bloqueo` date NOT NULL DEFAULT '0000-00-00',
  `fecha_termino_bloqueo` date NOT NULL DEFAULT '0000-00-00',
  `hora_desde` time DEFAULT NULL,
  `hora_hasta` time DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_bloqueo_agenda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `BLOQUE_HORARIO_MEDICO` (
  `id_bloque_horario_medico` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  `dia` smallint(6) NOT NULL DEFAULT '0',
  `codigo_lugar_atencion` int(11) NOT NULL DEFAULT '0',
  `fecha_desde` datetime DEFAULT '0000-00-00 00:00:00',
  `fecha_hasta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hora_inicio` time NOT NULL DEFAULT '00:00:00',
  `hora_termino` time NOT NULL DEFAULT '00:00:00',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `duracion_consulta` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_visualizacion` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_bloque_horario_medico`,`rut_profesional`,`dia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `BODEGA` (
  `codigo_bodega` int(11) NOT NULL DEFAULT '0',
  `nombre_bodega` varchar(255) DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `genera_oc` tinyint(4) NOT NULL DEFAULT '0',
  `tipo` varchar(255) DEFAULT NULL,
  `region` smallint(4) NOT NULL DEFAULT '0',
  `existencia` smallint(4) NOT NULL DEFAULT '0',
  `codigo_tipo_bodega` int(11) NOT NULL DEFAULT '0',
  `realiza_despacho` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_bodega`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CAJA` (
  `codigo_caja` int(11) NOT NULL DEFAULT '0',
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `fecha_apertura_caja` datetime DEFAULT NULL,
  `fecha_cierre_caja` datetime DEFAULT NULL,
  `rut_funcionario` int(11) unsigned DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `monto_esperado` int(11) DEFAULT NULL,
  `monto_real` int(11) DEFAULT NULL,
  `ultima_boleta_afecta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `ultima_boleta_exenta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `observacion` text,
  `codigo_modulo` int(11) NOT NULL DEFAULT '9',
  PRIMARY KEY (`codigo_caja`,`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CAPITULO_CIE10` (
  `codigo_capitulo_cie10` varchar(10) NOT NULL DEFAULT '',
  `nombre_capitulo_cie10` text,
  `orden` int(11) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_capitulo_cie10`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CARGA_ARTICULO` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `fecha_cierre_carga` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_estado_carga` int(11) NOT NULL DEFAULT '1',
  `fecha_cirugia` date DEFAULT NULL,
  `hora_cirugia` varchar(11) NOT NULL DEFAULT '0',
  `codigo_lente` varchar(50) DEFAULT NULL,
  `rut_proveedor` int(11) NOT NULL DEFAULT '0',
  `numero_accion` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CARGA_AUTO_DIVISIBLE` (
  `codigo_accion_clinica` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `divisor_reut` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cantidad` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`codigo_accion_clinica`,`codigo_hospital`,`codigo_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `CAUSA_SUSPENCION` (
  `codigo_causa_suspencion` int(11) NOT NULL DEFAULT '0',
  `nombre_causa_suspencion` varchar(255) DEFAULT NULL,
  `codigo_tipo_causa_suspencion` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_causa_suspencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CENTRO_COSTO` (
  `codigo_centro_costo` int(11) NOT NULL DEFAULT '0',
  `nombre_centro_costo` char(50) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_servicio` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_centro_costo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CIRUGIA_CARDIOMEMO` (
  `id_cirugia_cardiomemo` int(11) NOT NULL DEFAULT '0',
  `nombre_cirugia` varchar(255) DEFAULT '',
  `tipo_cirugia` int(11) DEFAULT '0',
  `codigo_estado` int(11) DEFAULT '0',
  PRIMARY KEY (`id_cirugia_cardiomemo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CIRUGIA_CEC` (
  `codigo_cirugia_cec` int(11) NOT NULL DEFAULT '0',
  `nombre_cirugia_cec` varchar(250) DEFAULT NULL,
  `tipo_cec` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  `tipo_cirugia` int(11) NOT NULL DEFAULT '0',
  `complejidad` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`codigo_cirugia_cec`,`tipo_cec`,`tipo_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CIRUGIA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_cirugia` int(11) NOT NULL DEFAULT '0',
  `nombre_otro_cirugia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`codigo_reserva_atencion`,`codigo_tipo_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CIRUGIA_PROTOCOLO_CAR` (
  `codigo_cirugia_car` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_protocolo_operatorio` int(11) DEFAULT NULL,
  `id_cirugia_cardiomemo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_cirugia_car`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `COMUNA` (
  `codigo_comuna` int(6) NOT NULL DEFAULT '0',
  `nombre_comuna` varchar(150) DEFAULT NULL,
  `codigo_region` int(6) NOT NULL DEFAULT '0',
  `codigo_telefonico` smallint(6) DEFAULT NULL,
  `codigo_servicio_salud` int(6) DEFAULT NULL,
  PRIMARY KEY (`codigo_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `CONDICION_PAGO` (
  `codigo_condicion_pago` int(11) NOT NULL DEFAULT '0',
  `nombre_condicion_pago` varchar(255) NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_condicion_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CONDICION_TRASLADO` (
  `codigo_condicion_traslado` int(11) NOT NULL DEFAULT '0',
  `nombre_condicion_traslado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo_condicion_traslado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CONSULTA_MEDICA_FC` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_consulta_medica` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_atencion` varchar(255) NOT NULL DEFAULT '',
  `codigo_item_atencion` int(11) NOT NULL DEFAULT '0',
  `detalle_atencion` text,
  `fecha_registro` datetime DEFAULT NULL,
  `rut_medico` int(11) DEFAULT NULL,
  `prevision` int(11) DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `codigo_receta_paciente_fc` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_consulta_medica`,`codigo_detalle_atencion`,`codigo_item_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CONSULTA_MEDICA_OFT` (
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `codigo_ac_interfaz` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_prevision`,`codigo_hospital`,`codigo_accion_clinica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CONTROL_FACTURACION` (
  `codigo_control_facturacion` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `rut_empresa` int(11) NOT NULL DEFAULT '0',
  `monto_factura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `factor_descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal_factura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  `comprobante_deposito` int(11) NOT NULL DEFAULT '0',
  `fecha_registro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_factura` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `rut_pjuridica` int(11) NOT NULL DEFAULT '0',
  `numero_factura` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` tinyint(3) NOT NULL DEFAULT '1',
  `rut_anula` int(11) NOT NULL DEFAULT '0',
  `fecha_anula` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`codigo_control_facturacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CONVENIO` (
  `codigo_convenio` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_convenio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo_convenio`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

CREATE TABLE IF NOT EXISTS `CONVENIO_PREVISION` (
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `codigo_convenio` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_prevision`,`codigo_convenio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `CUENTA_PACIENTE` (
  `codigo_cuenta` bigint(20) NOT NULL DEFAULT '0',
  `codigo_estado_cuenta` int(11) DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `total_cuenta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `afecto_cuenta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `pregunta_uno` int(1) DEFAULT NULL,
  `pregunta_dos` int(1) NOT NULL DEFAULT '0',
  `total_precuenta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `numero_precuenta` int(11) NOT NULL DEFAULT '0',
  `total_descuento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `rut_corrige_saldo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_cuenta`,`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATO` (
  `codigo_dato` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_dato` int(11) DEFAULT NULL,
  `nombre_dato` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_dato`),
  KEY `fk_reference_75` (`codigo_tipo_dato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATOS_CIRUGIA_CAR` (
  `codigo_cirugia_car` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_patologia` int(11) DEFAULT NULL,
  `antenatal` int(11) DEFAULT NULL,
  `numero_cate` int(11) DEFAULT NULL,
  `numero_eco` int(11) DEFAULT NULL,
  `eco_no` int(11) DEFAULT NULL,
  `cate_no` int(11) DEFAULT NULL,
  `codigo_factor_riesgo` int(11) DEFAULT NULL,
  `codigo_asist` int(11) DEFAULT NULL,
  `codigo_ultrafiltracion` int(11) DEFAULT NULL,
  `op_pract_1` int(11) DEFAULT NULL,
  `op_pract_2` int(11) DEFAULT NULL,
  `op_pract_3` int(11) DEFAULT NULL,
  `codigo_aabs_1` int(11) DEFAULT NULL,
  `codigo_aabs_2` int(11) DEFAULT NULL,
  `codigo_vasodil` int(11) DEFAULT NULL,
  `tpo_qco` int(11) DEFAULT NULL,
  `cec_1` int(11) DEFAULT NULL,
  `cec_2` int(1) DEFAULT NULL,
  `paro_1` int(11) DEFAULT NULL,
  `paro_2` int(11) DEFAULT NULL,
  `clamp_1` int(11) DEFAULT NULL,
  `clamp_2` int(11) DEFAULT NULL,
  `codigo_lugar_operacion` int(11) DEFAULT NULL,
  `otro_patologia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_cirugia_car`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATOS_PROCEDENCIA` (
  `codigo_procedencia` int(11) NOT NULL DEFAULT '0',
  `nombre_procedencia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_procedencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATO_INGRESO` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) DEFAULT '0',
  `codigo_convenio` int(11) DEFAULT '0',
  `rut_medico_tratante` int(11) DEFAULT '0',
  `rut_ingreso` int(11) DEFAULT NULL,
  `rut_cierra` int(11) DEFAULT NULL,
  `rut_anula` int(11) DEFAULT NULL,
  `rut_alta` int(11) DEFAULT NULL,
  `fecha_admision` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `fecha_anula` datetime DEFAULT NULL,
  `hmq` tinyint(1) DEFAULT NULL,
  `diagnostico_ingreso` int(11) DEFAULT NULL,
  `codigo_procedencia` int(11) DEFAULT NULL,
  `procedencia` varchar(50) DEFAULT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `fono_responsable` varchar(11) DEFAULT NULL,
  `modificado` int(2) DEFAULT NULL,
  `nombre_medico_txt` varchar(255) DEFAULT NULL,
  `codigo_motivo_anulacion` int(4) DEFAULT '0',
  `otro_motivo_anulacion` text,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`),
  KEY `fk_reference_76` (`codigo_procedencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATO_INGRESO_LOG` (
  `id` int(11) NOT NULL DEFAULT '0',
  `fecha_modificacion` datetime DEFAULT NULL,
  `rut_funcionario_modificacion` int(11) DEFAULT NULL,
  `codigo_servicio` int(11) DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) DEFAULT '0',
  `codigo_convenio` int(11) DEFAULT '0',
  `codigo_patologia` int(11) DEFAULT NULL,
  `rut_medico_tratante` int(11) DEFAULT '0',
  `rut_ingreso` int(11) DEFAULT NULL,
  `rut_cierra` int(11) DEFAULT NULL,
  `rut_anula` int(11) DEFAULT NULL,
  `rut_alta` int(11) DEFAULT NULL,
  `fecha_admision` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `fecha_anula` datetime DEFAULT NULL,
  `hmq` tinyint(1) DEFAULT NULL,
  `codigo_procedencia` int(11) DEFAULT NULL,
  `procedencia` char(50) DEFAULT NULL,
  `responsable` char(50) DEFAULT NULL,
  `fono_responsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`id`),
  KEY `fk_reference_101` (`codigo_servicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DATO_PACIENTE` (
  `codigo_registro_preoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_dato` int(11) NOT NULL DEFAULT '0',
  `detalle_dato` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_registro_preoperatorio`,`codigo_dato`,`detalle_dato`),
  KEY `fk_reference_76` (`codigo_dato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DESCUENTO` (
  `codigo_descuento` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `total_cuenta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_descuento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_cuenta_con_descuento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `porcentaje_descuento` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario_descuento` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_descuento` int(11) NOT NULL DEFAULT '0',
  `codigo_motivo_descuento` int(11) NOT NULL DEFAULT '0',
  `descripcion_motivo_descuento` text,
  `codigo_autoriza_descuento` int(11) NOT NULL DEFAULT '0',
  `codigo_item_descuento` int(11) NOT NULL DEFAULT '0',
  `fecha_descuento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`codigo_descuento`,`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DESTINO_PROBABLE` (
  `codigo_destino` int(11) NOT NULL DEFAULT '0',
  `nombre_destino` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_destino`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_ANTECEDENTE_PACIENTE` (
  `codigo_antecedente_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_antecedente_fc` int(11) NOT NULL DEFAULT '0',
  `otro_antecedente` text,
  PRIMARY KEY (`codigo_antecedente_paciente`,`codigo_antecedente_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_ATENCION_FC` (
  `codigo_item_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_atencion` varchar(255) NOT NULL DEFAULT '',
  `nombre_detalle_atencion` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `laboratorio` varchar(255) DEFAULT NULL,
  `componentes` text,
  `campo_agregar` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_item_atencion`,`codigo_detalle_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_BOLETA` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_cuenta` varchar(20) NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_documento` int(11) NOT NULL DEFAULT '0',
  `impuesto` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `monto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `codigo_caja` int(11) NOT NULL DEFAULT '0',
  `fecha_detalle_boleta` datetime DEFAULT NULL,
  `fecha_facturacion` datetime DEFAULT NULL,
  `rut_funcionario` int(11) DEFAULT NULL,
  `numero_documento` int(11) NOT NULL DEFAULT '0',
  `codigo_control_facturacion` int(11) NOT NULL DEFAULT '0',
  `codigo_flujo_caja` varchar(50) NOT NULL DEFAULT '0',
  `propietario_boleta` varchar(10) NOT NULL DEFAULT 'clinica',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_tipo_documento`,`impuesto`,`codigo_estado`,`numero_documento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_CAJA` (
  `codigo_caja` int(11) NOT NULL DEFAULT '0',
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  `numero_deposito` varchar(25) NOT NULL DEFAULT '0',
  `monto` int(11) DEFAULT '0',
  `rut_emisor` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_caja`,`codigo_forma_pago`,`rut_emisor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_CAJAS_ABIERTAS` (
  `codigo_caja_abierta` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `nombre_caja_abierta` char(200) DEFAULT NULL,
  `numero_lote` int(11) DEFAULT NULL,
  `estado_cajas` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_caja_abierta`,`codigo_registro_intraoperatorio`),
  KEY `fk_reference_82` (`codigo_registro_intraoperatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_CUENTA_PACIENTE` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_item_cirugia` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `monto_item_cirugia` decimal(12,2) NOT NULL DEFAULT '0.00',
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_item_cirugia`,`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_DOCUMENTO_PAGO` (
  `rut_paciente` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(3) unsigned NOT NULL DEFAULT '0',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_detalle_pago_cuenta` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_forma_pago` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_detalle_documento_pago` int(11) unsigned NOT NULL DEFAULT '0',
  `monto_documento` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `fecha_pago_documento` datetime NOT NULL DEFAULT '1900-01-01 12:41:33',
  `numero_documento_detalle` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_detalle_pago_cuenta`,`codigo_forma_pago`,`codigo_detalle_documento_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_GARANTIA` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `ivp` int(11) NOT NULL DEFAULT '0',
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_pago_cuenta` smallint(6) NOT NULL DEFAULT '0',
  `codigo_estado_garantia` int(6) NOT NULL DEFAULT '0',
  `folio_garantia` bigint(20) DEFAULT NULL,
  `monto_garantia` decimal(10,0) DEFAULT NULL,
  `codigo_moneda` int(11) DEFAULT NULL,
  `fecha_ingreso_admision` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `fecha_ingreso_caja` datetime DEFAULT NULL,
  `rut_ingreso_admision` int(11) NOT NULL DEFAULT '0',
  `rut_ingreso_caja` int(11) NOT NULL DEFAULT '0',
  `rut_devolucion` int(11) NOT NULL DEFAULT '0',
  `folio_devolucion` int(11) DEFAULT NULL,
  `nombre_empresa` char(50) DEFAULT NULL,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_forma_pago`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_detalle_pago_cuenta`),
  KEY `fk_reference_91` (`codigo_moneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_IMPLANTE` (
  `codigo_detalle_implante` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `estado_implante` int(1) NOT NULL DEFAULT '0',
  `tipo_implante` varchar(255) DEFAULT NULL,
  `numero_lote` int(11) DEFAULT '0',
  `codigo_implante` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_detalle_implante`,`codigo_registro_intraoperatorio`),
  KEY `fk_reference_81` (`codigo_registro_intraoperatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_ORDEN_COMPRA` (
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `item_oc` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `precio_unitario_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cantidad_emitida` int(11) NOT NULL DEFAULT '0',
  `cantidad_debe` int(11) NOT NULL DEFAULT '0',
  `rut_proveedor` int(11) NOT NULL DEFAULT '0',
  `glosa_servicio` text,
  PRIMARY KEY (`numero_oc`,`item_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_ORDEN_COMPRA_LOG` (
  `id_log` int(11) NOT NULL DEFAULT '0',
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `item_oc` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `precio_unitario_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cantidad_emitida` int(11) NOT NULL DEFAULT '0',
  `cantidad_debe` int(11) NOT NULL DEFAULT '0',
  `rut_proveedor` int(11) NOT NULL DEFAULT '0',
  `glosa_servicio` text,
  `rut_modifica` int(11) NOT NULL DEFAULT '0',
  `fecha_modifica` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_PAGO_CUENTA` (
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_pago_cuenta` smallint(6) NOT NULL DEFAULT '0',
  `codigo_caja` int(11) NOT NULL DEFAULT '0',
  `id_usuario` int(11) DEFAULT '1',
  `garantia` int(11) NOT NULL DEFAULT '0',
  `monto_pago_cuenta` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigo_moneda` int(11) DEFAULT NULL,
  `codigo_prevision` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_prevision2` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha_detalle_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nombre_empresa` char(50) DEFAULT NULL,
  `codigo_control_facturacion` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_forma_pago`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_detalle_pago_cuenta`,`codigo_caja`,`garantia`),
  KEY `detalle_forma_pago_fk` (`codigo_forma_pago`),
  KEY `detalle_pago_fk` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`),
  KEY `pagos_recibidos_fk` (`codigo_caja`),
  KEY `fk_reference_149` (`codigo_caja`,`id_usuario`),
  KEY `fk_reference_93` (`codigo_moneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_PAQUETE_CIRUGIA` (
  `id_paquete` int(11) NOT NULL DEFAULT '0',
  `codigo_paquete_cirugia` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `codigo_item_cirugia` int(11) NOT NULL DEFAULT '0',
  `total_item_cirugia` decimal(10,2) DEFAULT NULL,
  `codigo_arancel` int(11) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `fecha_vigencia` datetime DEFAULT NULL,
  `clinica` tinyint(3) NOT NULL DEFAULT '0',
  `isapre` tinyint(3) NOT NULL DEFAULT '0',
  `auge` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_paquete`,`codigo_paquete_cirugia`,`codigo_prevision`,`codigo_item_cirugia`),
  KEY `fk_reference_134` (`codigo_item_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_PATOLOGIA_AUGE` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `codigo_patologia` int(11) NOT NULL DEFAULT '0',
  `codigo_agrupacion_patologia` int(11) NOT NULL DEFAULT '0',
  `valor` int(11) DEFAULT NULL,
  `fecha_vigencia` datetime DEFAULT NULL,
  `codigo_tipo_detalle` int(11) DEFAULT NULL,
  `codigo_paquete_cirugia` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`codigo_agrupacion_patologia`,`codigo_accion_clinica`,`codigo_prevision`,`codigo_patologia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `DETALLE_PRESTACION_EVENTO` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `orden` int(1) NOT NULL DEFAULT '0',
  `odi` tinyint(1) DEFAULT '0',
  `codigo_tipo_cuenta` int(11) DEFAULT NULL,
  `codigo_tipo_lente` int(11) DEFAULT NULL,
  `otro_lente` char(50) DEFAULT NULL,
  `valor_lente` decimal(11,2) DEFAULT NULL,
  `codigo_paquete_cirugia` int(11) DEFAULT NULL,
  `codigo_patologia` int(11) DEFAULT NULL,
  `sesion` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_accion_clinica`,`codigo_hospital`,`orden`),
  KEY `fk_reference_90` (`codigo_accion_clinica`,`codigo_hospital`),
  KEY `fk_reference_97` (`codigo_tipo_lente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_PRESTACION_EVENTO_LOG` (
  `id` int(11) NOT NULL DEFAULT '0',
  `fecha_modificacion` datetime DEFAULT NULL,
  `rut_funcionario_modificacion` int(11) DEFAULT NULL,
  `codigo_servicio` int(11) DEFAULT '0',
  `orden` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_tipo_cuenta` int(11) DEFAULT NULL,
  `codigo_tipo_lente` int(11) DEFAULT NULL,
  `codigo_paquete_cirugia` int(11) DEFAULT NULL,
  `otro_lente` char(50) DEFAULT NULL,
  `valor_lente` decimal(10,0) DEFAULT NULL,
  `odi` tinyint(1) DEFAULT NULL,
  `codigo_patologia` int(11) DEFAULT NULL,
  `sesion` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`orden`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_accion_clinica`,`codigo_hospital`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_RECEPCION_ORDEN_COMPRA` (
  `codigo_recepcion_oc` int(11) NOT NULL DEFAULT '0',
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `precio_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cantidad_recibida` int(11) NOT NULL DEFAULT '0',
  `glosa_servicio` text,
  `fecha_vencimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo_recepcion_oc`,`numero_oc`,`codigo_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_RECUENTO` (
  `codigo_recuento` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `pre_quirurgico` varchar(200) NOT NULL DEFAULT '',
  `post_quirurgico` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_recuento`,`codigo_registro_intraoperatorio`),
  KEY `fk_reference_80` (`codigo_registro_intraoperatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DETALLE_SOLICITUD_DESPACHO` (
  `numero_pedido` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `cantidad_solicitud` int(11) DEFAULT '0',
  `cantidad_despacho` int(11) DEFAULT '0',
  `cantidad_autorizada` int(11) DEFAULT NULL,
  `numero_receta` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numero_pedido`,`codigo_articulo`,`numero_receta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO` (
  `codigo_diagnostico` varchar(10) NOT NULL DEFAULT '0',
  `nombre_diagnostico` text,
  `codigo_estado` int(1) NOT NULL DEFAULT '1',
  `codigo_capitulo_cie10` int(11) DEFAULT NULL,
  `codigo_tipo_diagnostico` int(11) DEFAULT NULL,
  `escribe` int(11) NOT NULL DEFAULT '0',
  `nivel` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `ges` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_ges` int(11) DEFAULT NULL,
  `codigo_cie10` varchar(255) DEFAULT NULL,
  `epicrisis` int(11) DEFAULT '0',
  PRIMARY KEY (`codigo_diagnostico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO_PACIENTE` (
  `codigo_diagnostico_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_protocolo_operatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `diagnostico` char(200) DEFAULT NULL,
  `preoperatorio` char(10) DEFAULT NULL,
  `posoperatorio` char(10) DEFAULT NULL,
  PRIMARY KEY (`codigo_diagnostico_paciente`,`codigo_protocolo_operatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`),
  KEY `fk_reference_146` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_protocolo_operatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO_PACIENTE_CAR` (
  `codigo_diagnostico_car` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_diagnostico` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_diagnostico_car`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO_PACIENTE_CIE10` (
  `codigo_diagnostico_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_preoperatorio` int(11) DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `rut_paciente` int(11) DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) DEFAULT '0',
  `evento` int(11) DEFAULT '0',
  `codigo_diagnostico` varchar(10) DEFAULT NULL,
  `nombre_diagnostico` text,
  `codigo_lugar_cargo` int(11) DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `rut_elimina` int(11) DEFAULT NULL,
  `fecha_elimina` datetime DEFAULT NULL,
  `codigo_estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_diagnostico_paciente`),
  KEY `fk_reference_324` (`rut_paciente`,`numero_hermano_gemelo`,`evento`),
  KEY `fk_reference_325` (`codigo_diagnostico`),
  KEY `fk_reference_326` (`codigo_lugar_cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO_PACIENTE_PROTOCOLO_CAR` (
  `codigo_diagnostico_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_protocolo_operatorio` int(11) DEFAULT NULL,
  `codigo_diagnostico` int(11) DEFAULT NULL,
  `preoperatorio` int(11) DEFAULT NULL,
  `posoperatorio` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_diagnostico_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DOCUMENTO_PAGO` (
  `rut_paciente` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(3) unsigned NOT NULL DEFAULT '0',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_detalle_pago_cuenta` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_caja` int(11) DEFAULT '0',
  `garantia` tinyint(1) DEFAULT NULL,
  `codigo_forma_pago` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_documento_general` varchar(30) NOT NULL DEFAULT '',
  `fecha_recepcion_documento` datetime NOT NULL DEFAULT '1900-01-01 12:41:33',
  `monto_total_documento` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `rut_emisor` int(11) NOT NULL DEFAULT '0',
  `rut_propietario` int(11) NOT NULL DEFAULT '0',
  `numero_documento` varchar(50) DEFAULT NULL,
  `numero_voucher` int(20) DEFAULT NULL,
  `tipo_cambio` int(11) DEFAULT NULL,
  `monto_extranjero` int(11) DEFAULT NULL,
  `codigo_tarjeta_credito` int(11) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `copago_imed` int(11) NOT NULL DEFAULT '0',
  `nombre_empresa` text,
  `codigo_sucursal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_detalle_pago_cuenta`,`codigo_forma_pago`),
  KEY `fk_reference_33` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_forma_pago`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_detalle_pago_cuenta`,`codigo_caja`,`garantia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DOCUMENTO_TRIBUTARIO` (
  `codigo_documento` int(11) NOT NULL DEFAULT '0',
  `nombre_documento` varchar(255) NOT NULL DEFAULT '',
  `nombre_doc_interfaz` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_documento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DOMICILIO_PERSONA` (
  `rut` int(11) NOT NULL DEFAULT '0',
  `fecha_domicilio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_comuna` int(6) NOT NULL DEFAULT '0',
  `direccion` varchar(255) DEFAULT NULL,
  `telefono_fijo` varchar(20) DEFAULT NULL,
  `sucursal` int(11) NOT NULL DEFAULT '0',
  `codigo_sucursal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut`,`fecha_domicilio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DRENAJE_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_drenaje_paciente` int(11) NOT NULL DEFAULT '0',
  `otro_drenaje` text,
  `codigo_tipo_drenaje` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `ubicacion` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_drenaje_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `DROGAS_APOYO` (
  `codigo_drogas` int(11) NOT NULL DEFAULT '0',
  `nombre_drogas` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_drogas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `DROGAS_APOYO_PACIENTE` (
  `codigo_drogas_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_drogas` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_drogas_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EQUIPO_PABELLON` (
  `numero_pabellon` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_funcion_pabellon` int(11) NOT NULL DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT '1',
  `orden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numero_pabellon`,`rut_funcionario`,`codigo_tipo_funcion_pabellon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EQUIPO_QUIRURGICO` (
  `codigo_equipo_quirurgico` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) DEFAULT '0',
  `codigo_protocolo_operatorio` int(11) DEFAULT NULL,
  `codigo_tipo_equipo_quirurgico` int(11) DEFAULT NULL,
  `rut_funcionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_equipo_quirurgico`),
  KEY `fk_reference_91` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_protocolo_operatorio`),
  KEY `fk_reference_92` (`codigo_tipo_equipo_quirurgico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESPECIALIDAD_MEDICA` (
  `codigo_especialidad_medica` int(11) NOT NULL DEFAULT '0',
  `nombre_especialidad_medica` varchar(30) DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_especialidad_medica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESPECIALIDAD_MEDICA_OLD` (
  `codigo_especialidad_medica` int(11) NOT NULL DEFAULT '0',
  `nombre_especialidad_medica` varchar(30) DEFAULT '0',
  PRIMARY KEY (`codigo_especialidad_medica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO` (
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `nombre_estado` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_ARTICULO` (
  `codigo_estado_articulo` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_articulo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_CARGA` (
  `codigo_estado_carga` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_carga` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_estado_carga`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `ESTADO_CIVIL` (
  `codigo_estado_civil` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_civil` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_civil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_COBRANZA` (
  `codigo_estado_cobranza` int(3) NOT NULL DEFAULT '0',
  `nombre_estado_cobranza` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_cobranza`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_COBRANZA_PACIENTE` (
  `codigo_cuenta` bigint(15) unsigned NOT NULL DEFAULT '0',
  `rut_paciente` int(11) unsigned NOT NULL DEFAULT '0',
  `evento` int(10) unsigned NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `codigo_estado_cobranza` int(3) NOT NULL DEFAULT '0',
  `fecha_estado_cobranza` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo_cuenta`,`rut_paciente`,`evento`,`numero_hermano_gemelo`,`codigo_estado_cobranza`),
  KEY `fk_reference_142` (`codigo_estado_cobranza`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_CUENTA` (
  `codigo_estado_cuenta` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_cuenta` char(60) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_cuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_CUENTA_PACIENTE` (
  `rut_paciente` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `evento` int(10) unsigned NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) NOT NULL DEFAULT '0',
  `codigo_estado_cuenta` int(10) unsigned NOT NULL DEFAULT '0',
  `fecha_estado_cuenta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `saldo_cuenta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `numero_accion` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_cuenta`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_estado_cuenta`,`numero_accion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_GARANTIA` (
  `codigo_estado_garantia` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_garantia` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_garantia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_LE` (
  `codigo_estado_le` int(11) NOT NULL DEFAULT '0',
  `nombre_estado` char(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_le`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_OC` (
  `codigo_estado_oc` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_oc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_estado_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_PACIENTE` (
  `codigo_estado_paciente` smallint(6) NOT NULL DEFAULT '0',
  `nombre_estado_paciente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ESTADO_PAGO_HONORARIO` (
  `codigo_estado_pago_honorario` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_pago_honorario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_pago_honorario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EXAMENES_PACIENTES_PREVIOS` (
  `id_examen_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_preoperarotio` int(11) DEFAULT NULL,
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `nombre_examen` text NOT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_examen_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EXAMENES_PACIENTE_FC` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` int(11) NOT NULL DEFAULT '0',
  `codigo_agrupacion_cuenta` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) DEFAULT '0',
  `fecha_examen` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_estado` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_accion_clinica`,`codigo_hospital`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FACTOR_RIESGO_CAR` (
  `codigo_factor_riesgo` int(11) NOT NULL DEFAULT '0',
  `nombre_factor_riesgo` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_factor_riesgo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FACTURA_MULTIPLE` (
  `numero_factura` int(11) NOT NULL DEFAULT '0',
  `codigo_lugar_atencion` int(4) NOT NULL DEFAULT '2',
  `rut_prevision` int(11) NOT NULL DEFAULT '0',
  `monto` int(11) DEFAULT NULL,
  `bonificado` int(11) NOT NULL DEFAULT '0',
  `copago` int(11) NOT NULL DEFAULT '0',
  `fecha` datetime DEFAULT NULL,
  `forma_pago` int(11) DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_facturacion` int(11) NOT NULL DEFAULT '0',
  `impuesto` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `rut_anula` int(11) NOT NULL DEFAULT '0',
  `fecha_anula` datetime DEFAULT NULL,
  PRIMARY KEY (`numero_factura`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FALLECIDO` (
  `rut_pnatural` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `fecha_fallecimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`rut_pnatural`,`numero_hermano_gemelo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FICHA_MEDICA` (
  `rut_pnatural` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `numero_ficha_medica` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`rut_pnatural`,`numero_hermano_gemelo`,`numero_ficha_medica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FLUJO_CAJA` (
  `codigo_flujo_caja` varchar(11) NOT NULL DEFAULT '',
  `nombre_flujo_caja` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_flujo_caja`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FORMA_PAGO` (
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  `nombre_forma_pago` varchar(40) DEFAULT NULL,
  `codigo_tipo_forma_pago` smallint(3) unsigned NOT NULL DEFAULT '0',
  `codigo_emision_boleta` tinyint(4) DEFAULT NULL,
  `orden` smallint(6) DEFAULT NULL,
  `codigo_estado` smallint(6) DEFAULT NULL,
  `dias_pago` int(11) NOT NULL DEFAULT '0',
  `codigo_adicional_imed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_forma_pago`,`codigo_tipo_forma_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FUNCIONARIO` (
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_funcionario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `HISTORIAL_FECHA_ACTO_QUIRURGICO` (
  `id_historial_acto_quirurgico` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_acto_quirurgico` datetime DEFAULT NULL,
  `fecha_fin_acto_quirurgico` datetime DEFAULT NULL,
  `fecha_graba` datetime DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `rut_graba` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_historial_acto_quirurgico`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1636 ;

CREATE TABLE IF NOT EXISTS `HISTORIAL_FECHA_ANESTESIA` (
  `id_historial_anestesia` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_anestesia` datetime DEFAULT NULL,
  `fecha_fin_anestesia` datetime DEFAULT NULL,
  `fecha_graba` datetime DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `rut_graba` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_historial_anestesia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1636 ;

CREATE TABLE IF NOT EXISTS `HORARIO_CONSULTA` (
  `id_horario_consulta` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) DEFAULT NULL,
  `codigo_atencion_consulta` int(11) DEFAULT NULL,
  `codigo_accion_clinica_1` int(11) DEFAULT NULL,
  `codigo_hospital_1` int(11) DEFAULT NULL,
  `codigo_accion_clinica_2` int(11) DEFAULT NULL,
  `codigo_hospital_2` int(11) DEFAULT NULL,
  `codigo_tipo_paciente` int(11) DEFAULT NULL,
  `fecha_inicio_horario` datetime DEFAULT NULL,
  `fecha_termino_horario` datetime DEFAULT NULL,
  `id_bloque_horario_medico` int(11) NOT NULL DEFAULT '0',
  `id_bloqueo_agenda` int(11) NOT NULL DEFAULT '0',
  `id_control` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `concurrencia` tinyint(3) NOT NULL DEFAULT '0',
  `duracion_horario_consulta` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_horario_consulta`),
  KEY `agenda` (`rut_profesional`,`codigo_atencion_consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `IDENTIFICACION` (
  `rut` int(11) NOT NULL DEFAULT '0',
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefonos` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `IMPLANTES` (
  `codigo_implante` int(11) NOT NULL DEFAULT '0',
  `nombre_implante` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_implante`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `IMPUESTO_OC` (
  `codigo_impuesto_oc` int(11) NOT NULL DEFAULT '0',
  `nombre_impuesto_oc` char(50) DEFAULT NULL,
  `factor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigo_estado` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_impuesto_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `INTERFAZ_IMED` (
  `numero_transaccion` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva` int(11) DEFAULT '0',
  `rut_tratante` int(11) DEFAULT '0',
  `rut_solicitante` int(11) DEFAULT '0',
  `rut_beneficiario` int(11) DEFAULT '0',
  `codigo_financiador` int(11) DEFAULT '0',
  `fecha_inicio_tratamiento` date DEFAULT NULL,
  `fecha_termino_tratamiento` date DEFAULT NULL,
  `total_prestaciones` int(11) DEFAULT '0',
  PRIMARY KEY (`numero_transaccion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `INTERFAZ_REBSOL_SAM` (
  `id_interfaz_rebsol_sam` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_agendamiento` int(11) NOT NULL DEFAULT '0',
  `codigo_pabellon` int(11) DEFAULT NULL,
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_accion` int(11) DEFAULT NULL,
  `codigo_cirugia_1` int(11) DEFAULT NULL,
  `codigo_cirugia_2` int(11) DEFAULT NULL,
  `codigo_cirugia_3` int(11) DEFAULT NULL,
  `codigo_cirugia_4` int(11) DEFAULT NULL,
  `codigo_cirugia_5` int(11) DEFAULT NULL,
  `codigo_cirugia_6` int(11) DEFAULT NULL,
  `codigo_cirugia_7` int(11) DEFAULT NULL,
  `codigo_cirugia_8` int(11) DEFAULT NULL,
  `codigo_cirugia_9` int(11) DEFAULT NULL,
  `codigo_cirugia_10` int(11) DEFAULT NULL,
  `rut_medico_1` int(11) DEFAULT NULL,
  `rut_medico_2` int(11) DEFAULT NULL,
  `rut_medico_3` int(11) DEFAULT NULL,
  `anestesista_1` int(11) DEFAULT NULL,
  `anestesista_2` int(11) DEFAULT NULL,
  `fecha_cirugia` datetime DEFAULT NULL,
  `hora_inicio_acto_quirurgico` time DEFAULT NULL,
  `hora_termino_acto_quirurgico` time DEFAULT NULL,
  `tipo_cirugia` int(11) DEFAULT NULL,
  `tipo_anestesia` int(11) DEFAULT NULL,
  `especialidad` int(11) DEFAULT NULL,
  `tipo_herida` int(11) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT '0',
  `fecha_registro_rebsol` datetime DEFAULT NULL,
  `fecha_registro_sam` datetime DEFAULT NULL,
  `tratamiento_1` int(11) DEFAULT NULL,
  `tratamiento_2` int(11) DEFAULT NULL,
  `tratamiento_3` int(11) DEFAULT NULL,
  `tratamiento_4` int(11) DEFAULT NULL,
  `tratamiento_5` int(11) DEFAULT NULL,
  `tratamiento_6` varchar(255) DEFAULT NULL,
  `tratamiento_7` int(11) DEFAULT NULL,
  `tratamiento_8` int(11) DEFAULT NULL,
  `tratamiento_9` int(11) DEFAULT NULL,
  `tratamiento_10` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_interfaz_rebsol_sam`,`codigo_agendamiento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6030 ;

CREATE TABLE IF NOT EXISTS `ISQUEMIA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_isquemia_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_isquemia` int(11) DEFAULT NULL,
  `mmhg` int(11) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`codigo_reserva_atencion`,`codigo_isquemia_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

CREATE TABLE IF NOT EXISTS `ITEM_ATENCION_FC` (
  `codigo_item_atencion` int(11) NOT NULL DEFAULT '0',
  `nombre_item_atencion` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_item_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ITEM_DESCUENTO` (
  `codigo_item_descuento` int(11) NOT NULL DEFAULT '0',
  `nombre_item_descuento` char(50) DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_item_descuento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ITEM_PAQUETE_CIRUGIA` (
  `codigo_item_cirugia` int(11) NOT NULL DEFAULT '0',
  `nombre_item_cirugia` varchar(50) DEFAULT NULL,
  `impuesto` varchar(50) DEFAULT NULL,
  `codigo_tipo_item` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `nombre_presupuesto2` varchar(30) NOT NULL DEFAULT '',
  `codigo_referencia` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_item_cirugia`),
  KEY `fk_reference_141` (`codigo_tipo_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LENTE` (
  `codigo_lente` varchar(50) NOT NULL DEFAULT '',
  `nombre_lente` varchar(100) NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lente_ges` tinyint(3) NOT NULL DEFAULT '0',
  `codigo_agrupacion_cuenta` tinyint(3) NOT NULL DEFAULT '3',
  PRIMARY KEY (`codigo_lente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LINEA_ARTERIAL_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_linea_arterial` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) DEFAULT NULL,
  `lugar` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_linea_arterial`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `LISTA_ESTERILIZACION_CAR` (
  `codigo_esterilizacion_car` int(11) NOT NULL DEFAULT '0',
  `nombre_esterilizacion_card` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_esterilizacion_car`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LISTA_ESTERILIZACION_PACIENTE_CAR` (
  `codigo_esterilizacion_paciente_car` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_esterilizacion_car` int(11) DEFAULT NULL,
  `numero_esterilizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_esterilizacion_paciente_car`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LUGAR_DESPACHO` (
  `codigo_lugar_despacho` int(11) NOT NULL DEFAULT '0',
  `nombre_lugar_despacho` varchar(255) DEFAULT NULL,
  `codigo_estado` smallint(4) DEFAULT '0',
  PRIMARY KEY (`codigo_lugar_despacho`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LUGAR_OPERACION_CAR` (
  `codigo_lugar_operacion` int(11) NOT NULL DEFAULT '0',
  `nombrre_lugar_operacion` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_lugar_operacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `MODULO` (
  `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sistema` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_modulo` varchar(100) DEFAULT NULL,
  `foto_modulo` varchar(100) DEFAULT NULL,
  `ruta_modulo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_modulo`),
  KEY `fk_reference_15` (`codigo_estado`),
  KEY `fk_relationship_2` (`codigo_sistema`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

CREATE TABLE IF NOT EXISTS `MODULO_bak` (
  `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sistema` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_modulo` varchar(100) DEFAULT NULL,
  `foto_modulo` varchar(100) DEFAULT NULL,
  `ruta_modulo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_modulo`),
  KEY `fk_reference_15` (`codigo_estado`),
  KEY `fk_relationship_2` (`codigo_sistema`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

CREATE TABLE IF NOT EXISTS `MODULO_PERFIL` (
  `id_modulo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_perfil` int(11) NOT NULL DEFAULT '0',
  `codigo_modulo` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  `orden` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_modulo_perfil`),
  KEY `fk_reference_18` (`codigo_estado`),
  KEY `fk_relationship_10` (`codigo_modulo`),
  KEY `fk_relationship_12` (`codigo_perfil`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

CREATE TABLE IF NOT EXISTS `MONEDA_EXTRANJERA` (
  `codigo_moneda` int(11) NOT NULL DEFAULT '0',
  `nombre_moneda` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_moneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `MOTIVO_ANULACION` (
  `codigo_motivo_anulacion` int(11) NOT NULL DEFAULT '0',
  `nombre_motivo_anulacion` char(50) NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_motivo_anulacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `MOTIVO_DESCUENTO` (
  `codigo_motivo_descuento` int(11) NOT NULL DEFAULT '0',
  `nombre_motivo_descuento` char(50) DEFAULT NULL,
  `codigo_tipo_descuento` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_motivo_descuento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `MOVIMIENTO` (
  `codigo_movimiento` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_movimiento` int(11) NOT NULL DEFAULT '0',
  `codigo_bodega` int(11) NOT NULL DEFAULT '0',
  `codigo_articulo` int(11) NOT NULL DEFAULT '0',
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `codigo_recepcion_oc` int(11) NOT NULL DEFAULT '0',
  `fecha_movimiento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `cantidad_movimiento` int(11) NOT NULL DEFAULT '0',
  `precio` decimal(12,2) NOT NULL DEFAULT '0.00',
  `pmp` int(11) NOT NULL DEFAULT '0',
  `fecha_vencimiento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numero_pedido` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_movimiento`),
  KEY `codigo_bodega` (`codigo_bodega`,`codigo_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `NACIONALIDAD` (
  `codigo_nacionalidad` int(11) NOT NULL DEFAULT '0',
  `nombre_nacionalidad` char(50) DEFAULT NULL,
  `ordenamiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_nacionalidad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `OBSERVACION_COBRANZA` (
  `id_observacion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `observacion` text,
  `fecha_observacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_usuario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_observacion`,`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `OBSERVACION_CONFIRMA` (
  `id_observacion` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `observacion` text,
  `fecha_observacion` datetime DEFAULT NULL,
  `rut_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_observacion`,`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `OBSERVACION_EVENTO` (
  `id_observacion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `observacion` text,
  `fecha_observacion` datetime DEFAULT NULL,
  `rut_usuario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`id_observacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `OPCION` (
  `codigo_opcion` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_opcion` varchar(100) DEFAULT NULL,
  `codigo` text,
  PRIMARY KEY (`codigo_opcion`),
  KEY `fk_reference_16` (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `OPCION_DISPONIBLE` (
  `codigo_opcion` int(11) NOT NULL DEFAULT '0',
  `id_modulo_perfil` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_opcion`,`id_modulo_perfil`),
  KEY `fk_relationship_16` (`id_modulo_perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ORDEN_COMPRA` (
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `rut_proveedor` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `rut_anula` int(11) NOT NULL DEFAULT '0',
  `fecha_emision_oc` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_anulacion_oc` datetime DEFAULT NULL,
  `codigo_estado_oc` int(11) NOT NULL DEFAULT '0',
  `valor_neto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `impuesto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigo_condicion_pago` int(11) NOT NULL DEFAULT '0',
  `codigo_impuesto_oc` int(4) NOT NULL DEFAULT '0',
  `codigo_tipo_orden_compra` int(4) NOT NULL DEFAULT '0',
  `codigo_autoriza_oc` smallint(4) NOT NULL DEFAULT '0',
  `codigo_bodega_solicitud` int(11) NOT NULL DEFAULT '0',
  `codigo_bodega` int(11) NOT NULL DEFAULT '0',
  `observacion` text NOT NULL,
  `codigo_lugar_despacho` int(11) NOT NULL DEFAULT '0',
  `nombre_medico_autoriza` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numero_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PACIENTE` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `numero_ficha` int(11) NOT NULL DEFAULT '0',
  `codigo_estado_paciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PACIENTE_EN_COBRANZA` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `fecha_ingreso_cobranza` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_salida_cobranza` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_usuario_ingreso` int(11) NOT NULL DEFAULT '0',
  `rut_usuario_salida` int(11) NOT NULL DEFAULT '0',
  `fecha_abogado` date NOT NULL DEFAULT '0000-00-00',
  `nombre_abogado` varchar(255) DEFAULT NULL,
  `codigo_forma_pago` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PACIENTE_MEDICION` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(2) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `equipo` varchar(100) NOT NULL DEFAULT '',
  `fecha_ingreso` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_estado` tinyint(3) NOT NULL DEFAULT '1',
  `rut_tecnologo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`codigo_reserva_atencion`,`fecha_ingreso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAGO_CUENTA_DOCUMENTO` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_cuenta` bigint(15) NOT NULL DEFAULT '0',
  `codigo_pago_cuenta` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_documento` int(11) DEFAULT '0',
  `fecha_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numero_documento` bigint(20) DEFAULT '0',
  `impuesto` smallint(3) unsigned DEFAULT '0',
  `monto` decimal(12,2) DEFAULT '0.00',
  `estado_documento` int(11) DEFAULT '0',
  `codigo_unidad_negocio` int(11) DEFAULT '0',
  `cuota` varchar(11) NOT NULL DEFAULT '',
  `fecha_a_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_tipo_pago` int(11) DEFAULT NULL,
  `rut_anulacion` int(11) NOT NULL DEFAULT '0',
  `fecha_anulacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `motivo_anulacion` text,
  `tipo_pago` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`),
  KEY `informe_boletas` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_cuenta`,`codigo_pago_cuenta`,`codigo_unidad_negocio`,`codigo_tipo_documento`),
  KEY `fk_reference_145` (`codigo_tipo_pago`),
  KEY `fk_reference_76` (`codigo_cuenta`,`rut_paciente`,`evento`,`numero_hermano_gemelo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAGO_HONORARIOS` (
  `rut_paciente` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) unsigned NOT NULL DEFAULT '0',
  `evento` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha_traslado` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_ultimo_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_a_pagar` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_forma_pago` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_tipo_item` int(11) unsigned NOT NULL DEFAULT '0',
  `monto_honorario` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `rut_profesional` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_estado_pago_honorario` int(11) unsigned NOT NULL DEFAULT '0',
  `numero_boleta_medico` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_remesa` int(11) unsigned NOT NULL DEFAULT '0',
  `monto_anterior_nc` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_forma_pago`,`rut_profesional`,`codigo_tipo_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAQUETE_CIRUGIA` (
  `codigo_paquete_cirugia` int(11) NOT NULL DEFAULT '0',
  `nombre_paquete_cirugia` varchar(100) DEFAULT NULL,
  `codigo_accion_clinica` int(11) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `banda` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_paquete_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PATOLOGIA_ASOCIADA_CAR` (
  `codigo_patologia` int(11) NOT NULL DEFAULT '0',
  `nombre_patologia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_patologia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PATOLOGIA_AUGE` (
  `codigo_patologia` int(11) NOT NULL DEFAULT '0',
  `nombre_patologia` char(100) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_patologia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAUSA_DATOS` (
  `codigo_pausa_datos` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_pausa` int(11) DEFAULT NULL,
  `nombre_pausa_datos` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `codigo_tipo_pausa_datos` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `codigo_pausa_ab` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_pausa_datos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAUSA_DATOS_DETALLE` (
  `codigo_pausa_datos_detalle` int(11) NOT NULL DEFAULT '0',
  `codigo_pausa_datos` int(11) DEFAULT NULL,
  `nombre_pausa_datos_detalle` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `tipo_objeto` int(2) DEFAULT NULL,
  `nombre_objeto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_pausa_datos_detalle`),
  KEY `fk_reference_901` (`codigo_pausa_datos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAUSA_DATOS_DETALLE_N` (
  `codigo_pausa_datos_detalle` int(11) NOT NULL DEFAULT '0',
  `codigo_pausa_datos` int(11) NOT NULL DEFAULT '0',
  `nombre_pausa_datos_detalle` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `tipo_objeto` int(2) DEFAULT NULL,
  `nombre_objeto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_pausa_datos_detalle`),
  KEY `fk_reference_101` (`codigo_pausa_datos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `PAUSA_DATOS_N` (
  `codigo_pausa_datos` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_pausa` int(11) DEFAULT NULL,
  `nombre_pausa_datos` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `codigo_tipo_pausa_datos` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `codigo_pausa_ab` int(11) DEFAULT NULL,
  `orden_cardio` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_pausa_datos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `PAUSA_PACIENTE` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_pausa_paciente` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` smallint(3) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_pausa_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAUSA_PACIENTE_DETALLE` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_pausa_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_pausa_datos_detalle` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_pausa` int(11) DEFAULT NULL,
  `rut_medico_acargo` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `name_radio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_pausa_paciente`,`codigo_pausa_datos_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PAUSA_UNO_AB` (
  `codigo_pausa_ab` int(11) NOT NULL AUTO_INCREMENT,
  `pausa_ab` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_pausa_ab`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS `PERFIL` (
  `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_perfil` varchar(50) DEFAULT NULL,
  `descripcion_perfil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_perfil`),
  KEY `fk_reference_17` (`codigo_estado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

CREATE TABLE IF NOT EXISTS `PERFIL_bak` (
  `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_perfil` varchar(50) DEFAULT NULL,
  `descripcion_perfil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_perfil`),
  KEY `fk_reference_17` (`codigo_estado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

CREATE TABLE IF NOT EXISTS `PERSONA` (
  `rut` int(11) NOT NULL DEFAULT '0',
  `nombres` varchar(60) DEFAULT NULL,
  `telefono_movil` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(60) DEFAULT NULL,
  `telefono_trabajo` varchar(20) DEFAULT NULL,
  `fax` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PJURIDICA` (
  `rut_pjuridica` int(11) NOT NULL DEFAULT '0',
  `giro` varchar(100) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT '1',
  `codigo_tipo_pjuridica` int(11) NOT NULL DEFAULT '0',
  `nombre_contacto` varchar(100) DEFAULT '',
  `codigo_cuenta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rut_pjuridica`,`codigo_tipo_pjuridica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PNATURAL` (
  `rut_pnatural` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `codigo_nacionalidad` int(11) DEFAULT NULL,
  `codigo_estado_civil` int(11) DEFAULT NULL,
  `rut_pjuridica_convenio` int(11) DEFAULT NULL,
  `nombre_pnatural` varchar(60) DEFAULT NULL,
  `apellido_paterno` varchar(40) DEFAULT NULL,
  `apellido_materno` varchar(40) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `observacion_no_medica` text,
  `ruta_foto_pnatural` varchar(255) DEFAULT NULL,
  `carga_interfaz` int(1) NOT NULL DEFAULT '0',
  `fecha_carga` datetime DEFAULT NULL,
  PRIMARY KEY (`rut_pnatural`,`numero_hermano_gemelo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `POSICION_QUIRURGICA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_posicion_quirurgica` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_posicion` int(11) DEFAULT NULL,
  `otra_posicion` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_posicion_quirurgica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

CREATE TABLE IF NOT EXISTS `PRECIO` (
  `id_precio` int(11) unsigned NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital` int(4) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `factor_nocturno` decimal(4,3) NOT NULL DEFAULT '0.000',
  `factor_ambulatorio` decimal(4,3) NOT NULL DEFAULT '0.000',
  `factor_hospitalizado` decimal(4,3) NOT NULL DEFAULT '0.000',
  `valor_precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_a_pagar` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_inicio_vigencia` datetime DEFAULT '0000-00-00 00:00:00',
  `codigo_convenio` tinyint(3) NOT NULL DEFAULT '0',
  `codigo_lugar_atencion` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_precio`,`codigo_accion_clinica`,`codigo_hospital`,`codigo_prevision`,`codigo_convenio`,`codigo_lugar_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PRECIO_ARANCEL_MLE` (
  `ano_precio` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica` int(11) unsigned NOT NULL DEFAULT '0',
  `nivel1` decimal(10,0) NOT NULL DEFAULT '0',
  `nivel2` decimal(10,0) NOT NULL DEFAULT '0',
  `nivel3` decimal(10,0) NOT NULL DEFAULT '0',
  `fecha_vigencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_item_cirugia` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ano_precio`,`codigo_accion_clinica`,`codigo_item_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PREPARACION_PABELLON` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_preparacion_pabellon` int(11) NOT NULL DEFAULT '0',
  `lavado` int(11) DEFAULT NULL,
  `producto_lavado` text,
  `pincelacion` int(11) DEFAULT NULL,
  `producto_pincelacion` text,
  `ioban` int(11) DEFAULT NULL,
  `stridrape` int(11) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`codigo_preparacion_pabellon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PRESUPUESTO` (
  `codigo_presupuesto` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) DEFAULT '0',
  `evento` int(11) DEFAULT NULL,
  `rut_profesional_salud` int(11) DEFAULT NULL,
  `rut_funcionario` int(11) DEFAULT '0',
  `codigo_paquete_cirugia` int(11) DEFAULT NULL,
  `codigo_prevision` int(11) DEFAULT '0',
  `codigo_prevision2` int(11) DEFAULT NULL,
  `codigo_item_cirugia` int(11) DEFAULT NULL,
  `fecha_emision_presupuesto` datetime DEFAULT NULL,
  `nombre_cirugia` varchar(100) DEFAULT NULL,
  `observacion` text,
  `codigo_procedencia` int(11) DEFAULT NULL,
  `procedencia` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_presupuesto`),
  KEY `fk_reference_133` (`codigo_paquete_cirugia`,`codigo_prevision`,`codigo_item_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PREVENCION_UPP_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_prevencion_upp` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_prevencion` int(11) DEFAULT NULL,
  `otro_upp` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_prevencion_upp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

CREATE TABLE IF NOT EXISTS `PREVISION` (
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `nombre_prevision` varchar(40) DEFAULT NULL,
  `codigo_tipo_prevision` smallint(6) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `agrupa_accion_clinica` int(11) DEFAULT '0',
  `nombre_abreviado` varchar(40) DEFAULT NULL,
  `convenio` tinyint(4) NOT NULL DEFAULT '0',
  `rut_pjuridica` int(11) DEFAULT NULL,
  `regla_tributaria` tinyint(3) NOT NULL DEFAULT '1',
  `dias_pago` int(10) DEFAULT NULL,
  `codigo_financiador` int(11) NOT NULL DEFAULT '0',
  `estado_agenda_web` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_prevision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PREVISION_PNATURAL` (
  `rut_pnatural` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `codigo_prevision2` int(11) NOT NULL DEFAULT '0',
  `fecha_prevision` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`rut_pnatural`,`numero_hermano_gemelo`,`evento`,`fecha_prevision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROCEDENCIA` (
  `codigo_procedencia` int(11) NOT NULL DEFAULT '0',
  `nombre_procedencia` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_procedencia`),
  KEY `fk_reference_76` (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROCEDIMIENTOS_INVASIVOS` (
  `codigo_procedimientos_invasivos` int(11) NOT NULL DEFAULT '0',
  `nombre_procedimientos_invasivos` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_procedimientos_invasivos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROCEDIMIENTOS_INVASIVOS_PACIENTE` (
  `codigo_invasivos_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_procedimientos_invasivos` int(11) DEFAULT NULL,
  `proceimientos` int(11) DEFAULT NULL,
  `lvl_procedimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_invasivos_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROFESIONAL_SALUD` (
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `codigo_especialidad_medica` int(11) NOT NULL DEFAULT '0',
  `planta` varchar(6) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `duracion_consulta` int(11) NOT NULL DEFAULT '0',
  `atiende_fonasa_consulta` char(2) NOT NULL DEFAULT '',
  `observacion_profesional` text,
  `codigo_tipo_equipo_quirurgico` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_especialidad_medica`,`rut_funcionario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROFILAXIS_ANTIBIOTICA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_profilaxis_antibiotica` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_farmaco` int(11) DEFAULT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `dosis` text,
  `codigo_tipo_via` int(11) NOT NULL DEFAULT '0',
  `otro_tipo_via` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_profilaxis_antibiotica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_CEC_CAR` (
  `codigo_protocolo_cec` int(11) NOT NULL DEFAULT '0',
  `nombre_protocolo_cec` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_protocolo_cec`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_CEC_DETALLE_CAR` (
  `codigo_protocoo_detalle` int(11) NOT NULL DEFAULT '0',
  `nombre_protocolo_detalle` varchar(255) DEFAULT NULL,
  `codigo_tipo_campo` int(11) DEFAULT NULL,
  `codigo_protocolo_cec` int(11) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_protocoo_detalle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_CEC_PACIENTE_CAR` (
  `codigo_cec_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_protocolo_detalle` int(11) DEFAULT NULL,
  `valor_campo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_cec_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_OPERATORIO` (
  `codigo_protocolo_operatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_cirugia` int(11) DEFAULT NULL,
  `codigo_tipo_anestesia` int(11) DEFAULT NULL,
  `codigo_tipo_herida` int(11) DEFAULT NULL,
  `fecha_cirugia` datetime DEFAULT NULL,
  `hora_entrada_pabellon` time DEFAULT NULL,
  `hora_inicio_cirugia` time DEFAULT NULL,
  `hora_termino_cirugia` time DEFAULT NULL,
  `hora_salida_pabellon` time DEFAULT NULL,
  `descripcion_operatoria` text,
  `indicaciones` text,
  `biopsia` int(1) DEFAULT NULL,
  `cultivo` int(1) DEFAULT NULL,
  `uso_rayos` int(1) DEFAULT NULL,
  `profilaxis_antibiotica` int(1) DEFAULT NULL,
  `reintervencion` int(11) DEFAULT NULL,
  `rut_otro_cirujano` int(11) DEFAULT NULL,
  `nombre_otro_cirujano` text,
  `codigo_destino_paciente` int(11) DEFAULT NULL,
  `codigo_otro_destino` int(11) DEFAULT NULL,
  `tiempo_cec_1` int(11) DEFAULT NULL,
  `tiempo_cec_2` int(11) DEFAULT NULL,
  `tiempo_clam_1` int(11) DEFAULT NULL,
  `tiempo_clam_2` int(11) DEFAULT NULL,
  `tiempo_paro_1` int(11) DEFAULT NULL,
  `tiempo_paro_2` int(11) DEFAULT NULL,
  `asist_ecmo` int(11) DEFAULT NULL,
  `codigo_farmaco` int(11) DEFAULT NULL,
  `otro_farmaco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_protocolo_operatorio`),
  KEY `fk_reference_88` (`codigo_tipo_cirugia`),
  KEY `fk_reference_89` (`codigo_tipo_anestesia`),
  KEY `fk_reference_90` (`codigo_tipo_herida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_PACIENTE` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_anestesia` int(11) DEFAULT NULL,
  `diagnostico` varchar(200) DEFAULT NULL,
  `hora_ingreso_pabellon` time NOT NULL DEFAULT '00:00:00',
  `hora_alta_pabellon` time NOT NULL DEFAULT '00:00:00',
  `hora_inicio_cirugia` datetime DEFAULT NULL,
  `hora_termino_cirugia` datetime DEFAULT NULL,
  `od` int(1) DEFAULT NULL,
  `oi` int(1) DEFAULT NULL,
  `pabellonera` varchar(200) DEFAULT NULL,
  `protocolo` text,
  `observaciones` text,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PROTOCOLO_TIPO` (
  `codigo_accion_clinica` int(11) DEFAULT '0',
  `codigo_hospital` int(11) DEFAULT '0',
  `rut_funcionario` int(11) DEFAULT '0',
  `protocolo_tipo` text,
  `diagnostico_txt` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RECEPCION_ORDEN_COMPRA` (
  `codigo_recepcion_oc` int(11) NOT NULL DEFAULT '0',
  `numero_oc` int(11) NOT NULL DEFAULT '0',
  `fecha_recepcion_oc` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_anulacion` datetime DEFAULT NULL,
  `numero_factura` int(11) NOT NULL DEFAULT '0',
  `numero_guia` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `rut_proveedor` int(11) NOT NULL DEFAULT '0',
  `rut_anula` int(11) NOT NULL DEFAULT '0',
  `valor_neto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `impuesto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_vencimiento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_factura` datetime DEFAULT NULL,
  `fecha_guia` datetime DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  `codigo_documento` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_recepcion_oc`,`numero_oc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RECETA_MEDICA_FC` (
  `codigo_receta_medica` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_consulta_medica` int(11) NOT NULL DEFAULT '0',
  `codigo_item_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_receta` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_atencion` varchar(200) NOT NULL DEFAULT '',
  `rut_receta` int(11) DEFAULT '0',
  `fecha_receta` datetime DEFAULT NULL,
  `cantidad_uno` int(11) DEFAULT '0',
  `cantidad_dos` int(11) DEFAULT '0',
  `cantidad_tres` int(11) DEFAULT '0',
  `cantidad_cuatro` int(11) DEFAULT '0',
  PRIMARY KEY (`codigo_receta_medica`,`codigo_reserva_atencion`,`codigo_consulta_medica`,`codigo_tipo_receta`,`codigo_detalle_atencion`,`codigo_item_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RECETA_PACIENTE_FC` (
  `codigo_receta_paciente_fc` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_receta` int(11) NOT NULL DEFAULT '0',
  `codigo_detalle_atencion` varchar(200) DEFAULT NULL,
  `fecha_receta` datetime DEFAULT NULL,
  `od_sph` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_cyl` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_ax` int(11) NOT NULL DEFAULT '0',
  `oi_sph` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_cyl` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_ax` int(11) NOT NULL DEFAULT '0',
  `odi_dp_lejos` int(11) NOT NULL DEFAULT '0',
  `odi_add` decimal(10,2) NOT NULL DEFAULT '0.00',
  `odi_dp_cerca` int(11) NOT NULL DEFAULT '0',
  `observacion` text,
  PRIMARY KEY (`codigo_receta_paciente_fc`,`codigo_reserva_atencion`,`rut_paciente`,`numero_hermano_gemelo`),
  KEY `fk_reference_106` (`codigo_tipo_receta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RECUENTO` (
  `codigo_recuento` int(11) NOT NULL DEFAULT '0',
  `nombre_recuento` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_recuento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REFRACCION_PACIENTE_FC` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_prueba_subjetiva` int(11) NOT NULL DEFAULT '1',
  `od_sph_t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_cyl_t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_ax_t` int(11) NOT NULL DEFAULT '0',
  `oi_sph_t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_cyl_t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_ax_t` int(11) NOT NULL DEFAULT '0',
  `odi_dp_lejos_t` int(11) NOT NULL DEFAULT '0',
  `odi_dp_cerca_t` int(11) NOT NULL DEFAULT '0',
  `odi_add_t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_hora_reg_tecnologo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_tecnologo` int(11) NOT NULL DEFAULT '0',
  `codigo_vision_lejos_od_t` int(11) NOT NULL DEFAULT '0',
  `codigo_vision_lejos_oi_t` int(11) NOT NULL DEFAULT '0',
  `parcial_lejos_od_t` tinyint(3) NOT NULL DEFAULT '0',
  `parcial_lejos_oi_t` tinyint(3) NOT NULL DEFAULT '0',
  `rut_medico` int(11) NOT NULL DEFAULT '0',
  `od_sph_m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_cyl_m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `od_ax_m` int(11) NOT NULL DEFAULT '0',
  `oi_sph_m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_cyl_m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `oi_ax_m` int(11) NOT NULL DEFAULT '0',
  `odi_dp_lejos_m` int(11) NOT NULL DEFAULT '0',
  `odi_dp_cerca_m` int(11) NOT NULL DEFAULT '0',
  `odi_add_m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_hora_reg_medico` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `codigo_vision_lejos_od_m` int(11) NOT NULL DEFAULT '0',
  `codigo_vision_lejos_oi_m` int(11) NOT NULL DEFAULT '0',
  `parcial_lejos_od_m` tinyint(3) NOT NULL DEFAULT '0',
  `parcial_lejos_oi_m` tinyint(3) NOT NULL DEFAULT '0',
  `codigo_vision_cerca_odi1_m` tinyint(3) NOT NULL DEFAULT '0',
  `codigo_vision_cerca_odi2_m` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_tipo_prueba_subjetiva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGION` (
  `codigo_region` int(6) NOT NULL DEFAULT '0',
  `nombre_region` varchar(100) DEFAULT NULL,
  `orden` int(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `REGISTRO_CIRUGIA` (
  `codigo_registro_cirugia` int(11) NOT NULL DEFAULT '0',
  `nombre_registro_cirugia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_registro_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_CIRUGIA_PACIENTE` (
  `id_registro_cirugia_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_cirugia` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `otro_cirugia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_registro_cirugia_paciente`,`codigo_registro_cirugia`,`codigo_reserva_atencion`),
  KEY `fk_reference_108` (`codigo_registro_cirugia`),
  KEY `fk_reference_110` (`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_CIRUGIA_PACIENTE_V2` (
  `codigo_cirugia_v2` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `nombre_cirugia` text,
  PRIMARY KEY (`codigo_cirugia_v2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_INTRAOPERATORIO` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `codigo_tipo_anestesia` int(11) DEFAULT NULL,
  `hora_egreso` time DEFAULT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_ingreso_tpm_anestesia` time DEFAULT NULL,
  `hora_ingreso_anestesiologo` time DEFAULT NULL,
  `hora_ingreso_cirujano` time DEFAULT NULL,
  `hora_ingreso_enfermera` time DEFAULT NULL,
  `hora_ingreso_arsenalero` time DEFAULT NULL,
  `diagnostico` text,
  `codigo_diagnostico` int(11) DEFAULT NULL,
  `hora_inicio_anestesia` time DEFAULT NULL,
  `hora_termino_anestesia` time DEFAULT NULL,
  `hora_inicio_actoquirurgico` time DEFAULT NULL,
  `hora_termino_actoquirurgico` time DEFAULT NULL,
  `ecg` int(1) DEFAULT NULL,
  `oximetria` int(1) DEFAULT NULL,
  `pai` int(1) DEFAULT NULL,
  `pani` int(1) DEFAULT NULL,
  `capnografia` int(1) DEFAULT NULL,
  `temperatura_esofagica` int(1) DEFAULT NULL,
  `temperatura_rectal` int(1) DEFAULT NULL,
  `pvc` int(11) DEFAULT NULL,
  `sonda_vesical` int(11) DEFAULT NULL,
  `saturacion_cerebral` int(11) DEFAULT NULL,
  `via_venosa_periferica` int(1) DEFAULT NULL,
  `via_venosa_central` int(1) DEFAULT NULL,
  `numero_via_venosa_central` int(1) NOT NULL DEFAULT '0',
  `numero_via_venosa_periferica` int(11) DEFAULT NULL,
  `numero_arterial` int(11) DEFAULT NULL,
  `lugar_via_venosa` text,
  `lugar_arterial` text,
  `pantibiotica_hora` time DEFAULT NULL,
  `pantibiotica_farmaco` text,
  `pantibiotica_dosis` varchar(200) DEFAULT NULL,
  `posicion_quirurgica` text,
  `prevencion_upp` text,
  `zona_operatoria_lavado` text,
  `otra_zona_operatoria_lavado` text,
  `zona_operatoria_pincelacion` text,
  `otra_zona_operatoria_pincelaci` text,
  `electrodo_neutro_ubicacion` text,
  `electrodo_neutro_piel_antes` text,
  `otro_piel_antes` text,
  `electrodo_neutro_piel_despues` text,
  `otro_piel_despues` text,
  `biopsia` int(1) DEFAULT NULL,
  `biopsia_n_muestra` varchar(200) DEFAULT NULL,
  `biopsia_sondas_drenajes` text,
  `observaciones` text,
  `intervencion_quirurgica_realizada` int(11) NOT NULL DEFAULT '0',
  `fecha_registro` datetime DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `rut_cirujano` int(11) DEFAULT NULL,
  `rut_cirujano_2` int(11) DEFAULT NULL,
  `rut_cirujano_3` int(11) DEFAULT NULL,
  `rut_anestesiologo` int(11) DEFAULT NULL,
  `rut_pabellonero` int(11) DEFAULT NULL,
  `rut_arsenalero` int(11) DEFAULT NULL,
  `rut_anestesista` int(11) DEFAULT NULL,
  `rut_enfermera_pabellon` int(11) DEFAULT NULL,
  `rut_enfermera_anestesia` int(11) DEFAULT NULL,
  `rut_perfusionista` int(11) DEFAULT NULL,
  `rut_registro_anestesia` int(11) NOT NULL DEFAULT '0',
  `fecha_registro_anestesia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_inicio_anestesia` datetime DEFAULT NULL,
  `rut_registro_enfermera` int(11) DEFAULT NULL,
  `fecha_registro_enfermera` datetime DEFAULT NULL,
  `fecha_salida_pabellon` datetime DEFAULT NULL,
  `codigo_hospital` int(11) DEFAULT NULL,
  `fecha_registro_inicio_cirugia` datetime DEFAULT NULL,
  `rut_registro_inicio_cirugia` int(11) DEFAULT NULL,
  `fecha_inicio_cirugia` datetime DEFAULT NULL,
  `rut_registro_termino_cirugia` int(11) NOT NULL DEFAULT '0',
  `fecha_registro_termino_cirugia` datetime DEFAULT NULL,
  `fecha_termino_anestesia` datetime DEFAULT NULL,
  `fecha_termino_cirugia` datetime DEFAULT NULL,
  `destino_postop` int(11) DEFAULT NULL,
  `fecha_induccion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_incision_piel` datetime DEFAULT NULL,
  `temperatura_minima` int(11) DEFAULT NULL,
  `protamina` int(11) DEFAULT NULL,
  `cierre_esternon` int(11) DEFAULT NULL,
  `cierre_piel` int(11) DEFAULT NULL,
  `duracion_diseccion` time DEFAULT NULL,
  `duracion_cec_clam` time DEFAULT NULL,
  `duracion_clamp` time DEFAULT NULL,
  `paro` int(11) DEFAULT NULL,
  `codigo_transfusion` int(11) DEFAULT NULL,
  `codigo_sellante` int(11) DEFAULT NULL,
  `beriplast_colle_sellante` int(11) DEFAULT NULL,
  `trombina_sellante` int(11) DEFAULT NULL,
  `gelita_sellante` int(11) DEFAULT NULL,
  `esternon_abierto` int(11) DEFAULT NULL,
  `ventana` int(11) DEFAULT NULL,
  `piel_cerra` int(11) DEFAULT NULL,
  `aspiracion_continua` int(11) DEFAULT NULL,
  `eco_tee` int(11) DEFAULT NULL,
  `eco_epicardio` int(11) DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  `total_transfusiones` text,
  `personas_pabellon` int(11) DEFAULT NULL,
  `oxigenador` int(11) DEFAULT NULL,
  `intercambiador` int(11) DEFAULT NULL,
  `canula` int(11) DEFAULT NULL,
  `t_minima` int(11) DEFAULT NULL,
  `fecha_inicio_recuperacion` datetime DEFAULT NULL,
  `fecha_fin_recuperacion` datetime DEFAULT NULL,
  `fecha_protamina` datetime DEFAULT NULL,
  `fecha_cierre_piel` datetime DEFAULT NULL,
  `fecha_cierre_esternon` datetime DEFAULT NULL,
  `grabado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_registro_intraoperatorio`),
  KEY `fk_reference_78` (`codigo_tipo_anestesia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `REGISTRO_PREOPERATORIO` (
  `codigo_registro_preoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `hora_pre_anestesia` time DEFAULT NULL,
  `intervencion_quirurgica_propuesta` varchar(200) NOT NULL DEFAULT '',
  `codigo_hospital` int(11) DEFAULT NULL,
  `rut_cirujano` varchar(10) DEFAULT NULL,
  `otro_cirujano` varchar(255) DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `premedicacion` text,
  `peso` varchar(255) DEFAULT NULL,
  `talla` varchar(255) DEFAULT NULL,
  `temperatura_actual` varchar(200) DEFAULT NULL,
  `pulso` varchar(255) DEFAULT NULL,
  `respiratoria` varchar(255) DEFAULT NULL,
  `temperatura_card` int(11) DEFAULT NULL,
  `presion1` int(11) NOT NULL DEFAULT '0',
  `presion2` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_paciente_pasa_pabellon` datetime DEFAULT NULL,
  `pabellon_destino` int(11) DEFAULT NULL,
  `fecha_ingreso_hospital` datetime DEFAULT NULL,
  `fecha_ingreso_ccv` datetime DEFAULT NULL,
  `reoperacion` int(11) DEFAULT NULL,
  `fecha_recuperacion` datetime DEFAULT NULL,
  `glosa_reoperacion` varchar(255) NOT NULL DEFAULT '',
  `diagnostico_card` int(11) NOT NULL DEFAULT '0',
  `operacion_card` text,
  `examen_fisico_enfermeria` int(11) DEFAULT NULL,
  `examen_fisico_medico` int(11) DEFAULT NULL,
  `bano_anteriores` int(11) DEFAULT NULL,
  `pincelacion` int(11) DEFAULT NULL,
  `piel_povidona` int(11) DEFAULT NULL,
  `piel_clorhexidina` int(11) DEFAULT NULL,
  `traslado_camilla` int(11) DEFAULT NULL,
  `traslado_brazo` int(11) DEFAULT NULL,
  `traslado_silla` int(11) DEFAULT NULL,
  `vestuario_hospital` int(11) DEFAULT NULL,
  `vestuario_pijama` int(11) DEFAULT NULL,
  `vestuario_gorro` int(11) DEFAULT NULL,
  `ex_preoperatorio` int(11) DEFAULT NULL,
  `proveniente_uci` varchar(255) DEFAULT NULL,
  `revision_enfermera` text,
  `brazalete_identificacion` int(11) DEFAULT NULL,
  `suspension` int(11) DEFAULT NULL,
  `medicamento_suspension` varchar(255) DEFAULT NULL,
  `hora_fin_preanestesia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `temperatura` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_registro_preoperatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_PROTOCOLO_OPERATORIO` (
  `codigo_registro_protocolo_operatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) DEFAULT '0',
  `evento` int(11) DEFAULT '0',
  `codigo_protocolo_operatorio` int(11) DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo_registro_protocolo_operatorio`),
  KEY `fk_reference_152` (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_protocolo_operatorio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_RECUPERACION` (
  `codigo_registro_recuperacion` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` tinyint(3) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `rut_registro` int(11) NOT NULL DEFAULT '0',
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `rut_medico_acargo` int(11) NOT NULL DEFAULT '0',
  `codigo_servicio_clinico` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_registro_recuperacion`,`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_TRAUMATOLOGIA` (
  `codigo_registro_traumatologia` int(11) NOT NULL DEFAULT '0',
  `nombre_registro_traumatologia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_registro_traumatologia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `REGISTRO_TRAUMATOLOGIA_PACIENTE` (
  `id_registro_traumatologia_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_traumatologia` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `otro_traumatologia` varchar(255) DEFAULT NULL,
  `codigo_estado` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_registro_traumatologia_paciente`,`codigo_registro_traumatologia`,`codigo_reserva_atencion`),
  KEY `fk_reference_109` (`codigo_registro_traumatologia`),
  KEY `fk_reference_111` (`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RELACION_PN_PJ` (
  `rut_pnatural` int(11) NOT NULL AUTO_INCREMENT,
  `rut_pjuridica` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_pnatural`,`rut_pjuridica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `REMESA_HONORARIO` (
  `codigo_remesa` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  `monto_autorizado` decimal(12,2) NOT NULL DEFAULT '0.00',
  `monto_a_pagar` decimal(12,2) NOT NULL DEFAULT '0.00',
  `numero_boleta_medico` int(11) NOT NULL DEFAULT '0',
  `codigo_documento` int(11) NOT NULL DEFAULT '0',
  `fecha_emision_remesa` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_solicitud_boleta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_recepcion_boleta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_pago_honorario` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numero_egreso` int(11) NOT NULL DEFAULT '0',
  `estado_confirmacion` int(4) NOT NULL DEFAULT '0',
  `rut_emisor` int(11) NOT NULL DEFAULT '0',
  `rut_anula` int(11) NOT NULL DEFAULT '0',
  `fecha_anulacion_remesa` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `motivo_anula` text,
  PRIMARY KEY (`codigo_remesa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `RESERVA_ATENCION` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `id_horario_consulta` int(11) DEFAULT NULL,
  `rut_pnatural` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) NOT NULL DEFAULT '0',
  `numero_ficha_medica` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(40) DEFAULT NULL,
  `apellido_materno` varchar(40) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono1` varchar(15) NOT NULL DEFAULT '0',
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_prevision` int(11) NOT NULL DEFAULT '0',
  `rut_profesional` int(11) NOT NULL DEFAULT '0',
  `codigo_lugar_atencion` int(4) NOT NULL DEFAULT '0',
  `codigo_especialidad_alternativa` int(11) NOT NULL DEFAULT '0',
  `fecha_registro` datetime DEFAULT NULL,
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `fecha_reserva` datetime DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  `rut_funcionario_anula` int(11) NOT NULL DEFAULT '0',
  `codigo_causa_suspencion` int(11) NOT NULL DEFAULT '0',
  `otra_causa_suspencion` text,
  `codigo_estado_reserva` tinyint(3) NOT NULL DEFAULT '1',
  `codigo_estado_pabellon` int(11) NOT NULL DEFAULT '1',
  `rut_medico_solicita` int(11) NOT NULL DEFAULT '0',
  `nombre_otro_medico` varchar(100) DEFAULT NULL,
  `rut_medico_solicita_2` int(11) NOT NULL DEFAULT '0',
  `nombre_otro_medico_2` varchar(100) DEFAULT NULL,
  `rut_modifica` int(11) NOT NULL DEFAULT '0',
  `fecha_modifica` datetime DEFAULT NULL,
  `codigo_servicio_ingreso` int(11) NOT NULL DEFAULT '0',
  `diagnostico` varchar(255) DEFAULT NULL,
  `tipo_paciente` int(11) DEFAULT NULL,
  `codigo_accion_clinica_1` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital_1` int(11) NOT NULL DEFAULT '0',
  `codigo_accion_clinica_2` int(11) NOT NULL DEFAULT '0',
  `codigo_hospital_2` int(11) NOT NULL DEFAULT '0',
  `tiempo_cirugia` time DEFAULT NULL,
  `via_aerea_dificil` int(3) NOT NULL DEFAULT '0',
  `condicional` int(3) NOT NULL DEFAULT '0',
  `agregado` int(3) NOT NULL DEFAULT '0',
  `observacion_reserva` text,
  `codigo_destino` int(11) DEFAULT NULL,
  `codigo_procedencia` int(11) DEFAULT NULL,
  `grupo_sanguineo` varchar(255) DEFAULT NULL,
  `codigo_diagnostico` int(11) DEFAULT NULL,
  `id_cirugia_cardiomemo` int(11) DEFAULT NULL,
  `id_cirugia_cec` int(11) DEFAULT NULL,
  `ctacte_sam` int(11) NOT NULL,
  `le_sam` int(11) NOT NULL,
  `reserva_sam` int(11) NOT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`),
  KEY `segundo` (`id_horario_consulta`),
  KEY `indice1` (`codigo_reserva_atencion`,`fecha_reserva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ROL` (
  `codigo_rol` int(11) NOT NULL DEFAULT '0',
  `nombre_rol` varchar(20) DEFAULT NULL,
  `codigo_estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo_rol`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SERVICIO` (
  `codigo_servicio` int(11) NOT NULL DEFAULT '0',
  `nombre_servicio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_servicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SERVICIO_CLINICO` (
  `codigo_servicio_clinico` int(11) NOT NULL DEFAULT '0',
  `codigo_servicio` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_servicio` int(11) NOT NULL DEFAULT '0',
  `nombre_servicio_clinico` varchar(50) DEFAULT NULL,
  `dotacion_cama` int(11) DEFAULT NULL,
  `camas_disponible` int(11) DEFAULT NULL,
  `codigo_accion_clinica_cama` int(11) DEFAULT NULL,
  `codigo_servicio_ssms` int(11) DEFAULT NULL,
  `codigo_accion_clinica_cama_privado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_servicio_clinico`),
  KEY `fk_relationship_4` (`codigo_tipo_servicio`),
  KEY `fk_relationship_5` (`codigo_servicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SERVICIO_ORDEN_COMPRA` (
  `codigo_servicio_orden_compra` int(11) NOT NULL DEFAULT '0',
  `nombre_servicio_orden_compra` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_servicio_orden_compra`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SERVICIO_POSTOPERATORIO_PACIENTE` (
  `id_servicio_postoperatorio_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `codigo_servicio_clinico` varchar(10) NOT NULL DEFAULT '',
  `nombre_otros_servicio` varchar(255) DEFAULT NULL,
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `rut_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `codigo_estado` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_servicio_postoperatorio_paciente`,`codigo_reserva_atencion`,`codigo_servicio_clinico`),
  KEY `fk_reference_112` (`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SERVICIO_SALUD` (
  `codigo_servicio_salud` int(6) NOT NULL DEFAULT '0',
  `codigo_region` int(6) NOT NULL DEFAULT '0',
  `nombre_servicio_salud` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_servicio_salud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `SERVICIO_USUARIO` (
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `nombre_usuario` varchar(50) NOT NULL DEFAULT '',
  `codigo_servicio` int(11) NOT NULL DEFAULT '0',
  `fecha_servicio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`rut_funcionario`,`nombre_usuario`,`codigo_servicio`,`fecha_servicio`),
  KEY `fk_reference_124` (`codigo_servicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SESION` (
  `sesion` tinyint(3) NOT NULL DEFAULT '0',
  `descripcion` char(50) DEFAULT NULL,
  `descripcion_corto` char(50) NOT NULL DEFAULT '',
  `codigo_estado` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sesion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SISTEMA` (
  `codigo_sistema` int(11) NOT NULL DEFAULT '0',
  `nombre_sistema` varchar(100) DEFAULT NULL,
  `nombre_base_datos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_sistema`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SOLICITUD_DESPACHO_ARTICULO` (
  `numero_pedido` int(11) NOT NULL DEFAULT '0',
  `codigo_bodega_solicita` int(11) NOT NULL DEFAULT '0',
  `codigo_bodega_despacho` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_movimiento` int(11) NOT NULL DEFAULT '0',
  `fecha_solicitud_articulo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_autorizacion_articulo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_despacho_articulo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_anula_solicitud` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_anula_despacho` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_solicitante` int(11) NOT NULL DEFAULT '0',
  `rut_despacho` int(11) NOT NULL DEFAULT '0',
  `rut_autoriza` int(11) NOT NULL DEFAULT '0',
  `rut_anula_solicitud` int(11) NOT NULL DEFAULT '0',
  `rut_anula_despacho` int(11) NOT NULL DEFAULT '0',
  `controlado` int(11) NOT NULL DEFAULT '0',
  `observacion` text,
  `ajuste` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numero_pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `SOLICITUD_TRASLADO` (
  `numero_solicitud_traslado` int(11) NOT NULL AUTO_INCREMENT,
  `rut_funcionario` int(11) DEFAULT '0',
  `servicio_origen` int(11) DEFAULT '0',
  `servicio_destino` int(11) DEFAULT '0',
  `rut_paciente` int(11) DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) DEFAULT '0',
  `evento` int(11) DEFAULT '0',
  `fecha_traslado` datetime DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  PRIMARY KEY (`numero_solicitud_traslado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `SONDA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_sonda_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_sonda` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `ubicacion` text NOT NULL,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_sonda_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `TARJETA_CREDITO` (
  `codigo_tarjeta_credito` int(11) NOT NULL DEFAULT '0',
  `nombre_tarjeta_credito` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tarjeta_credito`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TEJIDOS` (
  `codigo_tejido` int(11) NOT NULL DEFAULT '0',
  `nombre_tejido` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tejido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TEJIDO_PACIENTE` (
  `codigo_tejido_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_tejido` int(11) DEFAULT NULL,
  `numero_tejido` int(11) DEFAULT NULL,
  `tipo_tejido` text,
  `otro_tejido` text,
  PRIMARY KEY (`codigo_tejido_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TENSION_PACIENTE` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `od_t` int(11) NOT NULL DEFAULT '0',
  `oi_t` int(11) NOT NULL DEFAULT '0',
  `fecha_hora_reg_tecnologo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rut_tecnologo` int(11) NOT NULL DEFAULT '0',
  `rut_medico` int(11) NOT NULL DEFAULT '0',
  `od_m` int(11) NOT NULL DEFAULT '0',
  `oi_m` int(11) NOT NULL DEFAULT '0',
  `fecha_hora_reg_medico` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`codigo_reserva_atencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIEMPO_CAR` (
  `codigo_tiempo` int(11) NOT NULL DEFAULT '0',
  `nombre_tiempo` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tiempo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIEMPO_PACIENTE_CAR` (
  `codigo_tiempo_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_tiempo` int(11) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `valor_total` time DEFAULT NULL,
  PRIMARY KEY (`codigo_tiempo_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_AGRUPACION_CUENTA` (
  `codigo_agrupacion_cuenta` int(6) NOT NULL DEFAULT '0',
  `nombre_agrupacion_cuenta` varchar(100) DEFAULT NULL,
  `descripcion_agrupacion_cuenta` varchar(100) DEFAULT NULL,
  `tipo_agrupacion` smallint(3) DEFAULT NULL,
  PRIMARY KEY (`codigo_agrupacion_cuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ALERTA` (
  `codigo_tipo_alerta` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_alerta` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_alerta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ANESTESIA` (
  `codigo_tipo_anestesia` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_anestesia` char(50) NOT NULL DEFAULT '',
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_anestesia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ANTECEDENTE` (
  `codigo_tipo_antecedente` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_antecedente` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_tipo_antecedente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ARTICULO` (
  `codigo_tipo_articulo` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_articulo` varchar(50) DEFAULT NULL,
  `inicio_codigo_articulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_articulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_BODEGA` (
  `codigo_tipo_bodega` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_bodega` varchar(50) DEFAULT NULL,
  `codigo_estado` smallint(4) DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_bodega`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_CARGO` (
  `codigo_tipo_cargo` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_cargo` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_CAUSA_SUSPENCION` (
  `codigo_tipo_causa_suspencion` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_causa_suspencion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_causa_suspencion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_CIRUGIA` (
  `codigo_tipo_cirugia` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_cirugia` varchar(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `ayuda` text,
  PRIMARY KEY (`codigo_tipo_cirugia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_CIRUGIA_CEC` (
  `codigo_tipo` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_CUENTA` (
  `codigo_tipo_cuenta` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_cuenta` char(50) DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_cuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_DATO` (
  `codigo_tipo_dato` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_dato` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_dato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_DESCUENTO` (
  `codigo_tipo_descuento` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_descuento` varchar(10) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_descuento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_DETALLE` (
  `codigo_tipo_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_detalle` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_detalle`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `TIPO_DIAGNOSTICO` (
  `codigo_tipo_diagnostico` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_diagnostico` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_diagnostico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

CREATE TABLE IF NOT EXISTS `TIPO_DOCUMENTO` (
  `codigo_tipo_documento` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_documento` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_documento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_DRENAJE` (
  `codigo_tipo_drenaje` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_drenaje` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_drenaje`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=7 ;

CREATE TABLE IF NOT EXISTS `TIPO_ELECTRODO_NEUTRO` (
  `codigo_tipo_electrodo_neutro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_electrodo_neutro` char(50) DEFAULT NULL,
  `antes` int(11) DEFAULT NULL,
  `despues` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_electrodo_neutro`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=9 ;

CREATE TABLE IF NOT EXISTS `TIPO_EQUIPO_QUIRURGICO` (
  `codigo_tipo_equipo_quirurgico` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_equipo_quirurgico` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_equipo_quirurgico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_FACTURACION` (
  `codigo_tipo_facturacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_facturacion` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_tipo_facturacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

CREATE TABLE IF NOT EXISTS `TIPO_FARMACO` (
  `codigo_tipo_farmaco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_farmaco` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_farmaco`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=15 ;

CREATE TABLE IF NOT EXISTS `TIPO_FORMA_PAGO` (
  `codigo_tipo_forma_pago` smallint(3) NOT NULL DEFAULT '0',
  `nombre_tipo_forma_pago` char(20) DEFAULT '0',
  PRIMARY KEY (`codigo_tipo_forma_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_FUNCION_PABELLON` (
  `codigo_tipo_funcion_pabellon` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_funcion_pabellon` varchar(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `nombre_abreviado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_funcion_pabellon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_HERIDA` (
  `codigo_tipo_herida` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_herida` char(200) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_herida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ISQUEMIA` (
  `codigo_tipo_isquemia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_isquemia` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_isquemia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=7 ;

CREATE TABLE IF NOT EXISTS `TIPO_ITEM_CIRUGIA` (
  `codigo_tipo_item` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_item` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_LAVADO` (
  `codigo_tipo_lavado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_lavado` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_lavado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS `TIPO_LE` (
  `codigo_tipo_le` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad_le` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_le`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

CREATE TABLE IF NOT EXISTS `TIPO_LENTE` (
  `codigo_tipo_lente` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_lente` char(50) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_lente`),
  KEY `fk_reference_96` (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_MOVIMIENTO` (
  `codigo_tipo_movimiento` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_movimiento` varchar(255) NOT NULL DEFAULT '',
  `movimiento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_movimiento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_ORDEN_COMPRA` (
  `codigo_tipo_orden_compra` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_orden_compra` char(50) DEFAULT NULL,
  `codigo_estado` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_orden_compra`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_PACIENTE` (
  `codigo_tipo_paciente` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_paciente` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_PAUSA` (
  `codigo_tipo_pausa` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_pausa` char(200) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_pausa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_PINCELACION` (
  `codigo_tipo_pincelacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_pincelacion` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_pincelacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=6 ;

CREATE TABLE IF NOT EXISTS `TIPO_PJURIDICA` (
  `codigo_tipo_pjuridica` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_pjuridica` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_pjuridica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_POSICION` (
  `codigo_tipo_posicion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_posicion` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_posicion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=12 ;

CREATE TABLE IF NOT EXISTS `TIPO_PRESTACION_AGENDA` (
  `codigo_tipo_prestacion_agenda` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_prestacion_agenda` varchar(50) NOT NULL DEFAULT '',
  `codigo_accion_clinica` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_tipo_prestacion_agenda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_PREVENCION_UPP` (
  `codigo_tipo_prevencion_upp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_prevencion_upp` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_prevencion_upp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=12 ;

CREATE TABLE IF NOT EXISTS `TIPO_PREVISION` (
  `codigo_tipo_prevision` smallint(6) NOT NULL DEFAULT '0',
  `nombre_tipo_prevision` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_prevision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_PRUEBA_SUBJETIVA` (
  `codigo_tipo_prueba_subjetiva` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_prueba_subjetiva` char(255) DEFAULT NULL,
  `codigo_estado` int(3) DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_prueba_subjetiva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_RECETA` (
  `codigo_tipo_receta` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_receta` varchar(200) NOT NULL DEFAULT '',
  `indicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_receta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_REFRACCION_FC` (
  `codigo_tipo_refraccion_fc` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_refraccion_fc` char(255) DEFAULT NULL,
  `codigo_estado` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_refraccion_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_SERVICIO` (
  `codigo_tipo_servicio` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_servicio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_servicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_SONDA` (
  `codigo_tipo_sonda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_sonda` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_sonda`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=9 ;

CREATE TABLE IF NOT EXISTS `TIPO_TRANSFUSIONES` (
  `codigo_transfusiones` int(11) NOT NULL DEFAULT '0',
  `nombre_transfusion` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_transfusiones`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_VIA` (
  `codigo_tipo_via` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_via` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_via`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `TIPO_VIA_VENOSA` (
  `codigo_tipo_via_venosa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_via_venosa` char(50) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_via_venosa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `TIPO_VISION` (
  `codigo_tipo_vision` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_vision` char(255) DEFAULT NULL,
  `title_vision` char(255) DEFAULT NULL,
  `codigo_estado` int(3) DEFAULT '1',
  PRIMARY KEY (`codigo_tipo_vision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TIPO_VISUALIZACION` (
  `codigo_tipo_visualizacion` int(11) NOT NULL DEFAULT '0',
  `nombre_tipo_visualizacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_tipo_visualizacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE IF NOT EXISTS `TRANSFUSIONES_PACIENTE` (
  `codigo_transfusiones_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_transfusion` int(11) DEFAULT NULL,
  `cantidad_transfusion` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_transfusiones_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `TRASLADO` (
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` smallint(6) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `movimiento` int(11) NOT NULL DEFAULT '0',
  `numero_solicitud_traslado` int(11) DEFAULT NULL,
  `codigo_condicion_traslado` int(11) NOT NULL DEFAULT '0',
  `servicio_origen` int(11) DEFAULT '0',
  `codigo_agrupacion` int(11) DEFAULT '0',
  `codigo_diagnostico` varchar(6) DEFAULT '0',
  `servicio_destino` int(11) DEFAULT '0',
  `fecha_traslado` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `infeccion` tinyint(4) DEFAULT NULL,
  `diagnostico` text,
  PRIMARY KEY (`rut_paciente`,`numero_hermano_gemelo`,`evento`,`movimiento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UBICACION_GRILLA` (
  `dia_semana` int(11) NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `topp` int(11) DEFAULT NULL,
  `leftp` int(11) DEFAULT NULL,
  `widthp` int(11) DEFAULT NULL,
  `heightp` int(11) DEFAULT NULL,
  PRIMARY KEY (`dia_semana`,`hora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UBICACION_GRILLA_PAB2` (
  `dia_semana` int(11) NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `topp` int(11) DEFAULT NULL,
  `leftp` int(11) DEFAULT NULL,
  `widthp` int(11) DEFAULT NULL,
  `heightp` int(11) DEFAULT NULL,
  PRIMARY KEY (`dia_semana`,`hora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UBICACION_GRILLA_PAB2_2` (
  `dia_semana` int(11) NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `topp` int(11) DEFAULT NULL,
  `leftp` int(11) DEFAULT NULL,
  `widthp` int(11) DEFAULT NULL,
  `heightp` int(11) DEFAULT NULL,
  PRIMARY KEY (`dia_semana`,`hora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UBICACION_GRILLA_TEC` (
  `dia_semana` int(11) NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `topp` int(11) DEFAULT NULL,
  `leftp` int(11) DEFAULT NULL,
  `widthp` int(11) DEFAULT NULL,
  `heightp` int(11) DEFAULT NULL,
  PRIMARY KEY (`dia_semana`,`hora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UBICACION_GRILLA_TEC_10` (
  `dia_semana` int(11) NOT NULL DEFAULT '0',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `topp` int(11) DEFAULT NULL,
  `leftp` int(11) DEFAULT NULL,
  `widthp` int(11) DEFAULT NULL,
  `heightp` int(11) DEFAULT NULL,
  PRIMARY KEY (`dia_semana`,`hora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ULTRAFILTRACION_CAR` (
  `codigo_ultrafiltracion` int(11) NOT NULL DEFAULT '0',
  `nombre_ultrafiltracion` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_ultrafiltracion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `UNIDAD_MEDIDA` (
  `codigo_unidad_medida` int(11) NOT NULL DEFAULT '0',
  `nombre_unidad_medida` varchar(60) DEFAULT NULL,
  `nombre_completo_unidad_medida` varchar(60) DEFAULT NULL,
  UNIQUE KEY `unidad_medida_pk` (`codigo_unidad_medida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `USUARIO_AGENDA_ESPECIALIDAD` (
  `rut_usuario` int(11) NOT NULL DEFAULT '0',
  `codigo_especialidad` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_usuario`,`codigo_especialidad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `USUARIO_AGENDA_MEDICO` (
  `rut_usuario` int(11) NOT NULL DEFAULT '0',
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_usuario`,`rut_funcionario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `USUARIO_MODULO` (
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `nombre_usuario` varchar(50) NOT NULL DEFAULT '',
  `id_modulo_perfil` int(11) NOT NULL DEFAULT '0',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `fecha_termino_usuario` datetime DEFAULT NULL,
  PRIMARY KEY (`rut_funcionario`,`nombre_usuario`,`id_modulo_perfil`),
  KEY `fk_relationship_13` (`id_modulo_perfil`),
  KEY `fk_relationship_14` (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `USUARIO_PABELLON` (
  `rut_usuario` int(11) NOT NULL DEFAULT '0',
  `codigo_pabellon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rut_usuario`,`codigo_pabellon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `USUARIO_REBSOL` (
  `rut_funcionario` int(11) NOT NULL DEFAULT '0',
  `nombre_usuario` varchar(50) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `contrasena` varchar(50) DEFAULT NULL,
  `contrasena_md5` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_termino_usuario` datetime DEFAULT NULL,
  `usuario_alerta` int(11) DEFAULT NULL,
  PRIMARY KEY (`rut_funcionario`,`nombre_usuario`),
  KEY `fk_relationship_11` (`codigo_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VALVULAS` (
  `codigo_valvula` int(11) NOT NULL DEFAULT '0',
  `nombre_valvula` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_valvula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VALVULAS_DETALLE` (
  `codigo_valvulas_detalle` int(11) NOT NULL DEFAULT '0',
  `codigo_valvulas` int(11) NOT NULL DEFAULT '0',
  `nombre_valvulas_detalle` varchar(255) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_valvulas_detalle`,`codigo_valvulas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VALVULAS_MARCA` (
  `codigo_valvula_marca` int(11) NOT NULL DEFAULT '0',
  `nombre_valvula_marca` varchar(255) DEFAULT NULL,
  `otro_nombre_marca` text,
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_valvula_marca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VALVULAS_PACIENTE` (
  `codigo_valvulas_paciente` int(11) NOT NULL DEFAULT '0',
  `codigo_reserva_atencion` int(11) DEFAULT NULL,
  `codigo_registro_intraoperatorio` int(11) DEFAULT NULL,
  `codigo_estado` int(11) DEFAULT NULL,
  `codigo_valvulas` int(11) DEFAULT NULL,
  `codigo_valvulas_detalle` int(11) DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `numero_lote` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_valvulas_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VASODIL_CAR` (
  `codigo_vasodil` int(11) NOT NULL DEFAULT '0',
  `nombre_vasodil` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_vasodil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VIA_AREA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `codigo_via_area` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `lugar` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`codigo_via_area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VIA_VENOSA_PACIENTE` (
  `codigo_registro_intraoperatorio` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) NOT NULL DEFAULT '0',
  `numero_hermano_gemelo` int(11) NOT NULL DEFAULT '0',
  `evento` int(11) NOT NULL DEFAULT '0',
  `codigo_via_venosa` int(11) NOT NULL DEFAULT '0',
  `codigo_tipo_via_venosa` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `lugar` text,
  PRIMARY KEY (`codigo_registro_intraoperatorio`,`rut_paciente`,`numero_hermano_gemelo`,`evento`,`codigo_via_venosa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `VISION_CERCA_FC` (
  `codigo_vision_cerca_fc` tinyint(3) NOT NULL DEFAULT '0',
  `nombre_vision_cerca_fc` varchar(255) NOT NULL DEFAULT '',
  `tipo_vision` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` tinyint(3) NOT NULL DEFAULT '0',
  `nombre_completo_vision_cerca_fc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_vision_cerca_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VISION_LEJOS_FC` (
  `codigo_vision_lejos_fc` int(11) NOT NULL DEFAULT '0',
  `nombre_vision_lejos_fc` varchar(255) NOT NULL DEFAULT '',
  `codigo_estado` int(11) NOT NULL DEFAULT '0',
  `nombre_completo_vision_lejos_fc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_vision_lejos_fc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `VISION_PACIENTE_FC` (
  `codigo_reserva_atencion` int(11) NOT NULL DEFAULT '0',
  `rut_paciente` int(11) DEFAULT NULL,
  `numero_hermano_gemelo` int(11) DEFAULT NULL,
  `codigo_tipo_vision` int(11) NOT NULL DEFAULT '0',
  `codigo_vision_lejos_od` int(11) DEFAULT NULL,
  `codigo_vision_lejos_oi` int(11) DEFAULT NULL,
  `parcial_lejos_od` tinyint(3) DEFAULT NULL,
  `parcial_lejos_oi` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`codigo_reserva_atencion`,`codigo_tipo_vision`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


ALTER TABLE `PAUSA_DATOS_DETALLE`
  ADD CONSTRAINT `fk_reference_901` FOREIGN KEY (`codigo_pausa_datos`) REFERENCES `PAUSA_DATOS` (`codigo_pausa_datos`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
