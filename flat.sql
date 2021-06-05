-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2021 at 07:37 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flat`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `IDApartment` int(11) NOT NULL,
  `IDLandlord` int(11) NOT NULL,
  `NRoom` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Plaque` int(11) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `PostalCode` int(11) NOT NULL,
  `City` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`IDApartment`, `IDLandlord`, `NRoom`, `Floor`, `Size`, `Plaque`, `Street`, `PostalCode`, `City`) VALUES
(1, 1, 2, 2, 70, 3, 'Kiraly utca 6', 1072, 'Budapest'),
(2, 1, 1, 1, 90, 110, 'Dutzu', 1065, 'Budapest'),
(3, 1, 3, 3, 300, 300, 'Kiraly utca  6', 1072, 'Budapest');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `IDContract` int(11) NOT NULL,
  `IDCustomer` int(11) NOT NULL,
  `IDApartment` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `IDCustomer` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Family` varchar(50) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `landlord`
--

CREATE TABLE `landlord` (
  `IDLandlord` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Family` varchar(50) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `landlord`
--

INSERT INTO `landlord` (`IDLandlord`, `Name`, `Family`, `Telephone`, `Address`) VALUES
(1, 'SeyedAmirHossein', 'Dabirsiaghi', 2147483647, 'Kiraly Utca 13');

-- --------------------------------------------------------

--
-- Table structure for table `usepass`
--

CREATE TABLE `usepass` (
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usepass`
--

INSERT INTO `usepass` (`UserName`, `Password`, `Level`) VALUES
('dabir', 'amir', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`IDApartment`,`IDLandlord`),
  ADD KEY `IDLandlord` (`IDLandlord`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`IDContract`,`IDCustomer`,`IDApartment`),
  ADD KEY `IDCustomer` (`IDCustomer`),
  ADD KEY `IDApartment` (`IDApartment`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`IDCustomer`);

--
-- Indexes for table `landlord`
--
ALTER TABLE `landlord`
  ADD PRIMARY KEY (`IDLandlord`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartment`
--
ALTER TABLE `apartment`
  MODIFY `IDApartment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `IDContract` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `IDCustomer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landlord`
--
ALTER TABLE `landlord`
  MODIFY `IDLandlord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartment`
--
ALTER TABLE `apartment`
  ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`IDLandlord`) REFERENCES `landlord` (`IDLandlord`);

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`IDCustomer`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`IDApartment`) REFERENCES `apartment` (`IDApartment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
