-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 22, 2010 at 04:03 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crbs2`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `colour` char(7) DEFAULT NULL COMMENT 'Hex colour value',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='School departments' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `description`, `colour`, `created`) VALUES
(1, 'English', '', '#4E9A06', '2008-12-19'),
(2, 'Maths', '', '#EDD400', '2008-12-19'),
(3, 'Science', '', '#729FCF', '2008-12-19'),
(4, 'ICT', '', '#204A87', '2008-12-19'),
(5, 'Music', '', '#F57900', '2008-12-19'),
(6, 'History', '', '#A40000', '2008-12-19'),
(7, 'Art', '', '#EF2929', '2008-12-19'),
(9, 'RE', '', '#E9B96E', '2008-12-19'),
(10, 'Geography', '', '#8F5902', '2008-12-19'),
(11, 'Languages', '', '#AD7FA8', '2009-01-09'),
(12, 'PE', '', '#2E3436', '2009-01-09'),
(13, 'Technology', '', '#BABDB6', '2009-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `departments2ldapgroups`
--

DROP TABLE IF EXISTS `departments2ldapgroups`;
CREATE TABLE `departments2ldapgroups` (
  `department_id` int(10) unsigned NOT NULL,
  `ldapgroup_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `unique` (`department_id`,`ldapgroup_id`),
  KEY `department_id` (`department_id`),
  KEY `ldapgroup_id` (`ldapgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments2ldapgroups`
--

INSERT INTO `departments2ldapgroups` (`department_id`, `ldapgroup_id`) VALUES
(1, 1157),
(2, 1154),
(2, 1176),
(3, 1147),
(3, 1164),
(4, 1149),
(5, 1158),
(6, 1162),
(6, 1190),
(7, 1150),
(9, 1163),
(9, 1186),
(10, 1179),
(10, 1190),
(11, 1156),
(12, 1159),
(12, 1199),
(13, 1144);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bookahead` smallint(3) unsigned DEFAULT NULL COMMENT 'Days ahead users in this group can make a booking',
  `quota_num` int(10) unsigned DEFAULT NULL COMMENT 'Default quota amount',
  `quota_type` enum('day','week','month','current') DEFAULT NULL COMMENT 'Type of quota in use',
  `permissions` text COMMENT 'A PHP-serialize()''d chunk of data',
  `created` date NOT NULL COMMENT 'Date the group was created',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Groups table with settings and permiss; InnoDB free: 9216 kB' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `description`, `bookahead`, `quota_num`, `quota_type`, `permissions`, `created`) VALUES
(0, 'Guests', 'Default group for guests', 0, 1, 'current', 'a:2:{i:0;s:9:"dashboard";i:1;s:8:"bookings";}', '0000-00-00'),
(1, 'Administrators', 'Default group for administrator users', 0, NULL, NULL, 'a:64:{i:0;s:9:"dashboard";i:1;s:18:"dashboard.viewdept";i:2;s:17:"dashboard.viewown";i:3;s:7:"account";i:4;s:17:"account.changepwd";i:5;s:9:"configure";i:6;s:10:"changeyear";i:7;s:8:"allrooms";i:8;s:8:"bookings";i:9;s:19:"bookings.create.one";i:10;s:21:"bookings.create.recur";i:11;s:23:"bookings.delete.one.own";i:12;s:29:"bookings.delete.one.roomowner";i:13;s:31:"bookings.delete.recur.roomowner";i:14;s:5:"rooms";i:15;s:9:"rooms.add";i:16;s:10:"rooms.edit";i:17;s:12:"rooms.delete";i:18;s:11:"rooms.attrs";i:19;s:18:"rooms.attrs.values";i:20;s:17:"rooms.permissions";i:21;s:8:"academic";i:22;s:5:"years";i:23;s:9:"years.add";i:24;s:10:"years.edit";i:25;s:12:"years.delete";i:26;s:7:"periods";i:27;s:11:"periods.add";i:28;s:12:"periods.edit";i:29;s:14:"periods.delete";i:30;s:5:"weeks";i:31;s:9:"weeks.add";i:32;s:10:"weeks.edit";i:33;s:12:"weeks.delete";i:34;s:19:"weeks.ayears.manage";i:35;s:16:"weeks.ayears.set";i:36;s:5:"terms";i:37;s:9:"terms.add";i:38;s:10:"terms.edit";i:39;s:12:"terms.delete";i:40;s:8:"holidays";i:41;s:12:"holidays.add";i:42;s:13:"holidays.edit";i:43;s:15:"holidays.delete";i:44;s:11:"departments";i:45;s:15:"departments.add";i:46;s:16:"departments.edit";i:47;s:18:"departments.delete";i:48;s:7:"reports";i:49;s:21:"reports.owndepartment";i:50;s:22:"reports.alldepartments";i:51;s:15:"reports.ownroom";i:52;s:16:"reports.allrooms";i:53;s:13:"reports.other";i:54;s:5:"users";i:55;s:9:"users.add";i:56;s:10:"users.edit";i:57;s:12:"users.delete";i:58;s:12:"users.import";i:59;s:6:"groups";i:60;s:10:"groups.add";i:61;s:11:"groups.edit";i:62;s:13:"groups.delete";i:63;s:11:"permissions";}', '0000-00-00'),
(2, 'Teaching Staff', 'Teachers from LDAP', 14, 2, 'day', 'a:8:{i:0;s:9:"dashboard";i:1;s:18:"dashboard.viewdept";i:2;s:17:"dashboard.viewown";i:3;s:7:"account";i:4;s:17:"account.changepwd";i:5;s:8:"bookings";i:6;s:19:"bookings.create.one";i:7;s:23:"bookings.delete.one.own";}', '0000-00-00'),
(4, 'Support staff', '', 14, 6, 'current', 'a:7:{i:0;s:9:"dashboard";i:1;s:18:"dashboard.viewdept";i:2;s:17:"dashboard.viewown";i:3;s:9:"myprofile";i:4;s:8:"bookings";i:5;s:19:"bookings.create.one";i:6;s:23:"bookings.delete.one.own";}', '2008-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `groups2ldapgroups`
--

DROP TABLE IF EXISTS `groups2ldapgroups`;
CREATE TABLE `groups2ldapgroups` (
  `group_id` int(10) unsigned NOT NULL,
  `ldapgroup_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `ldapgroup_id` (`ldapgroup_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps 1+ LDAp groups to 1 CRBS group';

--
-- Dumping data for table `groups2ldapgroups`
--

INSERT INTO `groups2ldapgroups` (`group_id`, `ldapgroup_id`) VALUES
(2, 1120),
(4, 1118);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(10) unsigned NOT NULL COMMENT 'The academic year that this holiday is relevant to',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  KEY `year_id` (`year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='School holidays' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`holiday_id`, `year_id`, `date_start`, `date_end`, `name`) VALUES
(4, 1, '2009-01-12', '2009-01-24', 'Foo'),
(5, 1, '2009-01-22', '2009-01-22', 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `ldapgroups`
--

DROP TABLE IF EXISTS `ldapgroups`;
CREATE TABLE `ldapgroups` (
  `ldapgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(104) NOT NULL COMMENT 'Name of LDAP group (not full DN, just name part)',
  PRIMARY KEY (`ldapgroup_id`),
  UNIQUE KEY `ldapgroup_id` (`ldapgroup_id`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Group names retrieved from LDAP; InnoDB free: 9216 kB' AUTO_INCREMENT=1222 ;

--
-- Dumping data for table `ldapgroups`
--

INSERT INTO `ldapgroups` (`ldapgroup_id`, `name`) VALUES
(1116, 'BBS Print Operators'),
(1117, 'BBS Staff Print Operators'),
(1118, 'BBS Non-Teaching Staff'),
(1119, 'BBS Students'),
(1120, 'BBS Teaching Staff'),
(1121, 'BBS Accessibility'),
(1122, 'BBS Internet Disabled'),
(1123, 'BBS Guest UserType'),
(1124, 'BBS RM Explorer UserType'),
(1125, 'BBS Restricted UserType'),
(1126, 'BBS Standard UserType'),
(1127, 'BBS Advanced UserType'),
(1128, 'BBS Staff UserType'),
(1129, 'BBS Advanced Staff UserType'),
(1130, 'BBS Advanced Station Security'),
(1131, 'BBS Standard Station Security'),
(1132, 'BBS No Station Security'),
(1133, 'BBS Shared Laptop StationType'),
(1134, 'BBS Managed Stations'),
(1135, 'BBS Authorised ManagerType'),
(1136, 'BBS Delegate ManagerType'),
(1137, 'BBS Shared Desktop StationType'),
(1138, 'BBS Personal StationType'),
(1139, 'BBS CyberCafe StationType'),
(1140, 'BBS EasyLink'),
(1141, 'BBS Education Management System'),
(1142, 'BBS Legacy Application Users'),
(1143, 'BBS Management Information System'),
(1144, 'BBS Technology Teachers'),
(1145, 'BBS Local Administrators'),
(1146, 'BBS Station Setup'),
(1147, 'BBS Science Teachers'),
(1148, 'BBS Leisure and Tourism Teachers'),
(1149, 'BBS ICT Teachers'),
(1150, 'BBS Art Teachers'),
(1151, 'BBS CD Burning'),
(1152, 'BBS Textiles Teachers'),
(1153, 'BBS PowerDVD'),
(1154, 'BBS Maths Teachers'),
(1155, 'BBS Food Technology Teachers'),
(1156, 'BBS MFL Teachers'),
(1157, 'BBS English Teachers'),
(1158, 'BBS Music Teachers'),
(1159, 'BBS Physical Education Teachers'),
(1160, 'BBS Performing Arts Teachers'),
(1161, 'BBS Media Studies Teachers'),
(1162, 'BBS History Teachers'),
(1163, 'BBS Religious Education Teachers'),
(1164, 'BBS Science'),
(1165, 'BBS RMMC AccessRight'),
(1166, 'BBS User Controller ManagerType'),
(1167, 'BBS EDI System'),
(1168, 'BBS Finance System'),
(1169, 'BBS Library System'),
(1170, 'BBS MIS Manager'),
(1171, 'BBS Network ManagerType'),
(1172, 'BBS Sleuth Users'),
(1173, 'BBS Staff Absences'),
(1174, 'BBS School Income'),
(1175, 'BBS RMSecurenet'),
(1176, 'BBS Maths'),
(1177, 'BBS Science Exam'),
(1178, 'BBS Admin Users'),
(1179, 'BBS Geography Teachers'),
(1180, 'BBS No GPO Security'),
(1181, 'BBS Associates'),
(1182, 'BBS Science year 11'),
(1183, 'BBS Science year 10'),
(1184, 'BBS Science Review'),
(1185, 'BBS Careers Teacher'),
(1186, 'BBS RE Teachers'),
(1187, 'BBS Detention DB Users'),
(1188, 'BBS Eregistration'),
(1189, 'BBS Interactive Whiteboard'),
(1190, 'BBS Humanities'),
(1191, 'BBS Science year 9'),
(1192, 'BBS Legal Team'),
(1193, 'BBS Leisure and Tourism'),
(1194, 'BBS QuarkXPress Users'),
(1195, 'BBS Quizdom'),
(1196, 'BBS BKSB'),
(1197, 'BBS Staff DAP UserType'),
(1198, 'BBS Design Teachers'),
(1199, 'BBS PE Teachers'),
(1200, 'BBS Exam Users'),
(1201, 'Terminal Services Users'),
(1202, 'BBS Shared Desktop 1280 StationType'),
(1203, 'BBS SecureNet'),
(1204, 'BBS Exam Officer'),
(1205, 'BBS Admin Staff UserType'),
(1206, 'BBS AnyComms Users'),
(1207, 'BBS Careers Teachers'),
(1208, 'BBS BKSB Manager'),
(1209, 'BBS Copy of Advanced UserType'),
(1210, 'BBS SEN Teachers'),
(1211, 'BBS SEN Students'),
(1212, 'BBS Childcare'),
(1213, 'BBS Truancy Call'),
(1214, 'BBS SSP'),
(1215, 'BBS Email disabled'),
(1216, 'BBS School Fund Officer'),
(1217, 'BBS IT authorised UserType'),
(1218, 'BBS Copy of Restricted UserType'),
(1219, 'BBS Encrypted Folder'),
(1220, 'BBS Guest 2 UserType'),
(1221, 'BBS HSS Finance');

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
CREATE TABLE `periods` (
  `period_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(10) unsigned NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `name` varchar(20) NOT NULL,
  `days` varchar(255) NOT NULL COMMENT 'Serialize() of the days that this period is set on',
  `bookable` tinyint(1) NOT NULL COMMENT 'Boolean 1 or 0 if periods can be booked or not',
  PRIMARY KEY (`period_id`),
  KEY `year_id` (`year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Periods' AUTO_INCREMENT=68 ;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`period_id`, `year_id`, `time_start`, `time_end`, `name`, `days`, `bookable`) VALUES
(9, 1, '08:45:00', '09:00:00', 'Registration', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(10, 1, '09:00:00', '10:00:00', 'Period 1', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(11, 1, '10:00:00', '11:00:00', 'Period 2', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(12, 1, '11:00:00', '11:15:00', 'Break', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(13, 1, '11:15:00', '12:15:00', 'Period 3', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(14, 1, '12:15:00', '13:20:00', 'Lunch', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(15, 1, '13:20:00', '14:20:00', 'Period 4', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(16, 1, '14:20:00', '15:20:00', 'Period 5', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(49, 1, '15:20:00', '18:30:00', 'After school', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(50, 5, '08:45:00', '09:00:00', 'Registration', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(51, 5, '09:00:00', '10:00:00', 'Period 1', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(52, 5, '10:00:00', '11:00:00', 'Period 2', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(53, 5, '11:00:00', '11:15:00', 'Break', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(54, 5, '11:15:00', '12:15:00', 'Period 3', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(55, 5, '12:15:00', '13:20:00', 'Lunch', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(56, 5, '13:20:00', '14:20:00', 'Period 4', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(57, 5, '14:20:00', '15:20:00', 'Period 5', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(58, 5, '15:20:00', '18:30:00', 'After school', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(59, 7, '08:45:00', '09:00:00', 'Registration', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(60, 7, '09:00:00', '10:00:00', 'Period 1', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(61, 7, '10:00:00', '11:00:00', 'Period 2', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(62, 7, '11:00:00', '11:15:00', 'Break', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(63, 7, '11:15:00', '12:15:00', 'Period 3', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(64, 7, '12:15:00', '13:20:00', 'Lunch', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 0),
(65, 7, '13:20:00', '14:20:00', 'Period 4', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(66, 7, '14:20:00', '15:20:00', 'Period 5', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1),
(67, 7, '15:20:00', '18:30:00', 'After school', 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
CREATE TABLE `quota` (
  `user_id` int(10) unsigned NOT NULL,
  `quota_num` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Quota details';

--
-- Dumping data for table `quota`
--

INSERT INTO `quota` (`user_id`, `quota_num`) VALUES
(1, 666),
(12, 2),
(19, 10),
(22, 10),
(24, 10),
(112, 10),
(113, 10),
(114, 10),
(115, 10),
(116, 10),
(118, 10),
(120, 10),
(121, 10),
(122, 10),
(123, 10),
(125, 10),
(126, 10),
(130, 2);

-- --------------------------------------------------------

--
-- Table structure for table `room-permissions`
--

DROP TABLE IF EXISTS `room-permissions`;
CREATE TABLE `room-permissions` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_ref` varchar(10) NOT NULL COMMENT 'Unique reference for this entry',
  `room_id` int(10) unsigned NOT NULL,
  `type` enum('e','o','u','g','d') NOT NULL COMMENT 'E: everyone; O: owner; U: user; G: group; D: department',
  `user_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `permission` varchar(50) NOT NULL COMMENT 'A single permission',
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `department_id` (`department_id`),
  KEY `room_id` (`room_id`),
  KEY `entry_ref` (`entry_ref`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Permission entries for various objects on different rooms' AUTO_INCREMENT=107 ;

--
-- Dumping data for table `room-permissions`
--

INSERT INTO `room-permissions` (`row_id`, `entry_ref`, `room_id`, `type`, `user_id`, `group_id`, `department_id`, `permission`) VALUES
(78, '1:e:0', 1, 'e', NULL, NULL, NULL, 'bookings.view'),
(79, '1:e:0', 1, 'e', NULL, NULL, NULL, 'bookings.create.one'),
(88, '3:g:2', 3, 'g', NULL, 2, NULL, 'bookings.view'),
(89, '3:g:2', 3, 'g', NULL, 2, NULL, 'bookings.create.one'),
(90, '6:e:0', 6, 'e', NULL, NULL, NULL, 'bookings.view'),
(92, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.create.one'),
(93, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.create.recur'),
(94, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.delete.own.one'),
(95, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.delete.own.recur'),
(96, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.edit.one'),
(97, '1:d:4', 1, 'd', NULL, NULL, 4, 'bookings.edit.recur'),
(98, '1:o:0', 1, 'o', NULL, NULL, NULL, 'bookings.delete.other.one'),
(99, '1:o:0', 1, 'o', NULL, NULL, NULL, 'bookings.delete.other.recur'),
(102, '5:d:13', 5, 'd', NULL, NULL, 13, 'bookings.view'),
(103, '5:d:13', 5, 'd', NULL, NULL, 13, 'bookings.create.one'),
(104, '5:d:13', 5, 'd', NULL, NULL, 13, 'bookings.delete.own.one'),
(105, '5:d:13', 5, 'd', NULL, NULL, 13, 'bookings.edit.one'),
(106, '5:o:0', 5, 'o', NULL, NULL, NULL, 'bookings.delete.other.one');

-- --------------------------------------------------------

--
-- Table structure for table `roomattrs-fields`
--

DROP TABLE IF EXISTS `roomattrs-fields`;
CREATE TABLE `roomattrs-fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` enum('text','select','check') NOT NULL COMMENT 'Text: textbox; Select: Choose one item from list; Check: Boolean on/off',
  `options_md5` char(32) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Names of fields that can be assigned to rooms' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `roomattrs-fields`
--

INSERT INTO `roomattrs-fields` (`field_id`, `name`, `type`, `options_md5`) VALUES
(13, 'Number of computers', 'text', NULL),
(17, 'Colour printer', 'check', NULL),
(18, 'Mono printer', 'check', NULL),
(19, 'Scanner', 'check', NULL),
(20, 'Dropdown', 'select', 'e3b9f91422c68deefb7a78b32dfc70d5');

-- --------------------------------------------------------

--
-- Table structure for table `roomattrs-options`
--

DROP TABLE IF EXISTS `roomattrs-options`;
CREATE TABLE `roomattrs-options` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL COMMENT 'Field that this belongs to',
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Options for room drop-down fields' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `roomattrs-options`
--

INSERT INTO `roomattrs-options` (`option_id`, `field_id`, `value`) VALUES
(33, 20, 'Tom'),
(34, 20, 'Dick'),
(35, 20, 'Harry');

-- --------------------------------------------------------

--
-- Table structure for table `roomattrs-values`
--

DROP TABLE IF EXISTS `roomattrs-values`;
CREATE TABLE `roomattrs-values` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `attr` (`room_id`,`field_id`),
  KEY `field_id` (`field_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Actual values of room fields for each room' AUTO_INCREMENT=231 ;

--
-- Dumping data for table `roomattrs-values`
--

INSERT INTO `roomattrs-values` (`value_id`, `room_id`, `field_id`, `value`) VALUES
(176, 1, 13, '30'),
(177, 1, 17, '1'),
(178, 1, 18, '1'),
(179, 1, 19, ''),
(180, 3, 13, '29'),
(181, 3, 17, '1'),
(182, 3, 18, '1'),
(183, 3, 19, '1'),
(184, 6, 13, '30'),
(185, 6, 17, '1'),
(186, 6, 18, '1'),
(187, 6, 19, ''),
(188, 5, 13, '15'),
(189, 5, 17, '1'),
(190, 5, 18, ''),
(191, 5, 19, ''),
(226, 2, 13, '7'),
(227, 2, 20, '35'),
(228, 2, 17, '1'),
(229, 2, 18, ''),
(230, 2, 19, '');

-- --------------------------------------------------------

--
-- Table structure for table `roomcategories`
--

DROP TABLE IF EXISTS `roomcategories`;
CREATE TABLE `roomcategories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Categories that rooms can belong to' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roomcategories`
--

INSERT INTO `roomcategories` (`category_id`, `name`) VALUES
(4, '0'),
(1, 'ICT'),
(3, 'Maths'),
(2, 'Technology');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'An optional category that the room can belong to',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Specifies an owner (user) of the room',
  `order` tinyint(3) unsigned DEFAULT NULL COMMENT 'Order that the rooms appear in (optional)',
  `name` varchar(20) NOT NULL,
  `description` varchar(40) DEFAULT NULL,
  `bookable` tinyint(1) NOT NULL COMMENT 'Boolean 1 or 0',
  `capacity` int(10) unsigned DEFAULT NULL,
  `photo` char(32) DEFAULT NULL COMMENT 'An md5 hash that references the file that is stored',
  `created` date DEFAULT NULL COMMENT 'Date the entry was created',
  PRIMARY KEY (`room_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='School rooms' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `category_id`, `user_id`, `order`, `name`, `description`, `bookable`, `capacity`, `photo`, `created`) VALUES
(1, 1, NULL, NULL, 'ICT1', 'ICT Suite', 1, 0, '14ae70cf0379e7.#.JPG', NULL),
(2, NULL, NULL, NULL, 'Room 16', '', 0, 7, '14ae7116cd7f20.#.JPG', NULL),
(3, 1, 1, NULL, 'ICT2', 'Room 13', 1, NULL, '0', NULL),
(5, 2, NULL, NULL, 'RM39', 'Tech Suite', 1, 0, '0', '2009-02-13'),
(6, 1, NULL, NULL, 'ICT3', '', 1, NULL, '0', '2009-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='All settings';

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`) VALUES
('school.name', 'Bishop Barrington School'),
('school.url', 'http://www.bishopbarrington.net/'),
('timetable.view', 'day'),
('timetable.cols', 'periods'),
('timetable.roomorder', 'alpha'),
('auth.preauth.key', '0a341129b64a985716e64009526eacc9dfae23d2'),
('auth.preauth.group_id', '2'),
('auth.preauth.emaildomain', 'bishopbarrington.net'),
('auth.ldap', '1'),
('auth.ldap.host', 'bbs-svr-001'),
('auth.ldap.port', '389'),
('auth.ldap.base', 'ou=teaching staff, ou=bbs, ou=establishments, dc=bbarrington, dc=internal; ou=system administrators, ou=bbs, ou=establishments, dc=bbarrington, dc=internal'),
('auth.ldap.filter', '(& (| (!(displayname=Administrator*)) (!(displayname=Admin*)) ) (cn=%u) )'),
('auth.ldap.group_id', '2'),
('auth.ldap.loginupdate', '1');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(10) unsigned NOT NULL COMMENT 'The academic year that this term belongs to',
  `date_start` date NOT NULL COMMENT 'Start date of the term',
  `date_end` date NOT NULL COMMENT 'End date of the term',
  `name` varchar(40) NOT NULL COMMENT 'Name of the term',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `uniquedates` (`date_start`,`date_end`),
  UNIQUE KEY `date_start` (`date_start`),
  UNIQUE KEY `date_end` (`date_end`),
  KEY `year_id` (`year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Term dates' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `year_id`, `date_start`, `date_end`, `name`) VALUES
(1, 1, '2008-09-08', '2008-10-24', 'Autumn'),
(2, 1, '2009-01-05', '2009-02-13', 'Spring A'),
(10, 1, '2009-04-09', '2009-05-16', 'Foo');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

DROP TABLE IF EXISTS `timeslots`;
CREATE TABLE `timeslots` (
  `year_id` int(10) unsigned NOT NULL,
  `start_time` time NOT NULL COMMENT 'Start of day',
  `end_time` time NOT NULL COMMENT 'End of day',
  `interval` bigint(20) unsigned NOT NULL COMMENT 'Time (in seconds)',
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`year_id`, `start_time`, `end_time`, `interval`) VALUES
(5, '08:30:00', '16:30:00', 900),
(7, '08:30:00', '16:30:00', 900);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Group that the user is a member of',
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Boolean 1 or 0',
  `username` varchar(104) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` char(40) DEFAULT NULL COMMENT 'SHA1 hash of password',
  `displayname` varchar(64) DEFAULT NULL,
  `cookiekey` char(40) DEFAULT NULL COMMENT 'SHA1 hash if a cookie is required',
  `lastlogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date the user last logged in',
  `lastactivity` datetime DEFAULT NULL COMMENT 'Last time a page was accessed by this user',
  `ldap` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean 1 or 0 if user should authenticate via LDAP',
  `created` date NOT NULL COMMENT 'Date the user was created',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `ldap` (`ldap`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Main users table' AUTO_INCREMENT=131 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `group_id`, `enabled`, `username`, `email`, `password`, `displayname`, `cookiekey`, `lastlogin`, `lastactivity`, `ldap`, `created`) VALUES
(1, 1, 1, 'admin', 'craig.rodway@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Craig Rodway', NULL, '2010-10-21 14:27:38', '2010-10-22 16:02:35', 0, '0000-00-00'),
(12, 2, 1, 'craig.rodway', 'craig.rodway@bishopbarrington.net', NULL, 'Mr Rodway', NULL, '2009-05-19 11:41:06', '2009-05-19 11:43:17', 0, '2009-01-09'),
(19, 2, 1, 'test.one', 'test.one@bishopbarrington.net', NULL, 'Mr T One', NULL, '2009-05-19 11:55:07', '2009-05-19 11:55:14', 1, '2009-01-14'),
(22, 2, 1, 'test.three', 'test.three@bishopbarrington.net', NULL, 'Mr T Three', NULL, '2009-01-14 10:56:57', '0000-00-00 00:00:00', 1, '2009-01-14'),
(24, 2, 1, 'test.two', 'test.two@bishopbarrington.net', NULL, 'Mr T Two', NULL, '2009-01-26 16:45:49', '0000-00-00 00:00:00', 1, '2009-01-26'),
(112, 2, 0, 'g.harrison100', 'g.harrison100@bishopbarrington.net', '39ccb32d95edfdbcd882f2b01809724ec640ea16', 'g.harrison100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(113, 2, 0, 'j.gent100', 'j.gent100@bishopbarrington.net', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'j.gent100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(114, 2, 0, 'k.hammerton100', 'k.hammerton100@bishopbarrington.net', 'be8ec20d52fdf21c23e83ba2bb7446a7fecb32ac', 'k.hammerton100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(115, 2, 0, 'l.johnson100', 'l.johnson100@bishopbarrington.net', '3a56bca418737e68a7620591abd0e7e8484458a6', 'l.johnson100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(116, 2, 0, 'm.bennett103', 'm.bennett103@bishopbarrington.net', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Mike Bennett', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(118, 2, 0, 'p.beighton100', 'p.beighton100@bishopbarrington.net', '32ba707d8ae992ced8648716fbd88002fc5be03a', 'Phillip Beighton', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(120, 2, 0, 'h.smith104', 'h.smith104@bishopbarrington.net', 'c06538faae9975cce73fc613a8370ba3ffb3d302', 'h.smith104', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(121, 2, 0, 'a.staff100', 'a.staff100@bishopbarrington.net', 'ef20a06d2c45dd9f6a58eacaa6b36d6fc89870a6', 'Adrian Staff', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(122, 2, 0, 'm.stokoe102', 'm.stokoe102@bishopbarrington.net', 'deaae441b2d1596d06f01725f930ed2f2e7277bd', 'm.stokoe102', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(123, 2, 0, 'j.thompson106', 'j.thompson106@bishopbarrington.net', '78c94605b024fc545b9100d2734dc4a4ae8a8335', 'j.thompson106', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(125, 2, 0, 'c.wearmouth100', 'c.wearmouth100@bishopbarrington.net', '9e907431a8d31fefe3c2d341ff8826624c954f15', 'c.wearmouth100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(126, 2, 0, 'e.winstanley100', 'e.winstanley100@bishopbarrington.net', 'ea157601840a5b4953c2e95f5fd27223291122d6', 'e.winstanley100', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2009-01-30'),
(127, 2, 1, 'john.doe', 'teacher@bishopbarrington.net', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'John Doe', NULL, '2009-12-09 14:35:13', '2009-12-09 14:35:43', 0, '2009-10-18'),
(129, 1, 0, 'smithj', '', '41d78584e31c36ffe3724d8ea37084b68179d198', 'smithj', NULL, '0000-00-00 00:00:00', NULL, 0, '2009-10-25'),
(130, 2, 1, 'teacher', 'teacher@bishopbarrington.net', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Teacher', NULL, '2010-10-04 09:46:17', '2010-10-04 09:46:02', 0, '2009-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `users2departments`
--

DROP TABLE IF EXISTS `users2departments`;
CREATE TABLE `users2departments` (
  `user_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  KEY `department_id` (`department_id`),
  KEY `assignment` (`user_id`,`department_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps a user to multiple departments';

--
-- Dumping data for table `users2departments`
--

INSERT INTO `users2departments` (`user_id`, `department_id`) VALUES
(1, 4),
(1, 7),
(19, 2),
(19, 2),
(19, 4),
(127, 2),
(130, 4),
(130, 13);

-- --------------------------------------------------------

--
-- Table structure for table `usersactive`
--

DROP TABLE IF EXISTS `usersactive`;
CREATE TABLE `usersactive` (
  `user_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Keep track of current active users';

--
-- Dumping data for table `usersactive`
--

INSERT INTO `usersactive` (`user_id`, `timestamp`) VALUES
(1, 1287759779);

-- --------------------------------------------------------

--
-- Table structure for table `weekdates`
--

DROP TABLE IF EXISTS `weekdates`;
CREATE TABLE `weekdates` (
  `week_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  UNIQUE KEY `date` (`date`),
  KEY `week_id` (`week_id`),
  KEY `year_id` (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Start-dates of weeks for timetable';

--
-- Dumping data for table `weekdates`
--

INSERT INTO `weekdates` (`week_id`, `year_id`, `date`) VALUES
(11, 1, '2008-09-08'),
(12, 1, '2008-09-15'),
(11, 1, '2008-09-22'),
(12, 1, '2008-09-29'),
(11, 1, '2008-10-06'),
(12, 1, '2008-10-13'),
(11, 1, '2008-10-20'),
(12, 1, '2008-11-03'),
(11, 1, '2008-11-10'),
(12, 1, '2008-11-17'),
(11, 1, '2008-11-24'),
(12, 1, '2008-12-01'),
(11, 1, '2008-12-08'),
(12, 1, '2008-12-15'),
(11, 1, '2009-01-05'),
(12, 1, '2009-01-12'),
(11, 1, '2009-01-19'),
(12, 1, '2009-01-26'),
(11, 1, '2009-02-02'),
(12, 1, '2009-02-09'),
(11, 1, '2009-02-23'),
(12, 1, '2009-03-02'),
(11, 1, '2009-03-09'),
(12, 1, '2009-03-16'),
(11, 1, '2009-03-23'),
(12, 1, '2009-03-30'),
(11, 1, '2009-04-20'),
(12, 1, '2009-04-27'),
(11, 1, '2009-05-04'),
(12, 1, '2009-05-11'),
(11, 1, '2009-05-18'),
(12, 1, '2009-06-01'),
(11, 1, '2009-06-08'),
(12, 1, '2009-06-15'),
(11, 1, '2009-06-22'),
(12, 1, '2009-06-29'),
(11, 1, '2009-07-06'),
(12, 1, '2009-07-13'),
(11, 1, '2009-07-20'),
(13, 5, '2009-09-07'),
(14, 5, '2009-09-14'),
(13, 5, '2009-09-21'),
(14, 5, '2009-09-28'),
(13, 5, '2009-10-05'),
(14, 5, '2009-10-12'),
(13, 5, '2009-10-19'),
(14, 5, '2009-11-02'),
(13, 5, '2009-11-09'),
(14, 5, '2009-11-16'),
(13, 5, '2009-11-23'),
(14, 5, '2009-11-30'),
(13, 5, '2009-12-07'),
(14, 5, '2009-12-14'),
(13, 5, '2010-01-04'),
(14, 5, '2010-01-11'),
(13, 5, '2010-01-18'),
(14, 5, '2010-01-25'),
(13, 5, '2010-02-01'),
(14, 5, '2010-02-08'),
(13, 5, '2010-02-22'),
(14, 5, '2010-03-01'),
(13, 5, '2010-03-08'),
(14, 5, '2010-03-15'),
(13, 5, '2010-03-22'),
(14, 5, '2010-03-29'),
(13, 5, '2010-04-19'),
(14, 5, '2010-04-26'),
(13, 5, '2010-05-03'),
(14, 5, '2010-05-10'),
(13, 5, '2010-05-17'),
(14, 5, '2010-05-24'),
(13, 5, '2010-06-07'),
(14, 5, '2010-06-14'),
(13, 5, '2010-06-21'),
(14, 5, '2010-06-28'),
(13, 5, '2010-07-05'),
(14, 5, '2010-07-12'),
(13, 5, '2010-07-19');

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

DROP TABLE IF EXISTS `weeks`;
CREATE TABLE `weeks` (
  `week_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `colour` char(7) DEFAULT NULL COMMENT 'Hex colour value including hash',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`week_id`),
  KEY `year_id` (`year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Week definitions for timetable weeks' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `weeks`
--

INSERT INTO `weeks` (`week_id`, `year_id`, `name`, `colour`, `created`) VALUES
(11, 1, 'Red Week', '#EF2929', '2009-01-25'),
(12, 1, 'Blue Week', '#3465A4', '2009-01-25'),
(13, 5, 'Red Week', '#CC0000', '2009-11-01'),
(14, 5, 'Blue Week', '#3465A4', '2009-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE `years` (
  `year_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `name` varchar(20) NOT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`year_id`),
  UNIQUE KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Academic year definitions' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`year_id`, `date_start`, `date_end`, `name`, `active`) VALUES
(1, '2008-09-08', '2009-07-23', '2008 - 2009', NULL),
(5, '2009-09-07', '2010-07-23', '2009 - 2010', NULL),
(6, '2007-09-01', '2008-07-24', '2007 - 2008', NULL),
(7, '2010-09-07', '2011-07-22', '2010 - 2011', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departments2ldapgroups`
--
ALTER TABLE `departments2ldapgroups`
  ADD CONSTRAINT `departments2ldapgroups_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `departments2ldapgroups_ibfk_2` FOREIGN KEY (`ldapgroup_id`) REFERENCES `ldapgroups` (`ldapgroup_id`) ON DELETE CASCADE;

--
-- Constraints for table `groups2ldapgroups`
--
ALTER TABLE `groups2ldapgroups`
  ADD CONSTRAINT `groups2ldapgroups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups2ldapgroups_ibfk_2` FOREIGN KEY (`ldapgroup_id`) REFERENCES `ldapgroups` (`ldapgroup_id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE CASCADE;

--
-- Constraints for table `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE CASCADE;

--
-- Constraints for table `quota`
--
ALTER TABLE `quota`
  ADD CONSTRAINT `quota_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `room-permissions`
--
ALTER TABLE `room-permissions`
  ADD CONSTRAINT `room@002dpermissions_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room@002dpermissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room@002dpermissions_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room@002dpermissions_ibfk_4` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `roomattrs-options`
--
ALTER TABLE `roomattrs-options`
  ADD CONSTRAINT `roomattrs@002doptions_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `roomattrs-fields` (`field_id`) ON DELETE CASCADE;

--
-- Constraints for table `roomattrs-values`
--
ALTER TABLE `roomattrs-values`
  ADD CONSTRAINT `roomattrs@002dvalues_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roomattrs@002dvalues_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `roomattrs-fields` (`field_id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `roomcategories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`);

--
-- Constraints for table `users2departments`
--
ALTER TABLE `users2departments`
  ADD CONSTRAINT `users2departments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2departments_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `usersactive`
--
ALTER TABLE `usersactive`
  ADD CONSTRAINT `usersactive_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `weekdates`
--
ALTER TABLE `weekdates`
  ADD CONSTRAINT `weekdates_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `weekdates_ibfk_2` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`week_id`) ON DELETE CASCADE;

--
-- Constraints for table `weeks`
--
ALTER TABLE `weeks`
  ADD CONSTRAINT `weeks_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE CASCADE;

SET FOREIGN_KEY_CHECKS=1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;