-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 10:48 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dlc_cbtconverted`
--

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`) VALUES
(54, 'Create Admin', 'Can create new administrator accounts'),
(55, 'Create Invigilator', 'Can create new test invigilator accounts'),
(56, 'Create Test Admin', 'Can create new test administrator accounts'),
(57, 'Create Test Compositor', 'Can create new test compositor accounts'),
(58, 'Demote', 'Can demote user roles'),
(59, 'Enrolls Students', 'Can enroll students in the system'),
(60, 'InitRecommendation', 'Can initiate recommendations'),
(61, 'ProfessorialAssessment', 'Can perform professorial assessments'),
(62, 'PromotionLetters', 'Can generate promotion letters'),
(63, 'PromotionSetting', 'Can configure promotion settings'),
(64, 'Recommendation', 'Can make recommendations'),
(65, 'Relocate Student', 'Can relocate students between venues'),
(66, 'Restore Candidate', 'Can restore candidate access'),
(67, 'SalaryPlacement', 'Can manage salary placements'),
(68, 'ScreenPublication', 'Can screen publications'),
(69, 'Set Question', 'Can set and configure questions'),
(70, 'Test Configuration', 'Can configure test settings'),
(71, 'Update Question Bank', 'Can update the question bank'),
(72, 'Venue Mapping', 'Can map and manage venues'),
(73, 'View Question', 'Can view questions in the bank'),
(74, 'View Result', 'Can view test results');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`) VALUES
(19, 'Admin', 'Administrator with system management capabilities'),
(20, 'PC Registrar', 'Manages PC registration and enrollment'),
(21, 'Question Author', 'Creates and manages question bank'),
(22, 'Student', 'Student user with limited access'),
(23, 'Super Admin', 'Super Administrator with full system access'),
(24, 'Test Administrator', 'Manages test administration and configuration'),
(25, 'Test Compositor', 'Creates and manages test questions'),
(26, 'Test Invigilator', 'Monitors and supervises test sessions'),
(27, 'Test Previewer', 'Reviews and previews test questions');

-- --------------------------------------------------------

--
-- Table structure for table `rolepermission`
--

CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblansweroptions`
--

CREATE TABLE `tblansweroptions` (
  `answerid` int(11) NOT NULL,
  `test` text NOT NULL,
  `questionbankid` int(11) NOT NULL,
  `correctness` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblansweroptions`
--

INSERT INTO `tblansweroptions` (`answerid`, `test`, `questionbankid`, `correctness`) VALUES
(1, 'Hyper Text Markup Language <br />', 1, 1),
(2, 'Hyperlinks and Text Markup Language<br />', 1, 0),
(3, 'Home Tool Markup Language<br />', 1, 0),
(4, 'Hyper Tool Machine Language</p>\r\n<p>', 1, 0),
(5, 'Monitor<br />', 2, 0),
(6, 'Keyboard <br />', 2, 1),
(7, 'Printer<br />', 2, 0),
(8, 'Speaker</p>\r\n<p>', 2, 0),
(9, 'RAM<br />', 3, 0),
(10, 'CPU<br />', 3, 0),
(11, 'Hard Disk <br />', 3, 1),
(12, 'Monitor</p>\r\n<p>', 3, 0),
(13, 'Random Access Memory <br />', 4, 1),
(14, 'Read Access Memory<br />', 4, 0),
(15, 'Run All Memory<br />', 4, 0),
(16, 'Random Arithmetic Machine</p>\r\n<p>', 4, 0),
(17, 'Monitor<br />', 5, 0),
(18, 'CPU <br />', 5, 1),
(19, 'RAM<br />', 5, 0),
(20, 'Keyboard</p>\r\n<p>', 5, 0),
(21, 'Decimal<br />', 6, 0),
(22, 'Binary<br />', 6, 0),
(23, 'Octal<br />', 6, 0),
(24, 'Hexadecimal </p>\r\n<p>', 6, 1),
(25, 'Structured Query Language <br />', 7, 1),
(26, 'Simple Query Language<br />', 7, 0),
(27, 'Standard Question Logic<br />', 7, 0),
(28, 'Sequential Query Language</p>\r\n<p>', 7, 0),
(29, 'MS Word<br />', 8, 0),
(30, 'Windows 10 <br />', 8, 1),
(31, 'Google Chrome<br />', 8, 0),
(32, 'Intel</p>\r\n<p>', 8, 0),
(33, 'Python<br />', 9, 0),
(34, 'Java<br />', 9, 0),
(35, 'HTML<br />', 9, 0),
(36, 'MySQL </p>\r\n<p>', 9, 1),
(37, '16<br />', 10, 0),
(38, '11 <br />', 10, 1),
(39, '13<br />', 10, 0),
(40, '10</p>\r\n<p>', 10, 0),
(41, 'Ability to inherit from multiple classes<br />', 11, 0),
(42, 'Ability to define multiple methods with the same name but different implementations <br />', 11, 1),
(43, 'The use of interfaces only<br />', 11, 0),
(44, 'Restricting object creation</p>\r\n<p>', 11, 0),
(45, 'Bubble Sort<br />', 12, 0),
(46, 'Merge Sort <br />', 12, 1),
(47, 'Insertion Sort<br />', 12, 0),
(48, 'Selection Sort</p>\r\n<p>', 12, 0),
(49, 'MySQL<br />', 13, 0),
(50, 'MongoDB <br />', 13, 1),
(51, 'Oracle<br />', 13, 0),
(52, 'PostgreSQL</p>\r\n<p>', 13, 0),
(53, 'To ensure uniqueness<br />', 14, 0),
(54, 'To index columns<br />', 14, 0),
(55, 'To create links between tables <br />', 14, 1),
(56, 'To increase storage</p>\r\n<p>', 14, 0),
(57, 'The parent class<br />', 15, 0),
(58, 'The current class object <br />', 15, 1),
(59, 'A static method<br />', 15, 0),
(60, 'An inherited object</p>', 15, 0),
(61, 'Hyper Text Markup Language <br />', 16, 1),
(62, 'Hyperlinks and Text Markup Language<br />', 16, 0),
(63, 'Home Tool Markup Language<br />', 16, 0),
(64, 'Hyper Tool Machine Language</p>\r\n<p>', 16, 0),
(65, 'Monitor<br />', 17, 0),
(66, 'Keyboard <br />', 17, 1),
(67, 'Printer<br />', 17, 0),
(68, 'Speaker</p>\r\n<p>', 17, 0),
(69, 'RAM<br />', 18, 0),
(70, 'CPU<br />', 18, 0),
(71, 'Hard Disk <br />', 18, 1),
(72, 'Monitor</p>\r\n<p>', 18, 0),
(73, 'Random Access Memory <br />', 19, 1),
(74, 'Read Access Memory<br />', 19, 0),
(75, 'Run All Memory<br />', 19, 0),
(76, 'Random Arithmetic Machine</p>\r\n<p>', 19, 0),
(77, 'Monitor<br />', 20, 0),
(78, 'CPU <br />', 20, 1),
(79, 'RAM<br />', 20, 0),
(80, 'Keyboard</p>\r\n<p>', 20, 0),
(81, 'Decimal<br />', 21, 0),
(82, 'Binary<br />', 21, 0),
(83, 'Octal<br />', 21, 0),
(84, 'Hexadecimal </p>\r\n<p>', 21, 1),
(85, 'Structured Query Language <br />', 22, 1),
(86, 'Simple Query Language<br />', 22, 0),
(87, 'Standard Question Logic<br />', 22, 0),
(88, 'Sequential Query Language</p>\r\n<p>', 22, 0),
(89, 'MS Word<br />', 23, 0),
(90, 'Windows 10 <br />', 23, 1),
(91, 'Google Chrome<br />', 23, 0),
(92, 'Intel</p>\r\n<p>', 23, 0),
(93, 'Python<br />', 24, 0),
(94, 'Java<br />', 24, 0),
(95, 'HTML<br />', 24, 0),
(96, 'MySQL </p>\r\n<p>', 24, 1),
(97, '16<br />', 25, 0),
(98, '11 <br />', 25, 1),
(99, '13<br />', 25, 0),
(100, '10</p>\r\n<p>', 25, 0),
(101, 'Ability to inherit from multiple classes<br />', 26, 0),
(102, 'Ability to define multiple methods with the same name but different implementations <br />', 26, 1),
(103, 'The use of interfaces only<br />', 26, 0),
(104, 'Restricting object creation</p>\r\n<p>', 26, 0),
(105, 'Bubble Sort<br />', 27, 0),
(106, 'Merge Sort <br />', 27, 1),
(107, 'Insertion Sort<br />', 27, 0),
(108, 'Selection Sort</p>\r\n<p>', 27, 0),
(109, 'MySQL<br />', 28, 0),
(110, 'MongoDB <br />', 28, 1),
(111, 'Oracle<br />', 28, 0),
(112, 'PostgreSQL</p>\r\n<p>', 28, 0),
(113, 'To ensure uniqueness<br />', 29, 0),
(114, 'To index columns<br />', 29, 0),
(115, 'To create links between tables <br />', 29, 1),
(116, 'To increase storage</p>\r\n<p>', 29, 0),
(117, 'The parent class<br />', 30, 0),
(118, 'The current class object <br />', 30, 1),
(119, 'A static method<br />', 30, 0),
(120, 'An inherited object</p>', 30, 0),
(121, 'Hyper Text Markup Language <br />', 31, 1),
(122, 'Hyperlinks and Text Markup Language<br />', 31, 0),
(123, 'Home Tool Markup Language<br />', 31, 0),
(124, 'Hyper Tool Machine Language</p>\r\n<p>', 31, 0),
(125, 'Monitor<br />', 32, 0),
(126, 'Keyboard <br />', 32, 1),
(127, 'Printer<br />', 32, 0),
(128, 'Speaker</p>\r\n<p>', 32, 0),
(129, 'RAM<br />', 33, 0),
(130, 'CPU<br />', 33, 0),
(131, 'Hard Disk <br />', 33, 1),
(132, 'Monitor</p>\r\n<p>', 33, 0),
(133, 'Random Access Memory <br />', 34, 1),
(134, 'Read Access Memory<br />', 34, 0),
(135, 'Run All Memory<br />', 34, 0),
(136, 'Random Arithmetic Machine</p>\r\n<p>', 34, 0),
(137, 'Monitor<br />', 35, 0),
(138, 'CPU <br />', 35, 1),
(139, 'RAM<br />', 35, 0),
(140, 'Keyboard</p>\r\n<p>', 35, 0),
(141, 'Decimal<br />', 36, 0),
(142, 'Binary<br />', 36, 0),
(143, 'Octal<br />', 36, 0),
(144, 'Hexadecimal </p>\r\n<p>', 36, 1),
(145, 'Structured Query Language <br />', 37, 1),
(146, 'Simple Query Language<br />', 37, 0),
(147, 'Standard Question Logic<br />', 37, 0),
(148, 'Sequential Query Language</p>\r\n<p>', 37, 0),
(149, 'MS Word<br />', 38, 0),
(150, 'Windows 10 <br />', 38, 1),
(151, 'Google Chrome<br />', 38, 0),
(152, 'Intel</p>\r\n<p>', 38, 0),
(153, 'Python<br />', 39, 0),
(154, 'Java<br />', 39, 0),
(155, 'HTML<br />', 39, 0),
(156, 'MySQL </p>\r\n<p>', 39, 1),
(157, '16<br />', 40, 0),
(158, '11 <br />', 40, 1),
(159, '13<br />', 40, 0),
(160, '10</p>\r\n<p>', 40, 0),
(161, 'Ability to inherit from multiple classes<br />', 41, 0),
(162, 'Ability to define multiple methods with the same name but different implementations <br />', 41, 1),
(163, 'The use of interfaces only<br />', 41, 0),
(164, 'Restricting object creation</p>\r\n<p>', 41, 0),
(165, 'Bubble Sort<br />', 42, 0),
(166, 'Merge Sort <br />', 42, 1),
(167, 'Insertion Sort<br />', 42, 0),
(168, 'Selection Sort</p>\r\n<p>', 42, 0),
(169, 'MySQL<br />', 43, 0),
(170, 'MongoDB <br />', 43, 1),
(171, 'Oracle<br />', 43, 0),
(172, 'PostgreSQL</p>\r\n<p>', 43, 0),
(173, 'To ensure uniqueness<br />', 44, 0),
(174, 'To index columns<br />', 44, 0),
(175, 'To create links between tables <br />', 44, 1),
(176, 'To increase storage</p>\r\n<p>', 44, 0),
(177, 'The parent class<br />', 45, 0),
(178, 'The current class object <br />', 45, 1),
(179, 'A static method<br />', 45, 0),
(180, 'An inherited object</p>', 45, 0),
(181, 'Hyper Text Markup Language <br />', 46, 1),
(182, 'Hyperlinks and Text Markup Language<br />', 46, 0),
(183, 'Home Tool Markup Language<br />', 46, 0),
(184, 'Hyper Tool Machine Language</p>\r\n<p>', 46, 0),
(185, 'Monitor<br />', 47, 0),
(186, 'Keyboard <br />', 47, 1),
(187, 'Printer<br />', 47, 0),
(188, 'Speaker</p>\r\n<p>', 47, 0),
(189, 'RAM<br />', 48, 0),
(190, 'CPU<br />', 48, 0),
(191, 'Hard Disk <br />', 48, 1),
(192, 'Monitor</p>\r\n<p>', 48, 0),
(193, 'Random Access Memory <br />', 49, 1),
(194, 'Read Access Memory<br />', 49, 0),
(195, 'Run All Memory<br />', 49, 0),
(196, 'Random Arithmetic Machine</p>\r\n<p>', 49, 0),
(197, 'Monitor<br />', 50, 0),
(198, 'CPU <br />', 50, 1),
(199, 'RAM<br />', 50, 0),
(200, 'Keyboard</p>\r\n<p>', 50, 0),
(201, 'Decimal<br />', 51, 0),
(202, 'Binary<br />', 51, 0),
(203, 'Octal<br />', 51, 0),
(204, 'Hexadecimal </p>\r\n<p>', 51, 1),
(205, 'Structured Query Language <br />', 52, 1),
(206, 'Simple Query Language<br />', 52, 0),
(207, 'Standard Question Logic<br />', 52, 0),
(208, 'Sequential Query Language</p>\r\n<p>', 52, 0),
(209, 'MS Word<br />', 53, 0),
(210, 'Windows 10 <br />', 53, 1),
(211, 'Google Chrome<br />', 53, 0),
(212, 'Intel</p>\r\n<p>', 53, 0),
(213, 'Python<br />', 54, 0),
(214, 'Java<br />', 54, 0),
(215, 'HTML<br />', 54, 0),
(216, 'MySQL </p>\r\n<p>', 54, 1),
(217, '16<br />', 55, 0),
(218, '11 <br />', 55, 1),
(219, '13<br />', 55, 0),
(220, '10</p>\r\n<p>', 55, 0),
(221, 'Ability to inherit from multiple classes<br />', 56, 0),
(222, 'Ability to define multiple methods with the same name but different implementations <br />', 56, 1),
(223, 'The use of interfaces only<br />', 56, 0),
(224, 'Restricting object creation</p>\r\n<p>', 56, 0),
(225, 'Bubble Sort<br />', 57, 0),
(226, 'Merge Sort <br />', 57, 1),
(227, 'Insertion Sort<br />', 57, 0),
(228, 'Selection Sort</p>\r\n<p>', 57, 0),
(229, 'MySQL<br />', 58, 0),
(230, 'MongoDB <br />', 58, 1),
(231, 'Oracle<br />', 58, 0),
(232, 'PostgreSQL</p>\r\n<p>', 58, 0),
(233, 'To ensure uniqueness<br />', 59, 0),
(234, 'To index columns<br />', 59, 0),
(235, 'To create links between tables <br />', 59, 1),
(236, 'To increase storage</p>\r\n<p>', 59, 0),
(237, 'The parent class<br />', 60, 0),
(238, 'The current class object <br />', 60, 1),
(239, 'A static method<br />', 60, 0),
(240, 'An inherited object</p>', 60, 0),
(241, 'Hyper Text Markup Language <br />', 61, 1),
(242, 'Hyperlinks and Text Markup Language<br />', 61, 0),
(243, 'Home Tool Markup Language<br />', 61, 0),
(244, 'Hyper Tool Machine Language</p>\r\n<p>', 61, 0),
(245, 'Monitor<br />', 62, 0),
(246, 'Keyboard <br />', 62, 1),
(247, 'Printer<br />', 62, 0),
(248, 'Speaker</p>\r\n<p>', 62, 0),
(249, 'RAM<br />', 63, 0),
(250, 'CPU<br />', 63, 0),
(251, 'Hard Disk <br />', 63, 1),
(252, 'Monitor</p>\r\n<p>', 63, 0),
(253, 'Random Access Memory <br />', 64, 1),
(254, 'Read Access Memory<br />', 64, 0),
(255, 'Run All Memory<br />', 64, 0),
(256, 'Random Arithmetic Machine</p>\r\n<p>', 64, 0),
(257, 'Monitor<br />', 65, 0),
(258, 'CPU <br />', 65, 1),
(259, 'RAM<br />', 65, 0),
(260, 'Keyboard</p>\r\n<p>', 65, 0),
(261, 'Decimal<br />', 66, 0),
(262, 'Binary<br />', 66, 0),
(263, 'Octal<br />', 66, 0),
(264, 'Hexadecimal </p>\r\n<p>', 66, 1),
(265, 'Structured Query Language <br />', 67, 1),
(266, 'Simple Query Language<br />', 67, 0),
(267, 'Standard Question Logic<br />', 67, 0),
(268, 'Sequential Query Language</p>\r\n<p>', 67, 0),
(269, 'MS Word<br />', 68, 0),
(270, 'Windows 10 <br />', 68, 1),
(271, 'Google Chrome<br />', 68, 0),
(272, 'Intel</p>\r\n<p>', 68, 0),
(273, 'Python<br />', 69, 0),
(274, 'Java<br />', 69, 0),
(275, 'HTML<br />', 69, 0),
(276, 'MySQL </p>\r\n<p>', 69, 1),
(277, '16<br />', 70, 0),
(278, '11 <br />', 70, 1),
(279, '13<br />', 70, 0),
(280, '10</p>\r\n<p>', 70, 0),
(281, 'Ability to inherit from multiple classes<br />', 71, 0),
(282, 'Ability to define multiple methods with the same name but different implementations <br />', 71, 1),
(283, 'The use of interfaces only<br />', 71, 0),
(284, 'Restricting object creation</p>\r\n<p>', 71, 0),
(285, 'Bubble Sort<br />', 72, 0),
(286, 'Merge Sort <br />', 72, 1),
(287, 'Insertion Sort<br />', 72, 0),
(288, 'Selection Sort</p>\r\n<p>', 72, 0),
(289, 'MySQL<br />', 73, 0),
(290, 'MongoDB <br />', 73, 1),
(291, 'Oracle<br />', 73, 0),
(292, 'PostgreSQL</p>\r\n<p>', 73, 0),
(293, 'To ensure uniqueness<br />', 74, 0),
(294, 'To index columns<br />', 74, 0),
(295, 'To create links between tables <br />', 74, 1),
(296, 'To increase storage</p>\r\n<p>', 74, 0),
(297, 'The parent class<br />', 75, 0),
(298, 'The current class object <br />', 75, 1),
(299, 'A static method<br />', 75, 0),
(300, 'An inherited object</p>', 75, 0),
(301, 'Hyper Text Markup Language <br />', 76, 1),
(302, 'Hyperlinks and Text Markup Language<br />', 76, 0),
(303, 'Home Tool Markup Language<br />', 76, 0),
(304, 'Hyper Tool Machine Language</p>\r\n<p>', 76, 0),
(305, 'Monitor<br />', 77, 0),
(306, 'Keyboard <br />', 77, 1),
(307, 'Printer<br />', 77, 0),
(308, 'Speaker</p>\r\n<p>', 77, 0),
(309, 'RAM<br />', 78, 0),
(310, 'CPU<br />', 78, 0),
(311, 'Hard Disk <br />', 78, 1),
(312, 'Monitor</p>\r\n<p>', 78, 0),
(313, 'Random Access Memory <br />', 79, 1),
(314, 'Read Access Memory<br />', 79, 0),
(315, 'Run All Memory<br />', 79, 0),
(316, 'Random Arithmetic Machine</p>\r\n<p>', 79, 0),
(317, 'Monitor<br />', 80, 0),
(318, 'CPU <br />', 80, 1),
(319, 'RAM<br />', 80, 0),
(320, 'Keyboard</p>\r\n<p>', 80, 0),
(321, 'Decimal<br />', 81, 0),
(322, 'Binary<br />', 81, 0),
(323, 'Octal<br />', 81, 0),
(324, 'Hexadecimal </p>\r\n<p>', 81, 1),
(325, 'Structured Query Language <br />', 82, 1),
(326, 'Simple Query Language<br />', 82, 0),
(327, 'Standard Question Logic<br />', 82, 0),
(328, 'Sequential Query Language</p>\r\n<p>', 82, 0),
(329, 'MS Word<br />', 83, 0),
(330, 'Windows 10 <br />', 83, 1),
(331, 'Google Chrome<br />', 83, 0),
(332, 'Intel</p>\r\n<p>', 83, 0),
(333, 'Python<br />', 84, 0),
(334, 'Java<br />', 84, 0),
(335, 'HTML<br />', 84, 0),
(336, 'MySQL </p>\r\n<p>', 84, 1),
(337, '16<br />', 85, 0),
(338, '11 <br />', 85, 1),
(339, '13<br />', 85, 0),
(340, '10</p>\r\n<p>', 85, 0),
(341, 'Ability to inherit from multiple classes<br />', 86, 0),
(342, 'Ability to define multiple methods with the same name but different implementations <br />', 86, 1),
(343, 'The use of interfaces only<br />', 86, 0),
(344, 'Restricting object creation</p>\r\n<p>', 86, 0),
(345, 'Bubble Sort<br />', 87, 0),
(346, 'Merge Sort <br />', 87, 1),
(347, 'Insertion Sort<br />', 87, 0),
(348, 'Selection Sort</p>\r\n<p>', 87, 0),
(349, 'MySQL<br />', 88, 0),
(350, 'MongoDB <br />', 88, 1),
(351, 'Oracle<br />', 88, 0),
(352, 'PostgreSQL</p>\r\n<p>', 88, 0),
(353, 'To ensure uniqueness<br />', 89, 0),
(354, 'To index columns<br />', 89, 0),
(355, 'To create links between tables <br />', 89, 1),
(356, 'To increase storage</p>\r\n<p>', 89, 0),
(357, 'The parent class<br />', 90, 0),
(358, 'The current class object <br />', 90, 1),
(359, 'A static method<br />', 90, 0),
(360, 'An inherited object</p>', 90, 0),
(361, 'Hyper Text Markup Language <br />', 91, 1),
(362, 'Hyperlinks and Text Markup Language<br />', 91, 0),
(363, 'Home Tool Markup Language<br />', 91, 0),
(364, 'Hyper Tool Machine Language</p>\r\n<p>', 91, 0),
(365, 'Monitor<br />', 92, 0),
(366, 'Keyboard <br />', 92, 1),
(367, 'Printer<br />', 92, 0),
(368, 'Speaker</p>\r\n<p>', 92, 0),
(369, 'RAM<br />', 93, 0),
(370, 'CPU<br />', 93, 0),
(371, 'Hard Disk <br />', 93, 1),
(372, 'Monitor</p>\r\n<p>', 93, 0),
(373, 'Random Access Memory <br />', 94, 1),
(374, 'Read Access Memory<br />', 94, 0),
(375, 'Run All Memory<br />', 94, 0),
(376, 'Random Arithmetic Machine</p>\r\n<p>', 94, 0),
(377, 'Monitor<br />', 95, 0),
(378, 'CPU <br />', 95, 1),
(379, 'RAM<br />', 95, 0),
(380, 'Keyboard</p>\r\n<p>', 95, 0),
(381, 'Decimal<br />', 96, 0),
(382, 'Binary<br />', 96, 0),
(383, 'Octal<br />', 96, 0),
(384, 'Hexadecimal </p>\r\n<p>', 96, 1),
(385, 'Structured Query Language <br />', 97, 1),
(386, 'Simple Query Language<br />', 97, 0),
(387, 'Standard Question Logic<br />', 97, 0),
(388, 'Sequential Query Language</p>\r\n<p>', 97, 0),
(389, 'MS Word<br />', 98, 0),
(390, 'Windows 10 <br />', 98, 1),
(391, 'Google Chrome<br />', 98, 0),
(392, 'Intel</p>\r\n<p>', 98, 0),
(393, 'Python<br />', 99, 0),
(394, 'Java<br />', 99, 0),
(395, 'HTML<br />', 99, 0),
(396, 'MySQL </p>\r\n<p>', 99, 1),
(397, '16<br />', 100, 0),
(398, '11 <br />', 100, 1),
(399, '13<br />', 100, 0),
(400, '10</p>\r\n<p>', 100, 0),
(401, 'Ability to inherit from multiple classes<br />', 101, 0),
(402, 'Ability to define multiple methods with the same name but different implementations <br />', 101, 1),
(403, 'The use of interfaces only<br />', 101, 0),
(404, 'Restricting object creation</p>\r\n<p>', 101, 0),
(405, 'Bubble Sort<br />', 102, 0),
(406, 'Merge Sort <br />', 102, 1),
(407, 'Insertion Sort<br />', 102, 0),
(408, 'Selection Sort</p>\r\n<p>', 102, 0),
(409, 'MySQL<br />', 103, 0),
(410, 'MongoDB <br />', 103, 1),
(411, 'Oracle<br />', 103, 0),
(412, 'PostgreSQL</p>\r\n<p>', 103, 0),
(413, 'To ensure uniqueness<br />', 104, 0),
(414, 'To index columns<br />', 104, 0),
(415, 'To create links between tables <br />', 104, 1),
(416, 'To increase storage</p>\r\n<p>', 104, 0),
(417, 'The parent class<br />', 105, 0),
(418, 'The current class object <br />', 105, 1),
(419, 'A static method<br />', 105, 0),
(420, 'An inherited object</p>', 105, 0),
(421, 'Hyper Text Markup Language <br />', 106, 1),
(422, 'Hyperlinks and Text Markup Language<br />', 106, 0),
(423, 'Home Tool Markup Language<br />', 106, 0),
(424, 'Hyper Tool Machine Language</p>\r\n<p>', 106, 0),
(425, 'Monitor<br />', 107, 0),
(426, 'Keyboard <br />', 107, 1),
(427, 'Printer<br />', 107, 0),
(428, 'Speaker</p>\r\n<p>', 107, 0),
(429, 'RAM<br />', 108, 0),
(430, 'CPU<br />', 108, 0),
(431, 'Hard Disk <br />', 108, 1),
(432, 'Monitor</p>\r\n<p>', 108, 0),
(433, 'Random Access Memory <br />', 109, 1),
(434, 'Read Access Memory<br />', 109, 0),
(435, 'Run All Memory<br />', 109, 0),
(436, 'Random Arithmetic Machine</p>\r\n<p>', 109, 0),
(437, 'Monitor<br />', 110, 0),
(438, 'CPU <br />', 110, 1),
(439, 'RAM<br />', 110, 0),
(440, 'Keyboard</p>\r\n<p>', 110, 0),
(441, 'Decimal<br />', 111, 0),
(442, 'Binary<br />', 111, 0),
(443, 'Octal<br />', 111, 0),
(444, 'Hexadecimal </p>\r\n<p>', 111, 1),
(445, 'Structured Query Language <br />', 112, 1),
(446, 'Simple Query Language<br />', 112, 0),
(447, 'Standard Question Logic<br />', 112, 0),
(448, 'Sequential Query Language</p>\r\n<p>', 112, 0),
(449, 'MS Word<br />', 113, 0),
(450, 'Windows 10 <br />', 113, 1),
(451, 'Google Chrome<br />', 113, 0),
(452, 'Intel</p>\r\n<p>', 113, 0),
(453, 'Python<br />', 114, 0),
(454, 'Java<br />', 114, 0),
(455, 'HTML<br />', 114, 0),
(456, 'MySQL </p>\r\n<p>', 114, 1),
(457, '16<br />', 115, 0),
(458, '11 <br />', 115, 1),
(459, '13<br />', 115, 0),
(460, '10</p>\r\n<p>', 115, 0),
(461, 'Ability to inherit from multiple classes<br />', 116, 0),
(462, 'Ability to define multiple methods with the same name but different implementations <br />', 116, 1),
(463, 'The use of interfaces only<br />', 116, 0),
(464, 'Restricting object creation</p>\r\n<p>', 116, 0),
(465, 'Bubble Sort<br />', 117, 0),
(466, 'Merge Sort <br />', 117, 1),
(467, 'Insertion Sort<br />', 117, 0),
(468, 'Selection Sort</p>\r\n<p>', 117, 0),
(469, 'MySQL<br />', 118, 0),
(470, 'MongoDB <br />', 118, 1),
(471, 'Oracle<br />', 118, 0),
(472, 'PostgreSQL</p>\r\n<p>', 118, 0),
(473, 'To ensure uniqueness<br />', 119, 0),
(474, 'To index columns<br />', 119, 0),
(475, 'To create links between tables <br />', 119, 1),
(476, 'To increase storage</p>\r\n<p>', 119, 0),
(477, 'The parent class<br />', 120, 0),
(478, 'The current class object <br />', 120, 1),
(479, 'A static method<br />', 120, 0),
(480, 'An inherited object</p>', 120, 0),
(481, 'Hyper Text Markup Language <br />', 121, 1),
(482, 'Hyperlinks and Text Markup Language<br />', 121, 0),
(483, 'Home Tool Markup Language<br />', 121, 0),
(484, 'Hyper Tool Machine Language</p>\r\n<p>', 121, 0),
(485, 'Monitor<br />', 122, 0),
(486, 'Keyboard <br />', 122, 1),
(487, 'Printer<br />', 122, 0),
(488, 'Speaker</p>\r\n<p>', 122, 0),
(489, 'RAM<br />', 123, 0),
(490, 'CPU<br />', 123, 0),
(491, 'Hard Disk <br />', 123, 1),
(492, 'Monitor</p>\r\n<p>', 123, 0),
(493, 'Random Access Memory <br />', 124, 1),
(494, 'Read Access Memory<br />', 124, 0),
(495, 'Run All Memory<br />', 124, 0),
(496, 'Random Arithmetic Machine</p>\r\n<p>', 124, 0),
(497, 'Monitor<br />', 125, 0),
(498, 'CPU <br />', 125, 1),
(499, 'RAM<br />', 125, 0),
(500, 'Keyboard</p>\r\n<p>', 125, 0),
(501, 'Decimal<br />', 126, 0),
(502, 'Binary<br />', 126, 0),
(503, 'Octal<br />', 126, 0),
(504, 'Hexadecimal </p>\r\n<p>', 126, 1),
(505, 'Structured Query Language <br />', 127, 1),
(506, 'Simple Query Language<br />', 127, 0),
(507, 'Standard Question Logic<br />', 127, 0),
(508, 'Sequential Query Language</p>\r\n<p>', 127, 0),
(509, 'MS Word<br />', 128, 0),
(510, 'Windows 10 <br />', 128, 1),
(511, 'Google Chrome<br />', 128, 0),
(512, 'Intel</p>\r\n<p>', 128, 0),
(513, 'Python<br />', 129, 0),
(514, 'Java<br />', 129, 0),
(515, 'HTML<br />', 129, 0),
(516, 'MySQL </p>\r\n<p>', 129, 1),
(517, '16<br />', 130, 0),
(518, '11 <br />', 130, 1),
(519, '13<br />', 130, 0),
(520, '10</p>\r\n<p>', 130, 0),
(521, 'Ability to inherit from multiple classes<br />', 131, 0),
(522, 'Ability to define multiple methods with the same name but different implementations <br />', 131, 1),
(523, 'The use of interfaces only<br />', 131, 0),
(524, 'Restricting object creation</p>\r\n<p>', 131, 0),
(525, 'Bubble Sort<br />', 132, 0),
(526, 'Merge Sort <br />', 132, 1),
(527, 'Insertion Sort<br />', 132, 0),
(528, 'Selection Sort</p>\r\n<p>', 132, 0),
(529, 'MySQL<br />', 133, 0),
(530, 'MongoDB <br />', 133, 1),
(531, 'Oracle<br />', 133, 0),
(532, 'PostgreSQL</p>\r\n<p>', 133, 0),
(533, 'To ensure uniqueness<br />', 134, 0),
(534, 'To index columns<br />', 134, 0),
(535, 'To create links between tables <br />', 134, 1),
(536, 'To increase storage</p>\r\n<p>', 134, 0),
(537, 'The parent class<br />', 135, 0),
(538, 'The current class object <br />', 135, 1),
(539, 'A static method<br />', 135, 0),
(540, 'An inherited object</p>', 135, 0),
(541, 'Hyper Text Markup Language <br />', 136, 1),
(542, 'Hyperlinks and Text Markup Language<br />', 136, 0),
(543, 'Home Tool Markup Language<br />', 136, 0),
(544, 'Hyper Tool Machine Language</p>\r\n<p>', 136, 0),
(545, 'Monitor<br />', 137, 0),
(546, 'Keyboard <br />', 137, 1),
(547, 'Printer<br />', 137, 0),
(548, 'Speaker</p>\r\n<p>', 137, 0),
(549, 'RAM<br />', 138, 0),
(550, 'CPU<br />', 138, 0),
(551, 'Hard Disk <br />', 138, 1),
(552, 'Monitor</p>\r\n<p>', 138, 0),
(553, 'Random Access Memory <br />', 139, 1),
(554, 'Read Access Memory<br />', 139, 0),
(555, 'Run All Memory<br />', 139, 0),
(556, 'Random Arithmetic Machine</p>\r\n<p>', 139, 0),
(557, 'Monitor<br />', 140, 0),
(558, 'CPU <br />', 140, 1),
(559, 'RAM<br />', 140, 0),
(560, 'Keyboard</p>\r\n<p>', 140, 0),
(561, 'Decimal<br />', 141, 0),
(562, 'Binary<br />', 141, 0),
(563, 'Octal<br />', 141, 0),
(564, 'Hexadecimal </p>\r\n<p>', 141, 1),
(565, 'Structured Query Language <br />', 142, 1),
(566, 'Simple Query Language<br />', 142, 0),
(567, 'Standard Question Logic<br />', 142, 0),
(568, 'Sequential Query Language</p>\r\n<p>', 142, 0),
(569, 'MS Word<br />', 143, 0),
(570, 'Windows 10 <br />', 143, 1),
(571, 'Google Chrome<br />', 143, 0),
(572, 'Intel</p>\r\n<p>', 143, 0),
(573, 'Python<br />', 144, 0),
(574, 'Java<br />', 144, 0),
(575, 'HTML<br />', 144, 0),
(576, 'MySQL </p>\r\n<p>', 144, 1),
(577, '16<br />', 145, 0),
(578, '11 <br />', 145, 1),
(579, '13<br />', 145, 0),
(580, '10</p>\r\n<p>', 145, 0),
(581, 'Ability to inherit from multiple classes<br />', 146, 0),
(582, 'Ability to define multiple methods with the same name but different implementations <br />', 146, 1),
(583, 'The use of interfaces only<br />', 146, 0),
(584, 'Restricting object creation</p>\r\n<p>', 146, 0),
(585, 'Bubble Sort<br />', 147, 0),
(586, 'Merge Sort <br />', 147, 1),
(587, 'Insertion Sort<br />', 147, 0),
(588, 'Selection Sort</p>\r\n<p>', 147, 0),
(589, 'MySQL<br />', 148, 0),
(590, 'MongoDB <br />', 148, 1),
(591, 'Oracle<br />', 148, 0),
(592, 'PostgreSQL</p>\r\n<p>', 148, 0),
(593, 'To ensure uniqueness<br />', 149, 0),
(594, 'To index columns<br />', 149, 0),
(595, 'To create links between tables <br />', 149, 1),
(596, 'To increase storage</p>\r\n<p>', 149, 0),
(597, 'The parent class<br />', 150, 0),
(598, 'The current class object <br />', 150, 1),
(599, 'A static method<br />', 150, 0),
(600, 'An inherited object</p>', 150, 0),
(601, 'Hyper Text Markup Language <br />', 151, 1),
(602, 'Hyperlinks and Text Markup Language<br />', 151, 0),
(603, 'Home Tool Markup Language<br />', 151, 0),
(604, 'Hyper Tool Machine Language</p>\r\n<p>', 151, 0),
(605, 'Monitor<br />', 152, 0),
(606, 'Keyboard <br />', 152, 1),
(607, 'Printer<br />', 152, 0),
(608, 'Speaker</p>\r\n<p>', 152, 0),
(609, 'RAM<br />', 153, 0),
(610, 'CPU<br />', 153, 0),
(611, 'Hard Disk <br />', 153, 1),
(612, 'Monitor</p>\r\n<p>', 153, 0),
(613, 'Random Access Memory <br />', 154, 1),
(614, 'Read Access Memory<br />', 154, 0),
(615, 'Run All Memory<br />', 154, 0),
(616, 'Random Arithmetic Machine</p>\r\n<p>', 154, 0),
(617, 'Monitor<br />', 155, 0),
(618, 'CPU <br />', 155, 1),
(619, 'RAM<br />', 155, 0),
(620, 'Keyboard</p>\r\n<p>', 155, 0),
(621, 'Decimal<br />', 156, 0),
(622, 'Binary<br />', 156, 0),
(623, 'Octal<br />', 156, 0),
(624, 'Hexadecimal </p>\r\n<p>', 156, 1),
(625, 'Structured Query Language <br />', 157, 1),
(626, 'Simple Query Language<br />', 157, 0),
(627, 'Standard Question Logic<br />', 157, 0),
(628, 'Sequential Query Language</p>\r\n<p>', 157, 0),
(629, 'MS Word<br />', 158, 0),
(630, 'Windows 10 <br />', 158, 1),
(631, 'Google Chrome<br />', 158, 0),
(632, 'Intel</p>\r\n<p>', 158, 0),
(633, 'Python<br />', 159, 0),
(634, 'Java<br />', 159, 0),
(635, 'HTML<br />', 159, 0),
(636, 'MySQL </p>\r\n<p>', 159, 1),
(637, '16<br />', 160, 0),
(638, '11 <br />', 160, 1),
(639, '13<br />', 160, 0),
(640, '10</p>\r\n<p>', 160, 0),
(641, 'Ability to inherit from multiple classes<br />', 161, 0),
(642, 'Ability to define multiple methods with the same name but different implementations <br />', 161, 1),
(643, 'The use of interfaces only<br />', 161, 0),
(644, 'Restricting object creation</p>\r\n<p>', 161, 0),
(645, 'Bubble Sort<br />', 162, 0),
(646, 'Merge Sort <br />', 162, 1),
(647, 'Insertion Sort<br />', 162, 0),
(648, 'Selection Sort</p>\r\n<p>', 162, 0),
(649, 'MySQL<br />', 163, 0),
(650, 'MongoDB <br />', 163, 1),
(651, 'Oracle<br />', 163, 0),
(652, 'PostgreSQL</p>\r\n<p>', 163, 0),
(653, 'To ensure uniqueness<br />', 164, 0),
(654, 'To index columns<br />', 164, 0),
(655, 'To create links between tables <br />', 164, 1),
(656, 'To increase storage</p>\r\n<p>', 164, 0),
(657, 'The parent class<br />', 165, 0),
(658, 'The current class object <br />', 165, 1),
(659, 'A static method<br />', 165, 0),
(660, 'An inherited object</p>', 165, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblansweroptions_temp`
--

CREATE TABLE `tblansweroptions_temp` (
  `answerid` int(11) NOT NULL,
  `test` text NOT NULL,
  `questionbankid` int(11) NOT NULL,
  `correctness` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblansweroptions_temp`
--

INSERT INTO `tblansweroptions_temp` (`answerid`, `test`, `questionbankid`, `correctness`) VALUES
(641, 'Microsoft Word&lt;br /&gt;', 188, 0),
(642, 'Keyboard &amp;#126;&lt;br /&gt;', 188, 0),
(643, 'Windows&lt;br /&gt;', 188, 0),
(644, 'Antivirus&lt;/p&gt;\r\n&lt;p&gt;', 188, 0),
(645, 'Printer&lt;br /&gt;', 189, 0),
(646, 'Monitor&lt;br /&gt;', 189, 0),
(647, 'Mouse &amp;#126;&lt;br /&gt;', 189, 0),
(648, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 189, 0),
(649, 'Central Process Unit&lt;br /&gt;', 190, 0),
(650, 'Central Processing Unit &amp;#126;&lt;br /&gt;', 190, 0),
(651, 'Computer Primary Unit&lt;br /&gt;', 190, 0),
(652, 'Central Programming Unit&lt;/p&gt;\r\n&lt;p&gt;', 190, 0),
(653, 'Monitor&lt;br /&gt;', 191, 0),
(654, 'CPU &amp;#126;&lt;br /&gt;', 191, 0),
(655, 'Hard Disk&lt;br /&gt;', 191, 0),
(656, 'RAM&lt;/p&gt;\r\n&lt;p&gt;-Which language is closest to machine language?&lt;br /&gt;', 191, 0),
(657, 'Assembly language &amp;#126;&lt;br /&gt;', 191, 0),
(658, 'Java&lt;br /&gt;', 191, 0),
(659, 'Python&lt;br /&gt;', 191, 0),
(660, 'C++&lt;/p&gt;\r\n&lt;p&gt;', 191, 0),
(661, '2 &amp;#126;&lt;br /&gt;', 192, 0),
(662, '8&lt;br /&gt;', 192, 0),
(663, '10&lt;br /&gt;', 192, 0),
(664, '16&lt;/p&gt;\r\n&lt;p&gt;', 192, 0),
(665, 'Python&lt;br /&gt;', 193, 0),
(666, 'HTML&lt;br /&gt;', 193, 0),
(667, 'Java&lt;br /&gt;', 193, 0),
(668, 'MS Word &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;', 193, 0),
(669, 'Storage&lt;br /&gt;', 194, 0),
(670, 'Permanent Memory&lt;br /&gt;', 194, 0),
(671, 'Primary Memory &amp;#126;&lt;br /&gt;', 194, 0),
(672, 'Input Device&lt;/p&gt;\r\n&lt;p&gt;', 194, 0),
(673, 'ROM&lt;br /&gt;', 195, 0),
(674, 'RAM &amp;#126;&lt;br /&gt;', 195, 0),
(675, 'Hard Disk&lt;br /&gt;', 195, 0),
(676, 'CD-ROM&lt;/p&gt;\r\n&lt;p&gt;', 195, 0),
(677, 'Read Only Memory &amp;#126;&lt;br /&gt;', 196, 0),
(678, 'Random Only Memory&lt;br /&gt;', 196, 0),
(679, 'Run On Memory&lt;br /&gt;', 196, 0),
(680, 'Readable Operational Memory&lt;/p&gt;\r\n&lt;p&gt;', 196, 0),
(681, 'Scanner&lt;br /&gt;', 197, 0),
(682, 'Mouse&lt;br /&gt;', 197, 0),
(683, 'Pen drive &amp;#126;&lt;br /&gt;', 197, 0),
(684, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 197, 0),
(685, 'Chrome&lt;br /&gt;', 198, 0),
(686, 'MS Word&lt;br /&gt;', 198, 0),
(687, 'Operating System &amp;#126;&lt;br /&gt;', 198, 0),
(688, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;', 198, 0),
(689, '1000 bytes&lt;br /&gt;', 199, 0),
(690, '1024 bytes &amp;#126;&lt;br /&gt;', 199, 0),
(691, '100 bytes&lt;br /&gt;', 199, 0),
(692, '512 bytes&lt;/p&gt;\r\n&lt;p&gt;', 199, 0),
(693, 'Machine code&lt;br /&gt;', 200, 0),
(694, 'Assembly&lt;br /&gt;', 200, 0),
(695, 'Python &amp;#126;&lt;br /&gt;', 200, 0),
(696, 'Binary&lt;/p&gt;\r\n&lt;p&gt;', 200, 0),
(697, 'Graphical User Interface &amp;#126;&lt;br /&gt;', 201, 0),
(698, 'General Use Interface&lt;br /&gt;', 201, 0),
(699, 'Graphics Used Internally&lt;br /&gt;', 201, 0),
(700, 'Global Utility Input&lt;/p&gt;\r\n&lt;p&gt;', 201, 0),
(701, 'Windows&lt;br /&gt;', 202, 0),
(702, 'Linux&lt;br /&gt;', 202, 0),
(703, 'Oracle &amp;#126;&lt;br /&gt;', 202, 0),
(704, 'macOS&lt;/p&gt;\r\n&lt;p&gt;', 202, 0),
(705, 'Compiling &amp;#126;&lt;br /&gt;', 203, 0),
(706, 'Running&lt;br /&gt;', 203, 0),
(707, 'Executing&lt;br /&gt;', 203, 0),
(708, 'Saving&lt;/p&gt;\r\n&lt;p&gt;', 203, 0),
(709, 'Facebook&lt;br /&gt;', 204, 0),
(710, 'Google &amp;#126;&lt;br /&gt;', 204, 0),
(711, 'Instagram&lt;br /&gt;', 204, 0),
(712, 'Wikipedia&lt;/p&gt;\r\n&lt;p&gt;', 204, 0),
(713, 'Compiler&lt;br /&gt;', 205, 0),
(714, 'Interpreter&lt;br /&gt;', 205, 0),
(715, 'Text Editor &amp;#126;&lt;br /&gt;', 205, 0),
(716, 'Printer&lt;/p&gt;\r\n&lt;p&gt;', 205, 0),
(717, 'Linux&lt;br /&gt;', 206, 0),
(718, 'Windows&lt;br /&gt;', 206, 0),
(719, 'MS Excel &amp;#126;&lt;br /&gt;', 206, 0),
(720, 'BIOS&lt;/p&gt;\r\n&lt;p&gt;', 206, 0),
(721, 'Mainframe&lt;br /&gt;', 207, 0),
(722, 'Supercomputer&lt;br /&gt;', 207, 0),
(723, 'Microcontroller&lt;br /&gt;', 207, 0),
(724, 'Compucard &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;', 207, 0),
(725, 'Information and Communication Technology &amp;#126;&lt;br /&gt;', 208, 0),
(726, 'International Computer Technology&lt;br /&gt;', 208, 0),
(727, 'Internet and Cyber Technology&lt;br /&gt;', 208, 0),
(728, 'Information Computer Techniques&lt;/p&gt;\r\n&lt;p&gt;', 208, 0),
(729, 'HTML &amp;#126;&lt;br /&gt;', 209, 0),
(730, 'MS Paint&lt;br /&gt;', 209, 0),
(731, 'Excel&lt;br /&gt;', 209, 0),
(732, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;', 209, 0),
(733, 'Google&lt;br /&gt;', 210, 0),
(734, 'Microsoft &amp;#126;&lt;br /&gt;', 210, 0),
(735, 'Apple&lt;br /&gt;', 210, 0),
(736, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 210, 0),
(737, 'Backspace&lt;br /&gt;', 211, 0),
(738, 'Shift&lt;br /&gt;', 211, 0),
(739, 'Delete &amp;#126;&lt;br /&gt;', 211, 0),
(740, 'Enter&lt;/p&gt;\r\n&lt;p&gt;', 211, 0),
(741, 'Scanner&lt;br /&gt;', 212, 0),
(742, 'Firewall &amp;#126;&lt;br /&gt;', 212, 0),
(743, 'Router&lt;br /&gt;', 212, 0),
(744, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 212, 0),
(745, 'Bit &amp;#126;&lt;br /&gt;', 213, 0),
(746, 'Byte&lt;br /&gt;', 213, 0),
(747, 'Kilobyte&lt;br /&gt;', 213, 0),
(748, 'Megabyte&lt;/p&gt;\r\n&lt;p&gt;', 213, 0),
(749, 'Convert machine code to text&lt;br /&gt;', 214, 0),
(750, 'Convert high-level code to machine code &amp;#126;&lt;br /&gt;', 214, 0),
(751, 'Run programs&lt;br /&gt;', 214, 0),
(752, 'Store data&lt;/p&gt;\r\n&lt;p&gt;', 214, 0),
(753, 'Procedural&lt;br /&gt;', 215, 0),
(754, 'Object-Oriented&lt;br /&gt;', 215, 0),
(755, 'Logical&lt;br /&gt;', 215, 0),
(756, 'Experimental &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;', 215, 0),
(757, '10 &amp;#126;&lt;br /&gt;', 216, 0),
(758, '5&lt;br /&gt;', 216, 0),
(759, '12&lt;br /&gt;', 216, 0),
(760, '15&lt;/p&gt;', 216, 0),
(761, 'Microsoft Word&lt;br /&gt;', 217, 0),
(762, 'Keyboard &amp;#126;&lt;br /&gt;', 217, 1),
(763, 'Windows&lt;br /&gt;', 217, 0),
(764, 'Antivirus&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an input device?&lt;br /&gt;', 217, 0),
(765, 'Printer&lt;br /&gt;', 217, 0),
(766, 'Monitor&lt;br /&gt;', 217, 0),
(767, 'Mouse &amp;#126;&lt;br /&gt;', 217, 1),
(768, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;--What does CPU stand for?&lt;br /&gt;', 217, 0),
(769, 'Central Process Unit&lt;br /&gt;', 217, 0),
(770, 'Central Processing Unit &amp;#126;&lt;br /&gt;', 217, 1),
(771, 'Computer Primary Unit&lt;br /&gt;', 217, 0),
(772, 'Central Programming Unit&lt;/p&gt;\r\n&lt;p&gt;--The brain of the computer is&amp;#8230;&lt;br /&gt;', 217, 0),
(773, 'Monitor&lt;br /&gt;', 217, 0),
(774, 'CPU &amp;#126;&lt;br /&gt;', 217, 1),
(775, 'Hard Disk&lt;br /&gt;', 217, 0),
(776, 'RAM&lt;/p&gt;\r\n&lt;p&gt;-Which language is closest to machine language?&lt;br /&gt;', 217, 0),
(777, 'Assembly language &amp;#126;&lt;br /&gt;', 217, 1),
(778, 'Java&lt;br /&gt;', 217, 0),
(779, 'Python&lt;br /&gt;', 217, 0),
(780, 'C++&lt;/p&gt;\r\n&lt;p&gt;--Binary number system uses base&amp;#8230;&lt;br /&gt;', 217, 0),
(781, '2 &amp;#126;&lt;br /&gt;', 217, 1),
(782, '8&lt;br /&gt;', 217, 0),
(783, '10&lt;br /&gt;', 217, 0),
(784, '16&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT a programming language?&lt;br /&gt;', 217, 0),
(785, 'Python&lt;br /&gt;', 217, 0),
(786, 'HTML&lt;br /&gt;', 217, 0),
(787, 'Java&lt;br /&gt;', 217, 0),
(788, 'MS Word &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;--RAM is a type of&amp;#8230;&lt;br /&gt;', 217, 1),
(789, 'Storage&lt;br /&gt;', 217, 0),
(790, 'Permanent Memory&lt;br /&gt;', 217, 0),
(791, 'Primary Memory &amp;#126;&lt;br /&gt;', 217, 1),
(792, 'Input Device&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is volatile memory?&lt;br /&gt;', 217, 0),
(793, 'ROM&lt;br /&gt;', 217, 0),
(794, 'RAM &amp;#126;&lt;br /&gt;', 217, 1),
(795, 'Hard Disk&lt;br /&gt;', 217, 0),
(796, 'CD-ROM&lt;/p&gt;\r\n&lt;p&gt;--What does ROM stand for?&lt;br /&gt;', 217, 0),
(797, 'Read Only Memory &amp;#126;&lt;br /&gt;', 217, 1),
(798, 'Random Only Memory&lt;br /&gt;', 217, 0),
(799, 'Run On Memory&lt;br /&gt;', 217, 0),
(800, 'Readable Operational Memory&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a storage device?&lt;br /&gt;', 217, 0),
(801, 'Scanner&lt;br /&gt;', 217, 0),
(802, 'Mouse&lt;br /&gt;', 217, 0),
(803, 'Pen drive &amp;#126;&lt;br /&gt;', 217, 1),
(804, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;--Which of these is system software?&lt;br /&gt;', 217, 0),
(805, 'Chrome&lt;br /&gt;', 217, 0),
(806, 'MS Word&lt;br /&gt;', 217, 0),
(807, 'Operating System &amp;#126;&lt;br /&gt;', 217, 1),
(808, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--1 Kilobyte (KB) =&lt;br /&gt;', 217, 0),
(809, '1000 bytes&lt;br /&gt;', 217, 0),
(810, '1024 bytes &amp;#126;&lt;br /&gt;', 217, 1),
(811, '100 bytes&lt;br /&gt;', 217, 0),
(812, '512 bytes&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is a high-level language?&lt;br /&gt;', 217, 0),
(813, 'Machine code&lt;br /&gt;', 217, 0),
(814, 'Assembly&lt;br /&gt;', 217, 0),
(815, 'Python &amp;#126;&lt;br /&gt;', 217, 1),
(816, 'Binary&lt;/p&gt;\r\n&lt;p&gt;--The full meaning of GUI is&amp;#8230;&lt;br /&gt;', 217, 0),
(817, 'Graphical User Interface &amp;#126;&lt;br /&gt;', 217, 1),
(818, 'General Use Interface&lt;br /&gt;', 217, 0),
(819, 'Graphics Used Internally&lt;br /&gt;', 217, 0),
(820, 'Global Utility Input&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT an operating system?&lt;br /&gt;', 217, 0),
(821, 'Windows&lt;br /&gt;', 217, 0),
(822, 'Linux&lt;br /&gt;', 217, 0),
(823, 'Oracle &amp;#126;&lt;br /&gt;', 217, 1),
(824, 'macOS&lt;/p&gt;\r\n&lt;p&gt;--The process of translating high-level language into machine code is called&amp;#8230;&lt;br /&gt;', 217, 0),
(825, 'Compiling &amp;#126;&lt;br /&gt;', 217, 1),
(826, 'Running&lt;br /&gt;', 217, 0),
(827, 'Executing&lt;br /&gt;', 217, 0),
(828, 'Saving&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a search engine?&lt;br /&gt;', 217, 0),
(829, 'Facebook&lt;br /&gt;', 217, 0),
(830, 'Google &amp;#126;&lt;br /&gt;', 217, 1),
(831, 'Instagram&lt;br /&gt;', 217, 0),
(832, 'Wikipedia&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is used to write programs?&lt;br /&gt;', 217, 0),
(833, 'Compiler&lt;br /&gt;', 217, 0),
(834, 'Interpreter&lt;br /&gt;', 217, 0),
(835, 'Text Editor &amp;#126;&lt;br /&gt;', 217, 1),
(836, 'Printer&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an example of application software?&lt;br /&gt;', 217, 0),
(837, 'Linux&lt;br /&gt;', 217, 0),
(838, 'Windows&lt;br /&gt;', 217, 0),
(839, 'MS Excel &amp;#126;&lt;br /&gt;', 217, 1),
(840, 'BIOS&lt;/p&gt;\r\n&lt;p&gt;--Which is NOT a type of computer?&lt;br /&gt;', 217, 0),
(841, 'Mainframe&lt;br /&gt;', 217, 0),
(842, 'Supercomputer&lt;br /&gt;', 217, 0),
(843, 'Microcontroller&lt;br /&gt;', 217, 0),
(844, 'Compucard &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;--The full meaning of ICT is&amp;#8230;&lt;br /&gt;', 217, 1),
(845, 'Information and Communication Technology &amp;#126;&lt;br /&gt;', 217, 1),
(846, 'International Computer Technology&lt;br /&gt;', 217, 0),
(847, 'Internet and Cyber Technology&lt;br /&gt;', 217, 0),
(848, 'Information Computer Techniques&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to create web pages?&lt;br /&gt;', 217, 0),
(849, 'HTML &amp;#126;&lt;br /&gt;', 217, 1),
(850, 'MS Paint&lt;br /&gt;', 217, 0),
(851, 'Excel&lt;br /&gt;', 217, 0),
(852, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--Which company developed the Windows OS?&lt;br /&gt;', 217, 0),
(853, 'Google&lt;br /&gt;', 217, 0),
(854, 'Microsoft &amp;#126;&lt;br /&gt;', 217, 1),
(855, 'Apple&lt;br /&gt;', 217, 0),
(856, 'Intel&lt;/p&gt;\r\n&lt;p&gt;--Which key is used to delete characters to the right of the cursor?&lt;br /&gt;', 217, 0),
(857, 'Backspace&lt;br /&gt;', 217, 0),
(858, 'Shift&lt;br /&gt;', 217, 0),
(859, 'Delete &amp;#126;&lt;br /&gt;', 217, 1),
(860, 'Enter&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to protect a computer from viruses?&lt;br /&gt;', 217, 0),
(861, 'Scanner&lt;br /&gt;', 217, 0),
(862, 'Firewall &amp;#126;&lt;br /&gt;', 217, 1),
(863, 'Router&lt;br /&gt;', 217, 0),
(864, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;--The smallest unit of data in a computer is&amp;#8230;&lt;br /&gt;', 217, 0),
(865, 'Bit &amp;#126;&lt;br /&gt;', 217, 1),
(866, 'Byte&lt;br /&gt;', 217, 0),
(867, 'Kilobyte&lt;br /&gt;', 217, 0),
(868, 'Megabyte&lt;/p&gt;\r\n&lt;p&gt;--What is the function of a compiler?&lt;br /&gt;', 217, 0),
(869, 'Convert machine code to text&lt;br /&gt;', 217, 0),
(870, 'Convert high-level code to machine code &amp;#126;&lt;br /&gt;', 217, 1),
(871, 'Run programs&lt;br /&gt;', 217, 0),
(872, 'Store data&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is NOT a programming paradigm?&lt;br /&gt;', 217, 0),
(873, 'Procedural&lt;br /&gt;', 217, 0),
(874, 'Object-Oriented&lt;br /&gt;', 217, 0),
(875, 'Logical&lt;br /&gt;', 217, 0),
(876, 'Experimental &amp;#126;&lt;/p&gt;\r\n&lt;p&gt;--Which of the following represents the binary number 1010 in decimal?&lt;br /&gt;', 217, 1),
(877, '10 &amp;#126;&lt;br /&gt;', 217, 1),
(878, '5&lt;br /&gt;', 217, 0),
(879, '12&lt;br /&gt;', 217, 0),
(880, '15&lt;/p&gt;', 217, 0),
(881, 'Microsoft Word&lt;br /&gt;', 218, 0),
(882, 'Keyboard &lt;br /&gt;', 218, 1),
(883, 'Windows&lt;br /&gt;', 218, 0),
(884, 'Antivirus&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an input device?&lt;br /&gt;', 218, 0),
(885, 'Printer&lt;br /&gt;', 218, 0),
(886, 'Monitor&lt;br /&gt;', 218, 0),
(887, 'Mouse &lt;br /&gt;', 218, 1),
(888, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;--What does CPU stand for?&lt;br /&gt;', 218, 0),
(889, 'Central Process Unit&lt;br /&gt;', 218, 0),
(890, 'Central Processing Unit &lt;br /&gt;', 218, 1),
(891, 'Computer Primary Unit&lt;br /&gt;', 218, 0),
(892, 'Central Programming Unit&lt;/p&gt;\r\n&lt;p&gt;--The brain of the computer is&amp;#8230;&lt;br /&gt;', 218, 0),
(893, 'Monitor&lt;br /&gt;', 218, 0),
(894, 'CPU &lt;br /&gt;', 218, 1),
(895, 'Hard Disk&lt;br /&gt;', 218, 0),
(896, 'RAM&lt;/p&gt;\r\n&lt;p&gt;-Which language is closest to machine language?&lt;br /&gt;', 218, 0),
(897, 'Assembly language &lt;br /&gt;', 218, 1),
(898, 'Java&lt;br /&gt;', 218, 0),
(899, 'Python&lt;br /&gt;', 218, 0),
(900, 'C++&lt;/p&gt;\r\n&lt;p&gt;--Binary number system uses base&amp;#8230;&lt;br /&gt;', 218, 0),
(901, '2 &lt;br /&gt;', 218, 1),
(902, '8&lt;br /&gt;', 218, 0),
(903, '10&lt;br /&gt;', 218, 0),
(904, '16&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT a programming language?&lt;br /&gt;', 218, 0),
(905, 'Python&lt;br /&gt;', 218, 0),
(906, 'HTML&lt;br /&gt;', 218, 0),
(907, 'Java&lt;br /&gt;', 218, 0),
(908, 'MS Word &lt;/p&gt;\r\n&lt;p&gt;--RAM is a type of&amp;#8230;&lt;br /&gt;', 218, 1),
(909, 'Storage&lt;br /&gt;', 218, 0),
(910, 'Permanent Memory&lt;br /&gt;', 218, 0),
(911, 'Primary Memory &lt;br /&gt;', 218, 1),
(912, 'Input Device&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is volatile memory?&lt;br /&gt;', 218, 0),
(913, 'ROM&lt;br /&gt;', 218, 0),
(914, 'RAM &lt;br /&gt;', 218, 1),
(915, 'Hard Disk&lt;br /&gt;', 218, 0),
(916, 'CD-ROM&lt;/p&gt;\r\n&lt;p&gt;--What does ROM stand for?&lt;br /&gt;', 218, 0),
(917, 'Read Only Memory &lt;br /&gt;', 218, 1),
(918, 'Random Only Memory&lt;br /&gt;', 218, 0),
(919, 'Run On Memory&lt;br /&gt;', 218, 0),
(920, 'Readable Operational Memory&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a storage device?&lt;br /&gt;', 218, 0),
(921, 'Scanner&lt;br /&gt;', 218, 0),
(922, 'Mouse&lt;br /&gt;', 218, 0),
(923, 'Pen drive &lt;br /&gt;', 218, 1),
(924, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;--Which of these is system software?&lt;br /&gt;', 218, 0),
(925, 'Chrome&lt;br /&gt;', 218, 0),
(926, 'MS Word&lt;br /&gt;', 218, 0),
(927, 'Operating System &lt;br /&gt;', 218, 1),
(928, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--1 Kilobyte (KB) =&lt;br /&gt;', 218, 0),
(929, '1000 bytes&lt;br /&gt;', 218, 0),
(930, '1024 bytes &lt;br /&gt;', 218, 1),
(931, '100 bytes&lt;br /&gt;', 218, 0),
(932, '512 bytes&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is a high-level language?&lt;br /&gt;', 218, 0),
(933, 'Machine code&lt;br /&gt;', 218, 0),
(934, 'Assembly&lt;br /&gt;', 218, 0),
(935, 'Python &lt;br /&gt;', 218, 1),
(936, 'Binary&lt;/p&gt;\r\n&lt;p&gt;--The full meaning of GUI is&amp;#8230;&lt;br /&gt;', 218, 0),
(937, 'Graphical User Interface &lt;br /&gt;', 218, 1),
(938, 'General Use Interface&lt;br /&gt;', 218, 0),
(939, 'Graphics Used Internally&lt;br /&gt;', 218, 0),
(940, 'Global Utility Input&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT an operating system?&lt;br /&gt;', 218, 0),
(941, 'Windows&lt;br /&gt;', 218, 0),
(942, 'Linux&lt;br /&gt;', 218, 0),
(943, 'Oracle &lt;br /&gt;', 218, 1),
(944, 'macOS&lt;/p&gt;\r\n&lt;p&gt;--The process of translating high-level language into machine code is called&amp;#8230;&lt;br /&gt;', 218, 0),
(945, 'Compiling &lt;br /&gt;', 218, 1),
(946, 'Running&lt;br /&gt;', 218, 0),
(947, 'Executing&lt;br /&gt;', 218, 0),
(948, 'Saving&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a search engine?&lt;br /&gt;', 218, 0),
(949, 'Facebook&lt;br /&gt;', 218, 0),
(950, 'Google &lt;br /&gt;', 218, 1),
(951, 'Instagram&lt;br /&gt;', 218, 0),
(952, 'Wikipedia&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is used to write programs?&lt;br /&gt;', 218, 0),
(953, 'Compiler&lt;br /&gt;', 218, 0),
(954, 'Interpreter&lt;br /&gt;', 218, 0),
(955, 'Text Editor &lt;br /&gt;', 218, 1),
(956, 'Printer&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an example of application software?&lt;br /&gt;', 218, 0),
(957, 'Linux&lt;br /&gt;', 218, 0),
(958, 'Windows&lt;br /&gt;', 218, 0),
(959, 'MS Excel &lt;br /&gt;', 218, 1),
(960, 'BIOS&lt;/p&gt;\r\n&lt;p&gt;--Which is NOT a type of computer?&lt;br /&gt;', 218, 0),
(961, 'Mainframe&lt;br /&gt;', 218, 0),
(962, 'Supercomputer&lt;br /&gt;', 218, 0),
(963, 'Microcontroller&lt;br /&gt;', 218, 0),
(964, 'Compucard &lt;/p&gt;\r\n&lt;p&gt;--The full meaning of ICT is&amp;#8230;&lt;br /&gt;', 218, 1),
(965, 'Information and Communication Technology &lt;br /&gt;', 218, 1),
(966, 'International Computer Technology&lt;br /&gt;', 218, 0),
(967, 'Internet and Cyber Technology&lt;br /&gt;', 218, 0),
(968, 'Information Computer Techniques&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to create web pages?&lt;br /&gt;', 218, 0),
(969, 'HTML &lt;br /&gt;', 218, 1),
(970, 'MS Paint&lt;br /&gt;', 218, 0),
(971, 'Excel&lt;br /&gt;', 218, 0),
(972, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--Which company developed the Windows OS?&lt;br /&gt;', 218, 0),
(973, 'Google&lt;br /&gt;', 218, 0),
(974, 'Microsoft &lt;br /&gt;', 218, 1),
(975, 'Apple&lt;br /&gt;', 218, 0),
(976, 'Intel&lt;/p&gt;\r\n&lt;p&gt;--Which key is used to delete characters to the right of the cursor?&lt;br /&gt;', 218, 0),
(977, 'Backspace&lt;br /&gt;', 218, 0),
(978, 'Shift&lt;br /&gt;', 218, 0),
(979, 'Delete &lt;br /&gt;', 218, 1),
(980, 'Enter&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to protect a computer from viruses?&lt;br /&gt;', 218, 0),
(981, 'Scanner&lt;br /&gt;', 218, 0),
(982, 'Firewall &lt;br /&gt;', 218, 1),
(983, 'Router&lt;br /&gt;', 218, 0),
(984, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;--The smallest unit of data in a computer is&amp;#8230;&lt;br /&gt;', 218, 0),
(985, 'Bit &lt;br /&gt;', 218, 1),
(986, 'Byte&lt;br /&gt;', 218, 0),
(987, 'Kilobyte&lt;br /&gt;', 218, 0),
(988, 'Megabyte&lt;/p&gt;\r\n&lt;p&gt;--What is the function of a compiler?&lt;br /&gt;', 218, 0),
(989, 'Convert machine code to text&lt;br /&gt;', 218, 0),
(990, 'Convert high-level code to machine code &lt;br /&gt;', 218, 1),
(991, 'Run programs&lt;br /&gt;', 218, 0),
(992, 'Store data&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is NOT a programming paradigm?&lt;br /&gt;', 218, 0),
(993, 'Procedural&lt;br /&gt;', 218, 0),
(994, 'Object-Oriented&lt;br /&gt;', 218, 0),
(995, 'Logical&lt;br /&gt;', 218, 0),
(996, 'Experimental &lt;/p&gt;\r\n&lt;p&gt;--Which of the following represents the binary number 1010 in decimal?&lt;br /&gt;', 218, 1),
(997, '10 &lt;br /&gt;', 218, 1),
(998, '5&lt;br /&gt;', 218, 0),
(999, '12&lt;br /&gt;', 218, 0),
(1000, '15&lt;/p&gt;', 218, 0),
(1001, 'Hyper Text Markup Language &lt;br /&gt;', 220, 1),
(1002, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 220, 0),
(1003, 'Home Tool Markup Language&lt;br /&gt;', 220, 0),
(1004, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 220, 0),
(1005, 'Monitor&lt;br /&gt;', 221, 0),
(1006, 'Keyboard &lt;br /&gt;', 221, 1),
(1007, 'Printer&lt;br /&gt;', 221, 0),
(1008, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 221, 0),
(1009, 'RAM&lt;br /&gt;', 222, 0),
(1010, 'CPU&lt;br /&gt;', 222, 0),
(1011, 'Hard Disk &lt;br /&gt;', 222, 1),
(1012, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 222, 0),
(1013, 'Random Access Memory &lt;br /&gt;', 223, 1),
(1014, 'Read Access Memory&lt;br /&gt;', 223, 0),
(1015, 'Run All Memory&lt;br /&gt;', 223, 0),
(1016, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 223, 0),
(1017, 'Monitor&lt;br /&gt;', 224, 0),
(1018, 'CPU &lt;br /&gt;', 224, 1),
(1019, 'RAM&lt;br /&gt;', 224, 0),
(1020, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 224, 0),
(1021, 'Decimal&lt;br /&gt;', 225, 0),
(1022, 'Binary&lt;br /&gt;', 225, 0),
(1023, 'Octal&lt;br /&gt;', 225, 0),
(1024, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 225, 1),
(1025, 'Structured Query Language &lt;br /&gt;', 226, 1),
(1026, 'Simple Query Language&lt;br /&gt;', 226, 0),
(1027, 'Standard Question Logic&lt;br /&gt;', 226, 0),
(1028, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 226, 0),
(1029, 'MS Word&lt;br /&gt;', 227, 0),
(1030, 'Windows 10 &lt;br /&gt;', 227, 1),
(1031, 'Google Chrome&lt;br /&gt;', 227, 0),
(1032, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 227, 0),
(1033, 'Python&lt;br /&gt;', 228, 0),
(1034, 'Java&lt;br /&gt;', 228, 0),
(1035, 'HTML&lt;br /&gt;', 228, 0),
(1036, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 228, 1),
(1037, '16&lt;br /&gt;', 229, 0),
(1038, '11 &lt;br /&gt;', 229, 1),
(1039, '13&lt;br /&gt;', 229, 0),
(1040, '10&lt;/p&gt;\r\n&lt;p&gt;', 229, 0),
(1041, 'Ability to inherit from multiple classes&lt;br /&gt;', 230, 0),
(1042, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 230, 1),
(1043, 'The use of interfaces only&lt;br /&gt;', 230, 0),
(1044, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 230, 0),
(1045, 'Bubble Sort&lt;br /&gt;', 231, 0),
(1046, 'Merge Sort &lt;br /&gt;', 231, 1),
(1047, 'Insertion Sort&lt;br /&gt;', 231, 0),
(1048, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 231, 0),
(1049, 'MySQL&lt;br /&gt;', 232, 0),
(1050, 'MongoDB &lt;br /&gt;', 232, 1),
(1051, 'Oracle&lt;br /&gt;', 232, 0),
(1052, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 232, 0),
(1053, 'To ensure uniqueness&lt;br /&gt;', 233, 0),
(1054, 'To index columns&lt;br /&gt;', 233, 0),
(1055, 'To create links between tables &lt;br /&gt;', 233, 1),
(1056, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 233, 0),
(1057, 'The parent class&lt;br /&gt;', 234, 0),
(1058, 'The current class object &lt;br /&gt;', 234, 1),
(1059, 'A static method&lt;br /&gt;', 234, 0),
(1060, 'An inherited object&lt;/p&gt;', 234, 0),
(1061, 'Hyper Text Markup Language &lt;br /&gt;', 236, 1),
(1062, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 236, 0),
(1063, 'Home Tool Markup Language&lt;br /&gt;', 236, 0),
(1064, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 236, 0),
(1065, 'Monitor&lt;br /&gt;', 237, 0),
(1066, 'Keyboard &lt;br /&gt;', 237, 1),
(1067, 'Printer&lt;br /&gt;', 237, 0),
(1068, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 237, 0),
(1069, 'RAM&lt;br /&gt;', 238, 0),
(1070, 'CPU&lt;br /&gt;', 238, 0),
(1071, 'Hard Disk &lt;br /&gt;', 238, 1),
(1072, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 238, 0),
(1073, 'Random Access Memory &lt;br /&gt;', 239, 1),
(1074, 'Read Access Memory&lt;br /&gt;', 239, 0),
(1075, 'Run All Memory&lt;br /&gt;', 239, 0),
(1076, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 239, 0),
(1077, 'Monitor&lt;br /&gt;', 240, 0),
(1078, 'CPU &lt;br /&gt;', 240, 1),
(1079, 'RAM&lt;br /&gt;', 240, 0),
(1080, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 240, 0),
(1081, 'Decimal&lt;br /&gt;', 241, 0),
(1082, 'Binary&lt;br /&gt;', 241, 0),
(1083, 'Octal&lt;br /&gt;', 241, 0),
(1084, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 241, 1),
(1085, 'Structured Query Language &lt;br /&gt;', 242, 1),
(1086, 'Simple Query Language&lt;br /&gt;', 242, 0),
(1087, 'Standard Question Logic&lt;br /&gt;', 242, 0),
(1088, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 242, 0),
(1089, 'MS Word&lt;br /&gt;', 243, 0),
(1090, 'Windows 10 &lt;br /&gt;', 243, 1),
(1091, 'Google Chrome&lt;br /&gt;', 243, 0),
(1092, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 243, 0),
(1093, 'Python&lt;br /&gt;', 244, 0),
(1094, 'Java&lt;br /&gt;', 244, 0),
(1095, 'HTML&lt;br /&gt;', 244, 0),
(1096, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 244, 1),
(1097, '16&lt;br /&gt;', 245, 0),
(1098, '11 &lt;br /&gt;', 245, 1),
(1099, '13&lt;br /&gt;', 245, 0),
(1100, '10&lt;/p&gt;\r\n&lt;p&gt;', 245, 0),
(1101, 'Ability to inherit from multiple classes&lt;br /&gt;', 246, 0),
(1102, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 246, 1),
(1103, 'The use of interfaces only&lt;br /&gt;', 246, 0),
(1104, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 246, 0),
(1105, 'Bubble Sort&lt;br /&gt;', 247, 0),
(1106, 'Merge Sort &lt;br /&gt;', 247, 1),
(1107, 'Insertion Sort&lt;br /&gt;', 247, 0),
(1108, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 247, 0),
(1109, 'MySQL&lt;br /&gt;', 248, 0),
(1110, 'MongoDB &lt;br /&gt;', 248, 1),
(1111, 'Oracle&lt;br /&gt;', 248, 0),
(1112, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 248, 0),
(1113, 'To ensure uniqueness&lt;br /&gt;', 249, 0),
(1114, 'To index columns&lt;br /&gt;', 249, 0),
(1115, 'To create links between tables &lt;br /&gt;', 249, 1),
(1116, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 249, 0),
(1117, 'The parent class&lt;br /&gt;', 250, 0),
(1118, 'The current class object &lt;br /&gt;', 250, 1),
(1119, 'A static method&lt;br /&gt;', 250, 0),
(1120, 'An inherited object&lt;/p&gt;', 250, 0),
(1121, 'Hyper Text Markup Language &lt;br /&gt;', 252, 1),
(1122, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 252, 0),
(1123, 'Home Tool Markup Language&lt;br /&gt;', 252, 0),
(1124, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 252, 0),
(1125, 'Monitor&lt;br /&gt;', 253, 0),
(1126, 'Keyboard &lt;br /&gt;', 253, 1),
(1127, 'Printer&lt;br /&gt;', 253, 0),
(1128, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 253, 0),
(1129, 'RAM&lt;br /&gt;', 254, 0),
(1130, 'CPU&lt;br /&gt;', 254, 0),
(1131, 'Hard Disk &lt;br /&gt;', 254, 1),
(1132, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 254, 0),
(1133, 'Random Access Memory &lt;br /&gt;', 255, 1),
(1134, 'Read Access Memory&lt;br /&gt;', 255, 0),
(1135, 'Run All Memory&lt;br /&gt;', 255, 0),
(1136, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 255, 0),
(1137, 'Monitor&lt;br /&gt;', 256, 0),
(1138, 'CPU &lt;br /&gt;', 256, 1),
(1139, 'RAM&lt;br /&gt;', 256, 0),
(1140, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 256, 0),
(1141, 'Decimal&lt;br /&gt;', 257, 0),
(1142, 'Binary&lt;br /&gt;', 257, 0),
(1143, 'Octal&lt;br /&gt;', 257, 0),
(1144, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 257, 1),
(1145, 'Structured Query Language &lt;br /&gt;', 258, 1),
(1146, 'Simple Query Language&lt;br /&gt;', 258, 0),
(1147, 'Standard Question Logic&lt;br /&gt;', 258, 0),
(1148, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 258, 0),
(1149, 'MS Word&lt;br /&gt;', 259, 0),
(1150, 'Windows 10 &lt;br /&gt;', 259, 1),
(1151, 'Google Chrome&lt;br /&gt;', 259, 0),
(1152, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 259, 0),
(1153, 'Python&lt;br /&gt;', 260, 0),
(1154, 'Java&lt;br /&gt;', 260, 0),
(1155, 'HTML&lt;br /&gt;', 260, 0),
(1156, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 260, 1),
(1157, '16&lt;br /&gt;', 261, 0),
(1158, '11 &lt;br /&gt;', 261, 1),
(1159, '13&lt;br /&gt;', 261, 0),
(1160, '10&lt;/p&gt;\r\n&lt;p&gt;', 261, 0),
(1161, 'Ability to inherit from multiple classes&lt;br /&gt;', 262, 0),
(1162, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 262, 1),
(1163, 'The use of interfaces only&lt;br /&gt;', 262, 0),
(1164, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 262, 0),
(1165, 'Bubble Sort&lt;br /&gt;', 263, 0),
(1166, 'Merge Sort &lt;br /&gt;', 263, 1),
(1167, 'Insertion Sort&lt;br /&gt;', 263, 0),
(1168, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 263, 0),
(1169, 'MySQL&lt;br /&gt;', 264, 0),
(1170, 'MongoDB &lt;br /&gt;', 264, 1),
(1171, 'Oracle&lt;br /&gt;', 264, 0),
(1172, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 264, 0),
(1173, 'To ensure uniqueness&lt;br /&gt;', 265, 0),
(1174, 'To index columns&lt;br /&gt;', 265, 0),
(1175, 'To create links between tables &lt;br /&gt;', 265, 1),
(1176, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 265, 0),
(1177, 'The parent class&lt;br /&gt;', 266, 0),
(1178, 'The current class object &lt;br /&gt;', 266, 1),
(1179, 'A static method&lt;br /&gt;', 266, 0),
(1180, 'An inherited object&lt;/p&gt;', 266, 0),
(1181, 'Microsoft Word&lt;br /&gt;', 267, 0),
(1182, 'Keyboard &lt;br /&gt;', 267, 1),
(1183, 'Windows&lt;br /&gt;', 267, 0),
(1184, 'Antivirus&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an input device?&lt;br /&gt;', 267, 0),
(1185, 'Printer&lt;br /&gt;', 267, 0),
(1186, 'Monitor&lt;br /&gt;', 267, 0),
(1187, 'Mouse &lt;br /&gt;', 267, 1),
(1188, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;--What does CPU stand for?&lt;br /&gt;', 267, 0),
(1189, 'Central Process Unit&lt;br /&gt;', 267, 0),
(1190, 'Central Processing Unit &lt;br /&gt;', 267, 1),
(1191, 'Computer Primary Unit&lt;br /&gt;', 267, 0),
(1192, 'Central Programming Unit&lt;/p&gt;\r\n&lt;p&gt;--The brain of the computer is&amp;#8230;&lt;br /&gt;', 267, 0),
(1193, 'Monitor&lt;br /&gt;', 267, 0),
(1194, 'CPU &lt;br /&gt;', 267, 1),
(1195, 'Hard Disk&lt;br /&gt;', 267, 0),
(1196, 'RAM&lt;/p&gt;\r\n&lt;p&gt;-Which language is closest to machine language?&lt;br /&gt;', 267, 0),
(1197, 'Assembly language &lt;br /&gt;', 267, 1),
(1198, 'Java&lt;br /&gt;', 267, 0),
(1199, 'Python&lt;br /&gt;', 267, 0),
(1200, 'C++&lt;/p&gt;\r\n&lt;p&gt;--Binary number system uses base&amp;#8230;&lt;br /&gt;', 267, 0),
(1201, '2 &lt;br /&gt;', 267, 1),
(1202, '8&lt;br /&gt;', 267, 0),
(1203, '10&lt;br /&gt;', 267, 0),
(1204, '16&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT a programming language?&lt;br /&gt;', 267, 0),
(1205, 'Python&lt;br /&gt;', 267, 0),
(1206, 'HTML&lt;br /&gt;', 267, 0),
(1207, 'Java&lt;br /&gt;', 267, 0),
(1208, 'MS Word &lt;/p&gt;\r\n&lt;p&gt;--RAM is a type of&amp;#8230;&lt;br /&gt;', 267, 1),
(1209, 'Storage&lt;br /&gt;', 267, 0),
(1210, 'Permanent Memory&lt;br /&gt;', 267, 0),
(1211, 'Primary Memory &lt;br /&gt;', 267, 1),
(1212, 'Input Device&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is volatile memory?&lt;br /&gt;', 267, 0),
(1213, 'ROM&lt;br /&gt;', 267, 0),
(1214, 'RAM &lt;br /&gt;', 267, 1),
(1215, 'Hard Disk&lt;br /&gt;', 267, 0),
(1216, 'CD-ROM&lt;/p&gt;\r\n&lt;p&gt;--What does ROM stand for?&lt;br /&gt;', 267, 0),
(1217, 'Read Only Memory &lt;br /&gt;', 267, 1),
(1218, 'Random Only Memory&lt;br /&gt;', 267, 0),
(1219, 'Run On Memory&lt;br /&gt;', 267, 0),
(1220, 'Readable Operational Memory&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a storage device?&lt;br /&gt;', 267, 0),
(1221, 'Scanner&lt;br /&gt;', 267, 0),
(1222, 'Mouse&lt;br /&gt;', 267, 0),
(1223, 'Pen drive &lt;br /&gt;', 267, 1),
(1224, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;--Which of these is system software?&lt;br /&gt;', 267, 0),
(1225, 'Chrome&lt;br /&gt;', 267, 0),
(1226, 'MS Word&lt;br /&gt;', 267, 0),
(1227, 'Operating System &lt;br /&gt;', 267, 1),
(1228, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--1 Kilobyte (KB) =&lt;br /&gt;', 267, 0),
(1229, '1000 bytes&lt;br /&gt;', 267, 0),
(1230, '1024 bytes &lt;br /&gt;', 267, 1),
(1231, '100 bytes&lt;br /&gt;', 267, 0),
(1232, '512 bytes&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is a high-level language?&lt;br /&gt;', 267, 0),
(1233, 'Machine code&lt;br /&gt;', 267, 0),
(1234, 'Assembly&lt;br /&gt;', 267, 0),
(1235, 'Python &lt;br /&gt;', 267, 1),
(1236, 'Binary&lt;/p&gt;\r\n&lt;p&gt;--The full meaning of GUI is&amp;#8230;&lt;br /&gt;', 267, 0),
(1237, 'Graphical User Interface &lt;br /&gt;', 267, 1),
(1238, 'General Use Interface&lt;br /&gt;', 267, 0),
(1239, 'Graphics Used Internally&lt;br /&gt;', 267, 0),
(1240, 'Global Utility Input&lt;/p&gt;\r\n&lt;p&gt;--Which of these is NOT an operating system?&lt;br /&gt;', 267, 0),
(1241, 'Windows&lt;br /&gt;', 267, 0),
(1242, 'Linux&lt;br /&gt;', 267, 0),
(1243, 'Oracle &lt;br /&gt;', 267, 1),
(1244, 'macOS&lt;/p&gt;\r\n&lt;p&gt;--The process of translating high-level language into machine code is called&amp;#8230;&lt;br /&gt;', 267, 0),
(1245, 'Compiling &lt;br /&gt;', 267, 1),
(1246, 'Running&lt;br /&gt;', 267, 0),
(1247, 'Executing&lt;br /&gt;', 267, 0),
(1248, 'Saving&lt;/p&gt;\r\n&lt;p&gt;--Which of these is a search engine?&lt;br /&gt;', 267, 0),
(1249, 'Facebook&lt;br /&gt;', 267, 0),
(1250, 'Google &lt;br /&gt;', 267, 1),
(1251, 'Instagram&lt;br /&gt;', 267, 0),
(1252, 'Wikipedia&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is used to write programs?&lt;br /&gt;', 267, 0),
(1253, 'Compiler&lt;br /&gt;', 267, 0),
(1254, 'Interpreter&lt;br /&gt;', 267, 0),
(1255, 'Text Editor &lt;br /&gt;', 267, 1),
(1256, 'Printer&lt;/p&gt;\r\n&lt;p&gt;--Which of these is an example of application software?&lt;br /&gt;', 267, 0),
(1257, 'Linux&lt;br /&gt;', 267, 0),
(1258, 'Windows&lt;br /&gt;', 267, 0),
(1259, 'MS Excel &lt;br /&gt;', 267, 1),
(1260, 'BIOS&lt;/p&gt;\r\n&lt;p&gt;--Which is NOT a type of computer?&lt;br /&gt;', 267, 0),
(1261, 'Mainframe&lt;br /&gt;', 267, 0),
(1262, 'Supercomputer&lt;br /&gt;', 267, 0),
(1263, 'Microcontroller&lt;br /&gt;', 267, 0),
(1264, 'Compucard &lt;/p&gt;\r\n&lt;p&gt;--The full meaning of ICT is&amp;#8230;&lt;br /&gt;', 267, 1),
(1265, 'Information and Communication Technology &lt;br /&gt;', 267, 1),
(1266, 'International Computer Technology&lt;br /&gt;', 267, 0),
(1267, 'Internet and Cyber Technology&lt;br /&gt;', 267, 0),
(1268, 'Information Computer Techniques&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to create web pages?&lt;br /&gt;', 267, 0),
(1269, 'HTML &lt;br /&gt;', 267, 1),
(1270, 'MS Paint&lt;br /&gt;', 267, 0),
(1271, 'Excel&lt;br /&gt;', 267, 0),
(1272, 'Photoshop&lt;/p&gt;\r\n&lt;p&gt;--Which company developed the Windows OS?&lt;br /&gt;', 267, 0),
(1273, 'Google&lt;br /&gt;', 267, 0),
(1274, 'Microsoft &lt;br /&gt;', 267, 1),
(1275, 'Apple&lt;br /&gt;', 267, 0),
(1276, 'Intel&lt;/p&gt;\r\n&lt;p&gt;--Which key is used to delete characters to the right of the cursor?&lt;br /&gt;', 267, 0),
(1277, 'Backspace&lt;br /&gt;', 267, 0),
(1278, 'Shift&lt;br /&gt;', 267, 0),
(1279, 'Delete &lt;br /&gt;', 267, 1),
(1280, 'Enter&lt;/p&gt;\r\n&lt;p&gt;--Which of these is used to protect a computer from viruses?&lt;br /&gt;', 267, 0),
(1281, 'Scanner&lt;br /&gt;', 267, 0),
(1282, 'Firewall &lt;br /&gt;', 267, 1),
(1283, 'Router&lt;br /&gt;', 267, 0),
(1284, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;--The smallest unit of data in a computer is&amp;#8230;&lt;br /&gt;', 267, 0),
(1285, 'Bit &lt;br /&gt;', 267, 1),
(1286, 'Byte&lt;br /&gt;', 267, 0),
(1287, 'Kilobyte&lt;br /&gt;', 267, 0),
(1288, 'Megabyte&lt;/p&gt;\r\n&lt;p&gt;--What is the function of a compiler?&lt;br /&gt;', 267, 0),
(1289, 'Convert machine code to text&lt;br /&gt;', 267, 0),
(1290, 'Convert high-level code to machine code &lt;br /&gt;', 267, 1),
(1291, 'Run programs&lt;br /&gt;', 267, 0),
(1292, 'Store data&lt;/p&gt;\r\n&lt;p&gt;--Which of the following is NOT a programming paradigm?&lt;br /&gt;', 267, 0),
(1293, 'Procedural&lt;br /&gt;', 267, 0),
(1294, 'Object-Oriented&lt;br /&gt;', 267, 0),
(1295, 'Logical&lt;br /&gt;', 267, 0),
(1296, 'Experimental &lt;/p&gt;\r\n&lt;p&gt;--Which of the following represents the binary number 1010 in decimal?&lt;br /&gt;', 267, 1),
(1297, '10 &lt;br /&gt;', 267, 1),
(1298, '5&lt;br /&gt;', 267, 0),
(1299, '12&lt;br /&gt;', 267, 0),
(1300, '15&lt;/p&gt;', 267, 0),
(1301, 'Hyper Text Markup Language &lt;br /&gt;', 269, 1),
(1302, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 269, 0),
(1303, 'Home Tool Markup Language&lt;br /&gt;', 269, 0),
(1304, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 269, 0),
(1305, 'Monitor&lt;br /&gt;', 270, 0),
(1306, 'Keyboard &lt;br /&gt;', 270, 1),
(1307, 'Printer&lt;br /&gt;', 270, 0),
(1308, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 270, 0),
(1309, 'RAM&lt;br /&gt;', 271, 0),
(1310, 'CPU&lt;br /&gt;', 271, 0),
(1311, 'Hard Disk &lt;br /&gt;', 271, 1),
(1312, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 271, 0),
(1313, 'Random Access Memory &lt;br /&gt;', 272, 1),
(1314, 'Read Access Memory&lt;br /&gt;', 272, 0),
(1315, 'Run All Memory&lt;br /&gt;', 272, 0),
(1316, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 272, 0),
(1317, 'Monitor&lt;br /&gt;', 273, 0),
(1318, 'CPU &lt;br /&gt;', 273, 1),
(1319, 'RAM&lt;br /&gt;', 273, 0),
(1320, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 273, 0),
(1321, 'Decimal&lt;br /&gt;', 274, 0),
(1322, 'Binary&lt;br /&gt;', 274, 0),
(1323, 'Octal&lt;br /&gt;', 274, 0),
(1324, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 274, 1),
(1325, 'Structured Query Language &lt;br /&gt;', 275, 1),
(1326, 'Simple Query Language&lt;br /&gt;', 275, 0),
(1327, 'Standard Question Logic&lt;br /&gt;', 275, 0),
(1328, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 275, 0),
(1329, 'MS Word&lt;br /&gt;', 276, 0),
(1330, 'Windows 10 &lt;br /&gt;', 276, 1),
(1331, 'Google Chrome&lt;br /&gt;', 276, 0),
(1332, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 276, 0),
(1333, 'Python&lt;br /&gt;', 277, 0),
(1334, 'Java&lt;br /&gt;', 277, 0),
(1335, 'HTML&lt;br /&gt;', 277, 0),
(1336, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 277, 1),
(1337, '16&lt;br /&gt;', 278, 0),
(1338, '11 &lt;br /&gt;', 278, 1),
(1339, '13&lt;br /&gt;', 278, 0),
(1340, '10&lt;/p&gt;\r\n&lt;p&gt;', 278, 0),
(1341, 'Ability to inherit from multiple classes&lt;br /&gt;', 279, 0),
(1342, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 279, 1),
(1343, 'The use of interfaces only&lt;br /&gt;', 279, 0),
(1344, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 279, 0),
(1345, 'Bubble Sort&lt;br /&gt;', 280, 0),
(1346, 'Merge Sort &lt;br /&gt;', 280, 1),
(1347, 'Insertion Sort&lt;br /&gt;', 280, 0),
(1348, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 280, 0),
(1349, 'MySQL&lt;br /&gt;', 281, 0),
(1350, 'MongoDB &lt;br /&gt;', 281, 1),
(1351, 'Oracle&lt;br /&gt;', 281, 0),
(1352, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 281, 0),
(1353, 'To ensure uniqueness&lt;br /&gt;', 282, 0),
(1354, 'To index columns&lt;br /&gt;', 282, 0),
(1355, 'To create links between tables &lt;br /&gt;', 282, 1),
(1356, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 282, 0),
(1357, 'The parent class&lt;br /&gt;', 283, 0),
(1358, 'The current class object &lt;br /&gt;', 283, 1),
(1359, 'A static method&lt;br /&gt;', 283, 0),
(1360, 'An inherited object&lt;/p&gt;', 283, 0),
(1361, 'Hyper Text Markup Language &lt;br /&gt;', 285, 1),
(1362, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 285, 0),
(1363, 'Home Tool Markup Language&lt;br /&gt;', 285, 0),
(1364, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 285, 0),
(1365, 'Monitor&lt;br /&gt;', 286, 0),
(1366, 'Keyboard &lt;br /&gt;', 286, 1),
(1367, 'Printer&lt;br /&gt;', 286, 0),
(1368, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 286, 0),
(1369, 'RAM&lt;br /&gt;', 287, 0),
(1370, 'CPU&lt;br /&gt;', 287, 0),
(1371, 'Hard Disk &lt;br /&gt;', 287, 1),
(1372, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 287, 0),
(1373, 'Random Access Memory &lt;br /&gt;', 288, 1),
(1374, 'Read Access Memory&lt;br /&gt;', 288, 0),
(1375, 'Run All Memory&lt;br /&gt;', 288, 0),
(1376, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 288, 0),
(1377, 'Monitor&lt;br /&gt;', 289, 0),
(1378, 'CPU &lt;br /&gt;', 289, 1),
(1379, 'RAM&lt;br /&gt;', 289, 0),
(1380, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 289, 0),
(1381, 'Decimal&lt;br /&gt;', 290, 0),
(1382, 'Binary&lt;br /&gt;', 290, 0),
(1383, 'Octal&lt;br /&gt;', 290, 0),
(1384, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 290, 1),
(1385, 'Structured Query Language &lt;br /&gt;', 291, 1),
(1386, 'Simple Query Language&lt;br /&gt;', 291, 0),
(1387, 'Standard Question Logic&lt;br /&gt;', 291, 0),
(1388, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 291, 0),
(1389, 'MS Word&lt;br /&gt;', 292, 0),
(1390, 'Windows 10 &lt;br /&gt;', 292, 1),
(1391, 'Google Chrome&lt;br /&gt;', 292, 0),
(1392, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 292, 0),
(1393, 'Python&lt;br /&gt;', 293, 0),
(1394, 'Java&lt;br /&gt;', 293, 0),
(1395, 'HTML&lt;br /&gt;', 293, 0),
(1396, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 293, 1),
(1397, '16&lt;br /&gt;', 294, 0),
(1398, '11 &lt;br /&gt;', 294, 1),
(1399, '13&lt;br /&gt;', 294, 0),
(1400, '10&lt;/p&gt;\r\n&lt;p&gt;', 294, 0),
(1401, 'Ability to inherit from multiple classes&lt;br /&gt;', 295, 0),
(1402, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 295, 1),
(1403, 'The use of interfaces only&lt;br /&gt;', 295, 0),
(1404, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 295, 0),
(1405, 'Bubble Sort&lt;br /&gt;', 296, 0),
(1406, 'Merge Sort &lt;br /&gt;', 296, 1),
(1407, 'Insertion Sort&lt;br /&gt;', 296, 0),
(1408, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 296, 0),
(1409, 'MySQL&lt;br /&gt;', 297, 0),
(1410, 'MongoDB &lt;br /&gt;', 297, 1),
(1411, 'Oracle&lt;br /&gt;', 297, 0),
(1412, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 297, 0),
(1413, 'To ensure uniqueness&lt;br /&gt;', 298, 0),
(1414, 'To index columns&lt;br /&gt;', 298, 0),
(1415, 'To create links between tables &lt;br /&gt;', 298, 1),
(1416, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 298, 0),
(1417, 'The parent class&lt;br /&gt;', 299, 0),
(1418, 'The current class object &lt;br /&gt;', 299, 1),
(1419, 'A static method&lt;br /&gt;', 299, 0),
(1420, 'An inherited object&lt;/p&gt;', 299, 0),
(1421, 'Hyper Text Markup Language &lt;br /&gt;', 301, 1),
(1422, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 301, 0),
(1423, 'Home Tool Markup Language&lt;br /&gt;', 301, 0),
(1424, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 301, 0),
(1425, 'Monitor&lt;br /&gt;', 302, 0),
(1426, 'Keyboard &lt;br /&gt;', 302, 1),
(1427, 'Printer&lt;br /&gt;', 302, 0),
(1428, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 302, 0),
(1429, 'RAM&lt;br /&gt;', 303, 0),
(1430, 'CPU&lt;br /&gt;', 303, 0),
(1431, 'Hard Disk &lt;br /&gt;', 303, 1),
(1432, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 303, 0),
(1433, 'Random Access Memory &lt;br /&gt;', 304, 1),
(1434, 'Read Access Memory&lt;br /&gt;', 304, 0),
(1435, 'Run All Memory&lt;br /&gt;', 304, 0),
(1436, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 304, 0),
(1437, 'Monitor&lt;br /&gt;', 305, 0),
(1438, 'CPU &lt;br /&gt;', 305, 1),
(1439, 'RAM&lt;br /&gt;', 305, 0),
(1440, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 305, 0),
(1441, 'Decimal&lt;br /&gt;', 306, 0),
(1442, 'Binary&lt;br /&gt;', 306, 0),
(1443, 'Octal&lt;br /&gt;', 306, 0),
(1444, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 306, 1),
(1445, 'Structured Query Language &lt;br /&gt;', 307, 1),
(1446, 'Simple Query Language&lt;br /&gt;', 307, 0),
(1447, 'Standard Question Logic&lt;br /&gt;', 307, 0),
(1448, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 307, 0),
(1449, 'MS Word&lt;br /&gt;', 308, 0),
(1450, 'Windows 10 &lt;br /&gt;', 308, 1),
(1451, 'Google Chrome&lt;br /&gt;', 308, 0),
(1452, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 308, 0),
(1453, 'Python&lt;br /&gt;', 309, 0),
(1454, 'Java&lt;br /&gt;', 309, 0),
(1455, 'HTML&lt;br /&gt;', 309, 0),
(1456, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 309, 1),
(1457, '16&lt;br /&gt;', 310, 0),
(1458, '11 &lt;br /&gt;', 310, 1),
(1459, '13&lt;br /&gt;', 310, 0),
(1460, '10&lt;/p&gt;\r\n&lt;p&gt;', 310, 0),
(1461, 'Ability to inherit from multiple classes&lt;br /&gt;', 311, 0),
(1462, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 311, 1),
(1463, 'The use of interfaces only&lt;br /&gt;', 311, 0),
(1464, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 311, 0),
(1465, 'Bubble Sort&lt;br /&gt;', 312, 0),
(1466, 'Merge Sort &lt;br /&gt;', 312, 1),
(1467, 'Insertion Sort&lt;br /&gt;', 312, 0),
(1468, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 312, 0),
(1469, 'MySQL&lt;br /&gt;', 313, 0),
(1470, 'MongoDB &lt;br /&gt;', 313, 1),
(1471, 'Oracle&lt;br /&gt;', 313, 0),
(1472, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 313, 0),
(1473, 'To ensure uniqueness&lt;br /&gt;', 314, 0),
(1474, 'To index columns&lt;br /&gt;', 314, 0),
(1475, 'To create links between tables &lt;br /&gt;', 314, 1),
(1476, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 314, 0),
(1477, 'The parent class&lt;br /&gt;', 315, 0),
(1478, 'The current class object &lt;br /&gt;', 315, 1),
(1479, 'A static method&lt;br /&gt;', 315, 0),
(1480, 'An inherited object&lt;/p&gt;', 315, 0),
(1481, 'Hyper Text Markup Language &lt;br /&gt;', 317, 1),
(1482, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 317, 0),
(1483, 'Home Tool Markup Language&lt;br /&gt;', 317, 0),
(1484, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 317, 0),
(1485, 'Monitor&lt;br /&gt;', 318, 0),
(1486, 'Keyboard &lt;br /&gt;', 318, 1),
(1487, 'Printer&lt;br /&gt;', 318, 0),
(1488, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 318, 0),
(1489, 'RAM&lt;br /&gt;', 319, 0),
(1490, 'CPU&lt;br /&gt;', 319, 0),
(1491, 'Hard Disk &lt;br /&gt;', 319, 1),
(1492, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 319, 0),
(1493, 'Random Access Memory &lt;br /&gt;', 320, 1),
(1494, 'Read Access Memory&lt;br /&gt;', 320, 0),
(1495, 'Run All Memory&lt;br /&gt;', 320, 0),
(1496, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 320, 0),
(1497, 'Monitor&lt;br /&gt;', 321, 0),
(1498, 'CPU &lt;br /&gt;', 321, 1),
(1499, 'RAM&lt;br /&gt;', 321, 0),
(1500, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 321, 0),
(1501, 'Decimal&lt;br /&gt;', 322, 0),
(1502, 'Binary&lt;br /&gt;', 322, 0),
(1503, 'Octal&lt;br /&gt;', 322, 0),
(1504, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 322, 1),
(1505, 'Structured Query Language &lt;br /&gt;', 323, 1),
(1506, 'Simple Query Language&lt;br /&gt;', 323, 0),
(1507, 'Standard Question Logic&lt;br /&gt;', 323, 0),
(1508, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 323, 0),
(1509, 'MS Word&lt;br /&gt;', 324, 0),
(1510, 'Windows 10 &lt;br /&gt;', 324, 1),
(1511, 'Google Chrome&lt;br /&gt;', 324, 0),
(1512, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 324, 0),
(1513, 'Python&lt;br /&gt;', 325, 0),
(1514, 'Java&lt;br /&gt;', 325, 0),
(1515, 'HTML&lt;br /&gt;', 325, 0),
(1516, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 325, 1),
(1517, '16&lt;br /&gt;', 326, 0),
(1518, '11 &lt;br /&gt;', 326, 1),
(1519, '13&lt;br /&gt;', 326, 0),
(1520, '10&lt;/p&gt;\r\n&lt;p&gt;', 326, 0),
(1521, 'Ability to inherit from multiple classes&lt;br /&gt;', 327, 0),
(1522, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 327, 1),
(1523, 'The use of interfaces only&lt;br /&gt;', 327, 0),
(1524, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 327, 0),
(1525, 'Bubble Sort&lt;br /&gt;', 328, 0),
(1526, 'Merge Sort &lt;br /&gt;', 328, 1),
(1527, 'Insertion Sort&lt;br /&gt;', 328, 0),
(1528, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 328, 0),
(1529, 'MySQL&lt;br /&gt;', 329, 0),
(1530, 'MongoDB &lt;br /&gt;', 329, 1),
(1531, 'Oracle&lt;br /&gt;', 329, 0),
(1532, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 329, 0),
(1533, 'To ensure uniqueness&lt;br /&gt;', 330, 0),
(1534, 'To index columns&lt;br /&gt;', 330, 0),
(1535, 'To create links between tables &lt;br /&gt;', 330, 1),
(1536, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 330, 0),
(1537, 'The parent class&lt;br /&gt;', 331, 0),
(1538, 'The current class object &lt;br /&gt;', 331, 1),
(1539, 'A static method&lt;br /&gt;', 331, 0),
(1540, 'An inherited object&lt;/p&gt;', 331, 0),
(1541, 'Hyper Text Markup Language &lt;br /&gt;', 333, 1),
(1542, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 333, 0),
(1543, 'Home Tool Markup Language&lt;br /&gt;', 333, 0),
(1544, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 333, 0),
(1545, 'Monitor&lt;br /&gt;', 334, 0),
(1546, 'Keyboard &lt;br /&gt;', 334, 1),
(1547, 'Printer&lt;br /&gt;', 334, 0),
(1548, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 334, 0),
(1549, 'RAM&lt;br /&gt;', 335, 0),
(1550, 'CPU&lt;br /&gt;', 335, 0),
(1551, 'Hard Disk &lt;br /&gt;', 335, 1),
(1552, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 335, 0),
(1553, 'Random Access Memory &lt;br /&gt;', 336, 1),
(1554, 'Read Access Memory&lt;br /&gt;', 336, 0),
(1555, 'Run All Memory&lt;br /&gt;', 336, 0),
(1556, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 336, 0),
(1557, 'Monitor&lt;br /&gt;', 337, 0),
(1558, 'CPU &lt;br /&gt;', 337, 1),
(1559, 'RAM&lt;br /&gt;', 337, 0),
(1560, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 337, 0),
(1561, 'Decimal&lt;br /&gt;', 338, 0),
(1562, 'Binary&lt;br /&gt;', 338, 0),
(1563, 'Octal&lt;br /&gt;', 338, 0),
(1564, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 338, 1),
(1565, 'Structured Query Language &lt;br /&gt;', 339, 1),
(1566, 'Simple Query Language&lt;br /&gt;', 339, 0),
(1567, 'Standard Question Logic&lt;br /&gt;', 339, 0),
(1568, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 339, 0),
(1569, 'MS Word&lt;br /&gt;', 340, 0),
(1570, 'Windows 10 &lt;br /&gt;', 340, 1),
(1571, 'Google Chrome&lt;br /&gt;', 340, 0),
(1572, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 340, 0),
(1573, 'Python&lt;br /&gt;', 341, 0),
(1574, 'Java&lt;br /&gt;', 341, 0),
(1575, 'HTML&lt;br /&gt;', 341, 0),
(1576, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 341, 1),
(1577, '16&lt;br /&gt;', 342, 0),
(1578, '11 &lt;br /&gt;', 342, 1),
(1579, '13&lt;br /&gt;', 342, 0),
(1580, '10&lt;/p&gt;\r\n&lt;p&gt;', 342, 0),
(1581, 'Ability to inherit from multiple classes&lt;br /&gt;', 343, 0),
(1582, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 343, 1),
(1583, 'The use of interfaces only&lt;br /&gt;', 343, 0),
(1584, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 343, 0),
(1585, 'Bubble Sort&lt;br /&gt;', 344, 0),
(1586, 'Merge Sort &lt;br /&gt;', 344, 1),
(1587, 'Insertion Sort&lt;br /&gt;', 344, 0),
(1588, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 344, 0),
(1589, 'MySQL&lt;br /&gt;', 345, 0),
(1590, 'MongoDB &lt;br /&gt;', 345, 1),
(1591, 'Oracle&lt;br /&gt;', 345, 0),
(1592, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 345, 0),
(1593, 'To ensure uniqueness&lt;br /&gt;', 346, 0),
(1594, 'To index columns&lt;br /&gt;', 346, 0),
(1595, 'To create links between tables &lt;br /&gt;', 346, 1),
(1596, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 346, 0),
(1597, 'The parent class&lt;br /&gt;', 347, 0),
(1598, 'The current class object &lt;br /&gt;', 347, 1),
(1599, 'A static method&lt;br /&gt;', 347, 0),
(1600, 'An inherited object&lt;/p&gt;', 347, 0),
(1601, 'Hyper Text Markup Language &lt;br /&gt;', 349, 1),
(1602, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 349, 0),
(1603, 'Home Tool Markup Language&lt;br /&gt;', 349, 0),
(1604, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 349, 0),
(1605, 'Monitor&lt;br /&gt;', 350, 0),
(1606, 'Keyboard &lt;br /&gt;', 350, 1),
(1607, 'Printer&lt;br /&gt;', 350, 0),
(1608, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 350, 0),
(1609, 'RAM&lt;br /&gt;', 351, 0),
(1610, 'CPU&lt;br /&gt;', 351, 0),
(1611, 'Hard Disk &lt;br /&gt;', 351, 1),
(1612, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 351, 0),
(1613, 'Random Access Memory &lt;br /&gt;', 352, 1),
(1614, 'Read Access Memory&lt;br /&gt;', 352, 0),
(1615, 'Run All Memory&lt;br /&gt;', 352, 0),
(1616, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 352, 0),
(1617, 'Monitor&lt;br /&gt;', 353, 0),
(1618, 'CPU &lt;br /&gt;', 353, 1),
(1619, 'RAM&lt;br /&gt;', 353, 0),
(1620, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 353, 0),
(1621, 'Decimal&lt;br /&gt;', 354, 0),
(1622, 'Binary&lt;br /&gt;', 354, 0),
(1623, 'Octal&lt;br /&gt;', 354, 0),
(1624, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 354, 1),
(1625, 'Structured Query Language &lt;br /&gt;', 355, 1),
(1626, 'Simple Query Language&lt;br /&gt;', 355, 0),
(1627, 'Standard Question Logic&lt;br /&gt;', 355, 0),
(1628, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 355, 0),
(1629, 'MS Word&lt;br /&gt;', 356, 0),
(1630, 'Windows 10 &lt;br /&gt;', 356, 1),
(1631, 'Google Chrome&lt;br /&gt;', 356, 0),
(1632, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 356, 0);
INSERT INTO `tblansweroptions_temp` (`answerid`, `test`, `questionbankid`, `correctness`) VALUES
(1633, 'Python&lt;br /&gt;', 357, 0),
(1634, 'Java&lt;br /&gt;', 357, 0),
(1635, 'HTML&lt;br /&gt;', 357, 0),
(1636, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 357, 1),
(1637, '16&lt;br /&gt;', 358, 0),
(1638, '11 &lt;br /&gt;', 358, 1),
(1639, '13&lt;br /&gt;', 358, 0),
(1640, '10&lt;/p&gt;\r\n&lt;p&gt;', 358, 0),
(1641, 'Ability to inherit from multiple classes&lt;br /&gt;', 359, 0),
(1642, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 359, 1),
(1643, 'The use of interfaces only&lt;br /&gt;', 359, 0),
(1644, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 359, 0),
(1645, 'Bubble Sort&lt;br /&gt;', 360, 0),
(1646, 'Merge Sort &lt;br /&gt;', 360, 1),
(1647, 'Insertion Sort&lt;br /&gt;', 360, 0),
(1648, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 360, 0),
(1649, 'MySQL&lt;br /&gt;', 361, 0),
(1650, 'MongoDB &lt;br /&gt;', 361, 1),
(1651, 'Oracle&lt;br /&gt;', 361, 0),
(1652, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 361, 0),
(1653, 'To ensure uniqueness&lt;br /&gt;', 362, 0),
(1654, 'To index columns&lt;br /&gt;', 362, 0),
(1655, 'To create links between tables &lt;br /&gt;', 362, 1),
(1656, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 362, 0),
(1657, 'The parent class&lt;br /&gt;', 363, 0),
(1658, 'The current class object &lt;br /&gt;', 363, 1),
(1659, 'A static method&lt;br /&gt;', 363, 0),
(1660, 'An inherited object&lt;/p&gt;', 363, 0),
(1661, 'Hyper Text Markup Language &lt;br /&gt;', 365, 1),
(1662, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 365, 0),
(1663, 'Home Tool Markup Language&lt;br /&gt;', 365, 0),
(1664, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 365, 0),
(1665, 'Monitor&lt;br /&gt;', 366, 0),
(1666, 'Keyboard &lt;br /&gt;', 366, 1),
(1667, 'Printer&lt;br /&gt;', 366, 0),
(1668, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 366, 0),
(1669, 'RAM&lt;br /&gt;', 367, 0),
(1670, 'CPU&lt;br /&gt;', 367, 0),
(1671, 'Hard Disk &lt;br /&gt;', 367, 1),
(1672, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 367, 0),
(1673, 'Random Access Memory &lt;br /&gt;', 368, 1),
(1674, 'Read Access Memory&lt;br /&gt;', 368, 0),
(1675, 'Run All Memory&lt;br /&gt;', 368, 0),
(1676, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 368, 0),
(1677, 'Monitor&lt;br /&gt;', 369, 0),
(1678, 'CPU &lt;br /&gt;', 369, 1),
(1679, 'RAM&lt;br /&gt;', 369, 0),
(1680, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 369, 0),
(1681, 'Decimal&lt;br /&gt;', 370, 0),
(1682, 'Binary&lt;br /&gt;', 370, 0),
(1683, 'Octal&lt;br /&gt;', 370, 0),
(1684, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 370, 1),
(1685, 'Structured Query Language &lt;br /&gt;', 371, 1),
(1686, 'Simple Query Language&lt;br /&gt;', 371, 0),
(1687, 'Standard Question Logic&lt;br /&gt;', 371, 0),
(1688, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 371, 0),
(1689, 'MS Word&lt;br /&gt;', 372, 0),
(1690, 'Windows 10 &lt;br /&gt;', 372, 1),
(1691, 'Google Chrome&lt;br /&gt;', 372, 0),
(1692, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 372, 0),
(1693, 'Python&lt;br /&gt;', 373, 0),
(1694, 'Java&lt;br /&gt;', 373, 0),
(1695, 'HTML&lt;br /&gt;', 373, 0),
(1696, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 373, 1),
(1697, '16&lt;br /&gt;', 374, 0),
(1698, '11 &lt;br /&gt;', 374, 1),
(1699, '13&lt;br /&gt;', 374, 0),
(1700, '10&lt;/p&gt;\r\n&lt;p&gt;', 374, 0),
(1701, 'Ability to inherit from multiple classes&lt;br /&gt;', 375, 0),
(1702, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 375, 1),
(1703, 'The use of interfaces only&lt;br /&gt;', 375, 0),
(1704, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 375, 0),
(1705, 'Bubble Sort&lt;br /&gt;', 376, 0),
(1706, 'Merge Sort &lt;br /&gt;', 376, 1),
(1707, 'Insertion Sort&lt;br /&gt;', 376, 0),
(1708, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 376, 0),
(1709, 'MySQL&lt;br /&gt;', 377, 0),
(1710, 'MongoDB &lt;br /&gt;', 377, 1),
(1711, 'Oracle&lt;br /&gt;', 377, 0),
(1712, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 377, 0),
(1713, 'To ensure uniqueness&lt;br /&gt;', 378, 0),
(1714, 'To index columns&lt;br /&gt;', 378, 0),
(1715, 'To create links between tables &lt;br /&gt;', 378, 1),
(1716, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 378, 0),
(1717, 'The parent class&lt;br /&gt;', 379, 0),
(1718, 'The current class object &lt;br /&gt;', 379, 1),
(1719, 'A static method&lt;br /&gt;', 379, 0),
(1720, 'An inherited object&lt;/p&gt;', 379, 0),
(1721, 'Hyper Text Markup Language &lt;br /&gt;', 381, 1),
(1722, 'Hyperlinks and Text Markup Language&lt;br /&gt;', 381, 0),
(1723, 'Home Tool Markup Language&lt;br /&gt;', 381, 0),
(1724, 'Hyper Tool Machine Language&lt;/p&gt;\r\n&lt;p&gt;', 381, 0),
(1725, 'Monitor&lt;br /&gt;', 382, 0),
(1726, 'Keyboard &lt;br /&gt;', 382, 1),
(1727, 'Printer&lt;br /&gt;', 382, 0),
(1728, 'Speaker&lt;/p&gt;\r\n&lt;p&gt;', 382, 0),
(1729, 'RAM&lt;br /&gt;', 383, 0),
(1730, 'CPU&lt;br /&gt;', 383, 0),
(1731, 'Hard Disk &lt;br /&gt;', 383, 1),
(1732, 'Monitor&lt;/p&gt;\r\n&lt;p&gt;', 383, 0),
(1733, 'Random Access Memory &lt;br /&gt;', 384, 1),
(1734, 'Read Access Memory&lt;br /&gt;', 384, 0),
(1735, 'Run All Memory&lt;br /&gt;', 384, 0),
(1736, 'Random Arithmetic Machine&lt;/p&gt;\r\n&lt;p&gt;', 384, 0),
(1737, 'Monitor&lt;br /&gt;', 385, 0),
(1738, 'CPU &lt;br /&gt;', 385, 1),
(1739, 'RAM&lt;br /&gt;', 385, 0),
(1740, 'Keyboard&lt;/p&gt;\r\n&lt;p&gt;', 385, 0),
(1741, 'Decimal&lt;br /&gt;', 386, 0),
(1742, 'Binary&lt;br /&gt;', 386, 0),
(1743, 'Octal&lt;br /&gt;', 386, 0),
(1744, 'Hexadecimal &lt;/p&gt;\r\n&lt;p&gt;', 386, 1),
(1745, 'Structured Query Language &lt;br /&gt;', 387, 1),
(1746, 'Simple Query Language&lt;br /&gt;', 387, 0),
(1747, 'Standard Question Logic&lt;br /&gt;', 387, 0),
(1748, 'Sequential Query Language&lt;/p&gt;\r\n&lt;p&gt;', 387, 0),
(1749, 'MS Word&lt;br /&gt;', 388, 0),
(1750, 'Windows 10 &lt;br /&gt;', 388, 1),
(1751, 'Google Chrome&lt;br /&gt;', 388, 0),
(1752, 'Intel&lt;/p&gt;\r\n&lt;p&gt;', 388, 0),
(1753, 'Python&lt;br /&gt;', 389, 0),
(1754, 'Java&lt;br /&gt;', 389, 0),
(1755, 'HTML&lt;br /&gt;', 389, 0),
(1756, 'MySQL &lt;/p&gt;\r\n&lt;p&gt;', 389, 1),
(1757, '16&lt;br /&gt;', 390, 0),
(1758, '11 &lt;br /&gt;', 390, 1),
(1759, '13&lt;br /&gt;', 390, 0),
(1760, '10&lt;/p&gt;\r\n&lt;p&gt;', 390, 0),
(1761, 'Ability to inherit from multiple classes&lt;br /&gt;', 391, 0),
(1762, 'Ability to define multiple methods with the same name but different implementations &lt;br /&gt;', 391, 1),
(1763, 'The use of interfaces only&lt;br /&gt;', 391, 0),
(1764, 'Restricting object creation&lt;/p&gt;\r\n&lt;p&gt;', 391, 0),
(1765, 'Bubble Sort&lt;br /&gt;', 392, 0),
(1766, 'Merge Sort &lt;br /&gt;', 392, 1),
(1767, 'Insertion Sort&lt;br /&gt;', 392, 0),
(1768, 'Selection Sort&lt;/p&gt;\r\n&lt;p&gt;', 392, 0),
(1769, 'MySQL&lt;br /&gt;', 393, 0),
(1770, 'MongoDB &lt;br /&gt;', 393, 1),
(1771, 'Oracle&lt;br /&gt;', 393, 0),
(1772, 'PostgreSQL&lt;/p&gt;\r\n&lt;p&gt;', 393, 0),
(1773, 'To ensure uniqueness&lt;br /&gt;', 394, 0),
(1774, 'To index columns&lt;br /&gt;', 394, 0),
(1775, 'To create links between tables &lt;br /&gt;', 394, 1),
(1776, 'To increase storage&lt;/p&gt;\r\n&lt;p&gt;', 394, 0),
(1777, 'The parent class&lt;br /&gt;', 395, 0),
(1778, 'The current class object &lt;br /&gt;', 395, 1),
(1779, 'A static method&lt;br /&gt;', 395, 0),
(1780, 'An inherited object&lt;/p&gt;', 395, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidatestudent`
--

CREATE TABLE `tblcandidatestudent` (
  `id` int(11) NOT NULL,
  `candidateid` int(11) NOT NULL,
  `scheduleid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `add_index` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcandidatestudent`
--

INSERT INTO `tblcandidatestudent` (`id`, `candidateid`, `scheduleid`, `subjectid`, `add_index`) VALUES
(1, 1, 13, 21, 0),
(2, 2, 13, 21, 0),
(3, 3, 13, 21, 0),
(4, 4, 13, 21, 0),
(5, 5, 13, 21, 0),
(6, 6, 13, 21, 0),
(7, 7, 13, 21, 0),
(8, 8, 13, 21, 0),
(9, 9, 13, 21, 0),
(10, 10, 13, 21, 0),
(11, 11, 13, 21, 0),
(12, 12, 13, 21, 0),
(13, 13, 13, 21, 0),
(14, 14, 13, 21, 0),
(15, 15, 13, 21, 0),
(16, 16, 13, 21, 0),
(17, 17, 13, 21, 0),
(18, 18, 13, 21, 0),
(19, 19, 13, 21, 0),
(20, 20, 13, 21, 0),
(21, 21, 13, 21, 0),
(22, 22, 13, 21, 0),
(23, 23, 13, 21, 0),
(24, 24, 13, 21, 0),
(25, 25, 13, 21, 0),
(26, 26, 13, 21, 0),
(27, 27, 13, 21, 0),
(28, 28, 13, 21, 0),
(29, 29, 13, 21, 0),
(30, 30, 13, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidatetypes`
--

CREATE TABLE `tblcandidatetypes` (
  `candidatetypeid` int(11) NOT NULL,
  `candidatetype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcandidatetypes`
--

INSERT INTO `tblcandidatetypes` (`candidatetypeid`, `candidatetype`) VALUES
(1, 'SBRS'),
(2, 'PUTME'),
(3, 'REGULAR');

-- --------------------------------------------------------

--
-- Table structure for table `tblcentres`
--

CREATE TABLE `tblcentres` (
  `centreid` int(11) NOT NULL,
  `centrename` varchar(100) NOT NULL,
  `centrelocation` varchar(255) DEFAULT NULL,
  `centrecode` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcentres`
--

INSERT INTO `tblcentres` (`centreid`, `centrename`, `centrelocation`, `centrecode`, `status`, `created_at`) VALUES
(1, 'Centre1', NULL, NULL, 'active', '2025-06-09 15:00:14'),
(2, 'Centre2', NULL, NULL, 'active', '2025-06-14 19:31:56'),
(4, 'Centre 3', NULL, NULL, 'active', '2025-06-14 20:08:53'),
(5, 'Center2', NULL, NULL, 'active', '2025-06-14 21:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `departmentid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `facultyid` int(11) DEFAULT NULL,
  `depttype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`departmentid`, `name`, `facultyid`, `depttype`) VALUES
(1, 'System Administration', 1, 'ADMIN'),
(2, 'IT', NULL, 'ADMIN'),
(3, 'Examinations', NULL, 'ADMIN'),
(4, 'Academic', NULL, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `employeeid` int(11) NOT NULL,
  `personnelno` varchar(50) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `othernames` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL COMMENT 'M for Male, F for Female',
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `departmentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`employeeid`, `personnelno`, `surname`, `firstname`, `othernames`, `gender`, `email`, `department`, `departmentid`) VALUES
(1, '123458', 'Admin', 'System', NULL, 'M', 'admin@example.com', 'IT', 2),
(2, 'p12347', 'Test', 'Admin', NULL, 'M', 'testadmin@example.com', 'Examinations', 3),
(3, 'p12346', 'Author', 'Question', NULL, 'M', 'author@example.com', 'Academic', 4),
(4, 'p12345', 'Administrator', 'System', NULL, 'M', 'admin@system.local', 'System Administration', 1),
(5, 'p12340', 'Doe', 'John', NULL, 'M', 'p1234@system.local', 'System Administration', 1),
(999, 'test123', 'Test', 'User', NULL, 'F', 'test123@personal.com', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblentrycombination`
--

CREATE TABLE `tblentrycombination` (
  `id` int(11) NOT NULL,
  `programmeid` int(11) NOT NULL,
  `requirement` text NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblentrycombination`
--

INSERT INTO `tblentrycombination` (`id`, `programmeid`, `requirement`, `status`, `created_at`) VALUES
(1, 1, 'English Language, Mathematics, Physics, and any one of Biology, Chemistry, Agricultural Science, Economics, Geography', 'active', '2025-06-16 18:25:33'),
(2, 2, 'English Language, Mathematics, Physics, and any one of Chemistry, Biology, Technical Drawing, Further Mathematics', 'active', '2025-06-16 18:25:33'),
(3, 3, 'English Language, Mathematics, Physics, and any one of Chemistry, Biology, Technical Drawing, Further Mathematics', 'active', '2025-06-16 18:25:33'),
(4, 4, 'English Language, Mathematics, Physics, and any one of Chemistry, Biology, Technical Drawing, Further Mathematics', 'active', '2025-06-16 18:25:33'),
(5, 5, 'English Language, Mathematics, Physics, and any one of Chemistry, Biology, Technical Drawing, Further Mathematics', 'active', '2025-06-16 18:25:33'),
(6, 6, 'English Language, Mathematics, Physics, and any one of Chemistry, Biology, Technical Drawing, Further Mathematics', 'active', '2025-06-16 18:25:33'),
(7, 7, 'English Language, Biology, Chemistry, and any one of Physics, Mathematics', 'active', '2025-06-16 18:25:33'),
(8, 8, 'English Language, Biology, Chemistry, and any one of Physics, Mathematics', 'active', '2025-06-16 18:25:33'),
(9, 9, 'English Language, Literature in English, and any two of Government, History, Economics, Christian Religious Studies, Islamic Studies', 'active', '2025-06-16 18:25:33'),
(10, 10, 'English Language, Mathematics, Economics, and any one of Government, Geography, Commerce, Financial Accounting', 'active', '2025-06-16 18:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `tblexamsdate`
--

CREATE TABLE `tblexamsdate` (
  `id` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblexamsdate`
--

INSERT INTO `tblexamsdate` (`id`, `testid`, `date`, `start_time`, `end_time`, `created_at`) VALUES
(1, 1, '2025-06-10', '00:00:00', '00:00:00', '2025-06-10 10:50:10'),
(2, 2, '2025-06-10', '00:00:00', '00:00:00', '2025-06-10 11:32:23'),
(3, 2, '2025-06-13', '00:00:00', '00:00:00', '2025-06-13 21:39:37'),
(4, 2, '2025-06-14', '00:00:00', '00:00:00', '2025-06-14 13:40:29'),
(5, 3, '2025-06-14', '00:00:00', '00:00:00', '2025-06-14 20:54:05'),
(6, 5, '2025-06-14', '00:00:00', '00:00:00', '2025-06-14 21:52:02'),
(7, 6, '2025-06-14', '00:00:00', '00:00:00', '2025-06-14 21:54:20'),
(8, 5, '2025-06-15', '00:00:00', '00:00:00', '2025-06-15 18:54:38'),
(9, 6, '2025-06-15', '00:00:00', '00:00:00', '2025-06-15 20:40:15'),
(10, 7, '2025-06-15', '00:00:00', '00:00:00', '2025-06-15 20:44:39'),
(11, 8, '2025-06-15', '00:00:00', '00:00:00', '2025-06-15 20:51:21'),
(12, 8, '2025-06-16', '00:00:00', '00:00:00', '2025-06-16 14:52:55'),
(13, 7, '2025-06-16', '00:00:00', '00:00:00', '2025-06-16 19:05:39'),
(14, 8, '2025-06-17', '00:00:00', '00:00:00', '2025-06-17 13:52:42'),
(15, 7, '2025-06-17', '00:00:00', '00:00:00', '2025-06-17 13:53:38'),
(16, 9, '2025-06-19', '00:00:00', '00:00:00', '2025-06-19 07:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `tblfaculty`
--

CREATE TABLE `tblfaculty` (
  `facultyid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblfaculty_schedule_mapping`
--

CREATE TABLE `tblfaculty_schedule_mapping` (
  `id` int(11) NOT NULL,
  `schedulingid` int(11) NOT NULL,
  `facultyid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblhost`
--

CREATE TABLE `tblhost` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `mac_address` varchar(17) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbljamb`
--

CREATE TABLE `tbljamb` (
  `id` int(11) NOT NULL,
  `RegNo` varchar(20) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `CandName` varchar(100) NOT NULL,
  `othername` varchar(100) NOT NULL,
  `StateOfOrigin` varchar(50) NOT NULL,
  `LGA` varchar(50) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Age` int(3) NOT NULL,
  `EngScore` int(3) NOT NULL,
  `Subj2` varchar(10) NOT NULL,
  `Subj2Score` int(3) NOT NULL,
  `Subj3` varchar(10) NOT NULL,
  `Subj3Score` int(3) NOT NULL,
  `Subj4` varchar(10) NOT NULL,
  `Subj4Score` int(3) NOT NULL,
  `TotalScore` int(4) NOT NULL,
  `Faculty` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbljamb`
--

INSERT INTO `tbljamb` (`id`, `RegNo`, `surname`, `CandName`, `othername`, `StateOfOrigin`, `LGA`, `Sex`, `Age`, `EngScore`, `Subj2`, `Subj2Score`, `Subj3`, `Subj3Score`, `Subj4`, `Subj4Score`, `TotalScore`, `Faculty`, `Course`, `created_at`) VALUES
(1, '202456789AB', 'John', 'Doe', 'John', 'Lagos', 'Ikeja', 'M', 18, 75, 'MTH', 85, 'PHY', 80, 'CHEM', 75, 315, 'Engineering', 'Computer Engineering', '2025-05-29 12:44:07'),
(2, '202456780AC', 'Abruzi', 'Fatima', 'John', 'Kaduna', 'zaria', 'F', 20, 73, 'MTH', 81, 'PHY', 87, 'CHEM', 72, 313, 'Engineering', 'Computer Engineering', '2025-05-29 11:44:20'),
(3, 'CAND3', '', 'John Doe 1', '', 'Enugu', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:34:07'),
(4, 'CAND4', '', 'John Doe 1', '', 'Enugu', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:36:29'),
(5, 'CAND5', '', 'John Doe 1', '', 'Enugu', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:36:50'),
(6, 'CAND6', '', 'Does', '', 'Benue', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:37:17'),
(7, 'CAND7', '', 'Sam Walolo', '', 'Jigawa', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:38:13'),
(8, 'CAND8', '', 'Fbd ', '', 'Enugu', '', '', 0, 0, '', 0, '', 0, '', 0, 0, '', '', '2025-06-16 18:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbllga`
--

CREATE TABLE `tbllga` (
  `lgaid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `lganame` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpresentation`
--

CREATE TABLE `tblpresentation` (
  `id` int(11) NOT NULL,
  `candidateid` varchar(50) NOT NULL,
  `testid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `answerid` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpresentation`
--

INSERT INTO `tblpresentation` (`id`, `candidateid`, `testid`, `sectionid`, `questionid`, `answerid`, `created_at`) VALUES
(1, '13', 2, 2, 15, 59, '2025-06-13 21:57:39'),
(2, '13', 2, 2, 15, 60, '2025-06-13 21:57:39'),
(3, '13', 2, 2, 15, 58, '2025-06-13 21:57:39'),
(4, '13', 2, 2, 15, 57, '2025-06-13 21:57:39'),
(5, '13', 2, 2, 3, 10, '2025-06-13 21:57:39'),
(6, '13', 2, 2, 3, 12, '2025-06-13 21:57:39'),
(7, '13', 2, 2, 3, 9, '2025-06-13 21:57:39'),
(8, '13', 2, 2, 3, 11, '2025-06-13 21:57:39'),
(9, '13', 2, 2, 2, 6, '2025-06-13 21:57:39'),
(10, '13', 2, 2, 2, 8, '2025-06-13 21:57:39'),
(11, '13', 2, 2, 2, 5, '2025-06-13 21:57:39'),
(12, '13', 2, 2, 2, 7, '2025-06-13 21:57:39'),
(13, '13', 2, 2, 7, 26, '2025-06-13 21:57:39'),
(14, '13', 2, 2, 7, 27, '2025-06-13 21:57:39'),
(15, '13', 2, 2, 7, 28, '2025-06-13 21:57:39'),
(16, '13', 2, 2, 7, 25, '2025-06-13 21:57:39'),
(17, '13', 2, 2, 1, 4, '2025-06-13 21:57:39'),
(18, '13', 2, 2, 1, 1, '2025-06-13 21:57:39'),
(19, '13', 2, 2, 1, 2, '2025-06-13 21:57:39'),
(20, '13', 2, 2, 1, 3, '2025-06-13 21:57:39'),
(21, '13', 2, 2, 19, 74, '2025-06-13 21:57:39'),
(22, '13', 2, 2, 19, 75, '2025-06-13 21:57:39'),
(23, '13', 2, 2, 19, 76, '2025-06-13 21:57:39'),
(24, '13', 2, 2, 19, 73, '2025-06-13 21:57:39'),
(25, '13', 2, 2, 18, 71, '2025-06-13 21:57:39'),
(26, '13', 2, 2, 18, 72, '2025-06-13 21:57:39'),
(27, '13', 2, 2, 18, 69, '2025-06-13 21:57:39'),
(28, '13', 2, 2, 18, 70, '2025-06-13 21:57:39'),
(29, '13', 2, 2, 16, 64, '2025-06-13 21:57:39'),
(30, '13', 2, 2, 16, 61, '2025-06-13 21:57:39'),
(31, '13', 2, 2, 16, 63, '2025-06-13 21:57:39'),
(32, '13', 2, 2, 16, 62, '2025-06-13 21:57:39'),
(33, '13', 2, 2, 22, 87, '2025-06-13 21:57:39'),
(34, '13', 2, 2, 22, 86, '2025-06-13 21:57:39'),
(35, '13', 2, 2, 22, 88, '2025-06-13 21:57:39'),
(36, '13', 2, 2, 22, 85, '2025-06-13 21:57:39'),
(37, '13', 2, 2, 27, 107, '2025-06-13 21:57:39'),
(38, '13', 2, 2, 27, 106, '2025-06-13 21:57:39'),
(39, '13', 2, 2, 27, 105, '2025-06-13 21:57:39'),
(40, '13', 2, 2, 27, 108, '2025-06-13 21:57:39'),
(41, '13', 2, 2, 44, 176, '2025-06-13 21:57:39'),
(42, '13', 2, 2, 44, 173, '2025-06-13 21:57:39'),
(43, '13', 2, 2, 44, 174, '2025-06-13 21:57:39'),
(44, '13', 2, 2, 44, 175, '2025-06-13 21:57:39'),
(45, '13', 2, 2, 31, 122, '2025-06-13 21:57:39'),
(46, '13', 2, 2, 31, 123, '2025-06-13 21:57:39'),
(47, '13', 2, 2, 31, 121, '2025-06-13 21:57:39'),
(48, '13', 2, 2, 31, 124, '2025-06-13 21:57:39'),
(49, '13', 2, 2, 35, 139, '2025-06-13 21:57:39'),
(50, '13', 2, 2, 35, 140, '2025-06-13 21:57:39'),
(51, '13', 2, 2, 35, 138, '2025-06-13 21:57:39'),
(52, '13', 2, 2, 35, 137, '2025-06-13 21:57:39'),
(53, '13', 2, 2, 41, 163, '2025-06-13 21:57:39'),
(54, '13', 2, 2, 41, 162, '2025-06-13 21:57:39'),
(55, '13', 2, 2, 41, 164, '2025-06-13 21:57:39'),
(56, '13', 2, 2, 41, 161, '2025-06-13 21:57:39'),
(57, '13', 2, 2, 38, 149, '2025-06-13 21:57:39'),
(58, '13', 2, 2, 38, 151, '2025-06-13 21:57:39'),
(59, '13', 2, 2, 38, 152, '2025-06-13 21:57:39'),
(60, '13', 2, 2, 38, 150, '2025-06-13 21:57:39'),
(61, '15', 2, 2, 13, 51, '2025-06-14 14:02:59'),
(62, '15', 2, 2, 13, 50, '2025-06-14 14:02:59'),
(63, '15', 2, 2, 13, 52, '2025-06-14 14:02:59'),
(64, '15', 2, 2, 13, 49, '2025-06-14 14:02:59'),
(65, '15', 2, 2, 10, 38, '2025-06-14 14:02:59'),
(66, '15', 2, 2, 10, 39, '2025-06-14 14:02:59'),
(67, '15', 2, 2, 10, 40, '2025-06-14 14:02:59'),
(68, '15', 2, 2, 10, 37, '2025-06-14 14:02:59'),
(69, '15', 2, 2, 12, 45, '2025-06-14 14:02:59'),
(70, '15', 2, 2, 12, 46, '2025-06-14 14:02:59'),
(71, '15', 2, 2, 12, 47, '2025-06-14 14:02:59'),
(72, '15', 2, 2, 12, 48, '2025-06-14 14:02:59'),
(73, '15', 2, 2, 15, 57, '2025-06-14 14:02:59'),
(74, '15', 2, 2, 15, 59, '2025-06-14 14:02:59'),
(75, '15', 2, 2, 15, 58, '2025-06-14 14:02:59'),
(76, '15', 2, 2, 15, 60, '2025-06-14 14:02:59'),
(77, '15', 2, 2, 7, 28, '2025-06-14 14:02:59'),
(78, '15', 2, 2, 7, 27, '2025-06-14 14:02:59'),
(79, '15', 2, 2, 7, 26, '2025-06-14 14:02:59'),
(80, '15', 2, 2, 7, 25, '2025-06-14 14:02:59'),
(81, '15', 2, 2, 18, 72, '2025-06-14 14:02:59'),
(82, '15', 2, 2, 18, 71, '2025-06-14 14:02:59'),
(83, '15', 2, 2, 18, 70, '2025-06-14 14:02:59'),
(84, '15', 2, 2, 18, 69, '2025-06-14 14:02:59'),
(85, '15', 2, 2, 22, 86, '2025-06-14 14:02:59'),
(86, '15', 2, 2, 22, 88, '2025-06-14 14:02:59'),
(87, '15', 2, 2, 22, 85, '2025-06-14 14:02:59'),
(88, '15', 2, 2, 22, 87, '2025-06-14 14:02:59'),
(89, '15', 2, 2, 30, 117, '2025-06-14 14:02:59'),
(90, '15', 2, 2, 30, 120, '2025-06-14 14:02:59'),
(91, '15', 2, 2, 30, 119, '2025-06-14 14:02:59'),
(92, '15', 2, 2, 30, 118, '2025-06-14 14:02:59'),
(93, '15', 2, 2, 28, 112, '2025-06-14 14:02:59'),
(94, '15', 2, 2, 28, 111, '2025-06-14 14:02:59'),
(95, '15', 2, 2, 28, 110, '2025-06-14 14:02:59'),
(96, '15', 2, 2, 28, 109, '2025-06-14 14:02:59'),
(97, '15', 2, 2, 19, 75, '2025-06-14 14:02:59'),
(98, '15', 2, 2, 19, 74, '2025-06-14 14:02:59'),
(99, '15', 2, 2, 19, 73, '2025-06-14 14:02:59'),
(100, '15', 2, 2, 19, 76, '2025-06-14 14:02:59'),
(101, '15', 2, 2, 35, 138, '2025-06-14 14:02:59'),
(102, '15', 2, 2, 35, 137, '2025-06-14 14:02:59'),
(103, '15', 2, 2, 35, 140, '2025-06-14 14:02:59'),
(104, '15', 2, 2, 35, 139, '2025-06-14 14:02:59'),
(105, '15', 2, 2, 45, 178, '2025-06-14 14:02:59'),
(106, '15', 2, 2, 45, 177, '2025-06-14 14:02:59'),
(107, '15', 2, 2, 45, 179, '2025-06-14 14:02:59'),
(108, '15', 2, 2, 45, 180, '2025-06-14 14:02:59'),
(109, '15', 2, 2, 40, 160, '2025-06-14 14:02:59'),
(110, '15', 2, 2, 40, 158, '2025-06-14 14:02:59'),
(111, '15', 2, 2, 40, 159, '2025-06-14 14:02:59'),
(112, '15', 2, 2, 40, 157, '2025-06-14 14:02:59'),
(113, '15', 2, 2, 34, 135, '2025-06-14 14:02:59'),
(114, '15', 2, 2, 34, 136, '2025-06-14 14:02:59'),
(115, '15', 2, 2, 34, 133, '2025-06-14 14:02:59'),
(116, '15', 2, 2, 34, 134, '2025-06-14 14:02:59'),
(117, '15', 2, 2, 41, 164, '2025-06-14 14:02:59'),
(118, '15', 2, 2, 41, 163, '2025-06-14 14:02:59'),
(119, '15', 2, 2, 41, 162, '2025-06-14 14:02:59'),
(120, '15', 2, 2, 41, 161, '2025-06-14 14:02:59'),
(121, '0', 2, 2, 1, 4, '2025-06-14 14:03:48'),
(122, '0', 2, 2, 1, 1, '2025-06-14 14:03:48'),
(123, '0', 2, 2, 1, 3, '2025-06-14 14:03:48'),
(124, '0', 2, 2, 1, 2, '2025-06-14 14:03:48'),
(125, '0', 2, 2, 12, 48, '2025-06-14 14:03:48'),
(126, '0', 2, 2, 12, 47, '2025-06-14 14:03:48'),
(127, '0', 2, 2, 12, 46, '2025-06-14 14:03:48'),
(128, '0', 2, 2, 12, 45, '2025-06-14 14:03:48'),
(129, '0', 2, 2, 7, 25, '2025-06-14 14:03:48'),
(130, '0', 2, 2, 7, 26, '2025-06-14 14:03:48'),
(131, '0', 2, 2, 7, 27, '2025-06-14 14:03:48'),
(132, '0', 2, 2, 7, 28, '2025-06-14 14:03:48'),
(133, '0', 2, 2, 11, 44, '2025-06-14 14:03:48'),
(134, '0', 2, 2, 11, 43, '2025-06-14 14:03:48'),
(135, '0', 2, 2, 11, 42, '2025-06-14 14:03:48'),
(136, '0', 2, 2, 11, 41, '2025-06-14 14:03:48'),
(137, '0', 2, 2, 6, 23, '2025-06-14 14:03:48'),
(138, '0', 2, 2, 6, 24, '2025-06-14 14:03:48'),
(139, '0', 2, 2, 6, 21, '2025-06-14 14:03:48'),
(140, '0', 2, 2, 6, 22, '2025-06-14 14:03:48'),
(141, '0', 2, 2, 16, 64, '2025-06-14 14:03:48'),
(142, '0', 2, 2, 16, 62, '2025-06-14 14:03:48'),
(143, '0', 2, 2, 16, 63, '2025-06-14 14:03:48'),
(144, '0', 2, 2, 16, 61, '2025-06-14 14:03:48'),
(145, '0', 2, 2, 28, 112, '2025-06-14 14:03:48'),
(146, '0', 2, 2, 28, 110, '2025-06-14 14:03:48'),
(147, '0', 2, 2, 28, 109, '2025-06-14 14:03:48'),
(148, '0', 2, 2, 28, 111, '2025-06-14 14:03:48'),
(149, '0', 2, 2, 26, 101, '2025-06-14 14:03:48'),
(150, '0', 2, 2, 26, 102, '2025-06-14 14:03:48'),
(151, '0', 2, 2, 26, 103, '2025-06-14 14:03:48'),
(152, '0', 2, 2, 26, 104, '2025-06-14 14:03:48'),
(153, '0', 2, 2, 27, 107, '2025-06-14 14:03:48'),
(154, '0', 2, 2, 27, 106, '2025-06-14 14:03:48'),
(155, '0', 2, 2, 27, 108, '2025-06-14 14:03:48'),
(156, '0', 2, 2, 27, 105, '2025-06-14 14:03:48'),
(157, '0', 2, 2, 24, 96, '2025-06-14 14:03:48'),
(158, '0', 2, 2, 24, 95, '2025-06-14 14:03:48'),
(159, '0', 2, 2, 24, 93, '2025-06-14 14:03:48'),
(160, '0', 2, 2, 24, 94, '2025-06-14 14:03:48'),
(161, '0', 2, 2, 37, 148, '2025-06-14 14:03:48'),
(162, '0', 2, 2, 37, 147, '2025-06-14 14:03:48'),
(163, '0', 2, 2, 37, 145, '2025-06-14 14:03:48'),
(164, '0', 2, 2, 37, 146, '2025-06-14 14:03:48'),
(165, '0', 2, 2, 36, 141, '2025-06-14 14:03:48'),
(166, '0', 2, 2, 36, 142, '2025-06-14 14:03:48'),
(167, '0', 2, 2, 36, 143, '2025-06-14 14:03:48'),
(168, '0', 2, 2, 36, 144, '2025-06-14 14:03:48'),
(169, '0', 2, 2, 43, 170, '2025-06-14 14:03:48'),
(170, '0', 2, 2, 43, 171, '2025-06-14 14:03:48'),
(171, '0', 2, 2, 43, 169, '2025-06-14 14:03:48'),
(172, '0', 2, 2, 43, 172, '2025-06-14 14:03:48'),
(173, '0', 2, 2, 33, 132, '2025-06-14 14:03:48'),
(174, '0', 2, 2, 33, 130, '2025-06-14 14:03:48'),
(175, '0', 2, 2, 33, 131, '2025-06-14 14:03:48'),
(176, '0', 2, 2, 33, 129, '2025-06-14 14:03:48'),
(177, '0', 2, 2, 44, 174, '2025-06-14 14:03:48'),
(178, '0', 2, 2, 44, 173, '2025-06-14 14:03:48'),
(179, '0', 2, 2, 44, 175, '2025-06-14 14:03:48'),
(180, '0', 2, 2, 44, 176, '2025-06-14 14:03:48'),
(181, '20', 2, 2, 4, 13, '2025-06-14 14:09:03'),
(182, '20', 2, 2, 4, 15, '2025-06-14 14:09:03'),
(183, '20', 2, 2, 4, 14, '2025-06-14 14:09:03'),
(184, '20', 2, 2, 4, 16, '2025-06-14 14:09:03'),
(185, '20', 2, 2, 11, 42, '2025-06-14 14:09:03'),
(186, '20', 2, 2, 11, 41, '2025-06-14 14:09:03'),
(187, '20', 2, 2, 11, 43, '2025-06-14 14:09:03'),
(188, '20', 2, 2, 11, 44, '2025-06-14 14:09:03'),
(189, '20', 2, 2, 10, 37, '2025-06-14 14:09:03'),
(190, '20', 2, 2, 10, 38, '2025-06-14 14:09:03'),
(191, '20', 2, 2, 10, 39, '2025-06-14 14:09:03'),
(192, '20', 2, 2, 10, 40, '2025-06-14 14:09:03'),
(193, '20', 2, 2, 14, 56, '2025-06-14 14:09:03'),
(194, '20', 2, 2, 14, 55, '2025-06-14 14:09:03'),
(195, '20', 2, 2, 14, 54, '2025-06-14 14:09:03'),
(196, '20', 2, 2, 14, 53, '2025-06-14 14:09:03'),
(197, '20', 2, 2, 5, 17, '2025-06-14 14:09:03'),
(198, '20', 2, 2, 5, 20, '2025-06-14 14:09:03'),
(199, '20', 2, 2, 5, 18, '2025-06-14 14:09:03'),
(200, '20', 2, 2, 5, 19, '2025-06-14 14:09:03'),
(201, '20', 2, 2, 24, 95, '2025-06-14 14:09:03'),
(202, '20', 2, 2, 24, 94, '2025-06-14 14:09:03'),
(203, '20', 2, 2, 24, 93, '2025-06-14 14:09:03'),
(204, '20', 2, 2, 24, 96, '2025-06-14 14:09:03'),
(205, '20', 2, 2, 23, 92, '2025-06-14 14:09:03'),
(206, '20', 2, 2, 23, 89, '2025-06-14 14:09:03'),
(207, '20', 2, 2, 23, 90, '2025-06-14 14:09:03'),
(208, '20', 2, 2, 23, 91, '2025-06-14 14:09:03'),
(209, '20', 2, 2, 16, 62, '2025-06-14 14:09:03'),
(210, '20', 2, 2, 16, 64, '2025-06-14 14:09:03'),
(211, '20', 2, 2, 16, 61, '2025-06-14 14:09:03'),
(212, '20', 2, 2, 16, 63, '2025-06-14 14:09:03'),
(213, '20', 2, 2, 30, 120, '2025-06-14 14:09:03'),
(214, '20', 2, 2, 30, 118, '2025-06-14 14:09:03'),
(215, '20', 2, 2, 30, 117, '2025-06-14 14:09:03'),
(216, '20', 2, 2, 30, 119, '2025-06-14 14:09:03'),
(217, '20', 2, 2, 26, 102, '2025-06-14 14:09:03'),
(218, '20', 2, 2, 26, 101, '2025-06-14 14:09:03'),
(219, '20', 2, 2, 26, 104, '2025-06-14 14:09:03'),
(220, '20', 2, 2, 26, 103, '2025-06-14 14:09:03'),
(221, '20', 2, 2, 41, 161, '2025-06-14 14:09:03'),
(222, '20', 2, 2, 41, 163, '2025-06-14 14:09:03'),
(223, '20', 2, 2, 41, 164, '2025-06-14 14:09:03'),
(224, '20', 2, 2, 41, 162, '2025-06-14 14:09:03'),
(225, '20', 2, 2, 43, 171, '2025-06-14 14:09:03'),
(226, '20', 2, 2, 43, 170, '2025-06-14 14:09:03'),
(227, '20', 2, 2, 43, 172, '2025-06-14 14:09:03'),
(228, '20', 2, 2, 43, 169, '2025-06-14 14:09:03'),
(229, '20', 2, 2, 38, 149, '2025-06-14 14:09:03'),
(230, '20', 2, 2, 38, 150, '2025-06-14 14:09:03'),
(231, '20', 2, 2, 38, 152, '2025-06-14 14:09:03'),
(232, '20', 2, 2, 38, 151, '2025-06-14 14:09:03'),
(233, '20', 2, 2, 37, 147, '2025-06-14 14:09:03'),
(234, '20', 2, 2, 37, 146, '2025-06-14 14:09:03'),
(235, '20', 2, 2, 37, 148, '2025-06-14 14:09:03'),
(236, '20', 2, 2, 37, 145, '2025-06-14 14:09:03'),
(237, '20', 2, 2, 35, 140, '2025-06-14 14:09:03'),
(238, '20', 2, 2, 35, 138, '2025-06-14 14:09:03'),
(239, '20', 2, 2, 35, 139, '2025-06-14 14:09:03'),
(240, '20', 2, 2, 35, 137, '2025-06-14 14:09:03'),
(241, '0', 3, 3, 56, 223, '2025-06-14 21:56:37'),
(242, '0', 3, 3, 56, 224, '2025-06-14 21:56:37'),
(243, '0', 3, 3, 56, 221, '2025-06-14 21:56:37'),
(244, '0', 3, 3, 56, 222, '2025-06-14 21:56:37'),
(245, '0', 3, 3, 48, 192, '2025-06-14 21:56:37'),
(246, '0', 3, 3, 48, 190, '2025-06-14 21:56:37'),
(247, '0', 3, 3, 48, 189, '2025-06-14 21:56:37'),
(248, '0', 3, 3, 48, 191, '2025-06-14 21:56:37'),
(249, '0', 3, 3, 49, 193, '2025-06-14 21:56:37'),
(250, '0', 3, 3, 49, 196, '2025-06-14 21:56:37'),
(251, '0', 3, 3, 49, 194, '2025-06-14 21:56:37'),
(252, '0', 3, 3, 49, 195, '2025-06-14 21:56:37'),
(253, '0', 3, 3, 46, 183, '2025-06-14 21:56:37'),
(254, '0', 3, 3, 46, 181, '2025-06-14 21:56:37'),
(255, '0', 3, 3, 46, 184, '2025-06-14 21:56:37'),
(256, '0', 3, 3, 46, 182, '2025-06-14 21:56:37'),
(257, '0', 3, 3, 59, 236, '2025-06-14 21:56:37'),
(258, '0', 3, 3, 59, 235, '2025-06-14 21:56:37'),
(259, '0', 3, 3, 59, 234, '2025-06-14 21:56:37'),
(260, '0', 3, 3, 59, 233, '2025-06-14 21:56:37'),
(261, '0', 3, 3, 47, 186, '2025-06-14 21:56:37'),
(262, '0', 3, 3, 47, 187, '2025-06-14 21:56:37'),
(263, '0', 3, 3, 47, 185, '2025-06-14 21:56:37'),
(264, '0', 3, 3, 47, 188, '2025-06-14 21:56:37'),
(265, '0', 3, 3, 57, 228, '2025-06-14 21:56:37'),
(266, '0', 3, 3, 57, 226, '2025-06-14 21:56:37'),
(267, '0', 3, 3, 57, 225, '2025-06-14 21:56:37'),
(268, '0', 3, 3, 57, 227, '2025-06-14 21:56:37'),
(269, '0', 3, 3, 58, 229, '2025-06-14 21:56:37'),
(270, '0', 3, 3, 58, 230, '2025-06-14 21:56:37'),
(271, '0', 3, 3, 58, 231, '2025-06-14 21:56:37'),
(272, '0', 3, 3, 58, 232, '2025-06-14 21:56:37'),
(273, '0', 3, 3, 50, 200, '2025-06-14 21:56:37'),
(274, '0', 3, 3, 50, 199, '2025-06-14 21:56:37'),
(275, '0', 3, 3, 50, 198, '2025-06-14 21:56:37'),
(276, '0', 3, 3, 50, 197, '2025-06-14 21:56:37'),
(277, '0', 3, 3, 60, 237, '2025-06-14 21:56:37'),
(278, '0', 3, 3, 60, 238, '2025-06-14 21:56:37'),
(279, '0', 3, 3, 60, 239, '2025-06-14 21:56:37'),
(280, '0', 3, 3, 60, 240, '2025-06-14 21:56:37'),
(281, '20', 5, 1, 11, 41, '2025-06-15 20:35:32'),
(282, '20', 5, 1, 11, 42, '2025-06-15 20:35:32'),
(283, '20', 5, 1, 11, 44, '2025-06-15 20:35:32'),
(284, '20', 5, 1, 11, 43, '2025-06-15 20:35:32'),
(285, '20', 5, 1, 8, 30, '2025-06-15 20:35:32'),
(286, '20', 5, 1, 8, 29, '2025-06-15 20:35:32'),
(287, '20', 5, 1, 8, 32, '2025-06-15 20:35:32'),
(288, '20', 5, 1, 8, 31, '2025-06-15 20:35:32'),
(289, '20', 5, 1, 14, 54, '2025-06-15 20:35:32'),
(290, '20', 5, 1, 14, 53, '2025-06-15 20:35:32'),
(291, '20', 5, 1, 14, 55, '2025-06-15 20:35:32'),
(292, '20', 5, 1, 14, 56, '2025-06-15 20:35:32'),
(293, '20', 5, 1, 3, 11, '2025-06-15 20:35:32'),
(294, '20', 5, 1, 3, 9, '2025-06-15 20:35:32'),
(295, '20', 5, 1, 3, 12, '2025-06-15 20:35:32'),
(296, '20', 5, 1, 3, 10, '2025-06-15 20:35:32'),
(297, '20', 5, 1, 5, 19, '2025-06-15 20:35:32'),
(298, '20', 5, 1, 5, 18, '2025-06-15 20:35:32'),
(299, '20', 5, 1, 5, 20, '2025-06-15 20:35:32'),
(300, '20', 5, 1, 5, 17, '2025-06-15 20:35:32'),
(301, '20', 5, 1, 24, 95, '2025-06-15 20:35:32'),
(302, '20', 5, 1, 24, 96, '2025-06-15 20:35:32'),
(303, '20', 5, 1, 24, 94, '2025-06-15 20:35:32'),
(304, '20', 5, 1, 24, 93, '2025-06-15 20:35:32'),
(305, '20', 5, 1, 27, 107, '2025-06-15 20:35:32'),
(306, '20', 5, 1, 27, 105, '2025-06-15 20:35:32'),
(307, '20', 5, 1, 27, 106, '2025-06-15 20:35:32'),
(308, '20', 5, 1, 27, 108, '2025-06-15 20:35:32'),
(309, '20', 5, 1, 19, 73, '2025-06-15 20:35:32'),
(310, '20', 5, 1, 19, 75, '2025-06-15 20:35:32'),
(311, '20', 5, 1, 19, 74, '2025-06-15 20:35:32'),
(312, '20', 5, 1, 19, 76, '2025-06-15 20:35:32'),
(313, '20', 5, 1, 20, 78, '2025-06-15 20:35:32'),
(314, '20', 5, 1, 20, 77, '2025-06-15 20:35:32'),
(315, '20', 5, 1, 20, 79, '2025-06-15 20:35:32'),
(316, '20', 5, 1, 20, 80, '2025-06-15 20:35:32'),
(317, '20', 5, 1, 18, 71, '2025-06-15 20:35:32'),
(318, '20', 5, 1, 18, 70, '2025-06-15 20:35:32'),
(319, '20', 5, 1, 18, 69, '2025-06-15 20:35:32'),
(320, '20', 5, 1, 18, 72, '2025-06-15 20:35:32'),
(321, '20', 5, 1, 32, 127, '2025-06-15 20:35:32'),
(322, '20', 5, 1, 32, 128, '2025-06-15 20:35:32'),
(323, '20', 5, 1, 32, 125, '2025-06-15 20:35:32'),
(324, '20', 5, 1, 32, 126, '2025-06-15 20:35:32'),
(325, '20', 5, 1, 31, 124, '2025-06-15 20:35:32'),
(326, '20', 5, 1, 31, 123, '2025-06-15 20:35:32'),
(327, '20', 5, 1, 31, 122, '2025-06-15 20:35:32'),
(328, '20', 5, 1, 31, 121, '2025-06-15 20:35:32'),
(329, '20', 5, 1, 33, 132, '2025-06-15 20:35:32'),
(330, '20', 5, 1, 33, 130, '2025-06-15 20:35:32'),
(331, '20', 5, 1, 33, 131, '2025-06-15 20:35:32'),
(332, '20', 5, 1, 33, 129, '2025-06-15 20:35:32'),
(333, '20', 5, 1, 44, 173, '2025-06-15 20:35:32'),
(334, '20', 5, 1, 44, 174, '2025-06-15 20:35:32'),
(335, '20', 5, 1, 44, 176, '2025-06-15 20:35:32'),
(336, '20', 5, 1, 44, 175, '2025-06-15 20:35:32'),
(337, '20', 5, 1, 36, 141, '2025-06-15 20:35:32'),
(338, '20', 5, 1, 36, 143, '2025-06-15 20:35:32'),
(339, '20', 5, 1, 36, 144, '2025-06-15 20:35:32'),
(340, '20', 5, 1, 36, 142, '2025-06-15 20:35:32'),
(341, '20', 7, 3, 60, 239, '2025-06-15 20:55:28'),
(342, '20', 7, 3, 60, 238, '2025-06-15 20:55:28'),
(343, '20', 7, 3, 60, 237, '2025-06-15 20:55:28'),
(344, '20', 7, 3, 60, 240, '2025-06-15 20:55:28'),
(345, '20', 7, 3, 56, 224, '2025-06-15 20:55:28'),
(346, '20', 7, 3, 56, 221, '2025-06-15 20:55:28'),
(347, '20', 7, 3, 56, 222, '2025-06-15 20:55:28'),
(348, '20', 7, 3, 56, 223, '2025-06-15 20:55:28'),
(349, '20', 7, 3, 52, 205, '2025-06-15 20:55:28'),
(350, '20', 7, 3, 52, 206, '2025-06-15 20:55:28'),
(351, '20', 7, 3, 52, 207, '2025-06-15 20:55:28'),
(352, '20', 7, 3, 52, 208, '2025-06-15 20:55:28'),
(353, '20', 7, 3, 54, 214, '2025-06-15 20:55:28'),
(354, '20', 7, 3, 54, 215, '2025-06-15 20:55:28'),
(355, '20', 7, 3, 54, 213, '2025-06-15 20:55:28'),
(356, '20', 7, 3, 54, 216, '2025-06-15 20:55:28'),
(357, '20', 7, 3, 53, 210, '2025-06-15 20:55:28'),
(358, '20', 7, 3, 53, 209, '2025-06-15 20:55:28'),
(359, '20', 7, 3, 53, 212, '2025-06-15 20:55:28'),
(360, '20', 7, 3, 53, 211, '2025-06-15 20:55:28'),
(361, '20', 7, 3, 74, 294, '2025-06-15 20:55:28'),
(362, '20', 7, 3, 74, 293, '2025-06-15 20:55:28'),
(363, '20', 7, 3, 74, 295, '2025-06-15 20:55:28'),
(364, '20', 7, 3, 74, 296, '2025-06-15 20:55:28'),
(365, '20', 7, 3, 61, 243, '2025-06-15 20:55:28'),
(366, '20', 7, 3, 61, 244, '2025-06-15 20:55:28'),
(367, '20', 7, 3, 61, 241, '2025-06-15 20:55:28'),
(368, '20', 7, 3, 61, 242, '2025-06-15 20:55:28'),
(369, '20', 7, 3, 66, 264, '2025-06-15 20:55:28'),
(370, '20', 7, 3, 66, 262, '2025-06-15 20:55:28'),
(371, '20', 7, 3, 66, 263, '2025-06-15 20:55:28'),
(372, '20', 7, 3, 66, 261, '2025-06-15 20:55:28'),
(373, '20', 7, 3, 70, 277, '2025-06-15 20:55:28'),
(374, '20', 7, 3, 70, 279, '2025-06-15 20:55:28'),
(375, '20', 7, 3, 70, 278, '2025-06-15 20:55:28'),
(376, '20', 7, 3, 70, 280, '2025-06-15 20:55:28'),
(377, '20', 7, 3, 62, 245, '2025-06-15 20:55:28'),
(378, '20', 7, 3, 62, 248, '2025-06-15 20:55:28'),
(379, '20', 7, 3, 62, 247, '2025-06-15 20:55:28'),
(380, '20', 7, 3, 62, 246, '2025-06-15 20:55:28'),
(381, '20', 7, 3, 82, 328, '2025-06-15 20:55:28'),
(382, '20', 7, 3, 82, 326, '2025-06-15 20:55:28'),
(383, '20', 7, 3, 82, 327, '2025-06-15 20:55:28'),
(384, '20', 7, 3, 82, 325, '2025-06-15 20:55:28'),
(385, '20', 7, 3, 90, 360, '2025-06-15 20:55:28'),
(386, '20', 7, 3, 90, 359, '2025-06-15 20:55:28'),
(387, '20', 7, 3, 90, 358, '2025-06-15 20:55:28'),
(388, '20', 7, 3, 90, 357, '2025-06-15 20:55:28'),
(389, '20', 7, 3, 78, 309, '2025-06-15 20:55:28'),
(390, '20', 7, 3, 78, 310, '2025-06-15 20:55:28'),
(391, '20', 7, 3, 78, 311, '2025-06-15 20:55:28'),
(392, '20', 7, 3, 78, 312, '2025-06-15 20:55:28'),
(393, '20', 7, 3, 80, 320, '2025-06-15 20:55:28'),
(394, '20', 7, 3, 80, 319, '2025-06-15 20:55:28'),
(395, '20', 7, 3, 80, 318, '2025-06-15 20:55:28'),
(396, '20', 7, 3, 80, 317, '2025-06-15 20:55:28'),
(397, '20', 7, 3, 89, 356, '2025-06-15 20:55:28'),
(398, '20', 7, 3, 89, 355, '2025-06-15 20:55:28'),
(399, '20', 7, 3, 89, 353, '2025-06-15 20:55:28'),
(400, '20', 7, 3, 89, 354, '2025-06-15 20:55:28'),
(401, '0', 8, 4, 92, 365, '2025-06-15 21:00:58'),
(402, '0', 8, 4, 92, 368, '2025-06-15 21:00:58'),
(403, '0', 8, 4, 92, 366, '2025-06-15 21:00:58'),
(404, '0', 8, 4, 92, 367, '2025-06-15 21:00:58'),
(405, '0', 8, 4, 99, 395, '2025-06-15 21:00:58'),
(406, '0', 8, 4, 99, 396, '2025-06-15 21:00:58'),
(407, '0', 8, 4, 99, 393, '2025-06-15 21:00:58'),
(408, '0', 8, 4, 99, 394, '2025-06-15 21:00:58'),
(409, '0', 8, 4, 96, 381, '2025-06-15 21:00:58'),
(410, '0', 8, 4, 96, 382, '2025-06-15 21:00:58'),
(411, '0', 8, 4, 96, 384, '2025-06-15 21:00:58'),
(412, '0', 8, 4, 96, 383, '2025-06-15 21:00:58'),
(413, '0', 8, 4, 104, 416, '2025-06-15 21:00:58'),
(414, '0', 8, 4, 104, 413, '2025-06-15 21:00:58'),
(415, '0', 8, 4, 104, 414, '2025-06-15 21:00:58'),
(416, '0', 8, 4, 104, 415, '2025-06-15 21:00:58'),
(417, '0', 8, 4, 91, 361, '2025-06-15 21:00:58'),
(418, '0', 8, 4, 91, 364, '2025-06-15 21:00:58'),
(419, '0', 8, 4, 91, 362, '2025-06-15 21:00:58'),
(420, '0', 8, 4, 91, 363, '2025-06-15 21:00:58'),
(421, '0', 8, 4, 116, 464, '2025-06-15 21:00:58'),
(422, '0', 8, 4, 116, 462, '2025-06-15 21:00:58'),
(423, '0', 8, 4, 116, 463, '2025-06-15 21:00:58'),
(424, '0', 8, 4, 116, 461, '2025-06-15 21:00:58'),
(425, '0', 8, 4, 117, 467, '2025-06-15 21:00:58'),
(426, '0', 8, 4, 117, 465, '2025-06-15 21:00:58'),
(427, '0', 8, 4, 117, 466, '2025-06-15 21:00:58'),
(428, '0', 8, 4, 117, 468, '2025-06-15 21:00:58'),
(429, '0', 8, 4, 118, 469, '2025-06-15 21:00:58'),
(430, '0', 8, 4, 118, 470, '2025-06-15 21:00:58'),
(431, '0', 8, 4, 118, 471, '2025-06-15 21:00:58'),
(432, '0', 8, 4, 118, 472, '2025-06-15 21:00:58'),
(433, '0', 8, 4, 119, 476, '2025-06-15 21:00:58'),
(434, '0', 8, 4, 119, 474, '2025-06-15 21:00:58'),
(435, '0', 8, 4, 119, 475, '2025-06-15 21:00:58'),
(436, '0', 8, 4, 119, 473, '2025-06-15 21:00:58'),
(437, '0', 8, 4, 115, 459, '2025-06-15 21:00:58'),
(438, '0', 8, 4, 115, 460, '2025-06-15 21:00:58'),
(439, '0', 8, 4, 115, 457, '2025-06-15 21:00:58'),
(440, '0', 8, 4, 115, 458, '2025-06-15 21:00:58'),
(441, '0', 8, 4, 129, 516, '2025-06-15 21:00:58'),
(442, '0', 8, 4, 129, 514, '2025-06-15 21:00:58'),
(443, '0', 8, 4, 129, 513, '2025-06-15 21:00:58'),
(444, '0', 8, 4, 129, 515, '2025-06-15 21:00:58'),
(445, '0', 8, 4, 123, 490, '2025-06-15 21:00:58'),
(446, '0', 8, 4, 123, 491, '2025-06-15 21:00:58'),
(447, '0', 8, 4, 123, 492, '2025-06-15 21:00:58'),
(448, '0', 8, 4, 123, 489, '2025-06-15 21:00:58'),
(449, '0', 8, 4, 122, 486, '2025-06-15 21:00:58'),
(450, '0', 8, 4, 122, 488, '2025-06-15 21:00:58'),
(451, '0', 8, 4, 122, 487, '2025-06-15 21:00:58'),
(452, '0', 8, 4, 122, 485, '2025-06-15 21:00:58'),
(453, '0', 8, 4, 125, 499, '2025-06-15 21:00:58'),
(454, '0', 8, 4, 125, 500, '2025-06-15 21:00:58'),
(455, '0', 8, 4, 125, 497, '2025-06-15 21:00:58'),
(456, '0', 8, 4, 125, 498, '2025-06-15 21:00:58'),
(457, '0', 8, 4, 128, 509, '2025-06-15 21:00:58'),
(458, '0', 8, 4, 128, 511, '2025-06-15 21:00:58'),
(459, '0', 8, 4, 128, 510, '2025-06-15 21:00:58'),
(460, '0', 8, 4, 128, 512, '2025-06-15 21:00:58'),
(461, '20', 8, 4, 96, 381, '2025-06-15 21:06:33'),
(462, '20', 8, 4, 96, 382, '2025-06-15 21:06:33'),
(463, '20', 8, 4, 96, 384, '2025-06-15 21:06:33'),
(464, '20', 8, 4, 96, 383, '2025-06-15 21:06:33'),
(465, '20', 8, 4, 100, 399, '2025-06-15 21:06:33'),
(466, '20', 8, 4, 100, 400, '2025-06-15 21:06:33'),
(467, '20', 8, 4, 100, 397, '2025-06-15 21:06:33'),
(468, '20', 8, 4, 100, 398, '2025-06-15 21:06:33'),
(469, '20', 8, 4, 93, 371, '2025-06-15 21:06:33'),
(470, '20', 8, 4, 93, 370, '2025-06-15 21:06:33'),
(471, '20', 8, 4, 93, 369, '2025-06-15 21:06:33'),
(472, '20', 8, 4, 93, 372, '2025-06-15 21:06:33'),
(473, '20', 8, 4, 98, 390, '2025-06-15 21:06:33'),
(474, '20', 8, 4, 98, 389, '2025-06-15 21:06:33'),
(475, '20', 8, 4, 98, 391, '2025-06-15 21:06:33'),
(476, '20', 8, 4, 98, 392, '2025-06-15 21:06:33'),
(477, '20', 8, 4, 91, 361, '2025-06-15 21:06:33'),
(478, '20', 8, 4, 91, 363, '2025-06-15 21:06:33'),
(479, '20', 8, 4, 91, 362, '2025-06-15 21:06:33'),
(480, '20', 8, 4, 91, 364, '2025-06-15 21:06:33'),
(481, '20', 8, 4, 115, 458, '2025-06-15 21:06:33'),
(482, '20', 8, 4, 115, 460, '2025-06-15 21:06:33'),
(483, '20', 8, 4, 115, 459, '2025-06-15 21:06:33'),
(484, '20', 8, 4, 115, 457, '2025-06-15 21:06:33'),
(485, '20', 8, 4, 110, 439, '2025-06-15 21:06:33'),
(486, '20', 8, 4, 110, 440, '2025-06-15 21:06:33'),
(487, '20', 8, 4, 110, 437, '2025-06-15 21:06:33'),
(488, '20', 8, 4, 110, 438, '2025-06-15 21:06:33'),
(489, '20', 8, 4, 107, 427, '2025-06-15 21:06:33'),
(490, '20', 8, 4, 107, 425, '2025-06-15 21:06:33'),
(491, '20', 8, 4, 107, 428, '2025-06-15 21:06:33'),
(492, '20', 8, 4, 107, 426, '2025-06-15 21:06:33'),
(493, '20', 8, 4, 106, 423, '2025-06-15 21:06:33'),
(494, '20', 8, 4, 106, 422, '2025-06-15 21:06:33'),
(495, '20', 8, 4, 106, 421, '2025-06-15 21:06:33'),
(496, '20', 8, 4, 106, 424, '2025-06-15 21:06:33'),
(497, '20', 8, 4, 111, 441, '2025-06-15 21:06:33'),
(498, '20', 8, 4, 111, 443, '2025-06-15 21:06:33'),
(499, '20', 8, 4, 111, 444, '2025-06-15 21:06:33'),
(500, '20', 8, 4, 111, 442, '2025-06-15 21:06:33'),
(501, '20', 8, 4, 127, 507, '2025-06-15 21:06:33'),
(502, '20', 8, 4, 127, 506, '2025-06-15 21:06:33'),
(503, '20', 8, 4, 127, 508, '2025-06-15 21:06:33'),
(504, '20', 8, 4, 127, 505, '2025-06-15 21:06:33'),
(505, '20', 8, 4, 121, 481, '2025-06-15 21:06:33'),
(506, '20', 8, 4, 121, 483, '2025-06-15 21:06:33'),
(507, '20', 8, 4, 121, 482, '2025-06-15 21:06:33'),
(508, '20', 8, 4, 121, 484, '2025-06-15 21:06:33'),
(509, '20', 8, 4, 125, 499, '2025-06-15 21:06:33'),
(510, '20', 8, 4, 125, 498, '2025-06-15 21:06:33'),
(511, '20', 8, 4, 125, 497, '2025-06-15 21:06:33'),
(512, '20', 8, 4, 125, 500, '2025-06-15 21:06:33'),
(513, '20', 8, 4, 128, 509, '2025-06-15 21:06:33'),
(514, '20', 8, 4, 128, 510, '2025-06-15 21:06:33'),
(515, '20', 8, 4, 128, 512, '2025-06-15 21:06:33'),
(516, '20', 8, 4, 128, 511, '2025-06-15 21:06:33'),
(517, '20', 8, 4, 130, 520, '2025-06-15 21:06:33'),
(518, '20', 8, 4, 130, 518, '2025-06-15 21:06:33'),
(519, '20', 8, 4, 130, 519, '2025-06-15 21:06:33'),
(520, '20', 8, 4, 130, 517, '2025-06-15 21:06:33'),
(521, '0', 7, 3, 50, 198, '2025-06-15 21:14:38'),
(522, '0', 7, 3, 50, 199, '2025-06-15 21:14:38'),
(523, '0', 7, 3, 50, 200, '2025-06-15 21:14:38'),
(524, '0', 7, 3, 50, 197, '2025-06-15 21:14:38'),
(525, '0', 7, 3, 55, 218, '2025-06-15 21:14:38'),
(526, '0', 7, 3, 55, 217, '2025-06-15 21:14:38'),
(527, '0', 7, 3, 55, 219, '2025-06-15 21:14:38'),
(528, '0', 7, 3, 55, 220, '2025-06-15 21:14:38'),
(529, '0', 7, 3, 57, 227, '2025-06-15 21:14:38'),
(530, '0', 7, 3, 57, 225, '2025-06-15 21:14:38'),
(531, '0', 7, 3, 57, 228, '2025-06-15 21:14:38'),
(532, '0', 7, 3, 57, 226, '2025-06-15 21:14:38'),
(533, '0', 7, 3, 60, 240, '2025-06-15 21:14:38'),
(534, '0', 7, 3, 60, 237, '2025-06-15 21:14:38'),
(535, '0', 7, 3, 60, 239, '2025-06-15 21:14:38'),
(536, '0', 7, 3, 60, 238, '2025-06-15 21:14:38'),
(537, '0', 7, 3, 48, 192, '2025-06-15 21:14:38'),
(538, '0', 7, 3, 48, 189, '2025-06-15 21:14:38'),
(539, '0', 7, 3, 48, 190, '2025-06-15 21:14:38'),
(540, '0', 7, 3, 48, 191, '2025-06-15 21:14:38'),
(541, '0', 7, 3, 69, 276, '2025-06-15 21:14:38'),
(542, '0', 7, 3, 69, 273, '2025-06-15 21:14:38'),
(543, '0', 7, 3, 69, 274, '2025-06-15 21:14:38'),
(544, '0', 7, 3, 69, 275, '2025-06-15 21:14:38'),
(545, '0', 7, 3, 73, 291, '2025-06-15 21:14:38'),
(546, '0', 7, 3, 73, 289, '2025-06-15 21:14:38'),
(547, '0', 7, 3, 73, 290, '2025-06-15 21:14:38'),
(548, '0', 7, 3, 73, 292, '2025-06-15 21:14:38'),
(549, '0', 7, 3, 67, 265, '2025-06-15 21:14:38'),
(550, '0', 7, 3, 67, 266, '2025-06-15 21:14:38'),
(551, '0', 7, 3, 67, 267, '2025-06-15 21:14:38'),
(552, '0', 7, 3, 67, 268, '2025-06-15 21:14:38'),
(553, '0', 7, 3, 68, 269, '2025-06-15 21:14:38'),
(554, '0', 7, 3, 68, 272, '2025-06-15 21:14:38'),
(555, '0', 7, 3, 68, 270, '2025-06-15 21:14:38'),
(556, '0', 7, 3, 68, 271, '2025-06-15 21:14:38'),
(557, '0', 7, 3, 71, 283, '2025-06-15 21:14:38'),
(558, '0', 7, 3, 71, 282, '2025-06-15 21:14:38'),
(559, '0', 7, 3, 71, 284, '2025-06-15 21:14:38'),
(560, '0', 7, 3, 71, 281, '2025-06-15 21:14:38'),
(561, '0', 7, 3, 87, 345, '2025-06-15 21:14:38'),
(562, '0', 7, 3, 87, 346, '2025-06-15 21:14:38'),
(563, '0', 7, 3, 87, 348, '2025-06-15 21:14:38'),
(564, '0', 7, 3, 87, 347, '2025-06-15 21:14:38'),
(565, '0', 7, 3, 88, 350, '2025-06-15 21:14:38'),
(566, '0', 7, 3, 88, 351, '2025-06-15 21:14:38'),
(567, '0', 7, 3, 88, 349, '2025-06-15 21:14:38'),
(568, '0', 7, 3, 88, 352, '2025-06-15 21:14:38'),
(569, '0', 7, 3, 89, 356, '2025-06-15 21:14:38'),
(570, '0', 7, 3, 89, 354, '2025-06-15 21:14:38'),
(571, '0', 7, 3, 89, 353, '2025-06-15 21:14:38'),
(572, '0', 7, 3, 89, 355, '2025-06-15 21:14:38'),
(573, '0', 7, 3, 85, 338, '2025-06-15 21:14:38'),
(574, '0', 7, 3, 85, 340, '2025-06-15 21:14:38'),
(575, '0', 7, 3, 85, 339, '2025-06-15 21:14:38'),
(576, '0', 7, 3, 85, 337, '2025-06-15 21:14:38'),
(577, '0', 7, 3, 79, 316, '2025-06-15 21:14:38'),
(578, '0', 7, 3, 79, 314, '2025-06-15 21:14:38'),
(579, '0', 7, 3, 79, 313, '2025-06-15 21:14:38'),
(580, '0', 7, 3, 79, 315, '2025-06-15 21:14:38'),
(581, '23', 8, 4, 92, 368, '2025-06-16 16:19:05'),
(582, '23', 8, 4, 92, 367, '2025-06-16 16:19:05'),
(583, '23', 8, 4, 92, 366, '2025-06-16 16:19:05'),
(584, '23', 8, 4, 92, 365, '2025-06-16 16:19:05'),
(585, '23', 8, 4, 99, 394, '2025-06-16 16:19:05'),
(586, '23', 8, 4, 99, 395, '2025-06-16 16:19:05'),
(587, '23', 8, 4, 99, 393, '2025-06-16 16:19:05'),
(588, '23', 8, 4, 99, 396, '2025-06-16 16:19:05'),
(589, '23', 8, 4, 101, 402, '2025-06-16 16:19:05'),
(590, '23', 8, 4, 101, 403, '2025-06-16 16:19:05'),
(591, '23', 8, 4, 101, 404, '2025-06-16 16:19:05'),
(592, '23', 8, 4, 101, 401, '2025-06-16 16:19:05'),
(593, '23', 8, 4, 91, 362, '2025-06-16 16:19:05'),
(594, '23', 8, 4, 91, 363, '2025-06-16 16:19:05'),
(595, '23', 8, 4, 91, 364, '2025-06-16 16:19:05'),
(596, '23', 8, 4, 91, 361, '2025-06-16 16:19:05'),
(597, '23', 8, 4, 97, 388, '2025-06-16 16:19:05'),
(598, '23', 8, 4, 97, 385, '2025-06-16 16:19:05'),
(599, '23', 8, 4, 97, 387, '2025-06-16 16:19:05'),
(600, '23', 8, 4, 97, 386, '2025-06-16 16:19:05'),
(601, '23', 8, 4, 113, 451, '2025-06-16 16:19:05'),
(602, '23', 8, 4, 113, 452, '2025-06-16 16:19:05'),
(603, '23', 8, 4, 113, 449, '2025-06-16 16:19:05'),
(604, '23', 8, 4, 113, 450, '2025-06-16 16:19:05'),
(605, '23', 8, 4, 111, 441, '2025-06-16 16:19:05'),
(606, '23', 8, 4, 111, 444, '2025-06-16 16:19:05'),
(607, '23', 8, 4, 111, 442, '2025-06-16 16:19:05'),
(608, '23', 8, 4, 111, 443, '2025-06-16 16:19:05'),
(609, '23', 8, 4, 114, 456, '2025-06-16 16:19:05'),
(610, '23', 8, 4, 114, 453, '2025-06-16 16:19:05'),
(611, '23', 8, 4, 114, 454, '2025-06-16 16:19:05'),
(612, '23', 8, 4, 114, 455, '2025-06-16 16:19:05'),
(613, '23', 8, 4, 110, 439, '2025-06-16 16:19:05'),
(614, '23', 8, 4, 110, 438, '2025-06-16 16:19:05'),
(615, '23', 8, 4, 110, 440, '2025-06-16 16:19:05'),
(616, '23', 8, 4, 110, 437, '2025-06-16 16:19:05'),
(617, '23', 8, 4, 106, 424, '2025-06-16 16:19:05'),
(618, '23', 8, 4, 106, 421, '2025-06-16 16:19:05'),
(619, '23', 8, 4, 106, 422, '2025-06-16 16:19:05'),
(620, '23', 8, 4, 106, 423, '2025-06-16 16:19:05'),
(621, '23', 8, 4, 126, 503, '2025-06-16 16:19:05'),
(622, '23', 8, 4, 126, 501, '2025-06-16 16:19:05'),
(623, '23', 8, 4, 126, 502, '2025-06-16 16:19:05'),
(624, '23', 8, 4, 126, 504, '2025-06-16 16:19:05'),
(625, '23', 8, 4, 129, 516, '2025-06-16 16:19:05'),
(626, '23', 8, 4, 129, 515, '2025-06-16 16:19:05'),
(627, '23', 8, 4, 129, 514, '2025-06-16 16:19:05'),
(628, '23', 8, 4, 129, 513, '2025-06-16 16:19:05'),
(629, '23', 8, 4, 123, 489, '2025-06-16 16:19:05'),
(630, '23', 8, 4, 123, 492, '2025-06-16 16:19:05'),
(631, '23', 8, 4, 123, 491, '2025-06-16 16:19:05'),
(632, '23', 8, 4, 123, 490, '2025-06-16 16:19:05'),
(633, '23', 8, 4, 121, 484, '2025-06-16 16:19:05'),
(634, '23', 8, 4, 121, 483, '2025-06-16 16:19:05'),
(635, '23', 8, 4, 121, 481, '2025-06-16 16:19:05'),
(636, '23', 8, 4, 121, 482, '2025-06-16 16:19:05'),
(637, '23', 8, 4, 131, 522, '2025-06-16 16:19:05'),
(638, '23', 8, 4, 131, 524, '2025-06-16 16:19:05'),
(639, '23', 8, 4, 131, 523, '2025-06-16 16:19:05'),
(640, '23', 8, 4, 131, 521, '2025-06-16 16:19:05'),
(641, '24', 8, 4, 95, 377, '2025-06-16 16:32:43'),
(642, '24', 8, 4, 95, 378, '2025-06-16 16:32:43'),
(643, '24', 8, 4, 95, 379, '2025-06-16 16:32:43'),
(644, '24', 8, 4, 95, 380, '2025-06-16 16:32:43'),
(645, '24', 8, 4, 92, 368, '2025-06-16 16:32:43'),
(646, '24', 8, 4, 92, 367, '2025-06-16 16:32:43'),
(647, '24', 8, 4, 92, 365, '2025-06-16 16:32:43'),
(648, '24', 8, 4, 92, 366, '2025-06-16 16:32:43'),
(649, '24', 8, 4, 99, 396, '2025-06-16 16:32:43'),
(650, '24', 8, 4, 99, 393, '2025-06-16 16:32:43'),
(651, '24', 8, 4, 99, 395, '2025-06-16 16:32:43'),
(652, '24', 8, 4, 99, 394, '2025-06-16 16:32:43'),
(653, '24', 8, 4, 94, 376, '2025-06-16 16:32:43'),
(654, '24', 8, 4, 94, 373, '2025-06-16 16:32:43'),
(655, '24', 8, 4, 94, 375, '2025-06-16 16:32:43'),
(656, '24', 8, 4, 94, 374, '2025-06-16 16:32:43'),
(657, '24', 8, 4, 97, 386, '2025-06-16 16:32:43'),
(658, '24', 8, 4, 97, 385, '2025-06-16 16:32:43'),
(659, '24', 8, 4, 97, 388, '2025-06-16 16:32:43'),
(660, '24', 8, 4, 97, 387, '2025-06-16 16:32:43'),
(661, '24', 8, 4, 112, 447, '2025-06-16 16:32:43'),
(662, '24', 8, 4, 112, 445, '2025-06-16 16:32:43'),
(663, '24', 8, 4, 112, 448, '2025-06-16 16:32:43'),
(664, '24', 8, 4, 112, 446, '2025-06-16 16:32:43'),
(665, '24', 8, 4, 119, 474, '2025-06-16 16:32:43'),
(666, '24', 8, 4, 119, 475, '2025-06-16 16:32:43'),
(667, '24', 8, 4, 119, 473, '2025-06-16 16:32:43'),
(668, '24', 8, 4, 119, 476, '2025-06-16 16:32:43'),
(669, '24', 8, 4, 115, 457, '2025-06-16 16:32:43'),
(670, '24', 8, 4, 115, 458, '2025-06-16 16:32:43'),
(671, '24', 8, 4, 115, 460, '2025-06-16 16:32:43'),
(672, '24', 8, 4, 115, 459, '2025-06-16 16:32:43'),
(673, '24', 8, 4, 106, 421, '2025-06-16 16:32:43'),
(674, '24', 8, 4, 106, 424, '2025-06-16 16:32:43'),
(675, '24', 8, 4, 106, 423, '2025-06-16 16:32:43'),
(676, '24', 8, 4, 106, 422, '2025-06-16 16:32:43'),
(677, '24', 8, 4, 109, 433, '2025-06-16 16:32:43'),
(678, '24', 8, 4, 109, 436, '2025-06-16 16:32:43'),
(679, '24', 8, 4, 109, 435, '2025-06-16 16:32:43'),
(680, '24', 8, 4, 109, 434, '2025-06-16 16:32:43'),
(681, '24', 8, 4, 128, 511, '2025-06-16 16:32:43'),
(682, '24', 8, 4, 128, 512, '2025-06-16 16:32:43'),
(683, '24', 8, 4, 128, 509, '2025-06-16 16:32:43'),
(684, '24', 8, 4, 128, 510, '2025-06-16 16:32:43'),
(685, '24', 8, 4, 133, 532, '2025-06-16 16:32:43'),
(686, '24', 8, 4, 133, 529, '2025-06-16 16:32:43'),
(687, '24', 8, 4, 133, 531, '2025-06-16 16:32:43'),
(688, '24', 8, 4, 133, 530, '2025-06-16 16:32:43'),
(689, '24', 8, 4, 122, 487, '2025-06-16 16:32:43'),
(690, '24', 8, 4, 122, 486, '2025-06-16 16:32:43'),
(691, '24', 8, 4, 122, 488, '2025-06-16 16:32:43'),
(692, '24', 8, 4, 122, 485, '2025-06-16 16:32:43'),
(693, '24', 8, 4, 124, 494, '2025-06-16 16:32:43'),
(694, '24', 8, 4, 124, 493, '2025-06-16 16:32:43'),
(695, '24', 8, 4, 124, 496, '2025-06-16 16:32:43'),
(696, '24', 8, 4, 124, 495, '2025-06-16 16:32:43'),
(697, '24', 8, 4, 125, 500, '2025-06-16 16:32:43'),
(698, '24', 8, 4, 125, 499, '2025-06-16 16:32:43'),
(699, '24', 8, 4, 125, 498, '2025-06-16 16:32:43'),
(700, '24', 8, 4, 125, 497, '2025-06-16 16:32:43'),
(701, '25', 8, 4, 104, 413, '2025-06-16 19:13:28'),
(702, '25', 8, 4, 104, 415, '2025-06-16 19:13:28'),
(703, '25', 8, 4, 104, 416, '2025-06-16 19:13:28'),
(704, '25', 8, 4, 104, 414, '2025-06-16 19:13:28'),
(705, '25', 8, 4, 100, 400, '2025-06-16 19:13:28'),
(706, '25', 8, 4, 100, 397, '2025-06-16 19:13:28'),
(707, '25', 8, 4, 100, 398, '2025-06-16 19:13:28'),
(708, '25', 8, 4, 100, 399, '2025-06-16 19:13:28'),
(709, '25', 8, 4, 105, 420, '2025-06-16 19:13:28'),
(710, '25', 8, 4, 105, 418, '2025-06-16 19:13:28'),
(711, '25', 8, 4, 105, 417, '2025-06-16 19:13:28'),
(712, '25', 8, 4, 105, 419, '2025-06-16 19:13:28'),
(713, '25', 8, 4, 98, 390, '2025-06-16 19:13:28'),
(714, '25', 8, 4, 98, 391, '2025-06-16 19:13:28'),
(715, '25', 8, 4, 98, 392, '2025-06-16 19:13:28'),
(716, '25', 8, 4, 98, 389, '2025-06-16 19:13:28'),
(717, '25', 8, 4, 101, 402, '2025-06-16 19:13:28'),
(718, '25', 8, 4, 101, 401, '2025-06-16 19:13:28'),
(719, '25', 8, 4, 101, 403, '2025-06-16 19:13:28'),
(720, '25', 8, 4, 101, 404, '2025-06-16 19:13:28'),
(721, '25', 8, 4, 120, 479, '2025-06-16 19:13:28'),
(722, '25', 8, 4, 120, 477, '2025-06-16 19:13:28'),
(723, '25', 8, 4, 120, 478, '2025-06-16 19:13:28'),
(724, '25', 8, 4, 120, 480, '2025-06-16 19:13:28'),
(725, '25', 8, 4, 115, 459, '2025-06-16 19:13:28'),
(726, '25', 8, 4, 115, 457, '2025-06-16 19:13:28'),
(727, '25', 8, 4, 115, 460, '2025-06-16 19:13:28'),
(728, '25', 8, 4, 115, 458, '2025-06-16 19:13:28'),
(729, '25', 8, 4, 116, 464, '2025-06-16 19:13:28'),
(730, '25', 8, 4, 116, 461, '2025-06-16 19:13:28'),
(731, '25', 8, 4, 116, 462, '2025-06-16 19:13:28'),
(732, '25', 8, 4, 116, 463, '2025-06-16 19:13:28'),
(733, '25', 8, 4, 119, 473, '2025-06-16 19:13:28'),
(734, '25', 8, 4, 119, 474, '2025-06-16 19:13:28'),
(735, '25', 8, 4, 119, 476, '2025-06-16 19:13:28'),
(736, '25', 8, 4, 119, 475, '2025-06-16 19:13:28'),
(737, '25', 8, 4, 118, 470, '2025-06-16 19:13:28'),
(738, '25', 8, 4, 118, 472, '2025-06-16 19:13:28'),
(739, '25', 8, 4, 118, 469, '2025-06-16 19:13:28'),
(740, '25', 8, 4, 118, 471, '2025-06-16 19:13:28'),
(741, '25', 8, 4, 132, 525, '2025-06-16 19:13:28'),
(742, '25', 8, 4, 132, 527, '2025-06-16 19:13:28'),
(743, '25', 8, 4, 132, 526, '2025-06-16 19:13:28'),
(744, '25', 8, 4, 132, 528, '2025-06-16 19:13:28'),
(745, '25', 8, 4, 134, 533, '2025-06-16 19:13:28'),
(746, '25', 8, 4, 134, 536, '2025-06-16 19:13:28'),
(747, '25', 8, 4, 134, 534, '2025-06-16 19:13:28'),
(748, '25', 8, 4, 134, 535, '2025-06-16 19:13:28'),
(749, '25', 8, 4, 129, 515, '2025-06-16 19:13:28'),
(750, '25', 8, 4, 129, 513, '2025-06-16 19:13:28'),
(751, '25', 8, 4, 129, 516, '2025-06-16 19:13:28'),
(752, '25', 8, 4, 129, 514, '2025-06-16 19:13:28'),
(753, '25', 8, 4, 126, 501, '2025-06-16 19:13:28'),
(754, '25', 8, 4, 126, 503, '2025-06-16 19:13:28'),
(755, '25', 8, 4, 126, 502, '2025-06-16 19:13:28'),
(756, '25', 8, 4, 126, 504, '2025-06-16 19:13:28'),
(757, '25', 8, 4, 128, 509, '2025-06-16 19:13:28'),
(758, '25', 8, 4, 128, 512, '2025-06-16 19:13:28'),
(759, '25', 8, 4, 128, 511, '2025-06-16 19:13:28'),
(760, '25', 8, 4, 128, 510, '2025-06-16 19:13:28'),
(761, '24', 7, 3, 55, 219, '2025-06-16 19:42:01'),
(762, '24', 7, 3, 55, 218, '2025-06-16 19:42:01'),
(763, '24', 7, 3, 55, 217, '2025-06-16 19:42:01'),
(764, '24', 7, 3, 55, 220, '2025-06-16 19:42:01'),
(765, '24', 7, 3, 54, 215, '2025-06-16 19:42:01'),
(766, '24', 7, 3, 54, 216, '2025-06-16 19:42:01'),
(767, '24', 7, 3, 54, 213, '2025-06-16 19:42:01'),
(768, '24', 7, 3, 54, 214, '2025-06-16 19:42:01'),
(769, '24', 7, 3, 59, 236, '2025-06-16 19:42:01'),
(770, '24', 7, 3, 59, 234, '2025-06-16 19:42:01'),
(771, '24', 7, 3, 59, 235, '2025-06-16 19:42:01'),
(772, '24', 7, 3, 59, 233, '2025-06-16 19:42:01'),
(773, '24', 7, 3, 47, 187, '2025-06-16 19:42:01'),
(774, '24', 7, 3, 47, 188, '2025-06-16 19:42:01'),
(775, '24', 7, 3, 47, 185, '2025-06-16 19:42:01'),
(776, '24', 7, 3, 47, 186, '2025-06-16 19:42:01'),
(777, '24', 7, 3, 51, 204, '2025-06-16 19:42:01'),
(778, '24', 7, 3, 51, 202, '2025-06-16 19:42:01'),
(779, '24', 7, 3, 51, 201, '2025-06-16 19:42:01'),
(780, '24', 7, 3, 51, 203, '2025-06-16 19:42:01'),
(781, '24', 7, 3, 65, 259, '2025-06-16 19:42:01'),
(782, '24', 7, 3, 65, 257, '2025-06-16 19:42:01'),
(783, '24', 7, 3, 65, 260, '2025-06-16 19:42:01'),
(784, '24', 7, 3, 65, 258, '2025-06-16 19:42:01'),
(785, '24', 7, 3, 62, 247, '2025-06-16 19:42:01'),
(786, '24', 7, 3, 62, 245, '2025-06-16 19:42:01'),
(787, '24', 7, 3, 62, 246, '2025-06-16 19:42:01'),
(788, '24', 7, 3, 62, 248, '2025-06-16 19:42:01'),
(789, '24', 7, 3, 61, 243, '2025-06-16 19:42:01'),
(790, '24', 7, 3, 61, 241, '2025-06-16 19:42:01'),
(791, '24', 7, 3, 61, 244, '2025-06-16 19:42:01'),
(792, '24', 7, 3, 61, 242, '2025-06-16 19:42:01'),
(793, '24', 7, 3, 73, 289, '2025-06-16 19:42:01'),
(794, '24', 7, 3, 73, 290, '2025-06-16 19:42:01'),
(795, '24', 7, 3, 73, 291, '2025-06-16 19:42:01'),
(796, '24', 7, 3, 73, 292, '2025-06-16 19:42:01'),
(797, '24', 7, 3, 63, 250, '2025-06-16 19:42:01'),
(798, '24', 7, 3, 63, 251, '2025-06-16 19:42:01'),
(799, '24', 7, 3, 63, 249, '2025-06-16 19:42:01'),
(800, '24', 7, 3, 63, 252, '2025-06-16 19:42:01'),
(801, '24', 7, 3, 89, 355, '2025-06-16 19:42:01'),
(802, '24', 7, 3, 89, 353, '2025-06-16 19:42:01'),
(803, '24', 7, 3, 89, 354, '2025-06-16 19:42:01'),
(804, '24', 7, 3, 89, 356, '2025-06-16 19:42:01'),
(805, '24', 7, 3, 84, 333, '2025-06-16 19:42:01'),
(806, '24', 7, 3, 84, 334, '2025-06-16 19:42:01'),
(807, '24', 7, 3, 84, 335, '2025-06-16 19:42:01'),
(808, '24', 7, 3, 84, 336, '2025-06-16 19:42:01'),
(809, '24', 7, 3, 88, 351, '2025-06-16 19:42:01'),
(810, '24', 7, 3, 88, 350, '2025-06-16 19:42:01'),
(811, '24', 7, 3, 88, 352, '2025-06-16 19:42:01'),
(812, '24', 7, 3, 88, 349, '2025-06-16 19:42:01'),
(813, '24', 7, 3, 76, 301, '2025-06-16 19:42:01'),
(814, '24', 7, 3, 76, 302, '2025-06-16 19:42:01'),
(815, '24', 7, 3, 76, 303, '2025-06-16 19:42:01'),
(816, '24', 7, 3, 76, 304, '2025-06-16 19:42:01'),
(817, '24', 7, 3, 87, 348, '2025-06-16 19:42:01'),
(818, '24', 7, 3, 87, 345, '2025-06-16 19:42:01'),
(819, '24', 7, 3, 87, 347, '2025-06-16 19:42:01'),
(820, '24', 7, 3, 87, 346, '2025-06-16 19:42:01'),
(821, '25', 7, 3, 48, 190, '2025-06-16 19:45:18'),
(822, '25', 7, 3, 48, 189, '2025-06-16 19:45:18'),
(823, '25', 7, 3, 48, 192, '2025-06-16 19:45:18'),
(824, '25', 7, 3, 48, 191, '2025-06-16 19:45:18'),
(825, '25', 7, 3, 55, 220, '2025-06-16 19:45:18'),
(826, '25', 7, 3, 55, 218, '2025-06-16 19:45:18'),
(827, '25', 7, 3, 55, 217, '2025-06-16 19:45:18'),
(828, '25', 7, 3, 55, 219, '2025-06-16 19:45:18'),
(829, '25', 7, 3, 58, 232, '2025-06-16 19:45:18'),
(830, '25', 7, 3, 58, 231, '2025-06-16 19:45:18'),
(831, '25', 7, 3, 58, 229, '2025-06-16 19:45:18'),
(832, '25', 7, 3, 58, 230, '2025-06-16 19:45:18'),
(833, '25', 7, 3, 59, 234, '2025-06-16 19:45:18'),
(834, '25', 7, 3, 59, 233, '2025-06-16 19:45:18'),
(835, '25', 7, 3, 59, 236, '2025-06-16 19:45:18'),
(836, '25', 7, 3, 59, 235, '2025-06-16 19:45:18'),
(837, '25', 7, 3, 49, 194, '2025-06-16 19:45:18'),
(838, '25', 7, 3, 49, 193, '2025-06-16 19:45:18'),
(839, '25', 7, 3, 49, 195, '2025-06-16 19:45:18'),
(840, '25', 7, 3, 49, 196, '2025-06-16 19:45:18'),
(841, '25', 7, 3, 71, 282, '2025-06-16 19:45:18'),
(842, '25', 7, 3, 71, 283, '2025-06-16 19:45:18'),
(843, '25', 7, 3, 71, 281, '2025-06-16 19:45:18'),
(844, '25', 7, 3, 71, 284, '2025-06-16 19:45:18'),
(845, '25', 7, 3, 69, 273, '2025-06-16 19:45:18'),
(846, '25', 7, 3, 69, 274, '2025-06-16 19:45:18'),
(847, '25', 7, 3, 69, 275, '2025-06-16 19:45:18'),
(848, '25', 7, 3, 69, 276, '2025-06-16 19:45:18'),
(849, '25', 7, 3, 61, 241, '2025-06-16 19:45:18'),
(850, '25', 7, 3, 61, 243, '2025-06-16 19:45:18'),
(851, '25', 7, 3, 61, 242, '2025-06-16 19:45:18'),
(852, '25', 7, 3, 61, 244, '2025-06-16 19:45:18'),
(853, '25', 7, 3, 72, 287, '2025-06-16 19:45:18'),
(854, '25', 7, 3, 72, 285, '2025-06-16 19:45:18'),
(855, '25', 7, 3, 72, 286, '2025-06-16 19:45:18'),
(856, '25', 7, 3, 72, 288, '2025-06-16 19:45:18'),
(857, '25', 7, 3, 64, 254, '2025-06-16 19:45:18'),
(858, '25', 7, 3, 64, 253, '2025-06-16 19:45:18'),
(859, '25', 7, 3, 64, 255, '2025-06-16 19:45:18'),
(860, '25', 7, 3, 64, 256, '2025-06-16 19:45:18'),
(861, '25', 7, 3, 90, 357, '2025-06-16 19:45:18'),
(862, '25', 7, 3, 90, 359, '2025-06-16 19:45:18'),
(863, '25', 7, 3, 90, 358, '2025-06-16 19:45:18'),
(864, '25', 7, 3, 90, 360, '2025-06-16 19:45:18'),
(865, '25', 7, 3, 78, 311, '2025-06-16 19:45:18'),
(866, '25', 7, 3, 78, 310, '2025-06-16 19:45:18'),
(867, '25', 7, 3, 78, 309, '2025-06-16 19:45:18'),
(868, '25', 7, 3, 78, 312, '2025-06-16 19:45:18'),
(869, '25', 7, 3, 84, 334, '2025-06-16 19:45:18'),
(870, '25', 7, 3, 84, 335, '2025-06-16 19:45:18'),
(871, '25', 7, 3, 84, 336, '2025-06-16 19:45:18'),
(872, '25', 7, 3, 84, 333, '2025-06-16 19:45:18'),
(873, '25', 7, 3, 79, 313, '2025-06-16 19:45:18'),
(874, '25', 7, 3, 79, 315, '2025-06-16 19:45:18'),
(875, '25', 7, 3, 79, 316, '2025-06-16 19:45:18'),
(876, '25', 7, 3, 79, 314, '2025-06-16 19:45:18'),
(877, '25', 7, 3, 77, 306, '2025-06-16 19:45:18'),
(878, '25', 7, 3, 77, 308, '2025-06-16 19:45:18'),
(879, '25', 7, 3, 77, 307, '2025-06-16 19:45:18'),
(880, '25', 7, 3, 77, 305, '2025-06-16 19:45:18'),
(881, '1', 7, 3, 53, 212, '2025-06-17 14:13:19'),
(882, '1', 7, 3, 53, 210, '2025-06-17 14:13:19'),
(883, '1', 7, 3, 53, 211, '2025-06-17 14:13:19'),
(884, '1', 7, 3, 53, 209, '2025-06-17 14:13:19'),
(885, '1', 7, 3, 48, 191, '2025-06-17 14:13:19'),
(886, '1', 7, 3, 48, 190, '2025-06-17 14:13:19'),
(887, '1', 7, 3, 48, 192, '2025-06-17 14:13:19'),
(888, '1', 7, 3, 48, 189, '2025-06-17 14:13:19'),
(889, '1', 7, 3, 59, 234, '2025-06-17 14:13:19'),
(890, '1', 7, 3, 59, 233, '2025-06-17 14:13:19'),
(891, '1', 7, 3, 59, 236, '2025-06-17 14:13:19'),
(892, '1', 7, 3, 59, 235, '2025-06-17 14:13:19'),
(893, '1', 7, 3, 55, 220, '2025-06-17 14:13:19'),
(894, '1', 7, 3, 55, 219, '2025-06-17 14:13:19'),
(895, '1', 7, 3, 55, 217, '2025-06-17 14:13:19'),
(896, '1', 7, 3, 55, 218, '2025-06-17 14:13:19'),
(897, '1', 7, 3, 56, 224, '2025-06-17 14:13:19'),
(898, '1', 7, 3, 56, 223, '2025-06-17 14:13:19'),
(899, '1', 7, 3, 56, 222, '2025-06-17 14:13:19'),
(900, '1', 7, 3, 56, 221, '2025-06-17 14:13:19'),
(901, '1', 7, 3, 75, 300, '2025-06-17 14:13:19'),
(902, '1', 7, 3, 75, 299, '2025-06-17 14:13:19'),
(903, '1', 7, 3, 75, 297, '2025-06-17 14:13:19'),
(904, '1', 7, 3, 75, 298, '2025-06-17 14:13:19'),
(905, '1', 7, 3, 72, 287, '2025-06-17 14:13:19'),
(906, '1', 7, 3, 72, 285, '2025-06-17 14:13:19'),
(907, '1', 7, 3, 72, 286, '2025-06-17 14:13:19'),
(908, '1', 7, 3, 72, 288, '2025-06-17 14:13:19'),
(909, '1', 7, 3, 65, 259, '2025-06-17 14:13:19'),
(910, '1', 7, 3, 65, 257, '2025-06-17 14:13:19'),
(911, '1', 7, 3, 65, 258, '2025-06-17 14:13:19'),
(912, '1', 7, 3, 65, 260, '2025-06-17 14:13:19'),
(913, '1', 7, 3, 64, 253, '2025-06-17 14:13:19'),
(914, '1', 7, 3, 64, 255, '2025-06-17 14:13:19'),
(915, '1', 7, 3, 64, 256, '2025-06-17 14:13:19'),
(916, '1', 7, 3, 64, 254, '2025-06-17 14:13:19'),
(917, '1', 7, 3, 73, 290, '2025-06-17 14:13:19'),
(918, '1', 7, 3, 73, 292, '2025-06-17 14:13:19'),
(919, '1', 7, 3, 73, 289, '2025-06-17 14:13:19'),
(920, '1', 7, 3, 73, 291, '2025-06-17 14:13:19'),
(921, '1', 7, 3, 76, 302, '2025-06-17 14:13:19'),
(922, '1', 7, 3, 76, 301, '2025-06-17 14:13:19'),
(923, '1', 7, 3, 76, 303, '2025-06-17 14:13:19'),
(924, '1', 7, 3, 76, 304, '2025-06-17 14:13:19'),
(925, '1', 7, 3, 87, 348, '2025-06-17 14:13:19'),
(926, '1', 7, 3, 87, 347, '2025-06-17 14:13:19'),
(927, '1', 7, 3, 87, 346, '2025-06-17 14:13:19'),
(928, '1', 7, 3, 87, 345, '2025-06-17 14:13:19'),
(929, '1', 7, 3, 90, 359, '2025-06-17 14:13:19'),
(930, '1', 7, 3, 90, 357, '2025-06-17 14:13:19'),
(931, '1', 7, 3, 90, 360, '2025-06-17 14:13:19'),
(932, '1', 7, 3, 90, 358, '2025-06-17 14:13:19'),
(933, '1', 7, 3, 84, 335, '2025-06-17 14:13:19'),
(934, '1', 7, 3, 84, 336, '2025-06-17 14:13:19'),
(935, '1', 7, 3, 84, 333, '2025-06-17 14:13:19'),
(936, '1', 7, 3, 84, 334, '2025-06-17 14:13:19'),
(937, '1', 7, 3, 82, 326, '2025-06-17 14:13:19'),
(938, '1', 7, 3, 82, 327, '2025-06-17 14:13:19'),
(939, '1', 7, 3, 82, 325, '2025-06-17 14:13:19'),
(940, '1', 7, 3, 82, 328, '2025-06-17 14:13:19'),
(941, '16', 7, 3, 54, 215, '2025-06-17 14:34:40'),
(942, '16', 7, 3, 54, 213, '2025-06-17 14:34:40'),
(943, '16', 7, 3, 54, 216, '2025-06-17 14:34:40'),
(944, '16', 7, 3, 54, 214, '2025-06-17 14:34:40'),
(945, '16', 7, 3, 59, 236, '2025-06-17 14:34:40'),
(946, '16', 7, 3, 59, 234, '2025-06-17 14:34:40'),
(947, '16', 7, 3, 59, 233, '2025-06-17 14:34:40'),
(948, '16', 7, 3, 59, 235, '2025-06-17 14:34:40'),
(949, '16', 7, 3, 52, 206, '2025-06-17 14:34:40'),
(950, '16', 7, 3, 52, 205, '2025-06-17 14:34:40'),
(951, '16', 7, 3, 52, 208, '2025-06-17 14:34:40'),
(952, '16', 7, 3, 52, 207, '2025-06-17 14:34:40'),
(953, '16', 7, 3, 53, 209, '2025-06-17 14:34:40'),
(954, '16', 7, 3, 53, 210, '2025-06-17 14:34:40'),
(955, '16', 7, 3, 53, 211, '2025-06-17 14:34:40'),
(956, '16', 7, 3, 53, 212, '2025-06-17 14:34:40'),
(957, '16', 7, 3, 51, 201, '2025-06-17 14:34:40'),
(958, '16', 7, 3, 51, 204, '2025-06-17 14:34:40'),
(959, '16', 7, 3, 51, 203, '2025-06-17 14:34:40'),
(960, '16', 7, 3, 51, 202, '2025-06-17 14:34:40'),
(961, '16', 7, 3, 65, 257, '2025-06-17 14:34:40'),
(962, '16', 7, 3, 65, 259, '2025-06-17 14:34:40'),
(963, '16', 7, 3, 65, 260, '2025-06-17 14:34:40'),
(964, '16', 7, 3, 65, 258, '2025-06-17 14:34:40'),
(965, '16', 7, 3, 62, 246, '2025-06-17 14:34:40'),
(966, '16', 7, 3, 62, 248, '2025-06-17 14:34:40'),
(967, '16', 7, 3, 62, 245, '2025-06-17 14:34:40'),
(968, '16', 7, 3, 62, 247, '2025-06-17 14:34:40'),
(969, '16', 7, 3, 71, 282, '2025-06-17 14:34:40'),
(970, '16', 7, 3, 71, 284, '2025-06-17 14:34:40'),
(971, '16', 7, 3, 71, 281, '2025-06-17 14:34:40'),
(972, '16', 7, 3, 71, 283, '2025-06-17 14:34:40'),
(973, '16', 7, 3, 67, 267, '2025-06-17 14:34:40'),
(974, '16', 7, 3, 67, 266, '2025-06-17 14:34:40'),
(975, '16', 7, 3, 67, 268, '2025-06-17 14:34:40'),
(976, '16', 7, 3, 67, 265, '2025-06-17 14:34:40'),
(977, '16', 7, 3, 73, 291, '2025-06-17 14:34:40'),
(978, '16', 7, 3, 73, 289, '2025-06-17 14:34:40'),
(979, '16', 7, 3, 73, 292, '2025-06-17 14:34:40'),
(980, '16', 7, 3, 73, 290, '2025-06-17 14:34:40'),
(981, '16', 7, 3, 90, 357, '2025-06-17 14:34:40'),
(982, '16', 7, 3, 90, 360, '2025-06-17 14:34:40'),
(983, '16', 7, 3, 90, 358, '2025-06-17 14:34:40'),
(984, '16', 7, 3, 90, 359, '2025-06-17 14:34:40'),
(985, '16', 7, 3, 78, 310, '2025-06-17 14:34:40'),
(986, '16', 7, 3, 78, 312, '2025-06-17 14:34:40'),
(987, '16', 7, 3, 78, 309, '2025-06-17 14:34:40'),
(988, '16', 7, 3, 78, 311, '2025-06-17 14:34:40'),
(989, '16', 7, 3, 84, 336, '2025-06-17 14:34:40'),
(990, '16', 7, 3, 84, 334, '2025-06-17 14:34:40'),
(991, '16', 7, 3, 84, 333, '2025-06-17 14:34:40'),
(992, '16', 7, 3, 84, 335, '2025-06-17 14:34:40'),
(993, '16', 7, 3, 80, 319, '2025-06-17 14:34:40'),
(994, '16', 7, 3, 80, 320, '2025-06-17 14:34:40'),
(995, '16', 7, 3, 80, 317, '2025-06-17 14:34:40'),
(996, '16', 7, 3, 80, 318, '2025-06-17 14:34:40'),
(997, '16', 7, 3, 81, 322, '2025-06-17 14:34:40'),
(998, '16', 7, 3, 81, 323, '2025-06-17 14:34:40'),
(999, '16', 7, 3, 81, 321, '2025-06-17 14:34:40'),
(1000, '16', 7, 3, 81, 324, '2025-06-17 14:34:40'),
(1001, '17', 8, 4, 94, 373, '2025-06-17 14:34:52'),
(1002, '17', 8, 4, 94, 374, '2025-06-17 14:34:52'),
(1003, '17', 8, 4, 94, 375, '2025-06-17 14:34:52'),
(1004, '17', 8, 4, 94, 376, '2025-06-17 14:34:52'),
(1005, '17', 8, 4, 101, 402, '2025-06-17 14:34:52'),
(1006, '17', 8, 4, 101, 403, '2025-06-17 14:34:52'),
(1007, '17', 8, 4, 101, 401, '2025-06-17 14:34:52'),
(1008, '17', 8, 4, 101, 404, '2025-06-17 14:34:52'),
(1009, '17', 8, 4, 97, 388, '2025-06-17 14:34:52'),
(1010, '17', 8, 4, 97, 385, '2025-06-17 14:34:52'),
(1011, '17', 8, 4, 97, 387, '2025-06-17 14:34:52'),
(1012, '17', 8, 4, 97, 386, '2025-06-17 14:34:52'),
(1013, '17', 8, 4, 95, 377, '2025-06-17 14:34:52'),
(1014, '17', 8, 4, 95, 379, '2025-06-17 14:34:52'),
(1015, '17', 8, 4, 95, 378, '2025-06-17 14:34:52'),
(1016, '17', 8, 4, 95, 380, '2025-06-17 14:34:52'),
(1017, '17', 8, 4, 98, 390, '2025-06-17 14:34:52'),
(1018, '17', 8, 4, 98, 389, '2025-06-17 14:34:52'),
(1019, '17', 8, 4, 98, 391, '2025-06-17 14:34:52'),
(1020, '17', 8, 4, 98, 392, '2025-06-17 14:34:52'),
(1021, '17', 8, 4, 109, 435, '2025-06-17 14:34:52'),
(1022, '17', 8, 4, 109, 434, '2025-06-17 14:34:52'),
(1023, '17', 8, 4, 109, 433, '2025-06-17 14:34:52'),
(1024, '17', 8, 4, 109, 436, '2025-06-17 14:34:52'),
(1025, '17', 8, 4, 113, 451, '2025-06-17 14:34:52');
INSERT INTO `tblpresentation` (`id`, `candidateid`, `testid`, `sectionid`, `questionid`, `answerid`, `created_at`) VALUES
(1026, '17', 8, 4, 113, 449, '2025-06-17 14:34:52'),
(1027, '17', 8, 4, 113, 450, '2025-06-17 14:34:52'),
(1028, '17', 8, 4, 113, 452, '2025-06-17 14:34:52'),
(1029, '17', 8, 4, 110, 439, '2025-06-17 14:34:52'),
(1030, '17', 8, 4, 110, 440, '2025-06-17 14:34:52'),
(1031, '17', 8, 4, 110, 437, '2025-06-17 14:34:52'),
(1032, '17', 8, 4, 110, 438, '2025-06-17 14:34:52'),
(1033, '17', 8, 4, 114, 455, '2025-06-17 14:34:52'),
(1034, '17', 8, 4, 114, 456, '2025-06-17 14:34:52'),
(1035, '17', 8, 4, 114, 454, '2025-06-17 14:34:52'),
(1036, '17', 8, 4, 114, 453, '2025-06-17 14:34:52'),
(1037, '17', 8, 4, 120, 478, '2025-06-17 14:34:52'),
(1038, '17', 8, 4, 120, 480, '2025-06-17 14:34:52'),
(1039, '17', 8, 4, 120, 477, '2025-06-17 14:34:52'),
(1040, '17', 8, 4, 120, 479, '2025-06-17 14:34:52'),
(1041, '17', 8, 4, 132, 527, '2025-06-17 14:34:52'),
(1042, '17', 8, 4, 132, 528, '2025-06-17 14:34:52'),
(1043, '17', 8, 4, 132, 526, '2025-06-17 14:34:52'),
(1044, '17', 8, 4, 132, 525, '2025-06-17 14:34:52'),
(1045, '17', 8, 4, 123, 490, '2025-06-17 14:34:52'),
(1046, '17', 8, 4, 123, 489, '2025-06-17 14:34:52'),
(1047, '17', 8, 4, 123, 491, '2025-06-17 14:34:52'),
(1048, '17', 8, 4, 123, 492, '2025-06-17 14:34:52'),
(1049, '17', 8, 4, 121, 483, '2025-06-17 14:34:52'),
(1050, '17', 8, 4, 121, 482, '2025-06-17 14:34:52'),
(1051, '17', 8, 4, 121, 481, '2025-06-17 14:34:52'),
(1052, '17', 8, 4, 121, 484, '2025-06-17 14:34:52'),
(1053, '17', 8, 4, 134, 534, '2025-06-17 14:34:52'),
(1054, '17', 8, 4, 134, 535, '2025-06-17 14:34:52'),
(1055, '17', 8, 4, 134, 536, '2025-06-17 14:34:52'),
(1056, '17', 8, 4, 134, 533, '2025-06-17 14:34:52'),
(1057, '17', 8, 4, 131, 521, '2025-06-17 14:34:52'),
(1058, '17', 8, 4, 131, 523, '2025-06-17 14:34:52'),
(1059, '17', 8, 4, 131, 522, '2025-06-17 14:34:52'),
(1060, '17', 8, 4, 131, 524, '2025-06-17 14:34:52'),
(1061, '22', 8, 4, 93, 372, '2025-06-17 20:43:47'),
(1062, '22', 8, 4, 93, 370, '2025-06-17 20:43:47'),
(1063, '22', 8, 4, 93, 369, '2025-06-17 20:43:47'),
(1064, '22', 8, 4, 93, 371, '2025-06-17 20:43:47'),
(1065, '22', 8, 4, 94, 373, '2025-06-17 20:43:47'),
(1066, '22', 8, 4, 94, 374, '2025-06-17 20:43:47'),
(1067, '22', 8, 4, 94, 376, '2025-06-17 20:43:47'),
(1068, '22', 8, 4, 94, 375, '2025-06-17 20:43:47'),
(1069, '22', 8, 4, 97, 388, '2025-06-17 20:43:47'),
(1070, '22', 8, 4, 97, 385, '2025-06-17 20:43:47'),
(1071, '22', 8, 4, 97, 387, '2025-06-17 20:43:47'),
(1072, '22', 8, 4, 97, 386, '2025-06-17 20:43:47'),
(1073, '22', 8, 4, 103, 411, '2025-06-17 20:43:47'),
(1074, '22', 8, 4, 103, 410, '2025-06-17 20:43:47'),
(1075, '22', 8, 4, 103, 409, '2025-06-17 20:43:47'),
(1076, '22', 8, 4, 103, 412, '2025-06-17 20:43:47'),
(1077, '22', 8, 4, 98, 390, '2025-06-17 20:43:47'),
(1078, '22', 8, 4, 98, 389, '2025-06-17 20:43:47'),
(1079, '22', 8, 4, 98, 391, '2025-06-17 20:43:47'),
(1080, '22', 8, 4, 98, 392, '2025-06-17 20:43:47'),
(1081, '22', 8, 4, 118, 469, '2025-06-17 20:43:47'),
(1082, '22', 8, 4, 118, 471, '2025-06-17 20:43:47'),
(1083, '22', 8, 4, 118, 470, '2025-06-17 20:43:47'),
(1084, '22', 8, 4, 118, 472, '2025-06-17 20:43:47'),
(1085, '22', 8, 4, 114, 456, '2025-06-17 20:43:47'),
(1086, '22', 8, 4, 114, 455, '2025-06-17 20:43:47'),
(1087, '22', 8, 4, 114, 453, '2025-06-17 20:43:47'),
(1088, '22', 8, 4, 114, 454, '2025-06-17 20:43:47'),
(1089, '22', 8, 4, 109, 436, '2025-06-17 20:43:47'),
(1090, '22', 8, 4, 109, 435, '2025-06-17 20:43:47'),
(1091, '22', 8, 4, 109, 433, '2025-06-17 20:43:47'),
(1092, '22', 8, 4, 109, 434, '2025-06-17 20:43:47'),
(1093, '22', 8, 4, 110, 437, '2025-06-17 20:43:47'),
(1094, '22', 8, 4, 110, 439, '2025-06-17 20:43:47'),
(1095, '22', 8, 4, 110, 440, '2025-06-17 20:43:47'),
(1096, '22', 8, 4, 110, 438, '2025-06-17 20:43:47'),
(1097, '22', 8, 4, 115, 459, '2025-06-17 20:43:47'),
(1098, '22', 8, 4, 115, 457, '2025-06-17 20:43:47'),
(1099, '22', 8, 4, 115, 458, '2025-06-17 20:43:47'),
(1100, '22', 8, 4, 115, 460, '2025-06-17 20:43:47'),
(1101, '22', 8, 4, 127, 505, '2025-06-17 20:43:47'),
(1102, '22', 8, 4, 127, 507, '2025-06-17 20:43:47'),
(1103, '22', 8, 4, 127, 506, '2025-06-17 20:43:47'),
(1104, '22', 8, 4, 127, 508, '2025-06-17 20:43:47'),
(1105, '22', 8, 4, 123, 492, '2025-06-17 20:43:47'),
(1106, '22', 8, 4, 123, 490, '2025-06-17 20:43:47'),
(1107, '22', 8, 4, 123, 489, '2025-06-17 20:43:47'),
(1108, '22', 8, 4, 123, 491, '2025-06-17 20:43:47'),
(1109, '22', 8, 4, 124, 493, '2025-06-17 20:43:47'),
(1110, '22', 8, 4, 124, 495, '2025-06-17 20:43:47'),
(1111, '22', 8, 4, 124, 494, '2025-06-17 20:43:47'),
(1112, '22', 8, 4, 124, 496, '2025-06-17 20:43:47'),
(1113, '22', 8, 4, 126, 502, '2025-06-17 20:43:47'),
(1114, '22', 8, 4, 126, 501, '2025-06-17 20:43:47'),
(1115, '22', 8, 4, 126, 504, '2025-06-17 20:43:47'),
(1116, '22', 8, 4, 126, 503, '2025-06-17 20:43:47'),
(1117, '22', 8, 4, 131, 523, '2025-06-17 20:43:47'),
(1118, '22', 8, 4, 131, 521, '2025-06-17 20:43:47'),
(1119, '22', 8, 4, 131, 524, '2025-06-17 20:43:47'),
(1120, '22', 8, 4, 131, 522, '2025-06-17 20:43:47'),
(1121, '21', 8, 4, 93, 369, '2025-06-17 20:47:40'),
(1122, '21', 8, 4, 93, 370, '2025-06-17 20:47:40'),
(1123, '21', 8, 4, 93, 372, '2025-06-17 20:47:40'),
(1124, '21', 8, 4, 93, 371, '2025-06-17 20:47:40'),
(1125, '21', 8, 4, 103, 412, '2025-06-17 20:47:40'),
(1126, '21', 8, 4, 103, 411, '2025-06-17 20:47:40'),
(1127, '21', 8, 4, 103, 410, '2025-06-17 20:47:40'),
(1128, '21', 8, 4, 103, 409, '2025-06-17 20:47:40'),
(1129, '21', 8, 4, 105, 419, '2025-06-17 20:47:40'),
(1130, '21', 8, 4, 105, 417, '2025-06-17 20:47:40'),
(1131, '21', 8, 4, 105, 420, '2025-06-17 20:47:40'),
(1132, '21', 8, 4, 105, 418, '2025-06-17 20:47:40'),
(1133, '21', 8, 4, 100, 400, '2025-06-17 20:47:40'),
(1134, '21', 8, 4, 100, 398, '2025-06-17 20:47:40'),
(1135, '21', 8, 4, 100, 397, '2025-06-17 20:47:40'),
(1136, '21', 8, 4, 100, 399, '2025-06-17 20:47:40'),
(1137, '21', 8, 4, 102, 408, '2025-06-17 20:47:40'),
(1138, '21', 8, 4, 102, 405, '2025-06-17 20:47:40'),
(1139, '21', 8, 4, 102, 407, '2025-06-17 20:47:40'),
(1140, '21', 8, 4, 102, 406, '2025-06-17 20:47:40'),
(1141, '21', 8, 4, 116, 464, '2025-06-17 20:47:40'),
(1142, '21', 8, 4, 116, 462, '2025-06-17 20:47:40'),
(1143, '21', 8, 4, 116, 461, '2025-06-17 20:47:40'),
(1144, '21', 8, 4, 116, 463, '2025-06-17 20:47:40'),
(1145, '21', 8, 4, 111, 443, '2025-06-17 20:47:40'),
(1146, '21', 8, 4, 111, 441, '2025-06-17 20:47:40'),
(1147, '21', 8, 4, 111, 444, '2025-06-17 20:47:40'),
(1148, '21', 8, 4, 111, 442, '2025-06-17 20:47:40'),
(1149, '21', 8, 4, 118, 471, '2025-06-17 20:47:40'),
(1150, '21', 8, 4, 118, 472, '2025-06-17 20:47:40'),
(1151, '21', 8, 4, 118, 470, '2025-06-17 20:47:40'),
(1152, '21', 8, 4, 118, 469, '2025-06-17 20:47:40'),
(1153, '21', 8, 4, 110, 440, '2025-06-17 20:47:40'),
(1154, '21', 8, 4, 110, 437, '2025-06-17 20:47:40'),
(1155, '21', 8, 4, 110, 439, '2025-06-17 20:47:40'),
(1156, '21', 8, 4, 110, 438, '2025-06-17 20:47:40'),
(1157, '21', 8, 4, 113, 452, '2025-06-17 20:47:40'),
(1158, '21', 8, 4, 113, 450, '2025-06-17 20:47:40'),
(1159, '21', 8, 4, 113, 451, '2025-06-17 20:47:40'),
(1160, '21', 8, 4, 113, 449, '2025-06-17 20:47:40'),
(1161, '21', 8, 4, 129, 513, '2025-06-17 20:47:40'),
(1162, '21', 8, 4, 129, 515, '2025-06-17 20:47:40'),
(1163, '21', 8, 4, 129, 516, '2025-06-17 20:47:40'),
(1164, '21', 8, 4, 129, 514, '2025-06-17 20:47:40'),
(1165, '21', 8, 4, 127, 507, '2025-06-17 20:47:40'),
(1166, '21', 8, 4, 127, 506, '2025-06-17 20:47:40'),
(1167, '21', 8, 4, 127, 508, '2025-06-17 20:47:40'),
(1168, '21', 8, 4, 127, 505, '2025-06-17 20:47:40'),
(1169, '21', 8, 4, 121, 482, '2025-06-17 20:47:40'),
(1170, '21', 8, 4, 121, 484, '2025-06-17 20:47:40'),
(1171, '21', 8, 4, 121, 481, '2025-06-17 20:47:40'),
(1172, '21', 8, 4, 121, 483, '2025-06-17 20:47:40'),
(1173, '21', 8, 4, 131, 522, '2025-06-17 20:47:40'),
(1174, '21', 8, 4, 131, 521, '2025-06-17 20:47:40'),
(1175, '21', 8, 4, 131, 523, '2025-06-17 20:47:40'),
(1176, '21', 8, 4, 131, 524, '2025-06-17 20:47:40'),
(1177, '21', 8, 4, 126, 504, '2025-06-17 20:47:40'),
(1178, '21', 8, 4, 126, 502, '2025-06-17 20:47:40'),
(1179, '21', 8, 4, 126, 501, '2025-06-17 20:47:40'),
(1180, '21', 8, 4, 126, 503, '2025-06-17 20:47:40'),
(1181, '19', 8, 4, 102, 408, '2025-06-17 20:57:09'),
(1182, '19', 8, 4, 102, 407, '2025-06-17 20:57:09'),
(1183, '19', 8, 4, 102, 406, '2025-06-17 20:57:09'),
(1184, '19', 8, 4, 102, 405, '2025-06-17 20:57:09'),
(1185, '19', 8, 4, 104, 413, '2025-06-17 20:57:09'),
(1186, '19', 8, 4, 104, 414, '2025-06-17 20:57:09'),
(1187, '19', 8, 4, 104, 415, '2025-06-17 20:57:09'),
(1188, '19', 8, 4, 104, 416, '2025-06-17 20:57:09'),
(1189, '19', 8, 4, 101, 402, '2025-06-17 20:57:09'),
(1190, '19', 8, 4, 101, 403, '2025-06-17 20:57:09'),
(1191, '19', 8, 4, 101, 404, '2025-06-17 20:57:09'),
(1192, '19', 8, 4, 101, 401, '2025-06-17 20:57:09'),
(1193, '19', 8, 4, 99, 396, '2025-06-17 20:57:09'),
(1194, '19', 8, 4, 99, 394, '2025-06-17 20:57:09'),
(1195, '19', 8, 4, 99, 395, '2025-06-17 20:57:09'),
(1196, '19', 8, 4, 99, 393, '2025-06-17 20:57:09'),
(1197, '19', 8, 4, 105, 419, '2025-06-17 20:57:09'),
(1198, '19', 8, 4, 105, 418, '2025-06-17 20:57:09'),
(1199, '19', 8, 4, 105, 417, '2025-06-17 20:57:09'),
(1200, '19', 8, 4, 105, 420, '2025-06-17 20:57:09'),
(1201, '19', 8, 4, 115, 457, '2025-06-17 20:57:09'),
(1202, '19', 8, 4, 115, 459, '2025-06-17 20:57:09'),
(1203, '19', 8, 4, 115, 458, '2025-06-17 20:57:09'),
(1204, '19', 8, 4, 115, 460, '2025-06-17 20:57:09'),
(1205, '19', 8, 4, 110, 437, '2025-06-17 20:57:09'),
(1206, '19', 8, 4, 110, 438, '2025-06-17 20:57:09'),
(1207, '19', 8, 4, 110, 440, '2025-06-17 20:57:09'),
(1208, '19', 8, 4, 110, 439, '2025-06-17 20:57:09'),
(1209, '19', 8, 4, 111, 443, '2025-06-17 20:57:09'),
(1210, '19', 8, 4, 111, 442, '2025-06-17 20:57:09'),
(1211, '19', 8, 4, 111, 444, '2025-06-17 20:57:09'),
(1212, '19', 8, 4, 111, 441, '2025-06-17 20:57:09'),
(1213, '19', 8, 4, 116, 463, '2025-06-17 20:57:09'),
(1214, '19', 8, 4, 116, 464, '2025-06-17 20:57:09'),
(1215, '19', 8, 4, 116, 462, '2025-06-17 20:57:09'),
(1216, '19', 8, 4, 116, 461, '2025-06-17 20:57:09'),
(1217, '19', 8, 4, 112, 446, '2025-06-17 20:57:09'),
(1218, '19', 8, 4, 112, 447, '2025-06-17 20:57:09'),
(1219, '19', 8, 4, 112, 445, '2025-06-17 20:57:09'),
(1220, '19', 8, 4, 112, 448, '2025-06-17 20:57:09'),
(1221, '19', 8, 4, 135, 540, '2025-06-17 20:57:09'),
(1222, '19', 8, 4, 135, 537, '2025-06-17 20:57:09'),
(1223, '19', 8, 4, 135, 538, '2025-06-17 20:57:09'),
(1224, '19', 8, 4, 135, 539, '2025-06-17 20:57:09'),
(1225, '19', 8, 4, 132, 528, '2025-06-17 20:57:09'),
(1226, '19', 8, 4, 132, 526, '2025-06-17 20:57:09'),
(1227, '19', 8, 4, 132, 525, '2025-06-17 20:57:09'),
(1228, '19', 8, 4, 132, 527, '2025-06-17 20:57:09'),
(1229, '19', 8, 4, 128, 510, '2025-06-17 20:57:09'),
(1230, '19', 8, 4, 128, 512, '2025-06-17 20:57:09'),
(1231, '19', 8, 4, 128, 509, '2025-06-17 20:57:09'),
(1232, '19', 8, 4, 128, 511, '2025-06-17 20:57:09'),
(1233, '19', 8, 4, 126, 504, '2025-06-17 20:57:09'),
(1234, '19', 8, 4, 126, 503, '2025-06-17 20:57:09'),
(1235, '19', 8, 4, 126, 502, '2025-06-17 20:57:09'),
(1236, '19', 8, 4, 126, 501, '2025-06-17 20:57:09'),
(1237, '19', 8, 4, 131, 521, '2025-06-17 20:57:09'),
(1238, '19', 8, 4, 131, 524, '2025-06-17 20:57:09'),
(1239, '19', 8, 4, 131, 522, '2025-06-17 20:57:09'),
(1240, '19', 8, 4, 131, 523, '2025-06-17 20:57:09'),
(1241, '9', 7, 3, 46, 182, '2025-06-17 21:01:58'),
(1242, '9', 7, 3, 46, 183, '2025-06-17 21:01:58'),
(1243, '9', 7, 3, 46, 184, '2025-06-17 21:01:58'),
(1244, '9', 7, 3, 46, 181, '2025-06-17 21:01:58'),
(1245, '9', 7, 3, 58, 229, '2025-06-17 21:01:58'),
(1246, '9', 7, 3, 58, 230, '2025-06-17 21:01:58'),
(1247, '9', 7, 3, 58, 231, '2025-06-17 21:01:58'),
(1248, '9', 7, 3, 58, 232, '2025-06-17 21:01:58'),
(1249, '9', 7, 3, 49, 194, '2025-06-17 21:01:58'),
(1250, '9', 7, 3, 49, 193, '2025-06-17 21:01:58'),
(1251, '9', 7, 3, 49, 196, '2025-06-17 21:01:58'),
(1252, '9', 7, 3, 49, 195, '2025-06-17 21:01:58'),
(1253, '9', 7, 3, 55, 220, '2025-06-17 21:01:58'),
(1254, '9', 7, 3, 55, 218, '2025-06-17 21:01:58'),
(1255, '9', 7, 3, 55, 217, '2025-06-17 21:01:58'),
(1256, '9', 7, 3, 55, 219, '2025-06-17 21:01:58'),
(1257, '9', 7, 3, 57, 226, '2025-06-17 21:01:58'),
(1258, '9', 7, 3, 57, 228, '2025-06-17 21:01:58'),
(1259, '9', 7, 3, 57, 227, '2025-06-17 21:01:58'),
(1260, '9', 7, 3, 57, 225, '2025-06-17 21:01:58'),
(1261, '9', 7, 3, 72, 286, '2025-06-17 21:01:58'),
(1262, '9', 7, 3, 72, 285, '2025-06-17 21:01:58'),
(1263, '9', 7, 3, 72, 288, '2025-06-17 21:01:58'),
(1264, '9', 7, 3, 72, 287, '2025-06-17 21:01:58'),
(1265, '9', 7, 3, 65, 257, '2025-06-17 21:01:58'),
(1266, '9', 7, 3, 65, 259, '2025-06-17 21:01:58'),
(1267, '9', 7, 3, 65, 258, '2025-06-17 21:01:58'),
(1268, '9', 7, 3, 65, 260, '2025-06-17 21:01:58'),
(1269, '9', 7, 3, 68, 269, '2025-06-17 21:01:58'),
(1270, '9', 7, 3, 68, 272, '2025-06-17 21:01:58'),
(1271, '9', 7, 3, 68, 270, '2025-06-17 21:01:58'),
(1272, '9', 7, 3, 68, 271, '2025-06-17 21:01:58'),
(1273, '9', 7, 3, 69, 274, '2025-06-17 21:01:58'),
(1274, '9', 7, 3, 69, 276, '2025-06-17 21:01:58'),
(1275, '9', 7, 3, 69, 275, '2025-06-17 21:01:58'),
(1276, '9', 7, 3, 69, 273, '2025-06-17 21:01:58'),
(1277, '9', 7, 3, 73, 289, '2025-06-17 21:01:58'),
(1278, '9', 7, 3, 73, 291, '2025-06-17 21:01:58'),
(1279, '9', 7, 3, 73, 292, '2025-06-17 21:01:58'),
(1280, '9', 7, 3, 73, 290, '2025-06-17 21:01:58'),
(1281, '9', 7, 3, 86, 343, '2025-06-17 21:01:58'),
(1282, '9', 7, 3, 86, 341, '2025-06-17 21:01:58'),
(1283, '9', 7, 3, 86, 342, '2025-06-17 21:01:58'),
(1284, '9', 7, 3, 86, 344, '2025-06-17 21:01:58'),
(1285, '9', 7, 3, 80, 319, '2025-06-17 21:01:58'),
(1286, '9', 7, 3, 80, 320, '2025-06-17 21:01:58'),
(1287, '9', 7, 3, 80, 317, '2025-06-17 21:01:58'),
(1288, '9', 7, 3, 80, 318, '2025-06-17 21:01:58'),
(1289, '9', 7, 3, 87, 345, '2025-06-17 21:01:58'),
(1290, '9', 7, 3, 87, 346, '2025-06-17 21:01:58'),
(1291, '9', 7, 3, 87, 347, '2025-06-17 21:01:58'),
(1292, '9', 7, 3, 87, 348, '2025-06-17 21:01:58'),
(1293, '9', 7, 3, 78, 312, '2025-06-17 21:01:58'),
(1294, '9', 7, 3, 78, 311, '2025-06-17 21:01:58'),
(1295, '9', 7, 3, 78, 310, '2025-06-17 21:01:58'),
(1296, '9', 7, 3, 78, 309, '2025-06-17 21:01:58'),
(1297, '9', 7, 3, 79, 315, '2025-06-17 21:01:58'),
(1298, '9', 7, 3, 79, 316, '2025-06-17 21:01:58'),
(1299, '9', 7, 3, 79, 314, '2025-06-17 21:01:58'),
(1300, '9', 7, 3, 79, 313, '2025-06-17 21:01:58'),
(1301, '6', 7, 3, 53, 209, '2025-06-17 21:10:37'),
(1302, '6', 7, 3, 53, 210, '2025-06-17 21:10:37'),
(1303, '6', 7, 3, 53, 211, '2025-06-17 21:10:37'),
(1304, '6', 7, 3, 53, 212, '2025-06-17 21:10:37'),
(1305, '6', 7, 3, 48, 190, '2025-06-17 21:10:37'),
(1306, '6', 7, 3, 48, 189, '2025-06-17 21:10:37'),
(1307, '6', 7, 3, 48, 192, '2025-06-17 21:10:37'),
(1308, '6', 7, 3, 48, 191, '2025-06-17 21:10:37'),
(1309, '6', 7, 3, 55, 217, '2025-06-17 21:10:37'),
(1310, '6', 7, 3, 55, 218, '2025-06-17 21:10:37'),
(1311, '6', 7, 3, 55, 220, '2025-06-17 21:10:37'),
(1312, '6', 7, 3, 55, 219, '2025-06-17 21:10:37'),
(1313, '6', 7, 3, 52, 205, '2025-06-17 21:10:37'),
(1314, '6', 7, 3, 52, 208, '2025-06-17 21:10:37'),
(1315, '6', 7, 3, 52, 206, '2025-06-17 21:10:37'),
(1316, '6', 7, 3, 52, 207, '2025-06-17 21:10:37'),
(1317, '6', 7, 3, 60, 237, '2025-06-17 21:10:37'),
(1318, '6', 7, 3, 60, 239, '2025-06-17 21:10:37'),
(1319, '6', 7, 3, 60, 238, '2025-06-17 21:10:37'),
(1320, '6', 7, 3, 60, 240, '2025-06-17 21:10:37'),
(1321, '6', 7, 3, 61, 241, '2025-06-17 21:10:37'),
(1322, '6', 7, 3, 61, 242, '2025-06-17 21:10:37'),
(1323, '6', 7, 3, 61, 243, '2025-06-17 21:10:37'),
(1324, '6', 7, 3, 61, 244, '2025-06-17 21:10:37'),
(1325, '6', 7, 3, 62, 247, '2025-06-17 21:10:37'),
(1326, '6', 7, 3, 62, 246, '2025-06-17 21:10:37'),
(1327, '6', 7, 3, 62, 248, '2025-06-17 21:10:37'),
(1328, '6', 7, 3, 62, 245, '2025-06-17 21:10:37'),
(1329, '6', 7, 3, 70, 278, '2025-06-17 21:10:37'),
(1330, '6', 7, 3, 70, 280, '2025-06-17 21:10:37'),
(1331, '6', 7, 3, 70, 279, '2025-06-17 21:10:37'),
(1332, '6', 7, 3, 70, 277, '2025-06-17 21:10:37'),
(1333, '6', 7, 3, 67, 266, '2025-06-17 21:10:37'),
(1334, '6', 7, 3, 67, 265, '2025-06-17 21:10:37'),
(1335, '6', 7, 3, 67, 267, '2025-06-17 21:10:37'),
(1336, '6', 7, 3, 67, 268, '2025-06-17 21:10:37'),
(1337, '6', 7, 3, 73, 292, '2025-06-17 21:10:37'),
(1338, '6', 7, 3, 73, 289, '2025-06-17 21:10:37'),
(1339, '6', 7, 3, 73, 290, '2025-06-17 21:10:37'),
(1340, '6', 7, 3, 73, 291, '2025-06-17 21:10:37'),
(1341, '6', 7, 3, 77, 305, '2025-06-17 21:10:37'),
(1342, '6', 7, 3, 77, 307, '2025-06-17 21:10:37'),
(1343, '6', 7, 3, 77, 308, '2025-06-17 21:10:37'),
(1344, '6', 7, 3, 77, 306, '2025-06-17 21:10:37'),
(1345, '6', 7, 3, 84, 333, '2025-06-17 21:10:37'),
(1346, '6', 7, 3, 84, 336, '2025-06-17 21:10:37'),
(1347, '6', 7, 3, 84, 334, '2025-06-17 21:10:37'),
(1348, '6', 7, 3, 84, 335, '2025-06-17 21:10:37'),
(1349, '6', 7, 3, 81, 322, '2025-06-17 21:10:37'),
(1350, '6', 7, 3, 81, 324, '2025-06-17 21:10:37'),
(1351, '6', 7, 3, 81, 323, '2025-06-17 21:10:37'),
(1352, '6', 7, 3, 81, 321, '2025-06-17 21:10:37'),
(1353, '6', 7, 3, 82, 325, '2025-06-17 21:10:37'),
(1354, '6', 7, 3, 82, 327, '2025-06-17 21:10:37'),
(1355, '6', 7, 3, 82, 328, '2025-06-17 21:10:37'),
(1356, '6', 7, 3, 82, 326, '2025-06-17 21:10:37'),
(1357, '6', 7, 3, 90, 357, '2025-06-17 21:10:37'),
(1358, '6', 7, 3, 90, 360, '2025-06-17 21:10:37'),
(1359, '6', 7, 3, 90, 359, '2025-06-17 21:10:37'),
(1360, '6', 7, 3, 90, 358, '2025-06-17 21:10:37'),
(1361, '10', 7, 3, 49, 196, '2025-06-17 21:10:53'),
(1362, '10', 7, 3, 49, 195, '2025-06-17 21:10:53'),
(1363, '10', 7, 3, 49, 193, '2025-06-17 21:10:53'),
(1364, '10', 7, 3, 49, 194, '2025-06-17 21:10:53'),
(1365, '10', 7, 3, 57, 227, '2025-06-17 21:10:53'),
(1366, '10', 7, 3, 57, 225, '2025-06-17 21:10:53'),
(1367, '10', 7, 3, 57, 228, '2025-06-17 21:10:53'),
(1368, '10', 7, 3, 57, 226, '2025-06-17 21:10:53'),
(1369, '10', 7, 3, 47, 188, '2025-06-17 21:10:53'),
(1370, '10', 7, 3, 47, 187, '2025-06-17 21:10:53'),
(1371, '10', 7, 3, 47, 186, '2025-06-17 21:10:53'),
(1372, '10', 7, 3, 47, 185, '2025-06-17 21:10:53'),
(1373, '10', 7, 3, 58, 230, '2025-06-17 21:10:53'),
(1374, '10', 7, 3, 58, 231, '2025-06-17 21:10:53'),
(1375, '10', 7, 3, 58, 232, '2025-06-17 21:10:53'),
(1376, '10', 7, 3, 58, 229, '2025-06-17 21:10:53'),
(1377, '10', 7, 3, 51, 203, '2025-06-17 21:10:53'),
(1378, '10', 7, 3, 51, 202, '2025-06-17 21:10:53'),
(1379, '10', 7, 3, 51, 201, '2025-06-17 21:10:53'),
(1380, '10', 7, 3, 51, 204, '2025-06-17 21:10:53'),
(1381, '10', 7, 3, 74, 296, '2025-06-17 21:10:53'),
(1382, '10', 7, 3, 74, 294, '2025-06-17 21:10:53'),
(1383, '10', 7, 3, 74, 295, '2025-06-17 21:10:53'),
(1384, '10', 7, 3, 74, 293, '2025-06-17 21:10:53'),
(1385, '10', 7, 3, 70, 278, '2025-06-17 21:10:53'),
(1386, '10', 7, 3, 70, 280, '2025-06-17 21:10:53'),
(1387, '10', 7, 3, 70, 277, '2025-06-17 21:10:53'),
(1388, '10', 7, 3, 70, 279, '2025-06-17 21:10:53'),
(1389, '10', 7, 3, 64, 254, '2025-06-17 21:10:53'),
(1390, '10', 7, 3, 64, 255, '2025-06-17 21:10:53'),
(1391, '10', 7, 3, 64, 256, '2025-06-17 21:10:53'),
(1392, '10', 7, 3, 64, 253, '2025-06-17 21:10:53'),
(1393, '10', 7, 3, 65, 257, '2025-06-17 21:10:53'),
(1394, '10', 7, 3, 65, 259, '2025-06-17 21:10:53'),
(1395, '10', 7, 3, 65, 260, '2025-06-17 21:10:53'),
(1396, '10', 7, 3, 65, 258, '2025-06-17 21:10:53'),
(1397, '10', 7, 3, 72, 288, '2025-06-17 21:10:53'),
(1398, '10', 7, 3, 72, 286, '2025-06-17 21:10:53'),
(1399, '10', 7, 3, 72, 285, '2025-06-17 21:10:53'),
(1400, '10', 7, 3, 72, 287, '2025-06-17 21:10:53'),
(1401, '10', 7, 3, 88, 352, '2025-06-17 21:10:53'),
(1402, '10', 7, 3, 88, 349, '2025-06-17 21:10:53'),
(1403, '10', 7, 3, 88, 351, '2025-06-17 21:10:53'),
(1404, '10', 7, 3, 88, 350, '2025-06-17 21:10:53'),
(1405, '10', 7, 3, 89, 356, '2025-06-17 21:10:53'),
(1406, '10', 7, 3, 89, 354, '2025-06-17 21:10:53'),
(1407, '10', 7, 3, 89, 355, '2025-06-17 21:10:53'),
(1408, '10', 7, 3, 89, 353, '2025-06-17 21:10:53'),
(1409, '10', 7, 3, 84, 335, '2025-06-17 21:10:53'),
(1410, '10', 7, 3, 84, 336, '2025-06-17 21:10:53'),
(1411, '10', 7, 3, 84, 334, '2025-06-17 21:10:53'),
(1412, '10', 7, 3, 84, 333, '2025-06-17 21:10:53'),
(1413, '10', 7, 3, 85, 339, '2025-06-17 21:10:53'),
(1414, '10', 7, 3, 85, 340, '2025-06-17 21:10:53'),
(1415, '10', 7, 3, 85, 338, '2025-06-17 21:10:53'),
(1416, '10', 7, 3, 85, 337, '2025-06-17 21:10:53'),
(1417, '10', 7, 3, 76, 304, '2025-06-17 21:10:53'),
(1418, '10', 7, 3, 76, 303, '2025-06-17 21:10:53'),
(1419, '10', 7, 3, 76, 301, '2025-06-17 21:10:53'),
(1420, '10', 7, 3, 76, 302, '2025-06-17 21:10:53'),
(1421, '1', 9, 5, 157, 625, '2025-06-19 07:26:30'),
(1422, '1', 9, 5, 157, 626, '2025-06-19 07:26:30'),
(1423, '1', 9, 5, 157, 627, '2025-06-19 07:26:30'),
(1424, '1', 9, 5, 157, 628, '2025-06-19 07:26:30'),
(1425, '1', 9, 5, 158, 630, '2025-06-19 07:26:30'),
(1426, '1', 9, 5, 158, 632, '2025-06-19 07:26:30'),
(1427, '1', 9, 5, 158, 629, '2025-06-19 07:26:30'),
(1428, '1', 9, 5, 158, 631, '2025-06-19 07:26:30'),
(1429, '1', 9, 5, 163, 650, '2025-06-19 07:26:30'),
(1430, '1', 9, 5, 163, 651, '2025-06-19 07:26:30'),
(1431, '1', 9, 5, 163, 652, '2025-06-19 07:26:30'),
(1432, '1', 9, 5, 163, 649, '2025-06-19 07:26:30'),
(1433, '1', 9, 5, 152, 606, '2025-06-19 07:26:30'),
(1434, '1', 9, 5, 152, 608, '2025-06-19 07:26:30'),
(1435, '1', 9, 5, 152, 605, '2025-06-19 07:26:30'),
(1436, '1', 9, 5, 152, 607, '2025-06-19 07:26:30'),
(1437, '1', 9, 5, 159, 635, '2025-06-19 07:26:30'),
(1438, '1', 9, 5, 159, 634, '2025-06-19 07:26:30'),
(1439, '1', 9, 5, 159, 633, '2025-06-19 07:26:30'),
(1440, '1', 9, 5, 159, 636, '2025-06-19 07:26:30'),
(1441, '1', 9, 5, 161, 644, '2025-06-19 07:26:30'),
(1442, '1', 9, 5, 161, 643, '2025-06-19 07:26:30'),
(1443, '1', 9, 5, 161, 641, '2025-06-19 07:26:30'),
(1444, '1', 9, 5, 161, 642, '2025-06-19 07:26:30'),
(1445, '1', 9, 5, 151, 601, '2025-06-19 07:26:30'),
(1446, '1', 9, 5, 151, 602, '2025-06-19 07:26:30'),
(1447, '1', 9, 5, 151, 604, '2025-06-19 07:26:30'),
(1448, '1', 9, 5, 151, 603, '2025-06-19 07:26:30'),
(1449, '1', 9, 5, 156, 623, '2025-06-19 07:26:30'),
(1450, '1', 9, 5, 156, 621, '2025-06-19 07:26:30'),
(1451, '1', 9, 5, 156, 622, '2025-06-19 07:26:30'),
(1452, '1', 9, 5, 156, 624, '2025-06-19 07:26:30'),
(1453, '1', 9, 5, 162, 646, '2025-06-19 07:26:30'),
(1454, '1', 9, 5, 162, 645, '2025-06-19 07:26:30'),
(1455, '1', 9, 5, 162, 648, '2025-06-19 07:26:30'),
(1456, '1', 9, 5, 162, 647, '2025-06-19 07:26:30'),
(1457, '1', 9, 5, 164, 653, '2025-06-19 07:26:30'),
(1458, '1', 9, 5, 164, 654, '2025-06-19 07:26:30'),
(1459, '1', 9, 5, 164, 656, '2025-06-19 07:26:30'),
(1460, '1', 9, 5, 164, 655, '2025-06-19 07:26:30'),
(1461, '2', 9, 5, 156, 623, '2025-06-19 07:28:50'),
(1462, '2', 9, 5, 156, 624, '2025-06-19 07:28:50'),
(1463, '2', 9, 5, 156, 621, '2025-06-19 07:28:50'),
(1464, '2', 9, 5, 156, 622, '2025-06-19 07:28:50'),
(1465, '2', 9, 5, 160, 638, '2025-06-19 07:28:50'),
(1466, '2', 9, 5, 160, 637, '2025-06-19 07:28:50'),
(1467, '2', 9, 5, 160, 640, '2025-06-19 07:28:50'),
(1468, '2', 9, 5, 160, 639, '2025-06-19 07:28:50'),
(1469, '2', 9, 5, 165, 658, '2025-06-19 07:28:50'),
(1470, '2', 9, 5, 165, 657, '2025-06-19 07:28:50'),
(1471, '2', 9, 5, 165, 659, '2025-06-19 07:28:50'),
(1472, '2', 9, 5, 165, 660, '2025-06-19 07:28:50'),
(1473, '2', 9, 5, 159, 633, '2025-06-19 07:28:50'),
(1474, '2', 9, 5, 159, 636, '2025-06-19 07:28:50'),
(1475, '2', 9, 5, 159, 635, '2025-06-19 07:28:50'),
(1476, '2', 9, 5, 159, 634, '2025-06-19 07:28:50'),
(1477, '2', 9, 5, 153, 609, '2025-06-19 07:28:50'),
(1478, '2', 9, 5, 153, 612, '2025-06-19 07:28:50'),
(1479, '2', 9, 5, 153, 611, '2025-06-19 07:28:50'),
(1480, '2', 9, 5, 153, 610, '2025-06-19 07:28:50'),
(1481, '2', 9, 5, 161, 643, '2025-06-19 07:28:50'),
(1482, '2', 9, 5, 161, 644, '2025-06-19 07:28:50'),
(1483, '2', 9, 5, 161, 642, '2025-06-19 07:28:50'),
(1484, '2', 9, 5, 161, 641, '2025-06-19 07:28:50'),
(1485, '2', 9, 5, 157, 627, '2025-06-19 07:28:50'),
(1486, '2', 9, 5, 157, 628, '2025-06-19 07:28:50'),
(1487, '2', 9, 5, 157, 625, '2025-06-19 07:28:50'),
(1488, '2', 9, 5, 157, 626, '2025-06-19 07:28:50'),
(1489, '2', 9, 5, 158, 632, '2025-06-19 07:28:50'),
(1490, '2', 9, 5, 158, 629, '2025-06-19 07:28:50'),
(1491, '2', 9, 5, 158, 631, '2025-06-19 07:28:50'),
(1492, '2', 9, 5, 158, 630, '2025-06-19 07:28:50'),
(1493, '2', 9, 5, 155, 618, '2025-06-19 07:28:50'),
(1494, '2', 9, 5, 155, 617, '2025-06-19 07:28:50'),
(1495, '2', 9, 5, 155, 620, '2025-06-19 07:28:50'),
(1496, '2', 9, 5, 155, 619, '2025-06-19 07:28:50'),
(1497, '2', 9, 5, 151, 603, '2025-06-19 07:28:50'),
(1498, '2', 9, 5, 151, 604, '2025-06-19 07:28:50'),
(1499, '2', 9, 5, 151, 602, '2025-06-19 07:28:50'),
(1500, '2', 9, 5, 151, 601, '2025-06-19 07:28:50'),
(1501, '3', 9, 5, 151, 603, '2025-06-19 08:18:08'),
(1502, '3', 9, 5, 151, 601, '2025-06-19 08:18:08'),
(1503, '3', 9, 5, 151, 602, '2025-06-19 08:18:08'),
(1504, '3', 9, 5, 151, 604, '2025-06-19 08:18:08'),
(1505, '3', 9, 5, 155, 618, '2025-06-19 08:18:08'),
(1506, '3', 9, 5, 155, 617, '2025-06-19 08:18:08'),
(1507, '3', 9, 5, 155, 619, '2025-06-19 08:18:08'),
(1508, '3', 9, 5, 155, 620, '2025-06-19 08:18:08'),
(1509, '3', 9, 5, 153, 612, '2025-06-19 08:18:08'),
(1510, '3', 9, 5, 153, 609, '2025-06-19 08:18:08'),
(1511, '3', 9, 5, 153, 610, '2025-06-19 08:18:08'),
(1512, '3', 9, 5, 153, 611, '2025-06-19 08:18:08'),
(1513, '3', 9, 5, 162, 648, '2025-06-19 08:18:08'),
(1514, '3', 9, 5, 162, 645, '2025-06-19 08:18:08'),
(1515, '3', 9, 5, 162, 646, '2025-06-19 08:18:08'),
(1516, '3', 9, 5, 162, 647, '2025-06-19 08:18:08'),
(1517, '3', 9, 5, 158, 630, '2025-06-19 08:18:08'),
(1518, '3', 9, 5, 158, 631, '2025-06-19 08:18:08'),
(1519, '3', 9, 5, 158, 629, '2025-06-19 08:18:08'),
(1520, '3', 9, 5, 158, 632, '2025-06-19 08:18:08'),
(1521, '3', 9, 5, 157, 625, '2025-06-19 08:18:08'),
(1522, '3', 9, 5, 157, 626, '2025-06-19 08:18:08'),
(1523, '3', 9, 5, 157, 628, '2025-06-19 08:18:08'),
(1524, '3', 9, 5, 157, 627, '2025-06-19 08:18:08'),
(1525, '3', 9, 5, 152, 608, '2025-06-19 08:18:08'),
(1526, '3', 9, 5, 152, 605, '2025-06-19 08:18:08'),
(1527, '3', 9, 5, 152, 607, '2025-06-19 08:18:08'),
(1528, '3', 9, 5, 152, 606, '2025-06-19 08:18:08'),
(1529, '3', 9, 5, 161, 642, '2025-06-19 08:18:08'),
(1530, '3', 9, 5, 161, 641, '2025-06-19 08:18:08'),
(1531, '3', 9, 5, 161, 644, '2025-06-19 08:18:08'),
(1532, '3', 9, 5, 161, 643, '2025-06-19 08:18:08'),
(1533, '3', 9, 5, 159, 635, '2025-06-19 08:18:08'),
(1534, '3', 9, 5, 159, 633, '2025-06-19 08:18:08'),
(1535, '3', 9, 5, 159, 636, '2025-06-19 08:18:08'),
(1536, '3', 9, 5, 159, 634, '2025-06-19 08:18:08'),
(1537, '3', 9, 5, 164, 655, '2025-06-19 08:18:08'),
(1538, '3', 9, 5, 164, 653, '2025-06-19 08:18:08'),
(1539, '3', 9, 5, 164, 654, '2025-06-19 08:18:08'),
(1540, '3', 9, 5, 164, 656, '2025-06-19 08:18:08'),
(1541, '4', 9, 5, 153, 609, '2025-06-19 08:18:52'),
(1542, '4', 9, 5, 153, 612, '2025-06-19 08:18:52'),
(1543, '4', 9, 5, 153, 611, '2025-06-19 08:18:52'),
(1544, '4', 9, 5, 153, 610, '2025-06-19 08:18:52'),
(1545, '4', 9, 5, 155, 617, '2025-06-19 08:18:52'),
(1546, '4', 9, 5, 155, 620, '2025-06-19 08:18:52'),
(1547, '4', 9, 5, 155, 618, '2025-06-19 08:18:52'),
(1548, '4', 9, 5, 155, 619, '2025-06-19 08:18:52'),
(1549, '4', 9, 5, 157, 626, '2025-06-19 08:18:52'),
(1550, '4', 9, 5, 157, 627, '2025-06-19 08:18:52'),
(1551, '4', 9, 5, 157, 625, '2025-06-19 08:18:52'),
(1552, '4', 9, 5, 157, 628, '2025-06-19 08:18:52'),
(1553, '4', 9, 5, 156, 624, '2025-06-19 08:18:52'),
(1554, '4', 9, 5, 156, 622, '2025-06-19 08:18:52'),
(1555, '4', 9, 5, 156, 623, '2025-06-19 08:18:52'),
(1556, '4', 9, 5, 156, 621, '2025-06-19 08:18:52'),
(1557, '4', 9, 5, 163, 650, '2025-06-19 08:18:52'),
(1558, '4', 9, 5, 163, 649, '2025-06-19 08:18:52'),
(1559, '4', 9, 5, 163, 651, '2025-06-19 08:18:52'),
(1560, '4', 9, 5, 163, 652, '2025-06-19 08:18:52'),
(1561, '4', 9, 5, 158, 630, '2025-06-19 08:18:52'),
(1562, '4', 9, 5, 158, 632, '2025-06-19 08:18:52'),
(1563, '4', 9, 5, 158, 629, '2025-06-19 08:18:52'),
(1564, '4', 9, 5, 158, 631, '2025-06-19 08:18:52'),
(1565, '4', 9, 5, 164, 653, '2025-06-19 08:18:52'),
(1566, '4', 9, 5, 164, 654, '2025-06-19 08:18:52'),
(1567, '4', 9, 5, 164, 655, '2025-06-19 08:18:52'),
(1568, '4', 9, 5, 164, 656, '2025-06-19 08:18:52'),
(1569, '4', 9, 5, 165, 658, '2025-06-19 08:18:52'),
(1570, '4', 9, 5, 165, 657, '2025-06-19 08:18:52'),
(1571, '4', 9, 5, 165, 659, '2025-06-19 08:18:52'),
(1572, '4', 9, 5, 165, 660, '2025-06-19 08:18:52'),
(1573, '4', 9, 5, 154, 616, '2025-06-19 08:18:52'),
(1574, '4', 9, 5, 154, 615, '2025-06-19 08:18:52'),
(1575, '4', 9, 5, 154, 614, '2025-06-19 08:18:52'),
(1576, '4', 9, 5, 154, 613, '2025-06-19 08:18:52'),
(1577, '4', 9, 5, 162, 646, '2025-06-19 08:18:52'),
(1578, '4', 9, 5, 162, 648, '2025-06-19 08:18:52'),
(1579, '4', 9, 5, 162, 647, '2025-06-19 08:18:52'),
(1580, '4', 9, 5, 162, 645, '2025-06-19 08:18:52'),
(1581, '7', 9, 5, 160, 638, '2025-06-19 08:22:08'),
(1582, '7', 9, 5, 160, 637, '2025-06-19 08:22:08'),
(1583, '7', 9, 5, 160, 640, '2025-06-19 08:22:08'),
(1584, '7', 9, 5, 160, 639, '2025-06-19 08:22:08'),
(1585, '7', 9, 5, 158, 632, '2025-06-19 08:22:08'),
(1586, '7', 9, 5, 158, 630, '2025-06-19 08:22:08'),
(1587, '7', 9, 5, 158, 629, '2025-06-19 08:22:08'),
(1588, '7', 9, 5, 158, 631, '2025-06-19 08:22:08'),
(1589, '7', 9, 5, 163, 650, '2025-06-19 08:22:08'),
(1590, '7', 9, 5, 163, 652, '2025-06-19 08:22:08'),
(1591, '7', 9, 5, 163, 651, '2025-06-19 08:22:08'),
(1592, '7', 9, 5, 163, 649, '2025-06-19 08:22:08'),
(1593, '7', 9, 5, 156, 624, '2025-06-19 08:22:08'),
(1594, '7', 9, 5, 156, 621, '2025-06-19 08:22:08'),
(1595, '7', 9, 5, 156, 622, '2025-06-19 08:22:08'),
(1596, '7', 9, 5, 156, 623, '2025-06-19 08:22:08'),
(1597, '7', 9, 5, 151, 604, '2025-06-19 08:22:08'),
(1598, '7', 9, 5, 151, 601, '2025-06-19 08:22:08'),
(1599, '7', 9, 5, 151, 602, '2025-06-19 08:22:08'),
(1600, '7', 9, 5, 151, 603, '2025-06-19 08:22:08'),
(1601, '7', 9, 5, 157, 627, '2025-06-19 08:22:08'),
(1602, '7', 9, 5, 157, 626, '2025-06-19 08:22:08'),
(1603, '7', 9, 5, 157, 628, '2025-06-19 08:22:08'),
(1604, '7', 9, 5, 157, 625, '2025-06-19 08:22:08'),
(1605, '7', 9, 5, 152, 607, '2025-06-19 08:22:08'),
(1606, '7', 9, 5, 152, 608, '2025-06-19 08:22:08'),
(1607, '7', 9, 5, 152, 605, '2025-06-19 08:22:08'),
(1608, '7', 9, 5, 152, 606, '2025-06-19 08:22:08'),
(1609, '7', 9, 5, 161, 641, '2025-06-19 08:22:08'),
(1610, '7', 9, 5, 161, 643, '2025-06-19 08:22:08'),
(1611, '7', 9, 5, 161, 644, '2025-06-19 08:22:08'),
(1612, '7', 9, 5, 161, 642, '2025-06-19 08:22:08'),
(1613, '7', 9, 5, 164, 654, '2025-06-19 08:22:08'),
(1614, '7', 9, 5, 164, 653, '2025-06-19 08:22:08'),
(1615, '7', 9, 5, 164, 656, '2025-06-19 08:22:08'),
(1616, '7', 9, 5, 164, 655, '2025-06-19 08:22:08'),
(1617, '7', 9, 5, 165, 659, '2025-06-19 08:22:08'),
(1618, '7', 9, 5, 165, 658, '2025-06-19 08:22:08'),
(1619, '7', 9, 5, 165, 657, '2025-06-19 08:22:08'),
(1620, '7', 9, 5, 165, 660, '2025-06-19 08:22:08'),
(1621, '30', 9, 5, 156, 623, '2025-06-19 08:26:02'),
(1622, '30', 9, 5, 156, 624, '2025-06-19 08:26:02'),
(1623, '30', 9, 5, 156, 621, '2025-06-19 08:26:02'),
(1624, '30', 9, 5, 156, 622, '2025-06-19 08:26:02'),
(1625, '30', 9, 5, 159, 634, '2025-06-19 08:26:02'),
(1626, '30', 9, 5, 159, 633, '2025-06-19 08:26:02'),
(1627, '30', 9, 5, 159, 635, '2025-06-19 08:26:02'),
(1628, '30', 9, 5, 159, 636, '2025-06-19 08:26:02'),
(1629, '30', 9, 5, 160, 637, '2025-06-19 08:26:02'),
(1630, '30', 9, 5, 160, 640, '2025-06-19 08:26:02'),
(1631, '30', 9, 5, 160, 638, '2025-06-19 08:26:02'),
(1632, '30', 9, 5, 160, 639, '2025-06-19 08:26:02'),
(1633, '30', 9, 5, 154, 616, '2025-06-19 08:26:02'),
(1634, '30', 9, 5, 154, 615, '2025-06-19 08:26:02'),
(1635, '30', 9, 5, 154, 613, '2025-06-19 08:26:02'),
(1636, '30', 9, 5, 154, 614, '2025-06-19 08:26:02'),
(1637, '30', 9, 5, 155, 620, '2025-06-19 08:26:02'),
(1638, '30', 9, 5, 155, 619, '2025-06-19 08:26:02'),
(1639, '30', 9, 5, 155, 618, '2025-06-19 08:26:02'),
(1640, '30', 9, 5, 155, 617, '2025-06-19 08:26:02'),
(1641, '30', 9, 5, 157, 627, '2025-06-19 08:26:02'),
(1642, '30', 9, 5, 157, 626, '2025-06-19 08:26:02'),
(1643, '30', 9, 5, 157, 625, '2025-06-19 08:26:02'),
(1644, '30', 9, 5, 157, 628, '2025-06-19 08:26:02'),
(1645, '30', 9, 5, 162, 646, '2025-06-19 08:26:02'),
(1646, '30', 9, 5, 162, 645, '2025-06-19 08:26:02'),
(1647, '30', 9, 5, 162, 647, '2025-06-19 08:26:02'),
(1648, '30', 9, 5, 162, 648, '2025-06-19 08:26:02'),
(1649, '30', 9, 5, 158, 631, '2025-06-19 08:26:02'),
(1650, '30', 9, 5, 158, 632, '2025-06-19 08:26:02'),
(1651, '30', 9, 5, 158, 630, '2025-06-19 08:26:02'),
(1652, '30', 9, 5, 158, 629, '2025-06-19 08:26:02'),
(1653, '30', 9, 5, 153, 611, '2025-06-19 08:26:02'),
(1654, '30', 9, 5, 153, 612, '2025-06-19 08:26:02'),
(1655, '30', 9, 5, 153, 609, '2025-06-19 08:26:02'),
(1656, '30', 9, 5, 153, 610, '2025-06-19 08:26:02'),
(1657, '30', 9, 5, 164, 653, '2025-06-19 08:26:02'),
(1658, '30', 9, 5, 164, 655, '2025-06-19 08:26:02'),
(1659, '30', 9, 5, 164, 654, '2025-06-19 08:26:02'),
(1660, '30', 9, 5, 164, 656, '2025-06-19 08:26:02'),
(1661, '13', 9, 5, 154, 613, '2025-06-19 08:38:43'),
(1662, '13', 9, 5, 154, 614, '2025-06-19 08:38:43'),
(1663, '13', 9, 5, 154, 615, '2025-06-19 08:38:43'),
(1664, '13', 9, 5, 154, 616, '2025-06-19 08:38:43'),
(1665, '13', 9, 5, 159, 634, '2025-06-19 08:38:43'),
(1666, '13', 9, 5, 159, 636, '2025-06-19 08:38:43'),
(1667, '13', 9, 5, 159, 633, '2025-06-19 08:38:43'),
(1668, '13', 9, 5, 159, 635, '2025-06-19 08:38:43'),
(1669, '13', 9, 5, 155, 617, '2025-06-19 08:38:43'),
(1670, '13', 9, 5, 155, 620, '2025-06-19 08:38:43'),
(1671, '13', 9, 5, 155, 619, '2025-06-19 08:38:43'),
(1672, '13', 9, 5, 155, 618, '2025-06-19 08:38:43'),
(1673, '13', 9, 5, 163, 652, '2025-06-19 08:38:43'),
(1674, '13', 9, 5, 163, 649, '2025-06-19 08:38:43'),
(1675, '13', 9, 5, 163, 651, '2025-06-19 08:38:43'),
(1676, '13', 9, 5, 163, 650, '2025-06-19 08:38:43'),
(1677, '13', 9, 5, 164, 653, '2025-06-19 08:38:43'),
(1678, '13', 9, 5, 164, 655, '2025-06-19 08:38:43'),
(1679, '13', 9, 5, 164, 656, '2025-06-19 08:38:43'),
(1680, '13', 9, 5, 164, 654, '2025-06-19 08:38:43'),
(1681, '13', 9, 5, 156, 623, '2025-06-19 08:38:43'),
(1682, '13', 9, 5, 156, 621, '2025-06-19 08:38:43'),
(1683, '13', 9, 5, 156, 622, '2025-06-19 08:38:43'),
(1684, '13', 9, 5, 156, 624, '2025-06-19 08:38:43'),
(1685, '13', 9, 5, 152, 608, '2025-06-19 08:38:43'),
(1686, '13', 9, 5, 152, 606, '2025-06-19 08:38:43'),
(1687, '13', 9, 5, 152, 607, '2025-06-19 08:38:43'),
(1688, '13', 9, 5, 152, 605, '2025-06-19 08:38:43'),
(1689, '13', 9, 5, 165, 658, '2025-06-19 08:38:43'),
(1690, '13', 9, 5, 165, 659, '2025-06-19 08:38:43'),
(1691, '13', 9, 5, 165, 660, '2025-06-19 08:38:43'),
(1692, '13', 9, 5, 165, 657, '2025-06-19 08:38:43'),
(1693, '13', 9, 5, 157, 628, '2025-06-19 08:38:43'),
(1694, '13', 9, 5, 157, 625, '2025-06-19 08:38:43'),
(1695, '13', 9, 5, 157, 627, '2025-06-19 08:38:43'),
(1696, '13', 9, 5, 157, 626, '2025-06-19 08:38:43'),
(1697, '13', 9, 5, 151, 604, '2025-06-19 08:38:43'),
(1698, '13', 9, 5, 151, 602, '2025-06-19 08:38:43'),
(1699, '13', 9, 5, 151, 603, '2025-06-19 08:38:43'),
(1700, '13', 9, 5, 151, 601, '2025-06-19 08:38:43'),
(1701, '14', 9, 5, 162, 646, '2025-06-19 08:39:06'),
(1702, '14', 9, 5, 162, 645, '2025-06-19 08:39:06'),
(1703, '14', 9, 5, 162, 648, '2025-06-19 08:39:06'),
(1704, '14', 9, 5, 162, 647, '2025-06-19 08:39:06'),
(1705, '14', 9, 5, 152, 606, '2025-06-19 08:39:06'),
(1706, '14', 9, 5, 152, 607, '2025-06-19 08:39:06'),
(1707, '14', 9, 5, 152, 608, '2025-06-19 08:39:06'),
(1708, '14', 9, 5, 152, 605, '2025-06-19 08:39:06'),
(1709, '14', 9, 5, 154, 613, '2025-06-19 08:39:06'),
(1710, '14', 9, 5, 154, 616, '2025-06-19 08:39:06'),
(1711, '14', 9, 5, 154, 615, '2025-06-19 08:39:06'),
(1712, '14', 9, 5, 154, 614, '2025-06-19 08:39:06'),
(1713, '14', 9, 5, 159, 635, '2025-06-19 08:39:06'),
(1714, '14', 9, 5, 159, 633, '2025-06-19 08:39:06'),
(1715, '14', 9, 5, 159, 636, '2025-06-19 08:39:06'),
(1716, '14', 9, 5, 159, 634, '2025-06-19 08:39:06'),
(1717, '14', 9, 5, 151, 604, '2025-06-19 08:39:06'),
(1718, '14', 9, 5, 151, 602, '2025-06-19 08:39:06'),
(1719, '14', 9, 5, 151, 601, '2025-06-19 08:39:06'),
(1720, '14', 9, 5, 151, 603, '2025-06-19 08:39:06'),
(1721, '14', 9, 5, 153, 611, '2025-06-19 08:39:06'),
(1722, '14', 9, 5, 153, 610, '2025-06-19 08:39:06'),
(1723, '14', 9, 5, 153, 609, '2025-06-19 08:39:06'),
(1724, '14', 9, 5, 153, 612, '2025-06-19 08:39:06'),
(1725, '14', 9, 5, 164, 653, '2025-06-19 08:39:06'),
(1726, '14', 9, 5, 164, 656, '2025-06-19 08:39:06'),
(1727, '14', 9, 5, 164, 655, '2025-06-19 08:39:06'),
(1728, '14', 9, 5, 164, 654, '2025-06-19 08:39:06'),
(1729, '14', 9, 5, 163, 649, '2025-06-19 08:39:06'),
(1730, '14', 9, 5, 163, 652, '2025-06-19 08:39:06'),
(1731, '14', 9, 5, 163, 650, '2025-06-19 08:39:06'),
(1732, '14', 9, 5, 163, 651, '2025-06-19 08:39:06'),
(1733, '14', 9, 5, 161, 644, '2025-06-19 08:39:06'),
(1734, '14', 9, 5, 161, 641, '2025-06-19 08:39:06'),
(1735, '14', 9, 5, 161, 642, '2025-06-19 08:39:06'),
(1736, '14', 9, 5, 161, 643, '2025-06-19 08:39:06'),
(1737, '14', 9, 5, 157, 626, '2025-06-19 08:39:06'),
(1738, '14', 9, 5, 157, 627, '2025-06-19 08:39:06'),
(1739, '14', 9, 5, 157, 625, '2025-06-19 08:39:06'),
(1740, '14', 9, 5, 157, 628, '2025-06-19 08:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `tblprogramme`
--

CREATE TABLE `tblprogramme` (
  `programmeid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `programmetypeid` int(11) DEFAULT '2',
  `hprogtypecode` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblprogramme`
--

INSERT INTO `tblprogramme` (`programmeid`, `name`, `code`, `departmentid`, `programmetypeid`, `hprogtypecode`, `status`) VALUES
(1, 'Computer Science', 'CSC', 1, 2, NULL, 'active'),
(2, 'Information Technology', 'IT', 2, 2, NULL, 'active'),
(3, 'Mathematics', 'MAT', 3, 2, NULL, 'active'),
(4, 'Chemistry', 'CHEM', 4, 2, NULL, 'active'),
(5, 'Mathematics', 'MATH', 5, 2, NULL, 'active'),
(6, 'Biology', 'BIOL', 6, 2, NULL, 'active'),
(7, 'Electrical Engineering', 'EE', 7, 2, NULL, 'active'),
(8, 'Mechanical Engineering', 'ME', 8, 2, NULL, 'active'),
(9, 'Civil Engineering', 'CE', 9, 2, NULL, 'active'),
(10, 'Software Engineering', 'SE', 10, 2, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tblpromotions`
--

CREATE TABLE `tblpromotions` (
  `id` int(11) NOT NULL,
  `personnelno` varchar(50) NOT NULL,
  `promotion_date` date NOT NULL,
  `previous_position` varchar(100) DEFAULT NULL,
  `new_position` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionbank`
--

CREATE TABLE `tblquestionbank` (
  `questionbankid` int(11) NOT NULL,
  `title` text NOT NULL,
  `difficultylevel` enum('simple','difficult','moredifficult') NOT NULL,
  `questiontime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  `author` varchar(50) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `topicid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblquestionbank`
--

INSERT INTO `tblquestionbank` (`questionbankid`, `title`, `difficultylevel`, `questiontime`, `active`, `author`, `subjectid`, `topic`, `topicid`) VALUES
(1, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(2, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(3, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(4, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(5, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(6, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(7, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(8, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(9, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(10, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(11, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(12, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(13, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(14, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(15, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-10 10:53:30', 0, '4', 20, NULL, 28),
(16, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(17, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(18, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(19, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(20, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(21, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(22, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(23, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(24, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(25, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(26, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(27, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(28, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(29, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(30, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:38', 0, '4', 20, NULL, 28),
(31, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(32, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(33, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(34, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(35, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(36, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(37, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(38, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(39, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(40, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(41, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(42, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(43, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(44, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(45, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28),
(46, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(47, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(48, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(49, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(50, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(51, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(52, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(53, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(54, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(55, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(56, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(57, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(58, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(59, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(60, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-14 20:55:43', 0, '4', 23, NULL, 31),
(61, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(62, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(63, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(64, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(65, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(66, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(67, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(68, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(69, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(70, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(71, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(72, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(73, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(74, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(75, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:21', 0, '4', 23, NULL, 31),
(76, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(77, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(78, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(79, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(80, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(81, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(82, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(83, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(84, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(85, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(86, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(87, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(88, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(89, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(90, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:33', 0, '4', 23, NULL, 31),
(91, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(92, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(93, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(94, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(95, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(96, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(97, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(98, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(99, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(100, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(101, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(102, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(103, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(104, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(105, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-15 20:52:28', 0, '4', 22, NULL, 30),
(106, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(107, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(108, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(109, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(110, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(111, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(112, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(113, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(114, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(115, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(116, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(117, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(118, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(119, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(120, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:40', 0, '4', 22, NULL, 30),
(121, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(122, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(123, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(124, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(125, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(126, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(127, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(128, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(129, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(130, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(131, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(132, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(133, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(134, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(135, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:48', 0, '4', 22, NULL, 30),
(136, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(137, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(138, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(139, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(140, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(141, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(142, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(143, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(144, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(145, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(146, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(147, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(148, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(149, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(150, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-16 17:54:27', 0, '4', 24, NULL, 32),
(151, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(152, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(153, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(154, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(155, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(156, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(157, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(158, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(159, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(160, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(161, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(162, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(163, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(164, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29),
(165, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-19 07:16:52', 0, '4', 21, NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionbank_temp`
--

CREATE TABLE `tblquestionbank_temp` (
  `questionbankid` int(11) NOT NULL,
  `title` text NOT NULL,
  `difficultylevel` enum('simple','difficult','moredifficult') NOT NULL,
  `questiontime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  `author` varchar(50) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `topicid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblquestionbank_temp`
--

INSERT INTO `tblquestionbank_temp` (`questionbankid`, `title`, `difficultylevel`, `questiontime`, `active`, `author`, `subjectid`, `topicid`) VALUES
(188, 'Which of the following is considered hardware?&lt;br /&gt;', 'simple', '2025-06-09 15:01:19', 0, '4', 20, 28),
(189, 'Which of these is an input device?&lt;br /&gt;', 'simple', '2025-06-09 15:01:19', 0, '4', 20, 28),
(190, 'What does CPU stand for?&lt;br /&gt;', 'simple', '2025-06-09 15:01:19', 0, '4', 20, 28),
(191, 'The brain of the computer is&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:19', 0, '4', 20, 28),
(192, 'Binary number system uses base&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:19', 0, '4', 20, 28),
(193, 'Which of these is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(194, 'RAM is a type of&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(195, 'Which of the following is volatile memory?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(196, 'What does ROM stand for?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(197, 'Which of these is a storage device?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(198, 'Which of these is system software?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(199, '1 Kilobyte (KB) =&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(200, 'Which of the following is a high-level language?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(201, 'The full meaning of GUI is&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(202, 'Which of these is NOT an operating system?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(203, 'The process of translating high-level language into machine code is called&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(204, 'Which of these is a search engine?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(205, 'Which of the following is used to write programs?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(206, 'Which of these is an example of application software?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(207, 'Which is NOT a type of computer?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(208, 'The full meaning of ICT is&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(209, 'Which of these is used to create web pages?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(210, 'Which company developed the Windows OS?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(211, 'Which key is used to delete characters to the right of the cursor?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(212, 'Which of these is used to protect a computer from viruses?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(213, 'The smallest unit of data in a computer is&amp;#8230;&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(214, 'What is the function of a compiler?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(215, 'Which of the following is NOT a programming paradigm?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(216, 'Which of the following represents the binary number 1010 in decimal?&lt;br /&gt;', 'simple', '2025-06-09 15:01:20', 0, '4', 20, 28),
(217, '&lt;p&gt;--Which of the following is considered hardware?&lt;br /&gt;', 'simple', '2025-06-10 10:52:31', 0, '4', 20, 28),
(218, '&lt;p&gt;--Which of the following is considered hardware?&lt;br /&gt;', 'simple', '2025-06-10 10:52:56', 0, '4', 20, 28),
(219, '&lt;p&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(220, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(221, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(222, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(223, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(224, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(225, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-10 10:53:23', 0, '4', 20, 28),
(226, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(227, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(228, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(229, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(230, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(231, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(232, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(233, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(234, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-10 10:53:24', 0, '4', 20, 28),
(235, '&lt;p&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(236, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(237, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(238, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(239, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(240, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(241, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(242, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(243, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(244, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(245, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(246, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(247, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(248, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(249, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(250, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-10 10:53:35', 0, '4', 20, 28),
(251, '&lt;p&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(252, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(253, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(254, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(255, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(256, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(257, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(258, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(259, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(260, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(261, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(262, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(263, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(264, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(265, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(266, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28),
(267, '&lt;p&gt;--Which of the following is considered hardware?&lt;br /&gt;', 'simple', '2025-06-14 20:55:17', 0, '4', 23, 31),
(268, '&lt;p&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(269, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(270, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(271, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(272, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(273, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(274, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(275, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(276, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(277, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(278, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(279, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(280, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(281, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(282, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(283, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-14 20:55:38', 0, '4', 23, 31),
(284, '&lt;p&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(285, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(286, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(287, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(288, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(289, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(290, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(291, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(292, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(293, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(294, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(295, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(296, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(297, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(298, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(299, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-15 20:46:16', 0, '4', 23, 31),
(300, '&lt;p&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(301, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(302, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(303, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(304, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(305, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(306, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(307, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(308, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(309, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(310, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:27', 0, '4', 23, 31),
(311, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:28', 0, '4', 23, 31),
(312, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:28', 0, '4', 23, 31),
(313, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:28', 0, '4', 23, 31),
(314, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:28', 0, '4', 23, 31),
(315, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:46:28', 0, '4', 23, 31),
(316, '&lt;p&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(317, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(318, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(319, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(320, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(321, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(322, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(323, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(324, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(325, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(326, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(327, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(328, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(329, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(330, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(331, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-15 20:52:23', 0, '4', 22, 30),
(332, '&lt;p&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(333, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(334, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(335, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(336, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(337, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(338, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(339, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(340, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(341, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(342, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(343, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(344, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(345, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(346, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(347, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'difficult', '2025-06-15 20:52:34', 0, '4', 22, 30),
(348, '&lt;p&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(349, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(350, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(351, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(352, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(353, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(354, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(355, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(356, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(357, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(358, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(359, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(360, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(361, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(362, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(363, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-15 20:52:45', 0, '4', 22, 30),
(364, '&lt;p&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(365, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(366, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(367, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(368, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(369, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(370, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(371, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(372, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(373, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(374, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(375, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(376, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(377, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(378, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(379, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-16 17:54:22', 0, '4', 24, 32),
(380, '&lt;p&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(381, 'SIMPLE-What does HTML stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(382, 'SIMPLE-Which device is used to input data into a computer?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(383, 'SIMPLE-Which of the following is a storage device?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(384, 'SIMPLE-What does RAM stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(385, 'SIMPLE-Which part of the computer performs calculations?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(386, 'MODERATE-Which number system uses base 16?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(387, 'MODERATE-What does the acronym SQL stand for?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(388, 'MODERATE-Which of the following is an example of an operating system?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(389, 'MODERATE-Which of the following is NOT a programming language?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(390, 'MODERATE-What is the output of 5 + 3 * 2 in most programming languages?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(391, 'DIFFICULT-Which of the following best describes polymorphism in OOP?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(392, 'DIFFICULT-Which sorting algorithm has the best average case time complexity?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(393, 'DIFFICULT-Which of the following is a NoSQL database?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(394, 'DIFFICULT-What is the main purpose of a foreign key in databases?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29),
(395, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'simple', '2025-06-19 07:16:47', 0, '4', 21, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionpreviewer`
--

CREATE TABLE `tblquestionpreviewer` (
  `id` int(11) NOT NULL,
  `questionbankid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `subjectid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `preview_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsbrsstudents`
--

CREATE TABLE `tblsbrsstudents` (
  `sbrsno` varchar(50) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `othernames` varchar(100) DEFAULT NULL,
  `loginpassword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsbrsstudents`
--

INSERT INTO `tblsbrsstudents` (`sbrsno`, `surname`, `firstname`, `othernames`, `loginpassword`) VALUES
('SBRS001', 'Ahmed', 'Yusuf', 'Ibrahim', 'pass123'),
('SBRS002', 'Okoro', 'Jane', 'Chiamaka', 'secure456'),
('SBRS003', 'Bello', 'Musa', '', 'mypassword789');

-- --------------------------------------------------------

--
-- Table structure for table `tblscheduledcandidate`
--

CREATE TABLE `tblscheduledcandidate` (
  `id` int(11) NOT NULL,
  `candidateid` int(11) NOT NULL,
  `scheduleid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `add_index` int(11) NOT NULL DEFAULT '0',
  `RegNo` varchar(50) NOT NULL,
  `candidatetype` int(11) NOT NULL DEFAULT '3',
  `testid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblscheduledcandidate`
--

INSERT INTO `tblscheduledcandidate` (`id`, `candidateid`, `scheduleid`, `subjectid`, `add_index`, `RegNo`, `candidatetype`, `testid`) VALUES
(1, 1, 13, 21, 0, 'U11AB1023', 3, 9),
(2, 2, 13, 21, 0, 'U11AB1024', 3, 9),
(3, 3, 13, 21, 0, 'U11AB1025', 3, 9),
(4, 4, 13, 21, 0, 'U11AB1026', 3, 9),
(5, 5, 13, 21, 0, 'U11AB1027', 3, 9),
(6, 6, 13, 21, 0, 'U11AB1028', 3, 9),
(7, 7, 13, 21, 0, 'U11AB1029', 3, 9),
(8, 8, 13, 21, 0, 'U11AB1030', 3, 9),
(9, 9, 13, 21, 0, 'U11AB1001', 3, 9),
(10, 10, 13, 21, 0, 'U11AB1002', 3, 9),
(11, 11, 13, 21, 0, 'U11AB1003', 3, 9),
(12, 12, 13, 21, 0, 'U11AB1004', 3, 9),
(13, 13, 13, 21, 0, 'U11AB1005', 3, 9),
(14, 14, 13, 21, 0, 'U11AB1006', 3, 9),
(15, 15, 13, 21, 0, 'U11AB1007', 3, 9),
(16, 16, 13, 21, 0, 'U11AB1008', 3, 9),
(17, 17, 13, 21, 0, 'U11AB1009', 3, 9),
(18, 18, 13, 21, 0, 'U11AB1010', 3, 9),
(19, 19, 13, 21, 0, 'U11AB1011', 3, 9),
(20, 20, 13, 21, 0, 'U11AB1012', 3, 9),
(21, 21, 13, 21, 0, 'U11AB1013', 3, 9),
(22, 22, 13, 21, 0, 'U11AB1014', 3, 9),
(23, 23, 13, 21, 0, 'U11AB1015', 3, 9),
(24, 24, 13, 21, 0, 'U11AB1016', 3, 9),
(25, 25, 13, 21, 0, 'U11AB1017', 3, 9),
(26, 26, 13, 21, 0, 'U11AB1018', 3, 9),
(27, 27, 13, 21, 0, 'U11AB1019', 3, 9),
(28, 28, 13, 21, 0, 'U11AB1020', 3, 9),
(29, 29, 13, 21, 0, 'U11AB1021', 3, 9),
(30, 30, 13, 21, 0, 'U11AB1022', 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tblscheduling`
--

CREATE TABLE `tblscheduling` (
  `schedulingid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `venueid` int(11) NOT NULL,
  `date` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `dailystarttime` time DEFAULT NULL,
  `dailyendtime` time DEFAULT NULL,
  `maximumBatch` int(11) DEFAULT '-1',
  `noPerschedule` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblscheduling`
--

INSERT INTO `tblscheduling` (`schedulingid`, `testid`, `venueid`, `date`, `starttime`, `endtime`, `dailystarttime`, `dailyendtime`, `maximumBatch`, `noPerschedule`) VALUES
(3, 2, 26, '2025-06-14', '00:00:00', '00:00:00', '19:55:00', '21:44:00', 1, 250),
(4, 3, 29, '2025-06-14', '00:00:00', '00:00:00', '22:11:00', '23:59:00', 1, 250),
(5, 5, 30, '2025-06-14', '00:00:00', '00:00:00', '22:59:00', '23:59:00', 1, 250),
(6, 5, 29, '2025-06-15', '00:00:00', '00:00:00', '21:30:00', '23:40:00', 1, 250),
(7, 6, 26, '2025-06-15', '00:00:00', '00:00:00', '21:45:00', '23:59:00', 1, 250),
(11, 8, 29, '2025-06-17', '00:00:00', '00:00:00', '15:00:00', '23:59:00', 1, 250),
(12, 7, 30, '2025-06-17', '00:00:00', '00:00:00', '15:00:00', '23:59:00', 1, 250),
(13, 9, 26, '2025-06-19', '00:00:00', '00:00:00', '08:25:00', '23:59:00', 1, 250);

-- --------------------------------------------------------

--
-- Table structure for table `tblscore`
--

CREATE TABLE `tblscore` (
  `candidateid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `answerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblscore`
--

INSERT INTO `tblscore` (`candidateid`, `testid`, `questionid`, `answerid`) VALUES
(15, 2, 10, 39),
(15, 2, 12, 46),
(15, 2, 15, 57),
(15, 2, 18, 71),
(15, 2, 22, 88),
(15, 2, 35, 138),
(20, 2, 4, 13),
(20, 2, 11, 43),
(20, 2, 10, 39),
(20, 2, 14, 55),
(20, 2, 5, 20),
(20, 2, 24, 93),
(20, 2, 23, 89),
(20, 2, 16, 61),
(20, 2, 30, 118),
(20, 2, 26, 104),
(20, 2, 41, 161),
(20, 2, 43, 172),
(20, 2, 38, 150),
(20, 2, 37, 148),
(20, 2, 35, 140),
(15, 2, 13, 50),
(15, 2, 7, 28),
(15, 2, 28, 109),
(15, 2, 19, 76),
(15, 2, 30, 119),
(15, 2, 45, 180),
(20, 2, 43, 172),
(0, 3, 56, 224),
(0, 3, 48, 192),
(0, 3, 49, 195),
(0, 3, 46, 184),
(0, 3, 59, 236),
(0, 3, 47, 187),
(0, 3, 57, 225),
(0, 3, 50, 199),
(0, 3, 60, 239),
(20, 5, 11, 41),
(20, 5, 8, 32),
(20, 5, 14, 56),
(20, 5, 3, 9),
(20, 5, 5, 18),
(20, 5, 24, 96),
(20, 5, 27, 105),
(20, 5, 19, 75),
(20, 5, 19, 74),
(20, 5, 20, 77),
(20, 5, 18, 70),
(20, 5, 32, 128),
(20, 5, 31, 123),
(20, 5, 33, 131),
(20, 7, 56, 221),
(20, 7, 56, 221),
(20, 7, 52, 206),
(20, 7, 54, 215),
(20, 7, 54, 215),
(20, 7, 53, 210),
(20, 7, 53, 210),
(20, 7, 74, 295),
(20, 7, 61, 241),
(20, 7, 66, 262),
(20, 7, 66, 262),
(20, 7, 70, 278),
(20, 7, 62, 248),
(20, 7, 62, 248),
(20, 7, 82, 326),
(20, 7, 82, 326),
(20, 7, 90, 358),
(20, 8, 96, 384),
(20, 8, 96, 384),
(20, 8, 96, 382),
(20, 8, 96, 382),
(20, 8, 93, 370),
(20, 8, 93, 370),
(20, 8, 98, 389),
(20, 8, 98, 389),
(20, 8, 91, 363),
(20, 8, 91, 363),
(20, 8, 115, 460),
(20, 8, 110, 437),
(20, 8, 107, 427),
(20, 8, 107, 427),
(20, 8, 106, 422),
(20, 8, 106, 422),
(20, 8, 111, 443),
(20, 8, 111, 443),
(20, 8, 127, 506),
(20, 8, 127, 506),
(20, 8, 121, 482),
(20, 8, 121, 482),
(20, 8, 125, 499),
(20, 8, 125, 499),
(20, 8, 128, 512),
(20, 8, 130, 518),
(20, 8, 130, 518),
(0, 7, 50, 198),
(0, 7, 50, 198),
(0, 7, 55, 219),
(0, 7, 55, 219),
(0, 7, 57, 225),
(0, 7, 60, 239),
(0, 7, 60, 239),
(0, 7, 48, 192),
(0, 7, 48, 192),
(0, 7, 69, 274),
(0, 7, 69, 274),
(0, 7, 73, 291),
(0, 7, 73, 291),
(0, 7, 67, 267),
(0, 7, 68, 272),
(0, 7, 71, 284),
(0, 7, 87, 348),
(0, 7, 88, 350),
(0, 7, 88, 350),
(0, 7, 89, 355),
(0, 7, 85, 340),
(0, 7, 50, 200),
(0, 7, 79, 313),
(23, 8, 92, 368),
(23, 8, 92, 368),
(23, 8, 99, 395),
(23, 8, 99, 395),
(23, 8, 101, 404),
(23, 8, 101, 404),
(23, 8, 91, 363),
(23, 8, 97, 387),
(23, 8, 113, 452),
(23, 8, 111, 442),
(23, 8, 111, 442),
(23, 8, 114, 456),
(23, 8, 114, 456),
(23, 8, 110, 440),
(23, 8, 110, 440),
(23, 8, 106, 422),
(23, 8, 126, 503),
(23, 8, 129, 514),
(23, 8, 129, 514),
(23, 8, 123, 491),
(23, 8, 92, 366),
(23, 8, 121, 483),
(23, 8, 121, 483),
(23, 8, 131, 523),
(23, 8, 131, 523),
(24, 8, 95, 378),
(24, 8, 95, 378),
(24, 8, 92, 365),
(24, 8, 92, 365),
(24, 8, 99, 393),
(24, 8, 94, 375),
(24, 8, 94, 375),
(24, 8, 97, 388),
(23, 8, 92, 367),
(23, 8, 92, 366),
(23, 8, 92, 366),
(23, 8, 92, 367),
(25, 8, 104, 415),
(25, 8, 104, 415),
(25, 8, 100, 397),
(25, 8, 100, 397),
(25, 8, 105, 417),
(25, 8, 105, 417),
(25, 8, 98, 392),
(25, 8, 101, 401),
(25, 8, 120, 477),
(25, 8, 120, 477),
(24, 7, 55, 219),
(24, 7, 55, 219),
(25, 7, 55, 218),
(25, 7, 55, 218),
(25, 7, 58, 229),
(25, 7, 58, 229),
(25, 7, 59, 236),
(25, 7, 49, 194),
(25, 7, 49, 194),
(25, 7, 71, 281),
(25, 7, 71, 281),
(25, 7, 69, 275),
(25, 7, 61, 241),
(25, 7, 61, 241),
(25, 7, 72, 288),
(25, 7, 72, 288),
(25, 7, 64, 253),
(25, 7, 64, 253),
(25, 7, 90, 357),
(25, 7, 90, 357),
(25, 7, 78, 309),
(25, 7, 78, 309),
(25, 7, 84, 335),
(25, 7, 79, 314),
(25, 7, 79, 314),
(24, 7, 55, 217),
(24, 7, 54, 216),
(24, 7, 54, 216),
(24, 7, 59, 235),
(24, 7, 47, 185),
(24, 7, 51, 202),
(24, 7, 65, 259),
(24, 7, 65, 259),
(24, 7, 62, 246),
(24, 7, 62, 246),
(24, 7, 61, 244),
(24, 7, 61, 244),
(24, 7, 73, 290),
(24, 7, 63, 249),
(24, 7, 89, 353),
(24, 7, 89, 353),
(24, 7, 84, 335),
(24, 7, 84, 335),
(24, 7, 84, 335),
(24, 7, 84, 335),
(24, 7, 84, 335),
(24, 7, 88, 350),
(24, 7, 88, 350),
(16, 7, 54, 214),
(16, 7, 54, 214),
(16, 7, 59, 233),
(16, 7, 52, 208),
(16, 7, 53, 210),
(16, 7, 53, 210),
(16, 7, 51, 203),
(16, 7, 65, 259),
(16, 7, 62, 246),
(16, 7, 62, 246),
(16, 7, 71, 281),
(16, 7, 67, 268),
(16, 7, 67, 268),
(17, 8, 94, 374),
(17, 8, 94, 374),
(17, 8, 101, 401),
(17, 8, 97, 388),
(17, 8, 97, 388),
(17, 8, 98, 392),
(17, 8, 109, 433),
(17, 8, 113, 449),
(17, 8, 110, 437),
(17, 8, 110, 437),
(17, 8, 114, 456),
(17, 8, 120, 477),
(17, 8, 132, 528),
(17, 8, 132, 528),
(17, 8, 123, 491),
(17, 8, 123, 491),
(16, 7, 73, 290),
(16, 7, 73, 290),
(16, 7, 90, 360),
(16, 7, 90, 360),
(16, 7, 78, 312),
(16, 7, 78, 312),
(16, 7, 84, 333),
(16, 7, 84, 333),
(16, 7, 80, 320),
(16, 7, 80, 320),
(17, 8, 121, 482),
(17, 8, 131, 521),
(16, 7, 54, 216),
(16, 7, 54, 216),
(24, 8, 95, 379),
(24, 8, 95, 379),
(24, 8, 99, 395),
(24, 8, 94, 374),
(24, 8, 94, 374),
(20, 8, 96, 383),
(19, 8, 102, 408),
(9, 7, 46, 184),
(22, 8, 93, 372),
(22, 8, 93, 370),
(22, 8, 94, 375),
(22, 8, 97, 387),
(22, 8, 97, 387),
(22, 8, 103, 410),
(22, 8, 103, 410),
(22, 8, 98, 390),
(22, 8, 118, 470),
(22, 8, 114, 454),
(22, 8, 114, 454),
(22, 8, 109, 435),
(22, 8, 109, 435),
(22, 8, 110, 439),
(22, 8, 110, 438),
(22, 8, 110, 438),
(22, 8, 115, 457),
(22, 8, 127, 507),
(22, 8, 127, 507),
(22, 8, 123, 489),
(22, 8, 123, 489),
(10, 7, 49, 196),
(4, 9, 153, 612),
(4, 9, 155, 618),
(4, 9, 157, 628),
(4, 9, 156, 622),
(4, 9, 163, 651),
(4, 9, 158, 630),
(4, 9, 164, 656),
(4, 9, 165, 660),
(4, 9, 154, 615),
(4, 9, 162, 647);

-- --------------------------------------------------------

--
-- Table structure for table `tblsection`
--

CREATE TABLE `tblsection` (
  `sectionid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `instruction` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblstate`
--

CREATE TABLE `tblstate` (
  `stateid` int(11) NOT NULL,
  `statename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstate`
--

INSERT INTO `tblstate` (`stateid`, `statename`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Abuja'),
(16, 'Gombe'),
(17, 'Imo'),
(18, 'Jigawa'),
(19, 'Kaduna'),
(20, 'Kano'),
(21, 'Katsina'),
(22, 'Kebbi'),
(23, 'Kogi'),
(24, 'Kwara'),
(25, 'Lagos'),
(26, 'Nasarawa'),
(27, 'Niger'),
(28, 'Ogun'),
(29, 'Ondo'),
(30, 'Osun'),
(31, 'Oyo'),
(32, 'Plateau'),
(33, 'Rivers'),
(34, 'Sokoto'),
(35, 'Taraba'),
(36, 'Yobe'),
(37, 'Zamfara');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `studentid` int(11) NOT NULL,
  `matricnumber` varchar(50) NOT NULL,
  `loginpassword` varchar(255) NOT NULL,
  `other_regnum` varchar(50) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `othernames` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `entrylevel` varchar(50) DEFAULT NULL,
  `entrysession` varchar(50) DEFAULT NULL,
  `modeofentry` varchar(50) DEFAULT NULL,
  `contactaddress` text,
  `homeaddress` text,
  `gsmnumber` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `yearadmitted` int(11) DEFAULT NULL,
  `programmeid` int(11) DEFAULT NULL,
  `programmeadmitted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`studentid`, `matricnumber`, `loginpassword`, `other_regnum`, `surname`, `firstname`, `othernames`, `gender`, `dob`, `entrylevel`, `entrysession`, `modeofentry`, `contactaddress`, `homeaddress`, `gsmnumber`, `email`, `yearadmitted`, `programmeid`, `programmeadmitted`) VALUES
(1, 'U10AB9999', 'kaduna', 'U10AB9999', 'Ahmadu', 'Bello', 'Muhd', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345678', 'testuser1@cbt.com', 2021, NULL, NULL),
(2, 'U11AB1001', 'kaduna', 'U11AB1001', 'Binta1', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345679', 'testuser1@cbt.com', 2021, NULL, NULL),
(3, 'U11AB1002', 'kaduna', 'U11AB1002', 'Binta2', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345680', 'testuser1@cbt.com', 2021, NULL, NULL),
(4, 'U11AB1003', 'kaduna', 'U11AB1003', 'Binta3', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345681', 'testuser1@cbt.com', 2021, NULL, NULL),
(5, 'U11AB1004', 'kaduna', 'U11AB1004', 'Binta4', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345682', 'testuser1@cbt.com', 2021, NULL, NULL),
(6, 'U11AB1005', 'kaduna', 'U11AB1005', 'Binta5', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345683', 'testuser1@cbt.com', 2021, NULL, NULL),
(7, 'U11AB1006', 'kaduna', 'U11AB1006', 'Binta6', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345684', 'testuser1@cbt.com', 2021, NULL, NULL),
(8, 'U11AB1007', 'kaduna', 'U11AB1007', 'Binta7', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345685', 'testuser1@cbt.com', 2021, NULL, NULL),
(9, 'U11AB1008', 'kaduna', 'U11AB1008', 'Binta8', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345686', 'testuser1@cbt.com', 2021, NULL, NULL),
(10, 'U11AB1009', 'kaduna', 'U11AB1009', 'Binta9', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345687', 'testuser1@cbt.com', 2021, NULL, NULL),
(11, 'U11AB1010', 'kaduna', 'U11AB1010', 'Binta10', 'Ahmad', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345688', 'testuser1@cbt.com', 2021, NULL, NULL),
(12, 'U11AB1011', 'kaduna', 'U11AB1011', 'Sani1', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345689', 'testuser1@cbt.com', 2021, NULL, NULL),
(13, 'U11AB1012', 'kaduna', 'U11AB1012', 'Sani2', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345690', 'testuser1@cbt.com', 2021, NULL, NULL),
(14, 'U11AB1013', 'kaduna', 'U11AB1013', 'Sani3', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345691', 'testuser1@cbt.com', 2021, NULL, NULL),
(15, 'U11AB1014', 'kaduna', 'U11AB1014', 'Sani4', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345692', 'testuser1@cbt.com', 2021, NULL, 9),
(16, 'U11AB1015', 'kaduna', 'U11AB1015', 'Sani5', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345693', 'testuser1@cbt.com', 2021, NULL, NULL),
(17, 'U11AB1016', 'kaduna', 'U11AB1016', 'Sani6', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345694', 'testuser1@cbt.com', 2021, NULL, NULL),
(18, 'U11AB1017', 'kaduna', 'U11AB1017', 'Sani7', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345695', 'testuser1@cbt.com', 2021, 1, 1),
(19, 'U11AB1018', 'kaduna', 'U11AB1018', 'Sani8', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345696', 'testuser1@cbt.com', 2021, NULL, NULL),
(20, 'U11AB1019', 'kaduna', 'U11AB1019', 'Sani9', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345697', 'testuser1@cbt.com', 2021, NULL, NULL),
(21, 'U11AB1020', 'kaduna', 'U11AB1020', 'Sani10', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345698', 'testuser1@cbt.com', 2021, NULL, NULL),
(22, 'U11AB1021', 'kaduna', 'U11AB1021', 'Sani11', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345699', 'testuser1@cbt.com', 2021, NULL, NULL),
(23, 'U11AB1022', 'kaduna', 'U11AB1022', 'Sani12', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345700', 'testuser1@cbt.com', 2021, NULL, NULL),
(24, 'U11AB1023', 'kaduna', 'U11AB1023', 'Aisha1', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345701', 'testuser1@cbt.com', 2021, NULL, NULL),
(25, 'U11AB1024', 'kaduna', 'U11AB1024', 'Aisha2', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345702', 'testuser1@cbt.com', 2021, NULL, NULL),
(26, 'U11AB1025', 'kaduna', 'U11AB1025', 'Aisha3', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345703', 'testuser1@cbt.com', 2021, NULL, NULL),
(27, 'U11AB1026', 'kaduna', 'U11AB1026', 'Aisha4', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345704', 'testuser1@cbt.com', 2021, NULL, NULL),
(28, 'U11AB1027', 'kaduna', 'U11AB1027', 'Aisha5', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345705', 'testuser1@cbt.com', 2021, NULL, NULL),
(29, 'U11AB1028', 'kaduna', 'U11AB1028', 'Aisha6', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345706', 'testuser1@cbt.com', 2021, NULL, NULL),
(30, 'U11AB1029', 'kaduna', 'U11AB1029', 'Aisha7', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345707', 'testuser1@cbt.com', 2021, NULL, NULL),
(31, 'U11AB1030', 'kaduna', 'U11AB1030', 'Aisha8', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345708', 'testuser1@cbt.com', 2021, NULL, NULL),
(32, 'U11AB1031', 'kaduna', 'U11AB1031', 'Aisha9', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345709', 'testuser1@cbt.com', 2021, NULL, NULL),
(33, 'U11AB1032', 'kaduna', 'U11AB1032', 'Aisha10', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345710', 'testuser1@cbt.com', 2021, NULL, NULL),
(34, 'U11AB1033', 'kaduna', 'U11AB1033', 'Aisha11', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345711', 'testuser1@cbt.com', 2021, NULL, NULL),
(35, 'U11AB1034', 'kaduna', 'U11AB1034', 'Aisha12', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345712', 'testuser1@cbt.com', 2021, NULL, NULL),
(36, 'U11AB1035', 'kaduna', 'U11AB1035', 'Aisha13', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345713', 'testuser1@cbt.com', 2021, NULL, NULL),
(37, 'U11AB1036', 'kaduna', 'U11AB1036', 'Aisha14', 'Ahmadu', 'Bello', 'Female', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345714', 'testuser1@cbt.com', 2021, NULL, NULL),
(38, 'U11AB1037', 'kaduna', 'U11AB1037', 'Hadi2', 'Nasara', 'Sani', 'make', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345715', 'testuser1@cbt.com', 2021, NULL, NULL),
(39, 'U11AB1038', 'kaduna', 'U11AB1038', 'Hadi3', 'Nasara', 'Sani', 'make', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345716', 'testuser1@cbt.com', 2021, NULL, NULL),
(40, 'U11AB1039', 'kaduna', 'U11AB1039', 'Hadi4', 'Nasara', 'Sani', 'make', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345717', 'testuser1@cbt.com', 2021, NULL, NULL),
(41, 'U11AB1040', 'kaduna', 'U11AB1040', 'Hadi5', 'Nasara', 'Sani', 'make', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345718', 'testuser1@cbt.com', 2021, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubject`
--

CREATE TABLE `tblsubject` (
  `subjectid` int(11) NOT NULL,
  `subjectcode` varchar(20) NOT NULL,
  `subjectname` varchar(100) NOT NULL,
  `subjectcategory` varchar(50) DEFAULT NULL,
  `instruction` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsubject`
--

INSERT INTO `tblsubject` (`subjectid`, `subjectcode`, `subjectname`, `subjectcategory`, `instruction`) VALUES
(20, 'GENS101', 'Nationalism1', '1', NULL),
(21, 'COSC101', 'Intro To Computing', '1', NULL),
(22, 'MATH101', 'Number Problem', '1', NULL),
(23, 'HIST101', 'History Of Nigeria', '1', NULL),
(24, 'PHYS', 'Physics', '3', NULL),
(25, 'MATH', 'Mathematics', '3', NULL),
(26, 'ENG', 'English', '3', NULL),
(27, 'CHEM', 'Chemistry', '3', NULL),
(28, 'GEOG', 'Geography', '3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbltestcode`
--

CREATE TABLE `tbltestcode` (
  `testcodeid` int(11) NOT NULL,
  `testname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltestcode`
--

INSERT INTO `tbltestcode` (`testcodeid`, `testname`) VALUES
(20, 'GENS101'),
(21, 'COSC101'),
(22, 'MATH101'),
(23, 'HIST101'),
(24, 'PHYS'),
(25, 'MATH'),
(26, 'ENG'),
(27, 'CHEM'),
(28, 'GEOG');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestcompositor`
--

CREATE TABLE `tbltestcompositor` (
  `id` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `subjectid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltestconfig`
--

CREATE TABLE `tbltestconfig` (
  `testid` int(11) NOT NULL,
  `session` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `testtypeid` int(11) NOT NULL,
  `testcodeid` int(11) NOT NULL,
  `initiatedby` varchar(50) NOT NULL,
  `dateinitiated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `testname` varchar(100) NOT NULL,
  `testdescription` text,
  `teststatus` tinyint(1) DEFAULT '0',
  `testcategory` varchar(50) DEFAULT NULL,
  `totalmark` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `dailystarttime` time DEFAULT NULL,
  `startingmode` varchar(20) DEFAULT NULL,
  `displaymode` varchar(20) DEFAULT NULL,
  `questionadministration` varchar(20) DEFAULT NULL,
  `optionadministration` varchar(20) DEFAULT NULL,
  `versions` int(11) DEFAULT '1',
  `activeversion` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `endorsement` varchar(255) DEFAULT NULL,
  `timepadding` int(11) DEFAULT '0',
  `allow_calc` tinyint(1) DEFAULT '0',
  `passkey` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltestconfig`
--

INSERT INTO `tbltestconfig` (`testid`, `session`, `semester`, `testtypeid`, `testcodeid`, `initiatedby`, `dateinitiated`, `testname`, `testdescription`, `teststatus`, `testcategory`, `totalmark`, `duration`, `dailystarttime`, `startingmode`, `displaymode`, `questionadministration`, `optionadministration`, `versions`, `activeversion`, `status`, `endorsement`, `timepadding`, `allow_calc`, `passkey`) VALUES
(4, '2025', '1', 5, 20, '5', '2025-06-14 21:06:56', 'GENS101', NULL, 0, 'Multi-Subject', 100, 30, NULL, 'on login', 'All', 'random', 'random', 1, 1, 0, NULL, 0, 0, NULL),
(7, '2025', '2', 5, 23, '4', '2025-06-15 20:44:16', 'HIST101', NULL, 0, 'Multi-Subject', 100, 30, NULL, 'on login', 'single question', 'random', 'random', 1, 1, 1, 'yes', 0, 0, 'cbt'),
(8, '2023', '1', 5, 22, '4', '2025-06-15 20:51:03', 'MATH101', NULL, 0, 'Multi-Subject', 100, 5, NULL, 'on starttime', 'single question', 'random', 'random', 1, 1, 1, 'yes', 0, 0, 'cbt'),
(9, '2025', '1', 5, 21, '4', '2025-06-19 07:14:40', 'COSC101', NULL, 0, 'Multi-Subject', 100, 20, NULL, 'on starttime', 'single question', 'random', 'random', 1, 1, 1, 'yes', 0, 0, 'cbt');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestdate`
--

CREATE TABLE `tbltestdate` (
  `testdateid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `testdate` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltestinvigilator`
--

CREATE TABLE `tbltestinvigilator` (
  `id` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltestquestion`
--

CREATE TABLE `tbltestquestion` (
  `testsectionid` int(11) NOT NULL,
  `questionbankid` int(11) NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltestquestion`
--

INSERT INTO `tbltestquestion` (`testsectionid`, `questionbankid`, `version`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 7, 1),
(1, 6, 1),
(1, 5, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 1),
(1, 11, 1),
(1, 12, 1),
(1, 13, 1),
(1, 14, 1),
(1, 15, 1),
(1, 16, 1),
(1, 17, 1),
(1, 18, 1),
(1, 19, 1),
(1, 20, 1),
(1, 21, 1),
(1, 22, 1),
(1, 23, 1),
(1, 24, 1),
(1, 25, 1),
(1, 26, 1),
(1, 27, 1),
(1, 28, 1),
(1, 29, 1),
(1, 30, 1),
(1, 31, 1),
(1, 32, 1),
(1, 33, 1),
(1, 34, 1),
(1, 35, 1),
(1, 36, 1),
(1, 37, 1),
(1, 38, 1),
(1, 39, 1),
(1, 40, 1),
(1, 41, 1),
(1, 42, 1),
(1, 43, 1),
(1, 44, 1),
(1, 45, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 6, 1),
(2, 4, 1),
(2, 5, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 12, 1),
(2, 13, 1),
(2, 14, 1),
(2, 15, 1),
(2, 16, 1),
(2, 17, 1),
(2, 18, 1),
(2, 19, 1),
(2, 20, 1),
(2, 21, 1),
(2, 22, 1),
(2, 23, 1),
(2, 24, 1),
(2, 25, 1),
(2, 26, 1),
(2, 27, 1),
(2, 28, 1),
(2, 29, 1),
(2, 30, 1),
(2, 31, 1),
(2, 32, 1),
(2, 33, 1),
(2, 34, 1),
(2, 35, 1),
(2, 36, 1),
(2, 37, 1),
(2, 38, 1),
(2, 39, 1),
(2, 40, 1),
(2, 41, 1),
(2, 42, 1),
(2, 43, 1),
(2, 44, 1),
(2, 45, 1),
(3, 46, 1),
(3, 47, 1),
(3, 49, 1),
(3, 50, 1),
(3, 52, 1),
(3, 48, 1),
(3, 51, 1),
(3, 53, 1),
(3, 54, 1),
(3, 55, 1),
(3, 56, 1),
(3, 57, 1),
(3, 58, 1),
(3, 59, 1),
(3, 60, 1),
(3, 61, 1),
(3, 62, 1),
(3, 63, 1),
(3, 64, 1),
(3, 67, 1),
(3, 66, 1),
(3, 65, 1),
(3, 68, 1),
(3, 69, 1),
(3, 70, 1),
(3, 71, 1),
(3, 72, 1),
(3, 73, 1),
(3, 74, 1),
(3, 75, 1),
(3, 76, 1),
(3, 77, 1),
(3, 78, 1),
(3, 79, 1),
(3, 80, 1),
(3, 81, 1),
(3, 82, 1),
(3, 83, 1),
(3, 84, 1),
(3, 85, 1),
(3, 86, 1),
(3, 87, 1),
(3, 88, 1),
(3, 89, 1),
(3, 90, 1),
(4, 91, 1),
(4, 93, 1),
(4, 92, 1),
(4, 96, 1),
(4, 94, 1),
(4, 95, 1),
(4, 97, 1),
(4, 98, 1),
(4, 99, 1),
(4, 100, 1),
(4, 101, 1),
(4, 102, 1),
(4, 103, 1),
(4, 104, 1),
(4, 105, 1),
(4, 106, 1),
(4, 107, 1),
(4, 108, 1),
(4, 109, 1),
(4, 110, 1),
(4, 111, 1),
(4, 112, 1),
(4, 113, 1),
(4, 114, 1),
(4, 115, 1),
(4, 116, 1),
(4, 117, 1),
(4, 118, 1),
(4, 119, 1),
(4, 120, 1),
(4, 121, 1),
(4, 122, 1),
(4, 123, 1),
(4, 124, 1),
(4, 125, 1),
(4, 126, 1),
(4, 127, 1),
(4, 128, 1),
(4, 129, 1),
(4, 130, 1),
(4, 131, 1),
(4, 132, 1),
(4, 133, 1),
(4, 134, 1),
(4, 135, 1),
(5, 151, 1),
(5, 152, 1),
(5, 154, 1),
(5, 156, 1),
(5, 155, 1),
(5, 153, 1),
(5, 157, 1),
(5, 158, 1),
(5, 159, 1),
(5, 160, 1),
(5, 161, 1),
(5, 162, 1),
(5, 163, 1),
(5, 164, 1),
(5, 165, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbltestsection`
--

CREATE TABLE `tbltestsection` (
  `testsectionid` int(11) NOT NULL,
  `testsubjectid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `instruction` text,
  `num_toanswer` int(11) NOT NULL,
  `numofeasy` int(11) DEFAULT '0',
  `numofmoderate` int(11) DEFAULT '0',
  `numofdifficult` int(11) DEFAULT '0',
  `markperquestion` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltestsection`
--

INSERT INTO `tbltestsection` (`testsectionid`, `testsubjectid`, `title`, `instruction`, `num_toanswer`, `numofeasy`, `numofmoderate`, `numofdifficult`, `markperquestion`) VALUES
(3, 3, 'AS', 'TEST INSTRUCTION', 15, 5, 5, 5, '20.00'),
(4, 4, 'k', 'This is An Instruction Test', 15, 5, 5, 5, '5.00'),
(5, 5, 'COSC', 'Find Me Instruction', 10, 10, 0, 0, '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestsubject`
--

CREATE TABLE `tbltestsubject` (
  `testsubjectid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `instruction` text,
  `totalmark` int(11) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltestsubject`
--

INSERT INTO `tbltestsubject` (`testsubjectid`, `testid`, `subjectid`, `title`, `instruction`, `totalmark`) VALUES
(3, 7, 23, '', '', 100),
(4, 8, 22, '', '', 100),
(5, 9, 21, '', '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbltesttype`
--

CREATE TABLE `tbltesttype` (
  `testtypeid` int(11) NOT NULL,
  `testtypename` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltesttype`
--

INSERT INTO `tbltesttype` (`testtypeid`, `testtypename`, `description`) VALUES
(1, 'Regular', 'Regular semester examination'),
(2, 'Midterm', 'Mid-semester examination'),
(3, 'Quiz', 'Short assessment test'),
(4, 'Exam', 'Regular examination'),
(5, 'Test', 'Regular test'),
(6, 'MakeUp Test', 'Make-up examination'),
(12, 'Resit Exam', 'Resit examination'),
(13, 'PG Entrance Exam', 'Postgraduate entrance examination'),
(15, 'Aptitude Test', 'Aptitude assessment test'),
(16, 'January Semester', 'January semester examination'),
(17, 'May Semester', 'May semester examination'),
(18, 'September Semester', 'September semester examination');

-- --------------------------------------------------------

--
-- Table structure for table `tbltimecontrol`
--

CREATE TABLE `tbltimecontrol` (
  `id` int(11) NOT NULL,
  `candidateid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `curenttime` datetime DEFAULT NULL,
  `elapsed` int(11) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `securitycode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltimecontrol`
--

INSERT INTO `tbltimecontrol` (`id`, `candidateid`, `testid`, `ip`, `starttime`, `curenttime`, `elapsed`, `completed`, `securitycode`) VALUES
(518, 1, 9, '', NULL, NULL, 0, 0, NULL),
(520, 3, 9, '', NULL, NULL, 0, 0, NULL),
(577, 7, 9, '::1', '2025-06-19 10:22:08', '2025-06-19 10:22:08', 1750321328, 1, NULL),
(679, 4, 9, '::1', '2025-06-19 10:20:36', '2025-06-19 10:25:50', 314, 1, NULL),
(681, 30, 9, '::1', '2025-06-19 10:26:03', '2025-06-19 10:26:03', 1750321563, 1, NULL),
(683, 13, 9, '::1', '2025-06-19 10:38:43', '2025-06-19 10:38:43', 1750322323, 1, NULL),
(859, 14, 9, '::1', '2025-06-19 10:39:37', '2025-06-19 10:48:05', 508, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbltopics`
--

CREATE TABLE `tbltopics` (
  `topicid` int(11) NOT NULL,
  `topicname` varchar(100) NOT NULL,
  `subjectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltopics`
--

INSERT INTO `tbltopics` (`topicid`, `topicname`, `subjectid`) VALUES
(28, 'General', 20),
(29, 'General', 21),
(30, 'General', 22),
(31, 'General', 23),
(32, 'General', 24),
(33, 'General', 25),
(34, 'General', 26),
(35, 'General', 27),
(36, 'General', 28);

-- --------------------------------------------------------

--
-- Table structure for table `tblvenue`
--

CREATE TABLE `tblvenue` (
  `venueid` int(11) NOT NULL,
  `venuename` varchar(100) NOT NULL,
  `centreid` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT '0',
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblvenue`
--

INSERT INTO `tblvenue` (`venueid`, `venuename`, `centreid`, `capacity`, `status`, `created_at`, `location`) VALUES
(26, 'Venue1', 1, 250, 'active', '2025-06-09 15:00:41', 'Location1'),
(27, 'Venue2', 1, 250, 'active', '2025-06-14 19:54:48', 'Location 2'),
(29, 'Venue3', 4, 250, 'active', '2025-06-14 20:09:50', 'Location 3'),
(30, 'Venue2-1', 2, 250, 'active', '2025-06-14 21:27:04', 'Location2-1'),
(31, 'v22', 5, 250, 'active', '2025-06-15 20:53:57', 'Location4');

-- --------------------------------------------------------

--
-- Table structure for table `tblvenuecomputers`
--

CREATE TABLE `tblvenuecomputers` (
  `computerid` int(11) NOT NULL,
  `venueid` int(11) NOT NULL,
  `macaddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `displayname` varchar(100) NOT NULL,
  `staffno` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `displayname`, `staffno`, `enabled`, `created_at`, `last_login`) VALUES
(4, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@system.local', 'System Administrator', 'p12345', 1, '2025-05-23 19:23:32', NULL),
(5, 'p1234', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'p1234@system.local', 'John Doe', 'p12340', 1, '2025-05-24 08:02:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userpermission`
--

CREATE TABLE `userpermission` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userpermission`
--

INSERT INTO `userpermission` (`id`, `userid`, `permissionid`) VALUES
(1, 4, 54),
(2, 4, 55),
(3, 4, 56),
(4, 4, 57),
(5, 4, 58),
(6, 4, 59),
(7, 4, 60),
(8, 4, 61),
(9, 4, 62),
(10, 4, 63),
(11, 4, 64),
(12, 4, 65),
(13, 4, 66),
(14, 4, 67),
(15, 4, 68),
(16, 4, 69),
(17, 4, 70),
(18, 4, 71),
(19, 4, 72),
(20, 4, 73),
(21, 4, 74),
(32, 5, 59),
(33, 5, 69),
(38, 5, 70),
(34, 5, 74);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `userid`, `roleid`) VALUES
(41, 4, 19),
(18, 4, 20),
(19, 4, 21),
(20, 4, 22),
(21, 4, 23),
(22, 4, 24),
(23, 4, 25),
(24, 4, 26),
(25, 4, 27),
(32, 5, 19),
(33, 5, 21),
(34, 5, 22),
(35, 5, 23),
(36, 5, 24),
(44, 5, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission` (`roleid`,`permissionid`),
  ADD KEY `permissionid` (`permissionid`);

--
-- Indexes for table `tblansweroptions`
--
ALTER TABLE `tblansweroptions`
  ADD PRIMARY KEY (`answerid`),
  ADD KEY `questionbankid` (`questionbankid`);

--
-- Indexes for table `tblansweroptions_temp`
--
ALTER TABLE `tblansweroptions_temp`
  ADD PRIMARY KEY (`answerid`),
  ADD KEY `questionbankid` (`questionbankid`);

--
-- Indexes for table `tblcandidatestudent`
--
ALTER TABLE `tblcandidatestudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidateid` (`candidateid`),
  ADD KEY `scheduleid` (`scheduleid`),
  ADD KEY `subjectid` (`subjectid`);

--
-- Indexes for table `tblcentres`
--
ALTER TABLE `tblcentres`
  ADD PRIMARY KEY (`centreid`),
  ADD UNIQUE KEY `centrename` (`centrename`);

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`employeeid`),
  ADD UNIQUE KEY `personnelno` (`personnelno`),
  ADD KEY `idx_departmentid` (`departmentid`);

--
-- Indexes for table `tblentrycombination`
--
ALTER TABLE `tblentrycombination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programmeid` (`programmeid`);

--
-- Indexes for table `tblexamsdate`
--
ALTER TABLE `tblexamsdate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testid` (`testid`);

--
-- Indexes for table `tblfaculty`
--
ALTER TABLE `tblfaculty`
  ADD PRIMARY KEY (`facultyid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tblfaculty_schedule_mapping`
--
ALTER TABLE `tblfaculty_schedule_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_faculty_schedule` (`schedulingid`,`facultyid`),
  ADD KEY `schedulingid` (`schedulingid`),
  ADD KEY `facultyid` (`facultyid`),
  ADD KEY `idx_faculty_schedule_mapping_schedulingid` (`schedulingid`),
  ADD KEY `idx_faculty_schedule_mapping_facultyid` (`facultyid`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `testid` (`testid`);

--
-- Indexes for table `tblhost`
--
ALTER TABLE `tblhost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mac_address` (`mac_address`);

--
-- Indexes for table `tbljamb`
--
ALTER TABLE `tbljamb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RegNo` (`RegNo`);

--
-- Indexes for table `tbllga`
--
ALTER TABLE `tbllga`
  ADD PRIMARY KEY (`lgaid`),
  ADD KEY `stateid` (`stateid`);

--
-- Indexes for table `tblpresentation`
--
ALTER TABLE `tblpresentation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidateid` (`candidateid`),
  ADD KEY `testid` (`testid`),
  ADD KEY `sectionid` (`sectionid`),
  ADD KEY `questionid` (`questionid`),
  ADD KEY `answerid` (`answerid`);

--
-- Indexes for table `tblprogramme`
--
ALTER TABLE `tblprogramme`
  ADD PRIMARY KEY (`programmeid`);

--
-- Indexes for table `tblpromotions`
--
ALTER TABLE `tblpromotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnelno` (`personnelno`);

--
-- Indexes for table `tblquestionbank`
--
ALTER TABLE `tblquestionbank`
  ADD PRIMARY KEY (`questionbankid`),
  ADD KEY `subjectid` (`subjectid`),
  ADD KEY `topicid` (`topicid`);

--
-- Indexes for table `tblquestionbank_temp`
--
ALTER TABLE `tblquestionbank_temp`
  ADD PRIMARY KEY (`questionbankid`),
  ADD KEY `subjectid` (`subjectid`),
  ADD KEY `topicid` (`topicid`);

--
-- Indexes for table `tblquestionpreviewer`
--
ALTER TABLE `tblquestionpreviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionbankid` (`questionbankid`),
  ADD KEY `testid` (`testid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `idx_test_subject` (`testid`,`subjectid`);

--
-- Indexes for table `tblsbrsstudents`
--
ALTER TABLE `tblsbrsstudents`
  ADD PRIMARY KEY (`sbrsno`);

--
-- Indexes for table `tblscheduledcandidate`
--
ALTER TABLE `tblscheduledcandidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblscheduling`
--
ALTER TABLE `tblscheduling`
  ADD PRIMARY KEY (`schedulingid`),
  ADD KEY `fk_scheduling_venue` (`venueid`);

--
-- Indexes for table `tblsection`
--
ALTER TABLE `tblsection`
  ADD PRIMARY KEY (`sectionid`);

--
-- Indexes for table `tblstate`
--
ALTER TABLE `tblstate`
  ADD PRIMARY KEY (`stateid`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `matricnumber` (`matricnumber`);

--
-- Indexes for table `tblsubject`
--
ALTER TABLE `tblsubject`
  ADD PRIMARY KEY (`subjectid`),
  ADD UNIQUE KEY `subjectcode` (`subjectcode`);

--
-- Indexes for table `tbltestcode`
--
ALTER TABLE `tbltestcode`
  ADD PRIMARY KEY (`testcodeid`);

--
-- Indexes for table `tbltestcompositor`
--
ALTER TABLE `tbltestcompositor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_compositor` (`testid`,`userid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `idx_compositor_subject` (`subjectid`);

--
-- Indexes for table `tbltestconfig`
--
ALTER TABLE `tbltestconfig`
  ADD PRIMARY KEY (`testid`),
  ADD KEY `testtypeid` (`testtypeid`),
  ADD KEY `testcodeid` (`testcodeid`);

--
-- Indexes for table `tbltestdate`
--
ALTER TABLE `tbltestdate`
  ADD PRIMARY KEY (`testdateid`),
  ADD KEY `testid` (`testid`);

--
-- Indexes for table `tbltestinvigilator`
--
ALTER TABLE `tbltestinvigilator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_invigilator` (`testid`,`userid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbltestsection`
--
ALTER TABLE `tbltestsection`
  ADD PRIMARY KEY (`testsectionid`),
  ADD KEY `testsubjectid` (`testsubjectid`);

--
-- Indexes for table `tbltestsubject`
--
ALTER TABLE `tbltestsubject`
  ADD PRIMARY KEY (`testsubjectid`),
  ADD UNIQUE KEY `test_subject` (`testid`,`subjectid`),
  ADD KEY `subjectid` (`subjectid`);

--
-- Indexes for table `tbltesttype`
--
ALTER TABLE `tbltesttype`
  ADD PRIMARY KEY (`testtypeid`);

--
-- Indexes for table `tbltimecontrol`
--
ALTER TABLE `tbltimecontrol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidate_test` (`candidateid`,`testid`);

--
-- Indexes for table `tbltopics`
--
ALTER TABLE `tbltopics`
  ADD PRIMARY KEY (`topicid`),
  ADD KEY `subjectid` (`subjectid`);

--
-- Indexes for table `tblvenue`
--
ALTER TABLE `tblvenue`
  ADD PRIMARY KEY (`venueid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `staffno` (`staffno`);

--
-- Indexes for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_permission` (`userid`,`permissionid`),
  ADD KEY `permissionid` (`permissionid`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_role` (`userid`,`roleid`),
  ADD KEY `roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `rolepermission`
--
ALTER TABLE `rolepermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblansweroptions`
--
ALTER TABLE `tblansweroptions`
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;
--
-- AUTO_INCREMENT for table `tblansweroptions_temp`
--
ALTER TABLE `tblansweroptions_temp`
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1781;
--
-- AUTO_INCREMENT for table `tblcandidatestudent`
--
ALTER TABLE `tblcandidatestudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tblcentres`
--
ALTER TABLE `tblcentres`
  MODIFY `centreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `departmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `employeeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;
--
-- AUTO_INCREMENT for table `tblentrycombination`
--
ALTER TABLE `tblentrycombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblexamsdate`
--
ALTER TABLE `tblexamsdate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tblfaculty`
--
ALTER TABLE `tblfaculty`
  MODIFY `facultyid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblfaculty_schedule_mapping`
--
ALTER TABLE `tblfaculty_schedule_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblhost`
--
ALTER TABLE `tblhost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbljamb`
--
ALTER TABLE `tbljamb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbllga`
--
ALTER TABLE `tbllga`
  MODIFY `lgaid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpresentation`
--
ALTER TABLE `tblpresentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1741;
--
-- AUTO_INCREMENT for table `tblprogramme`
--
ALTER TABLE `tblprogramme`
  MODIFY `programmeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblpromotions`
--
ALTER TABLE `tblpromotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblquestionbank`
--
ALTER TABLE `tblquestionbank`
  MODIFY `questionbankid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `tblquestionbank_temp`
--
ALTER TABLE `tblquestionbank_temp`
  MODIFY `questionbankid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
--
-- AUTO_INCREMENT for table `tblquestionpreviewer`
--
ALTER TABLE `tblquestionpreviewer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblscheduledcandidate`
--
ALTER TABLE `tblscheduledcandidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tblscheduling`
--
ALTER TABLE `tblscheduling`
  MODIFY `schedulingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tblsection`
--
ALTER TABLE `tblsection`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblstate`
--
ALTER TABLE `tblstate`
  MODIFY `stateid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tblsubject`
--
ALTER TABLE `tblsubject`
  MODIFY `subjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbltestcode`
--
ALTER TABLE `tbltestcode`
  MODIFY `testcodeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbltestcompositor`
--
ALTER TABLE `tbltestcompositor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltestconfig`
--
ALTER TABLE `tbltestconfig`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbltestdate`
--
ALTER TABLE `tbltestdate`
  MODIFY `testdateid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltestinvigilator`
--
ALTER TABLE `tbltestinvigilator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltestsection`
--
ALTER TABLE `tbltestsection`
  MODIFY `testsectionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbltestsubject`
--
ALTER TABLE `tbltestsubject`
  MODIFY `testsubjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbltesttype`
--
ALTER TABLE `tbltesttype`
  MODIFY `testtypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbltimecontrol`
--
ALTER TABLE `tbltimecontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=860;
--
-- AUTO_INCREMENT for table `tbltopics`
--
ALTER TABLE `tbltopics`
  MODIFY `topicid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tblvenue`
--
ALTER TABLE `tblvenue`
  MODIFY `venueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `userpermission`
--
ALTER TABLE `userpermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD CONSTRAINT `rolepermission_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rolepermission_ibfk_2` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblansweroptions`
--
ALTER TABLE `tblansweroptions`
  ADD CONSTRAINT `tblansweroptions_ibfk_1` FOREIGN KEY (`questionbankid`) REFERENCES `tblquestionbank` (`questionbankid`) ON DELETE CASCADE;

--
-- Constraints for table `tblansweroptions_temp`
--
ALTER TABLE `tblansweroptions_temp`
  ADD CONSTRAINT `tblansweroptions_temp_ibfk_1` FOREIGN KEY (`questionbankid`) REFERENCES `tblquestionbank_temp` (`questionbankid`) ON DELETE CASCADE;

--
-- Constraints for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD CONSTRAINT `fk_department` FOREIGN KEY (`departmentid`) REFERENCES `tbldepartment` (`departmentid`),
  ADD CONSTRAINT `fk_employee_department` FOREIGN KEY (`departmentid`) REFERENCES `tbldepartment` (`departmentid`);

--
-- Constraints for table `tblentrycombination`
--
ALTER TABLE `tblentrycombination`
  ADD CONSTRAINT `fk_entrycombination_programme` FOREIGN KEY (`programmeid`) REFERENCES `tblprogramme` (`programmeid`) ON DELETE CASCADE;

--
-- Constraints for table `tblfaculty_schedule_mapping`
--
ALTER TABLE `tblfaculty_schedule_mapping`
  ADD CONSTRAINT `fk_faculty_schedule_mapping_faculty` FOREIGN KEY (`facultyid`) REFERENCES `tblfaculty` (`facultyid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_faculty_schedule_mapping_scheduling` FOREIGN KEY (`schedulingid`) REFERENCES `tblscheduling` (`schedulingid`) ON DELETE CASCADE;

--
-- Constraints for table `tblquestionbank`
--
ALTER TABLE `tblquestionbank`
  ADD CONSTRAINT `tblquestionbank_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `tblsubject` (`subjectid`),
  ADD CONSTRAINT `tblquestionbank_ibfk_2` FOREIGN KEY (`topicid`) REFERENCES `tbltopics` (`topicid`);

--
-- Constraints for table `tblquestionbank_temp`
--
ALTER TABLE `tblquestionbank_temp`
  ADD CONSTRAINT `tblquestionbank_temp_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `tblsubject` (`subjectid`),
  ADD CONSTRAINT `tblquestionbank_temp_ibfk_2` FOREIGN KEY (`topicid`) REFERENCES `tbltopics` (`topicid`);

--
-- Constraints for table `tblquestionpreviewer`
--
ALTER TABLE `tblquestionpreviewer`
  ADD CONSTRAINT `tblquestionpreviewer_ibfk_2` FOREIGN KEY (`testid`) REFERENCES `tbltestconfig` (`testid`),
  ADD CONSTRAINT `tblquestionpreviewer_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `tblscheduling`
--
ALTER TABLE `tblscheduling`
  ADD CONSTRAINT `fk_scheduling_venue` FOREIGN KEY (`venueid`) REFERENCES `tblvenue` (`venueid`);

--
-- Constraints for table `tbltestcompositor`
--
ALTER TABLE `tbltestcompositor`
  ADD CONSTRAINT `fk_compositor_subject` FOREIGN KEY (`subjectid`) REFERENCES `tblsubject` (`subjectid`),
  ADD CONSTRAINT `tbltestcompositor_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `tbltestconfig` (`testid`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbltestcompositor_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `tbltestconfig`
--
ALTER TABLE `tbltestconfig`
  ADD CONSTRAINT `fk_testconfig_testcode` FOREIGN KEY (`testcodeid`) REFERENCES `tbltestcode` (`testcodeid`),
  ADD CONSTRAINT `fk_testconfig_testtype` FOREIGN KEY (`testtypeid`) REFERENCES `tbltesttype` (`testtypeid`),
  ADD CONSTRAINT `tbltestconfig_ibfk_1` FOREIGN KEY (`testtypeid`) REFERENCES `tbltesttype` (`testtypeid`),
  ADD CONSTRAINT `tbltestconfig_ibfk_2` FOREIGN KEY (`testcodeid`) REFERENCES `tbltestcode` (`testcodeid`);

--
-- Constraints for table `tbltestdate`
--
ALTER TABLE `tbltestdate`
  ADD CONSTRAINT `tbltestdate_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `tbltestconfig` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbltestinvigilator`
--
ALTER TABLE `tbltestinvigilator`
  ADD CONSTRAINT `tbltestinvigilator_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `tbltestconfig` (`testid`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbltestinvigilator_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `tbltestsection`
--
ALTER TABLE `tbltestsection`
  ADD CONSTRAINT `tbltestsection_ibfk_1` FOREIGN KEY (`testsubjectid`) REFERENCES `tbltestsubject` (`testsubjectid`) ON DELETE CASCADE;

--
-- Constraints for table `tbltestsubject`
--
ALTER TABLE `tbltestsubject`
  ADD CONSTRAINT `tbltestsubject_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `tbltestconfig` (`testid`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbltestsubject_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `tblsubject` (`subjectid`);

--
-- Constraints for table `tbltopics`
--
ALTER TABLE `tbltopics`
  ADD CONSTRAINT `tbltopics_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `tblsubject` (`subjectid`) ON DELETE CASCADE;

--
-- Constraints for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD CONSTRAINT `userpermission_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermission_ibfk_2` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
