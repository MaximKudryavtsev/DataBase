-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 28 2017 г., 06:54
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab5`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

CREATE TABLE `contract` (
  `id_contract` int(11) NOT NULL,
  `date` date NOT NULL,
  `sum` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_in_contract(pic)`
--

CREATE TABLE `product_in_contract(pic)` (
  `id_pic` int(11) NOT NULL,
  `id_pis` int(11) NOT NULL,
  `id_contract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_in_stock (pis)`
--

CREATE TABLE `product_in_stock (pis)` (
  `id_pis` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `adress` varchar(255) CHARACTER SET latin1 NOT NULL,
  `area` int(11) NOT NULL,
  `empty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stock`
--

INSERT INTO `stock` (`id_stock`, `name`, `adress`, `area`, `empty`) VALUES
(1, 'stock-1', 'ul. lenina', 200, NULL),
(2, 'stock-2', 'ul. petrova', 100, NULL),
(3, 'stock-3', 'ul. petrova', 11, NULL),
(4, '', 'ul. ivanova', 20, NULL),
(5, 'stock-4', 'ul. petrova', 18, NULL),
(6, 'stock-5', 'ul. ivanova', 100, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `id_client` (`id_client`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `product_in_contract(pic)`
--
ALTER TABLE `product_in_contract(pic)`
  ADD PRIMARY KEY (`id_pic`),
  ADD KEY `id_pis` (`id_pis`),
  ADD KEY `id_contract` (`id_contract`);

--
-- Индексы таблицы `product_in_stock (pis)`
--
ALTER TABLE `product_in_stock (pis)`
  ADD PRIMARY KEY (`id_pis`),
  ADD KEY `id_stock` (`id_stock`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `contract`
--
ALTER TABLE `contract`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `product_in_contract(pic)`
--
ALTER TABLE `product_in_contract(pic)`
  MODIFY `id_pic` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `product_in_stock (pis)`
--
ALTER TABLE `product_in_stock (pis)`
  MODIFY `id_pis` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_contract`) REFERENCES `product_in_contract(pic)` (`id_contract`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product_in_stock (pis)` (`id_product`);

--
-- Ограничения внешнего ключа таблицы `product_in_contract(pic)`
--
ALTER TABLE `product_in_contract(pic)`
  ADD CONSTRAINT `product_in_contract(pic)_ibfk_1` FOREIGN KEY (`id_pis`) REFERENCES `product_in_stock (pis)` (`id_pis`);

--
-- Ограничения внешнего ключа таблицы `product_in_stock (pis)`
--
ALTER TABLE `product_in_stock (pis)`
  ADD CONSTRAINT `product_in_stock (pis)_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
