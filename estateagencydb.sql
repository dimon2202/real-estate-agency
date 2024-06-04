-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 04, 2024 at 11:06 AM
-- Server version: 8.0.33
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estateagencydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_ID` int NOT NULL,
  `area_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_ID`, `area_name`) VALUES
(1, 'Голосіївський'),
(2, 'Дарницький'),
(3, 'Деснянський'),
(4, 'Дніпровський'),
(5, 'Оболонський'),
(6, 'Печерський'),
(7, 'Подільський'),
(8, 'Святошинський'),
(9, 'Солом\'янський'),
(10, 'Шевченківський');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `сlient_ID` int NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `passport_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`сlient_ID`, `first_name`, `last_name`, `phone`, `mail`, `passport_number`) VALUES
(1, 'Іван', 'Іванов', '+380501234567', 'ivanov@gmail.com', 'AA123456'),
(2, 'Олена', 'Петренко', '+380677654321', 'petrenko@mail.com', 'BB234567'),
(3, 'Микола', 'Сидоренко', '+380631112233', 'sidorenko@gmail.com', 'CC345678'),
(4, 'Катерина', 'Ковальчук', '+380505554433', 'kovalchuk@mail.com', 'DD456789'),
(5, 'Віталій', 'Кравченко', '+380672223344', 'kravchenko@gmail.com', 'EE567890'),
(6, 'Наталія', 'Ковальова', '+380633332211', 'kovalova@mail.com', 'FF678901'),
(7, 'Андрій', 'Петров', '+380504443322', 'petrov@gmail.com', 'GG789012'),
(8, 'Оксана', 'Сидорова', '+380677778899', 'sidorova@mail.com', 'HH890123'),
(9, 'Ігор', 'Кравець', '+380638887766', 'kravets@gmail.com', 'II901234'),
(10, 'Юлія', 'Полякова', '+380509998877', 'polyakova@mail.com', 'JJ012345'),
(11, 'Сергій', 'Мельник', '+380672223344', 'melnik@gmail.com', 'KK123456'),
(12, 'Олександр', 'Бойко', '+380633332211', 'boyko@mail.com', 'LL234567'),
(13, 'Марина', 'Пономарьова', '+380504443322', 'ponomarova@gmail.com', 'MM345678'),
(14, 'Ірина', 'Сидорчук', '+380677778899', 'sidorchuk@mail.com', 'NN456789'),
(15, 'Василь', 'Петренко', '+380638887766', 'petrenko@gmail.com', 'OO567890'),
(16, 'Тетяна', 'Кравченко', '+380509998877', 'kravchenko@mail.com', 'PP678901'),
(17, 'Роман', 'Ковальов', '+380672223344', 'kovalov@gmail.com', 'QQ789012'),
(18, 'Марія', 'Іванова', '+380633332211', 'ivanova@mail.com', 'RR890123'),
(19, 'Євген', 'Сидоренко', '+380504443322', 'sidorenko@gmail.com', 'SS901234'),
(20, 'Аліна', 'Петрова', '+380503443322', 'petrova@gmail.com', 'QS901234'),
(21, 'Олег', 'Козлов', '+38050867890', 'oleg.kozlov@example.com', 'ABC123XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `commission_ID` int NOT NULL,
  `transaction_type_ID` int NOT NULL,
  `interest` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`commission_ID`, `transaction_type_ID`, `interest`) VALUES
