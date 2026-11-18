-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2026 a las 05:46:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petworld`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `icono` varchar(10) DEFAULT '?',
  `color` varchar(20) DEFAULT '#FF7A00',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `slug`, `icono`, `color`, `created_at`) VALUES
(1, 'Perros', 'perros', '🐶', '#FF7A00', '2026-11-18 04:33:03'),
(2, 'Gatos', 'gatos', '🐱', '#2EC4B6', '2026-11-18 04:33:03'),
(3, 'Aves', 'aves', '🦜', '#FFD60A', '2026-11-18 04:33:03'),
(4, 'Roedores', 'roedores', '🐹', '#A78BFA', '2026-11-18 04:33:03'),
(5, 'Peces', 'peces', '🐠', '#3B82F6', '2026-11-18 04:33:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `session_id` varchar(64) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `session_id`, `producto_id`, `fecha`) VALUES
(1, '73671396892cb0cca3190fa162529e2c', 5, '2026-11-18 04:34:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `codigo_seguimiento` varchar(20) NOT NULL,
  `cliente_nombre` varchar(120) NOT NULL,
  `cliente_email` varchar(150) NOT NULL,
  `cliente_telefono` varchar(20) DEFAULT NULL,
  `direccion_envio` text NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `metodo_pago` enum('PayPal','Transferencia') DEFAULT 'PayPal',
  `estado_pago` enum('Pendiente','Pagado','Cancelado') DEFAULT 'Pendiente',
  `estado_envio` enum('Procesando','En tránsito','Entregado','Cancelado') DEFAULT 'Procesando',
  `paypal_order_id` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `codigo_seguimiento`, `cliente_nombre`, `cliente_email`, `cliente_telefono`, `direccion_envio`, `usuario_id`, `total`, `metodo_pago`, `estado_pago`, `estado_envio`, `paypal_order_id`, `fecha`) VALUES
(1, 'PW-2026-A1B2', 'Diony Esparza', 'diony.esparza@petworld.mx', '449 234 5678', 'Av. Tecnológico #203, Centro, Aguascalientes', NULL, 444.00, 'PayPal', 'Pagado', 'Entregado', NULL, '2026-10-15 14:30:00'),
(2, 'PW-2026-C3D4', 'Kevin Flores', 'kevin.flores@petworld.mx', '449 345 6789', 'Calle Jardín 45, Col. del Sol, Aguascalientes', NULL, 285.00, 'Transferencia', 'Pendiente', 'En tránsito', NULL, '2026-11-10 09:15:00'),
(3, 'PW-2026-E5F6', 'Alan García', 'alan.garcia@petworld.mx', '449 456 7890', 'Privada Olivos 12, San Francisco, Ags.', NULL, 745.00, 'PayPal', 'Pagado', 'En tránsito', NULL, '2026-11-15 11:20:00'),
(4, 'PW-2026-A619', 'KEVIN ALEJANDRO', 'kevinflores010105@gmail.com', '4494550081', 'av vallarta 215', NULL, 1552.00, 'Transferencia', 'Pendiente', 'Procesando', NULL, '2026-11-17 22:35:06'),
(5, 'PW-2026-E1D1', 'KEVIN ALEJANDRO', '24150066@aguascalientes.tecnm.mx', '4494550081', 'av vallarta 215', NULL, 258.00, 'Transferencia', 'Pendiente', 'Procesando', NULL, '2026-11-17 22:36:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_items`
--

CREATE TABLE `pedido_items` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_items`
--

INSERT INTO `pedido_items` (`id`, `pedido_id`, `producto_id`, `nombre`, `precio`, `cantidad`) VALUES
(1, 4, 1, 'Croquetas Premium Adulto 3kg', 285.00, 1),
(2, 4, 2, 'Arena Sanitaria Premium 4kg', 189.00, 1),
(3, 4, 3, 'Juguete Interactivo Pelota', 159.00, 1),
(4, 4, 5, 'Acuario Rectangular 20L', 599.00, 1),
(5, 4, 7, 'Antiparasitario Externo', 320.00, 1),
(6, 5, 3, 'Juguete Interactivo Pelota', 159.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_anterior` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(150) DEFAULT '?',
  `etiqueta` varchar(20) DEFAULT NULL,
  `calificacion` decimal(2,1) DEFAULT 5.0,
  `total_resenas` int(11) DEFAULT 0,
  `destacado` tinyint(1) DEFAULT 0,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `marca`, `categoria_id`, `precio`, `precio_anterior`, `imagen`, `etiqueta`, `calificacion`, `total_resenas`, `destacado`, `descripcion`, `stock`, `creado_en`) VALUES
