-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2017 at 02:07 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final project`
--

-- --------------------------------------------------------

--
-- Table structure for table `family_member`
--

CREATE TABLE `family_member` (
  `Family_id` char(2) NOT NULL,
  `F_name` varchar(15) NOT NULL,
  `M_init` char(1) DEFAULT NULL,
  `L_name` varchar(15) NOT NULL,
  `Age` int(11) NOT NULL,
  `Sex` char(1) NOT NULL,
  `Birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family_member`
--

INSERT INTO `family_member` (`Family_id`, `F_name`, `M_init`, `L_name`, `Age`, `Sex`, `Birthdate`) VALUES
('1', 'Carlos', 'E', 'Bustos', 22, 'M', '1995-06-24'),
('2', 'Junu', '', 'Dhungana', 26, 'F', '1991-02-06'),
('3', 'Natnael', 'K', 'Kebede', 22, 'M', '1996-10-31'),
('4', 'Robert', '', 'LeBlanc', 22, 'm', '1995-07-04'),
('5', 'Octavio', '', 'Garcia', 28, 'm', '1988-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `Floor_numb` char(2) NOT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `House_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`Floor_numb`, `Description`, `House_id`) VALUES
('1', 'First Floor', '249000'),
('1', 'First Floor', '265000'),
('1', 'First Floor', '325995'),
('1', 'First Floor', '333900'),
('1', 'Basement', '589999'),
('2', 'Attic', '249000'),
('2', 'Attic', '265000'),
('2', 'Attic', '325995'),
('2', 'Attic', '333900'),
('2', 'First Floor', '589999'),
('3', 'Attic', '589999');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `house_id` char(10) NOT NULL,
  `addr` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`house_id`, `addr`) VALUES
('249000', '100 Oak Hollow Ct. S Azle Tx 76020'),
('265000', '1008 Wester Trl. Keller Tx 76248'),
('325995', '10020 Tule Lake Rd. Ft. Worth Tx 76177'),
('333900', '100 Spur Ct. Aledo Tx 76008'),
('589999', '100 River Creset Ct. Aledo Tx 76008');

-- --------------------------------------------------------

--
-- Table structure for table `house_of_fmbr`
--

CREATE TABLE `house_of_fmbr` (
  `Family_id` char(2) NOT NULL,
  `House_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_of_fmbr`
--

INSERT INTO `house_of_fmbr` (`Family_id`, `House_id`) VALUES
('1', '249000'),
('2', '265000'),
('3', '589999'),
('4', '325995'),
('5', '333900');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Item_id` char(2) NOT NULL,
  `Placed_date` date NOT NULL,
  `Remove_date` date DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Item_owner` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Item_id`, `Placed_date`, `Remove_date`, `Description`, `Item_owner`) VALUES
('1', '2017-01-01', '2017-12-01', 'Computer', '1'),
('1', '2017-09-01', '0000-00-00', 'Watch', '2'),
('1', '2016-05-02', '0000-00-00', 'Belt', '3'),
('1', '2017-03-15', '0000-00-00', 'Tshirt', '4'),
('1', '2017-02-14', '0000-00-00', 'Teddy Bear', '5'),
('2', '2016-05-10', '2016-06-13', 'Sweater', '3'),
('2', '2016-12-31', '2017-07-04', 'Remote Control Car', '5');

-- --------------------------------------------------------

--
-- Table structure for table `item_location`
--

CREATE TABLE `item_location` (
  `Item_id` char(2) NOT NULL,
  `Item_owner` char(2) NOT NULL,
  `Room_id` char(2) NOT NULL,
  `Room_owner` char(2) NOT NULL,
  `Floor_numb` char(2) NOT NULL,
  `House_id` char(10) NOT NULL,
  `Storage_id` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_location`
--

INSERT INTO `item_location` (`Item_id`, `Item_owner`, `Room_id`, `Room_owner`, `Floor_numb`, `House_id`, `Storage_id`) VALUES
('1', '1', '1', '1', '1', '249000', '1'),
('1', '2', '1', '2', '1', '265000', '1'),
('1', '3', '1', '3', '1', '589999', '1'),
('1', '4', '1', '4', '2', '325995', '1'),
('1', '5', '1', '5', '2', '333900', '1'),
('2', '3', '1', '3', '1', '589999', '1'),
('2', '5', '1', '5', '1', '333900', '1');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_id` char(2) NOT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Room_owner` char(2) NOT NULL,
  `Floor_numb` char(2) NOT NULL,
  `House_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_id`, `Description`, `Room_owner`, `Floor_numb`, `House_id`) VALUES