(1, 1, '3.00'),
(2, 1, '4.00'),
(3, 2, '40.00'),
(4, 2, '50.00'),
(5, 2, '55.00');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `contract_ID` int NOT NULL,
  `client_ID` int NOT NULL,
  `employee_ID` int NOT NULL,
  `commission_ID` int NOT NULL,
  `estate_ID` int NOT NULL,
  `date_signed` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract_ID`, `client_ID`, `employee_ID`, `commission_ID`, `estate_ID`, `date_signed`, `start_date`, `end_date`) VALUES
(1, 5, 8, 3, 1, '2022-01-10', '2022-02-01', '2023-02-01'),
(2, 14, 8, 1, 2, '2021-09-15', '2021-10-01', '2022-10-01'),
(3, 3, 5, 2, 3, '2023-04-20', '2023-05-01', NULL),
(4, 20, 4, 4, 4, '2022-07-12', '2022-08-01', '2023-08-01'),
(5, 11, 6, 3, 5, '2022-03-05', '2022-04-01', '2023-04-01'),
(6, 1, 3, 1, 6, '2022-01-15', '2022-02-01', '2023-01-31'),
(7, 3, 7, 3, 7, '2022-02-10', '2022-03-01', '2023-02-28'),
(8, 2, 6, 2, 8, '2022-03-05', '2022-04-01', '2023-03-31'),
(9, 4, 5, 4, 9, '2022-04-20', '2022-05-01', '2023-04-30'),
(10, 6, 10, 1, 10, '2022-05-10', '2022-06-01', NULL),
(11, 5, 3, 3, 11, '2022-06-15', '2022-07-01', '2023-06-30'),
(12, 8, 6, 2, 12, '2022-07-20', '2022-08-01', NULL),
(13, 7, 8, 1, 13, '2022-08-25', '2022-09-01', '2023-08-31'),
(14, 10, 4, 4, 14, '2022-09-10', '2022-10-01', NULL),
(15, 9, 9, 3, 15, '2022-10-15', '2022-11-01', '2023-10-31'),
(16, 12, 9, 1, 16, '2022-11-20', '2022-12-01', NULL),
(17, 11, 7, 1, 17, '2022-12-10', '2023-01-01', '2023-12-31'),
(18, 14, 5, 4, 18, '2023-01-15', '2023-02-01', '2024-01-31'),
(19, 13, 5, 2, 19, '2023-02-20', '2023-03-01', NULL),
(20, 12, 10, 2, 2, '2023-03-10', '2023-04-01', '2024-03-31'),
(21, 15, 3, 1, 16, '2023-04-20', '2023-05-01', '2024-04-30'),
(22, 18, 6, 2, 17, '2023-05-15', '2023-06-01', '2024-05-31'),
(23, 17, 8, 3, 18, '2023-06-10', '2023-07-01', NULL),
(24, 20, 4, 2, 19, '2023-07-20', '2023-08-01', '2024-07-31'),
(25, 19, 7, 1, 20, '2023-08-25', '2023-09-01', NULL),
(29, 6, 6, 1, 3, '2018-08-08', '2019-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countestateoncommission`
--

