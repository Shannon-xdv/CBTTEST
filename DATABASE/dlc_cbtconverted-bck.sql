-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 03:08 PM
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
(180, 'An inherited object</p>', 45, 0);

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
(1180, 'An inherited object&lt;/p&gt;', 266, 0);

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
(1, 0, 1, 20, 0);

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
(1, 'REGULAR'),
(2, 'PUTME'),
(3, 'SBRS');

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
(0, 'Centre1', NULL, NULL, 'active', '2025-06-09 15:00:14');

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
(2, 2, '2025-06-10', '00:00:00', '00:00:00', '2025-06-10 11:32:23');

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
(2, '202456780AC', 'Abruzi', 'Fatima', 'John', 'Kaduna', 'zaria', 'F', 20, 73, 'MTH', 81, 'PHY', 87, 'CHEM', 72, 313, 'Engineering', 'Computer Engineering', '2025-05-29 11:44:20');

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

-- --------------------------------------------------------

--
-- Table structure for table `tblprogramme`
--

CREATE TABLE `tblprogramme` (
  `programmeid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblprogramme`
--

INSERT INTO `tblprogramme` (`programmeid`, `name`, `code`, `departmentid`, `status`) VALUES
(1, 'Computer Science', 'CSC', 1, 'active'),
(2, 'Information Technology', 'IT', 2, 'active'),
(3, 'Mathematics', 'MAT', 3, 'active'),
(4, 'Chemistry', 'CHEM', 4, 'active'),
(5, 'Mathematics', 'MATH', 5, 'active'),
(6, 'Biology', 'BIOL', 6, 'active'),
(7, 'Electrical Engineering', 'EE', 7, 'active'),
(8, 'Mechanical Engineering', 'ME', 8, 'active'),
(9, 'Civil Engineering', 'CE', 9, 'active'),
(10, 'Software Engineering', 'SE', 10, 'active');

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
(45, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:49', 0, '4', 20, NULL, 28);

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
(266, 'DIFFICULT-What does the &#39;this&#39; keyword refer to in Java?&lt;br /&gt;', 'moredifficult', '2025-06-10 10:53:43', 0, '4', 20, 28);

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
(1, 0, 0, 0, 0, 'U10AB9999', 3, NULL),
(2, 0, 0, 0, 0, 'U11AB1001', 3, NULL),
(3, 0, 0, 0, 0, 'U11AB1002', 3, NULL),
(4, 0, 0, 0, 0, 'U11AB1003', 3, NULL),
(5, 0, 0, 0, 0, 'U11AB1004', 3, NULL);

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
(1, 2, 26, '2025-06-10', '00:00:00', '00:00:00', '12:50:00', '14:37:00', 1, 250);

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
  `id` int(11) NOT NULL,
  `statename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstate`
--

INSERT INTO `tblstate` (`id`, `statename`) VALUES
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
(15, 'FCT'),
(16, 'Abuja'),
(17, 'Gombe'),
(18, 'Imo'),
(19, 'Jigawa'),
(20, 'Kaduna'),
(21, 'Kano'),
(22, 'Katsina'),
(23, 'Kebbi'),
(24, 'Kogi'),
(25, 'Kwara'),
(26, 'Lagos'),
(27, 'Nasarawa'),
(28, 'Niger'),
(29, 'Ogun'),
(30, 'Ondo'),
(31, 'Osun'),
(32, 'Oyo'),
(33, 'Plateau'),
(34, 'Rivers'),
(35, 'Sokoto'),
(36, 'Taraba'),
(37, 'Yobe'),
(38, 'Zamfara'),
(39, 'Non-Nigerian');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
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

INSERT INTO `tblstudents` (`id`, `matricnumber`, `loginpassword`, `other_regnum`, `surname`, `firstname`, `othernames`, `gender`, `dob`, `entrylevel`, `entrysession`, `modeofentry`, `contactaddress`, `homeaddress`, `gsmnumber`, `email`, `yearadmitted`, `programmeid`, `programmeadmitted`) VALUES
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
(15, 'U11AB1014', 'kaduna', 'U11AB1014', 'Sani4', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345692', 'testuser1@cbt.com', 2021, NULL, NULL),
(16, 'U11AB1015', 'kaduna', 'U11AB1015', 'Sani5', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345693', 'testuser1@cbt.com', 2021, NULL, NULL),
(17, 'U11AB1016', 'kaduna', 'U11AB1016', 'Sani6', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345694', 'testuser1@cbt.com', 2021, NULL, NULL),
(18, 'U11AB1017', 'kaduna', 'U11AB1017', 'Sani7', 'Bello', 'Ahmad', 'Male', '0000-00-00', '400', '2021', 'UG', 'cabcjadjahd', 'cacbancajchja', '0812345695', 'testuser1@cbt.com', 2021, NULL, NULL),
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
(20, 'GENS101', 'Nationalism', '1', NULL),
(21, 'COSC101', 'Intro To Computing', '1', NULL),
(22, 'MATH101', 'Number Problem', '1', NULL);

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
(22, 'MATH101');

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
(2, '2025', '1', 4, 20, '4', '2025-06-10 11:31:09', 'GENS101', NULL, 0, 'Multi-Subject', 100, 30, NULL, 'on starttime', 'All', 'random', 'random', 1, 1, 1, 'yes', 0, 0, 'cbt');

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
(2, 45, 1);

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
(2, 2, 'K', 'Select The correct Answers Only', 15, 5, 5, 5, '2.00');

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
(2, 2, 20, '', '', 100);

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
(30, 'General', 22);

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
(26, 'Venue1', 0, 250, 'active', '2025-06-09 15:00:41', 'Location1');

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
(44, 5, 25),
(38, 5, 27);

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
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
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
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `tblansweroptions_temp`
--
ALTER TABLE `tblansweroptions_temp`
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1181;
--
-- AUTO_INCREMENT for table `tblcandidatestudent`
--
ALTER TABLE `tblcandidatestudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT for table `tblexamsdate`
--
ALTER TABLE `tblexamsdate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbllga`
--
ALTER TABLE `tbllga`
  MODIFY `lgaid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpresentation`
--
ALTER TABLE `tblpresentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `questionbankid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `tblquestionbank_temp`
--
ALTER TABLE `tblquestionbank_temp`
  MODIFY `questionbankid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT for table `tblquestionpreviewer`
--
ALTER TABLE `tblquestionpreviewer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblscheduledcandidate`
--
ALTER TABLE `tblscheduledcandidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblscheduling`
--
ALTER TABLE `tblscheduling`
  MODIFY `schedulingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblsection`
--
ALTER TABLE `tblsection`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblsubject`
--
ALTER TABLE `tblsubject`
  MODIFY `subjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tbltestcode`
--
ALTER TABLE `tbltestcode`
  MODIFY `testcodeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tbltestcompositor`
--
ALTER TABLE `tbltestcompositor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltestconfig`
--
ALTER TABLE `tbltestconfig`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `testsectionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbltestsubject`
--
ALTER TABLE `tbltestsubject`
  MODIFY `testsubjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbltesttype`
--
ALTER TABLE `tbltesttype`
  MODIFY `testtypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbltopics`
--
ALTER TABLE `tbltopics`
  MODIFY `topicid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tblvenue`
--
ALTER TABLE `tblvenue`
  MODIFY `venueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
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