('1', 'Carlos\' Room', '1', '1', '249000'),
('1', 'Junu\'s Closet', '2', '1', '265000'),
('1', 'Robert\'s study', '3', '1', '325995'),
('1', 'Nate\'s living room', '4', '1', '333900'),
('1', 'Octavio\'s garage', '5', '1', '589999');

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `Storage_id` char(2) NOT NULL,
  `Storage_capacity` varchar(2) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Room_id` char(2) NOT NULL,
  `Room_owner` char(2) NOT NULL,
  `Floor_numb` char(2) NOT NULL,
  `House_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`Storage_id`, `Storage_capacity`, `Description`, `Room_id`, `Room_owner`, `Floor_numb`, `House_id`) VALUES
('1', '5', 'Cabinet', '1', '1', '1', '249000'),
('1', '15', 'Moving box', '1', '1', '2', '249000'),
('1', '3', 'Nike\'s shoe Box', '1', '2', '1', '265000'),
('1', '10', 'Desk Drawer', '1', '3', '1', '589999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `family_member`
--
ALTER TABLE `family_member`
  ADD PRIMARY KEY (`Family_id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`Floor_numb`,`House_id`),
  ADD KEY `House_id` (`House_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`);

--
-- Indexes for table `house_of_fmbr`
--
ALTER TABLE `house_of_fmbr`
  ADD PRIMARY KEY (`Family_id`,`House_id`),
  ADD KEY `House_id` (`House_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Item_id`,`Item_owner`),
  ADD KEY `Item_owner` (`Item_owner`);

--
-- Indexes for table `item_location`
--
ALTER TABLE `item_location`
  ADD PRIMARY KEY (`Item_id`,`Item_owner`,`Room_id`,`Room_owner`,`Floor_numb`,`House_id`,`Storage_id`),
  ADD KEY `Item_owner` (`Item_owner`),
  ADD KEY `Room_id` (`Room_id`),
  ADD KEY `Room_owner` (`Room_owner`),
  ADD KEY `Floor_numb` (`Floor_numb`),
  ADD KEY `House_id` (`House_id`),
  ADD KEY `Storage_id` (`Storage_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_id`,`Room_owner`,`Floor_numb`,`House_id`),
  ADD KEY `Room_owner` (`Room_owner`),
  ADD KEY `Floor_numb` (`Floor_numb`),
  ADD KEY `House_id` (`House_id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`Storage_id`,`Room_id`,`Room_owner`,`Floor_numb`,`House_id`),
  ADD KEY `Room_id` (`Room_id`),
  ADD KEY `Room_owner` (`Room_owner`),
  ADD KEY `Floor_numb` (`Floor_numb`),
  ADD KEY `House_id` (`House_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `floor`
--
ALTER TABLE `floor`
  ADD CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`House_id`) REFERENCES `house` (`house_id`);

--
-- Constraints for table `house_of_fmbr`
--
ALTER TABLE `house_of_fmbr`
  ADD CONSTRAINT `house_of_fmbr_ibfk_1` FOREIGN KEY (`Family_id`) REFERENCES `family_member` (`Family_id`),
  ADD CONSTRAINT `house_of_fmbr_ibfk_2` FOREIGN KEY (`House_id`) REFERENCES `house` (`house_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`Item_owner`) REFERENCES `family_member` (`Family_id`);

--
-- Constraints for table `item_location`
--
ALTER TABLE `item_location`
  ADD CONSTRAINT `item_location_ibfk_1` FOREIGN KEY (`Item_id`) REFERENCES `item` (`Item_id`),
  ADD CONSTRAINT `item_location_ibfk_2` FOREIGN KEY (`Item_owner`) REFERENCES `family_member` (`Family_id`),
  ADD CONSTRAINT `item_location_ibfk_3` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`),
  ADD CONSTRAINT `item_location_ibfk_4` FOREIGN KEY (`Room_owner`) REFERENCES `family_member` (`Family_id`),
  ADD CONSTRAINT `item_location_ibfk_5` FOREIGN KEY (`Floor_numb`) REFERENCES `floor` (`Floor_numb`),
  ADD CONSTRAINT `item_location_ibfk_6` FOREIGN KEY (`House_id`) REFERENCES `house` (`house_id`),
  ADD CONSTRAINT `item_location_ibfk_7` FOREIGN KEY (`Storage_id`) REFERENCES `storage` (`Storage_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Room_owner`) REFERENCES `family_member` (`Family_id`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`Floor_numb`) REFERENCES `floor` (`Floor_numb`),
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`House_id`) REFERENCES `house` (`house_id`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`),
  ADD CONSTRAINT `storage_ibfk_2` FOREIGN KEY (`Room_owner`) REFERENCES `family_member` (`Family_id`),
  ADD CONSTRAINT `storage_ibfk_3` FOREIGN KEY (`Floor_numb`) REFERENCES `floor` (`Floor_numb`),
  ADD CONSTRAINT `storage_ibfk_4` FOREIGN KEY (`House_id`) REFERENCES `house` (`house_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