CREATE TABLE `countestateoncommission` (
  `Транзакція` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Відсоток` decimal(6,2) NOT NULL,
  `К-ть нерухомості` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `countestateoncommission`
--

INSERT INTO `countestateoncommission` (`Транзакція`, `Відсоток`, `К-ть нерухомості`) VALUES
('купівля/продаж', '3.00', 9),
('купівля/продаж', '4.00', 7),
('оренда', '40.00', 6),
('оренда', '50.00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `passport_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_ID`, `first_name`, `last_name`, `phone`, `mail`, `passport_number`) VALUES
(1, 'Іван', 'Петров', '+380971234567', 'ivan.petrov@example.com', 'AA123456'),
(2, 'Оксана', 'Ковальчук', '+380669876543', 'oksana.kovalchuk@example.com', 'AB234567'),
(3, 'Максим', 'Кравченко', '+380935554433', 'maksym.kravchenko@example.com', 'AC345678'),
(4, 'Надія', 'Лисенко', '+380507778899', 'nadiya.lysenko@example.com', 'AD456789'),
(5, 'Юрій', 'Дорошенко', '+380681112233', 'yuriy.doroshenko@example.com', 'AE567890'),
(6, 'Марина', 'Іваненко', '+380632223344', 'maryna.ivanenko@example.com', 'AF678901'),
(7, 'Віталій', 'Козак', '+380994445566', 'vitaliy.kozak@example.com', 'AG789012'),
(8, 'Ірина', 'Мельник', '+380978889990', 'iryna.melnik@example.com', 'AH890123'),
(9, 'Олександр', 'Петренко', '+380661112233', 'oleksandr.petrenko@example.com', 'AI901234'),
(10, 'Анастасія', 'Середа', '+380502223344', 'anastasiya.sereda@example.com', 'AJ012345'),
(13, 'Олена', 'Білова', '+380502223355', 'olena.belova@example.com', 'AK212212'),
(14, 'Іван', 'Петренко', '+38050181780', 'ivan@example.com', 'AB103456'),
(15, 'Марія', 'Коваленко', '+38050117890', 'maria@example.com', 'CD980654');

-- --------------------------------------------------------

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `estate_ID` int NOT NULL,
  `owner_ID` int NOT NULL,
  `estate_type_ID` int NOT NULL,
  `area_ID` int NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `floor` int NOT NULL,
  `number_of_rooms` int NOT NULL,
  `space` decimal(7,2) NOT NULL,
  `year_of_construction` int NOT NULL,
  `repair_ID` int DEFAULT NULL,
  `description` longtext,
  `cost` decimal(12,2) NOT NULL,
  `estate_status_ID` int NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estate`
--

INSERT INTO `estate` (`estate_ID`, `owner_ID`, `estate_type_ID`, `area_ID`, `address`, `floor`, `number_of_rooms`, `space`, `year_of_construction`, `repair_ID`, `description`, `cost`, `estate_status_ID`, `latitude`, `longitude`) VALUES
(1, 17, 3, 1, 'вул. Пушкіна, 1', 2, 3, '65.50', 2005, 1, 'Земельна ділянка! Гарна квартира в центрі міста', '500.00', 1, '50.489710', '30.601834'),
(2, 2, 3, 7, 'вул. Лермонтова, 7', 1, 2, '45.00', 1999, 2, 'Земельна ділянка! Потребує косметичного ремонту', '115000.00', 1, '50.360844', '30.752815'),
(3, 3, 2, 10, 'вул. Гоголя, 15', 5, 4, '100.00', 2010, 3, 'Квартира!!! Новобудова, високі стелі', '133000.00', 1, '50.426640', '30.382687'),
(4, 20, 1, 4, 'вул. Шевченка, 20', 1, 2, '50.00', 1980, 1, 'Вимагає капітального ремонту', '300.00', 1, '50.370569', '30.658105'),
(5, 5, 3, 5, 'вул. Тараса Шевченка, 12', 7, 1, '30.00', 2015, 2, 'Земельна ділянка! Недалеко від парку', '200.00', 1, '50.357060', '30.555507'),
(6, 6, 2, 2, 'вул. Івана Франка, 3', 4, 3, '75.00', 2000, 3, 'Квартира!!! Великий балкон з краєвидом', '120000.00', 1, '50.331007', '30.667093'),
(7, 7, 1, 8, 'вул. Петра Могили, 9', 1, 2, '60.00', 1985, 1, 'Хороший ремонт', '800.00', 1, '50.505588', '30.409012'),
(8, 4, 3, 3, 'вул. Островського, 6', 1, 1, '35.00', 2012, 2, 'Земельна ділянка! Нова квартира', '170000.00', 1, '50.495115', '30.691685'),
(9, 9, 2, 6, 'вул. Бульварно-Кудрявська, 18', 8, 4, '90.00', 2008, 3, 'Квартира!!! Поверхова квартира з гарним ремонтом', '600.00', 1, '50.368895', '30.543901'),
(10, 9, 2, 6, 'вул. Шемашка, 18', 10, 4, '90.00', 2020, 3, 'Квартира!!! Поверхова квартира з гарним ремонтом', '130000.00', 1, '50.530972', '30.557056'),
(11, 19, 1, 2, 'вул. Грушевського, 25', 5, 3, '70.00', 1995, 1, 'Зручне розташування', '9500.00', 4, '50.362410', '30.486247'),
(12, 12, 2, 10, 'вул. Героїв Майдану, 8', 2, 2, '50.00', 2000, 1, 'Квартира!!! Недалеко від транспорту', '200000.00', 5, '50.359040', '30.673294'),
(13, 13, 2, 5, 'вул. Січових Стрільців, 14', 3, 1, '35.00', 1980, 1, 'Квартира!!! Треба зробити косметичний ремонт', '370000.00', 3, '50.442071', '30.737464'),
(14, 14, 1, 8, 'вул. Мельника, 7', 0, 2, '55.00', 2010, 3, 'Хороший ремонт, є балкон', '1000.00', 2, '50.405996', '30.685969'),
(15, 15, 3, 7, 'вул. Стуса, 21', 4, 3, '75.00', 2005, 1, 'Земельна ділянка! Сучасна квартира з меблями', '450.00', 1, '50.343280', '30.368137'),
(16, 2, 2, 3, 'вул. Червоноармійська, 3', 6, 4, '110.00', 1999, 1, 'Квартира!!! Потребує косметичного ремонту', '80000.00', 3, '50.572353', '30.570590'),
(17, 1, 2, 1, 'вул. Соборна, 10', 2, 1, '30.00', 1985, 1, 'Квартира!!! Для одного-двох людей', '140000.00', 5, '50.557196', '30.674479'),
(18, 18, 3, 6, 'вул. Воскресенська, 4', 8, 2, '45.00', 2000, 2, 'Земельна ділянка! Біля парку', '800.00', 2, '50.399537', '30.413586'),
(19, 11, 2, 4, 'вул. Володимира Великого, 9', 5, 3, '80.00', 2015, 3, 'Квартира!!! Нова квартира з євроремонтом', '185000.00', 1, '50.554451', '30.712120'),
(20, 4, 1, 9, 'вул. Пирогова, 6', 1, 2, '60.00', 2005, 1, 'Недалеко від парку', '190000.00', 2, '50.532727', '30.478312'),
(190, 1, 1, 1, 'Головний корпус КНЕУ, проспект Победы, Киев, Украина', 2, 4, '88.00', 1950, 1, '8.41', '456000.00', 1, '50.456574', '30.440952'),
(191, 1, 1, 1, 'Кней, Словения', 4, 2, '67.00', 1234, 1, 'цувіаи', '12345.00', 1, '45.848066', '14.598521'),
(192, 1, 2, 1, 'Берестейський проспект, 16, Киев, Украина', 3, 2, '55.00', 2000, 2, '18.00', '78000.00', 1, '50.449357', '30.480120');

-- --------------------------------------------------------

--
-- Table structure for table `estate_status`
--

CREATE TABLE `estate_status` (
  `estate_status_ID` int NOT NULL,
  `estate_status_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estate_status`
--

INSERT INTO `estate_status` (`estate_status_ID`, `estate_status_name`) VALUES
(1, 'Активний'),
(2, 'Продано/Орендовано'),
(3, 'Резервовано'),
(4, 'Перегляд'),
(5, 'Відхилено');

-- --------------------------------------------------------

--
-- Table structure for table `estate_type`
--

CREATE TABLE `estate_type` (
  `estate_type_ID` int NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estate_type`
--

INSERT INTO `estate_type` (`estate_type_ID`, `type_name`) VALUES
(1, 'Котедж'),
(2, 'Квартира'),
(3, 'Земельна ділянка'),
(4, 'Гараж/Стоянка');

-- --------------------------------------------------------

--
-- Table structure for table `in_charge`
--

CREATE TABLE `in_charge` (
  `in_charge_ID` int NOT NULL,
  `employee_ID` int NOT NULL,
  `estate_ID` int NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `in_charge`
--

INSERT INTO `in_charge` (`in_charge_ID`, `employee_ID`, `estate_ID`, `date_from`, `date_to`) VALUES
(1, 3, 7, '2022-01-01', NULL),
(2, 2, 14, '2021-05-15', '2021-12-31'),
(3, 8, 3, '2023-02-14', NULL),
(4, 1, 6, '2020-10-01', '2022-02-28'),
(5, 3, 10, '2021-09-01', '2022-08-31'),
(6, 5, 2, '2022-03-15', NULL),
(7, 10, 1, '2023-01-01', NULL),
(8, 4, 8, '2022-06-01', '2022-12-31'),
(9, 9, 19, '2021-12-01', NULL),
(10, 7, 6, '2020-05-01', '2021-11-30'),
(11, 3, 9, '2022-04-01', NULL),
(12, 2, 16, '2021-03-01', '2022-02-28'),
(13, 8, 13, '2023-03-01', NULL),
(14, 1, 4, '2021-06-01', '2022-05-31'),
(15, 13, 12, '2022-09-01', '2023-08-31'),
(16, 5, 18, '2022-04-15', NULL),
(17, 10, 15, '2023-02-01', NULL),
(18, 4, 11, '2022-08-01', '2023-01-31'),
(19, 9, 17, '2022-01-01', NULL),
(20, 7, 20, '2020-03-01', '2021-12-31'),
(21, 3, 5, '2022-03-15', '2022-03-15'),
(22, 3, 5, '2022-03-15', '2022-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_ID` int NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `passport_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_ID`, `first_name`, `last_name`, `phone`, `mail`, `passport_number`) VALUES
(1, 'Іван', 'Петренко', '+380961234567', 'ivan.petr@gmail.com', 'AA123456'),
(2, 'Марія', 'Ковальчук', '+380971234567', 'mariya.koval@gmail.com', 'BB234567'),
(3, 'Петро', 'Іваненко', '+380501234567', 'petro.ivan@gmail.com', 'CC345678'),
(4, 'Олексій', 'Сидоренко', '+380631234567', 'oleksiy.sidor@gmail.com', 'DD456789'),
(5, 'Анна', 'Мельник', '+380961234568', 'anna.melnik@gmail.com', 'EE567890'),
(6, 'Віктор', 'Кравець', '+380971234568', 'viktor.krav@gmail.com', 'FF678901'),
(7, 'Олена', 'Ткаченко', '+380501234568', 'olena.tka@gmail.com', 'GG789012'),
(8, 'Юрій', 'Коваленко', '+380631234568', 'yuriy.koval@gmail.com', 'HH890123'),
(9, 'Наталія', 'Павленко', '+380961234569', 'natalia.pavlen@gmail.com', 'II901234'),
(10, 'Євген', 'Кузьменко', '+380971234569', 'yevgen.kuzmen@gmail.com', 'JJ012345'),
(11, 'Сергій', 'Гончаренко', '+380501234569', 'sergiy.honch@gmail.com', 'KK123456'),
(12, 'Оксана', 'Даниленко', '+380631234569', 'oksana.danilen@gmail.com', 'LL234567'),
(13, 'Андрій', 'Бондаренко', '+380961234570', 'andriy.bondar@gmail.com', 'MM345678'),
(14, 'Тетяна', 'Гринько', '+380971234570', 'tetyana.gryn@gmail.com', 'NN456789'),
(15, 'Вадим', 'Федоренко', '+380501234570', 'vadim.fedoren@gmail.com', 'OO567890'),
(16, 'Людмила', 'Марченко', '+380631234570', 'lyudmyla.march@gmail.com', 'PP678901'),
(17, 'Ігор', 'Кравченко', '+380961234571', 'igor.kravch@gmail.com', 'QQ789012'),
(18, 'Олег', 'Соловей', '+380971234571', 'oleg.solov@gmail.com', 'RR890123'),
(19, 'Дмитро', 'Тимченко', '+380971234471', 'igor.kravch@gmail.com', 'DS789012'),
(20, 'Валодимир', 'Козлов', '+380501234571', 'oleg.solov@gmail.com', 'RD890123');

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `repair_ID` int NOT NULL,
  `repair_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`repair_ID`, `repair_name`) VALUES
(1, 'Косметичний'),
(2, 'Капітальний'),
(3, 'Без ремонту'),
(4, 'Реконструкція');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `transaction_type_ID` int NOT NULL,
  `transaction_type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`transaction_type_ID`, `transaction_type_name`) VALUES
(1, 'купівля/продаж'),
(2, 'оренда');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_ID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`сlient_ID`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`commission_ID`),
  ADD KEY `FK_Commission_Transaction_type` (`transaction_type_ID`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_ID`),
  ADD KEY `FK_Contract_Client` (`client_ID`),
  ADD KEY `FK_Contract_Commission` (`commission_ID`),
  ADD KEY `FK_Contract_Employee` (`employee_ID`),
  ADD KEY `FK_Contract_Estate` (`estate_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`);

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`estate_ID`),
  ADD KEY `FK_Estate_Area` (`area_ID`),
  ADD KEY `FK_Estate_Estate_status` (`estate_status_ID`),
  ADD KEY `FK_Estate_Estate_type1` (`estate_type_ID`),
  ADD KEY `FK_Estate_Owner1` (`owner_ID`),
  ADD KEY `FK_Estate_Repair` (`repair_ID`);

--
-- Indexes for table `estate_status`
--
ALTER TABLE `estate_status`
  ADD PRIMARY KEY (`estate_status_ID`);

--
-- Indexes for table `estate_type`
--
ALTER TABLE `estate_type`
  ADD PRIMARY KEY (`estate_type_ID`);

--
-- Indexes for table `in_charge`
--
ALTER TABLE `in_charge`
  ADD PRIMARY KEY (`in_charge_ID`),
  ADD KEY `FK_In_charge_Employee` (`employee_ID`),
  ADD KEY `FK_In_charge_Estate` (`estate_ID`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_ID`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`repair_ID`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`transaction_type_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `сlient_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `commission_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `contract_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `estate`
--
ALTER TABLE `estate`
  MODIFY `estate_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `estate_status`
--
ALTER TABLE `estate_status`
  MODIFY `estate_status_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estate_type`
--
ALTER TABLE `estate_type`
  MODIFY `estate_type_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `in_charge`
--
ALTER TABLE `in_charge`
  MODIFY `in_charge_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `repair`
--
ALTER TABLE `repair`
  MODIFY `repair_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `transaction_type_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commission`
--
ALTER TABLE `commission`
  ADD CONSTRAINT `FK_Commission_Transaction_type` FOREIGN KEY (`transaction_type_ID`) REFERENCES `transaction_type` (`transaction_type_ID`);

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_Contract_Client` FOREIGN KEY (`client_ID`) REFERENCES `client` (`сlient_ID`),
  ADD CONSTRAINT `FK_Contract_Commission` FOREIGN KEY (`commission_ID`) REFERENCES `commission` (`commission_ID`),
  ADD CONSTRAINT `FK_Contract_Employee` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`),
  ADD CONSTRAINT `FK_Contract_Estate` FOREIGN KEY (`estate_ID`) REFERENCES `estate` (`estate_ID`);

--
-- Constraints for table `estate`
--
ALTER TABLE `estate`
  ADD CONSTRAINT `FK_Estate_Area` FOREIGN KEY (`area_ID`) REFERENCES `area` (`area_ID`),
  ADD CONSTRAINT `FK_Estate_Estate_status` FOREIGN KEY (`estate_status_ID`) REFERENCES `estate_status` (`estate_status_ID`),
  ADD CONSTRAINT `FK_Estate_Estate_type1` FOREIGN KEY (`estate_type_ID`) REFERENCES `estate_type` (`estate_type_ID`),
  ADD CONSTRAINT `FK_Estate_Owner1` FOREIGN KEY (`owner_ID`) REFERENCES `owner` (`owner_ID`),
  ADD CONSTRAINT `FK_Estate_Repair` FOREIGN KEY (`repair_ID`) REFERENCES `repair` (`repair_ID`);

--
-- Constraints for table `in_charge`
--
ALTER TABLE `in_charge`
  ADD CONSTRAINT `FK_In_charge_Employee` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`),
  ADD CONSTRAINT `FK_In_charge_Estate` FOREIGN KEY (`estate_ID`) REFERENCES `estate` (`estate_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