(1, 'Croquetas Premium Adulto 3kg', 'Pedigree', 1, 285.00, 350.00, '🦴', '-20%', 4.7, 124, 1, 'Alimento completo y balanceado para perros adultos de todos los tamaños.', 49, '2026-11-18 04:33:03'),
(2, 'Arena Sanitaria Premium 4kg', 'Catit', 2, 189.00, NULL, '🪣', 'Nuevo', 4.5, 38, 1, 'Arena aglomerante de alta absorción con control de olor.', 79, '2026-11-18 04:33:03'),
(3, 'Juguete Interactivo Pelota', 'Kong', 1, 159.00, 199.00, '🎾', '-20%', 4.8, 210, 1, 'Pelota resistente de caucho natural para perros masticadores.', 118, '2026-11-18 04:33:03'),
(4, 'Comida Viva para Aves 500g', 'Versele', 3, 95.00, NULL, '🌾', NULL, 4.3, 18, 0, 'Mezcla nutritiva de semillas para canarios y periquitos.', 60, '2026-11-18 04:33:03'),
(5, 'Acuario Rectangular 20L', 'Tetra', 5, 599.00, 750.00, '🐠', '-20%', 4.6, 45, 1, 'Acuario de vidrio con filtro incluido para peces tropicales.', 14, '2026-11-18 04:33:03'),
(6, 'Rueda Ejercicio Roedores', 'Ferplast', 4, 125.00, NULL, '⚙️', 'Nuevo', 4.4, 22, 0, 'Rueda silenciosa de plástico resistente para hámsters.', 40, '2026-11-18 04:33:03'),
(7, 'Antiparasitario Externo', 'Frontline', 1, 320.00, NULL, '💉', NULL, 4.9, 350, 1, 'Tratamiento antipulgas y garrapatas de larga duración.', 74, '2026-11-18 04:33:03'),
(8, 'Comida Húmeda Gato 85g', 'Whiskas', 2, 35.00, 45.00, '🥫', '-22%', 4.2, 180, 0, 'Lata de comida húmeda sabor atún para gatos adultos.', 200, '2026-11-18 04:33:03'),
(9, 'Collar Cuero Perro Mediano', 'Petsport', 1, 145.00, NULL, '🦮', NULL, 4.5, 67, 0, 'Collar de cuero genuino con hebilla metálica ajustable.', 90, '2026-11-18 04:33:03'),
(10, 'Bebedero Automático Gatos', 'Catit', 2, 410.00, 520.00, '💧', '-21%', 4.7, 88, 1, 'Fuente de agua con filtro recirculante para gatos.', 25, '2026-11-18 04:33:03'),
(11, 'Jaula Grande para Aves', 'Ferplast', 3, 890.00, NULL, '🪶', NULL, 4.4, 12, 0, 'Jaula espaciosa con bandeja extraíble y accesorios.', 8, '2026-11-18 04:33:03'),
(12, 'Comida Roedores Premium 1kg', 'Versele', 4, 110.00, 130.00, '🥕', '-15%', 4.6, 54, 0, 'Alimento completo para hámsters, conejos y cobayos.', 100, '2026-11-18 04:33:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `created_at`) VALUES
(1, 'Administrador PetWorld', 'admin@petworld.mx', '$2y$10$N9qo8uLOickgx2ZMRZoMy.MwrD5yQ8Uu0GjZ4rx5.mYxRQX5oKb2m', 'admin', '2026-11-18 04:33:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_fav` (`session_id`,`producto_id`),
  ADD KEY `fk_fav_prod` (`producto_id`),
  ADD KEY `idx_sess` (`session_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_seguimiento` (`codigo_seguimiento`),
  ADD KEY `fk_ped_usr` (`usuario_id`),
  ADD KEY `idx_seg` (`codigo_seguimiento`),
  ADD KEY `idx_email` (`cliente_email`);

--
-- Indices de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_it_prod` (`producto_id`),
  ADD KEY `idx_ped` (`pedido_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cat` (`categoria_id`),
  ADD KEY `idx_dest` (`destacado`),
  ADD KEY `idx_marca` (`marca`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `fk_fav_prod` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_ped_usr` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  ADD CONSTRAINT `fk_it_ped` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_it_prod` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_prod_cat` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
