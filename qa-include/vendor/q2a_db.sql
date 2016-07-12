-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2016 at 04:21 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `q2a_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `qa_blobs`
--

CREATE TABLE IF NOT EXISTS `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cache`
--

CREATE TABLE IF NOT EXISTS `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categories`
--

CREATE TABLE IF NOT EXISTS `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categorymetas`
--

CREATE TABLE IF NOT EXISTS `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_contentwords`
--

CREATE TABLE IF NOT EXISTS `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_contentwords`
--

INSERT INTO `qa_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 1, 4, 'Q', 1),
(1, 2, 4, 'Q', 1),
(1, 3, 4, 'Q', 1),
(1, 4, 4, 'Q', 1),
(1, 5, 4, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_cookies`
--

CREATE TABLE IF NOT EXISTS `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cs_widgets`
--

CREATE TABLE IF NOT EXISTS `qa_cs_widgets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `position` varchar(64) DEFAULT NULL,
  `widget_order` int(2) NOT NULL DEFAULT '0',
  `param` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=216 ;

--
-- Dumping data for table `qa_cs_widgets`
--

INSERT INTO `qa_cs_widgets` (`id`, `name`, `position`, `widget_order`, `param`) VALUES
(109, 'CS Tags', 'Right', 1, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:0;s:4:"home";b:0;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:13:"cs_tags_count";s:2:"10";}}'),
(98, 'CS User Posts', 'User Content', 1, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:11:"cs_ua_count";s:1:"5";s:11:"cs_up_count";s:2:"10";s:10:"cs_up_type";s:1:"Q";}}'),
(77, 'CS Featured Questions', 'Home Slide', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:0;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:4:{s:11:"cs_fq_count";s:1:"8";s:11:"cs_fq_boxes";s:1:"4";s:11:"cs_nu_count";s:2:"16";s:12:"cs_nu_avatar";s:2:"60";}}'),
(79, 'CS Ticker', 'Home 1 Left', 0, 'a:3:{s:2:"id";i:0;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:2:"10";s:14:"cs_CS Ticker_data";s:8:"Category";s:14:"cs_CS Ticker_slug";s:6:"Themes";}}'),
(80, 'CS Question Activity', 'Home Left', 0, 'a:3:{s:2:"id";i:80;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:11:"cs_qa_count";s:2:"14";}}'),
(81, 'CS Ticker', 'Home 3 Left', 0, 'a:3:{s:2:"id";i:0;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:7:"Keyword";s:14:"cs_CS Ticker_slug";s:5:"Lorem";}}'),
(82, 'CS Ticker', 'Home 3 Center', 0, 'a:3:{s:2:"id";i:82;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:7:"Keyword";s:14:"cs_CS Ticker_slug";s:3:"Est";}}'),
(85, 'CS New Users', 'New Users', 0, 'a:3:{s:2:"id";i:0;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:2:{s:11:"cs_nu_count";s:2:"20";s:12:"cs_nu_avatar";s:2:"30";}}'),
(86, 'CS Top Contributors', 'Top Users', 0, 'a:3:{s:2:"id";i:0;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:2:{s:11:"cs_tc_count";s:1:"5";s:12:"cs_tc_avatar";s:2:"30";}}'),
(84, 'CS Ticker', 'Home 1 Center', 0, 'a:3:{s:2:"id";i:0;s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:8:"Category";s:14:"cs_CS Ticker_slug";s:6:"Themes";}}'),
(87, 'CS Site Activity', 'Home Right', 2, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:11:"cs_sa_count";s:1:"7";}}'),
(88, 'CS Tags', 'Left', 1, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:13:"cs_tags_count";s:2:"10";}}'),
(96, 'CS User Activity', 'User Content', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:11:"cs_ua_count";s:1:"5";s:11:"cs_up_count";s:1:"5";s:10:"cs_up_type";s:1:"C";}}'),
(99, 'CS User Posts', 'User Content', 2, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:11:"cs_ua_count";s:1:"5";s:11:"cs_up_count";s:1:"5";s:10:"cs_up_type";s:1:"A";}}'),
(100, 'CS User Posts', 'User Content', 3, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:11:"cs_ua_count";s:1:"5";s:11:"cs_up_count";s:1:"5";s:10:"cs_up_type";s:1:"C";}}'),
(103, 'CS Ticker', 'Home 1 Left', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:8:"Category";s:14:"cs_CS Ticker_slug";s:6:"Joomla";}}'),
(102, 'CS Ajax Ask', 'Header', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:0;s:8:"question";b:0;s:9:"questions";b:0;s:8:"activity";b:0;s:10:"unanswered";b:0;s:3:"hot";b:0;s:4:"tags";b:0;s:3:"tag";b:0;s:10:"categories";b:0;s:5:"users";b:0;s:4:"user";b:0;s:7:"account";b:0;s:8:"favorite";b:0;s:9:"user-wall";b:0;s:13:"user-activity";b:0;s:14:"user-questions";b:0;s:12:"user-answers";b:0;s:6:"custom";b:0;s:5:"login";b:0;s:8:"feedback";b:0;s:7:"updates";b:0;s:6:"search";b:0;s:5:"admin";b:0;}s:7:"options";a:0:{}}'),
(104, 'CS Ticker', 'Home 1 Center', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:8:"Category";s:14:"cs_CS Ticker_slug";s:16:"Themes/Wordpress";}}'),
(105, 'CS Ticker', 'Home 1 Right', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:7:"Keyword";s:14:"cs_CS Ticker_slug";s:3:"Vel";}}'),
(108, 'CS Question Activity', 'Home 2', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:11:"cs_qa_count";s:2:"22";}}'),
(118, 'CS New Users', 'Home Slide', 1, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:0;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:4:{s:11:"cs_fq_count";s:1:"8";s:11:"cs_fq_boxes";s:1:"4";s:11:"cs_nu_count";s:2:"16";s:12:"cs_nu_avatar";s:2:"60";}}'),
(117, 'CS Top Contributors', 'Home Right', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:2:{s:11:"cs_tc_count";s:1:"5";s:12:"cs_tc_avatar";s:2:"30";}}'),
(211, 'CS Ticker', 'Home 3 Left', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:7:"Keyword";s:14:"cs_CS Ticker_slug";s:5:"Lorem";}}'),
(215, 'CS Related Questions', 'Question Right', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:5:"count";s:2:"10";}}'),
(120, 'CS Categories', 'Left', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:17:"cs_category_depth";s:1:"1";}}'),
(213, 'CS Ticker', 'Home 3 Center', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:3:{s:15:"cs_CS Ticker_count";s:1:"5";s:14:"cs_CS Ticker_data";s:7:"Keyword";s:14:"cs_CS Ticker_slug";s:5:"ipsum";}}'),
(123, 'CS Site Status', 'Right', 0, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:0;s:4:"home";b:0;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:10:"cs_ss_type";s:3:"bar";}}'),
(125, 'CS Site Activity', 'Right', 2, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:0;s:4:"home";b:0;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:0;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:11:"cs_sa_count";s:1:"8";}}'),
(209, 'CS Posts', 'Home Right', 5, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:2:{s:11:"cs_qa_count";s:1:"5";s:9:"post_type";s:1:"Q";}}'),
(200, 'CS Site Status', 'Home Right', 1, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:1:{s:10:"cs_ss_type";s:3:"bar";}}'),
(208, 'CS Posts', 'Home Right', 4, 'a:2:{s:9:"locations";a:26:{s:10:"show_title";b:1;s:2:"qa";b:1;s:4:"home";b:1;s:3:"ask";b:1;s:8:"question";b:1;s:9:"questions";b:1;s:8:"activity";b:1;s:10:"unanswered";b:1;s:3:"hot";b:1;s:4:"tags";b:1;s:3:"tag";b:1;s:10:"categories";b:1;s:5:"users";b:1;s:4:"user";b:1;s:7:"account";b:1;s:8:"favorite";b:1;s:9:"user-wall";b:1;s:13:"user-activity";b:1;s:14:"user-questions";b:1;s:12:"user-answers";b:1;s:6:"custom";b:1;s:5:"login";b:1;s:8:"feedback";b:1;s:7:"updates";b:1;s:6:"search";b:1;s:5:"admin";b:1;}s:7:"options";a:2:{s:11:"cs_qa_count";s:1:"5";s:9:"post_type";s:1:"Q";}}');

-- --------------------------------------------------------

--
-- Table structure for table `qa_iplimits`
--

CREATE TABLE IF NOT EXISTS `qa_iplimits` (
  `ip` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_iplimits`
--

INSERT INTO `qa_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0, 'Q', 407776, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_messages`
--

CREATE TABLE IF NOT EXISTS `qa_messages` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) unsigned NOT NULL,
  `touserid` int(10) unsigned NOT NULL,
  `fromhidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  KEY `touserid` (`touserid`,`type`,`created`),
  KEY `fromhidden` (`fromhidden`),
  KEY `tohidden` (`tohidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_options`
--

CREATE TABLE IF NOT EXISTS `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('allow_change_usernames', '1'),
('allow_close_questions', '1'),
('allow_login_email_only', ''),
('allow_multi_answers', '1'),
('allow_private_messages', '1'),
('allow_self_answer', '1'),
('allow_user_walls', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_blobid', ''),
('avatar_default_height', ''),
('avatar_default_show', ''),
('avatar_default_width', ''),
('avatar_message_list_size', '20'),
('avatar_profile_size', '200'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_store_size', '400'),
('avatar_users_size', '30'),
('badge_active', ''),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_acount', ''),
('cache_ccount', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '1'),
('cache_uapprovecount', '0'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('cs_ads_after_question_content', ''),
('cs_ads_below_question_title', ''),
('cs_advs', ''),
('cs_ask_btn_bg', ''),
('cs_back_to_top_location', 'nav'),
('cs_bg_color', '#F4F4F4'),
('cs_bg_select', ''),
('cs_border_color', '#EEEEEE'),
('cs_crop_x', 'c'),
('cs_crop_y', 'c'),
('cs_custom_css', ''),
('cs_custom_style', ''),
('cs_custom_style_created', ''),
('cs_enable_adv_list', ''),
('cs_enable_ask_button', '1'),
('cs_enable_avatar_lists', ''),
('cs_enable_category_nav', '1'),
('cs_enable_clean_qlist', '1'),
('cs_enable_default_home', '1'),
('cs_enable_except', ''),
('cs_enable_footer_nav', '1'),
('cs_enable_gzip', ''),
('cs_enble_back_to_top', '1'),
('cs_except_len', '240'),
('cs_favicon_url', ''),
('cs_featured_image_height', '300'),
('cs_featured_image_width', '800'),
('cs_featured_thumbnail_height', '120'),
('cs_featured_thumbnail_width', '278'),
('cs_footer_copyright', 'Copyright Â© 2015'),
('cs_highlight_bg_color', ''),
('cs_highlight_color', ''),
('cs_horizontal_voting_btns', ''),
('cs_init', '1'),
('cs_link_color', ''),
('cs_link_hover_color', ''),
('cs_mobile_logo_url', 'http://localhost/q2a/qa-theme/cleanstrap/images/small-logo.png'),
('cs_nav_fixed', '1'),
('cs_nav_link_color', ''),
('cs_nav_link_color_hover', ''),
('cs_nav_position', 'top'),
('cs_q_link_color', ''),
('cs_q_link_hover_color', ''),
('cs_show_icon', '1'),
('cs_show_tags_list', '1'),
('cs_social_enable', ''),
('cs_social_list', ''),
('cs_styling_closed_question', ''),
('cs_styling_duplicate_question', ''),
('cs_styling_open_question', ''),
('cs_styling_rtl', ''),
('cs_styling_solved_question', ''),
('cs_subnav_link_color', ''),
('cs_subnav_link_color_hover', ''),
('cs_text_color', ''),
('cs_theme_layout', 'boxed'),
('cs_version', '2.4.4'),
('cs_widgets_positions', 'a:18:{s:3:"Top";s:13:"Before navbar";s:6:"Header";s:12:"After navbar";s:11:"Header left";s:19:"Left side of header";s:12:"Header Right";s:20:"Right side of header";s:4:"Left";s:21:"Right side below menu";s:11:"Content Top";s:21:"Before questions list";s:14:"Content Bottom";s:21:"After questions lists";s:5:"Right";s:21:"Right side of content";s:6:"Bottom";s:31:"Below content and before footer";s:10:"Home Slide";s:8:"Home Top";s:11:"Home 1 Left";s:15:"Home position 1";s:13:"Home 1 Center";s:15:"Home position 1";s:6:"Home 2";s:15:"Home position 2";s:11:"Home 3 Left";s:15:"Home position 3";s:13:"Home 3 Center";s:15:"Home position 3";s:10:"Home Right";s:15:"Home right side";s:14:"Question Right";s:22:"Right side of question";s:12:"User Content";s:12:"On user page";}'),
('custom_answer', ''),
('custom_ask', ''),
('custom_comment', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_home_content', ''),
('custom_home_heading', ''),
('custom_in_head', ''),
('custom_register', ''),
('custom_sidepanel', ''),
('custom_welcome', ''),
('db_version', '59'),
('do_ask_check_qs', '0'),
('do_close_on_select', ''),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('extra_field_display', ''),
('extra_field_label', ''),
('extra_field_prompt', ''),
('facebook_app_id', ''),
('feedback_email', 'ducchinhbk@gmail.com'),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_for_questions', '1'),
('feed_for_unanswered', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('form_security_salt', '7nf620alfg0cyyree1vk9k6p3f5b5m12'),
('from_email', 'no-reply@example.com'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', 'http://localhost/q2a/qa-theme/cleanstrap/images/logo.png'),
('logo_width', ''),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('match_related_qs', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_messages', '10'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_messages', '5'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('min_len_a_content', '12'),
('min_len_c_content', '12'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('mouseover_content_on', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '1'),
('notice_visitor', ''),
('notice_welcome', ''),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_check_qs', '5'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_pms', '10'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_tags', '30'),
('page_size_una_qs', '20'),
('page_size_users', '30'),
('page_size_wall', '10'),
('permit_anon_view_ips', '70'),
('permit_close_q', '70'),
('permit_delete_hidden', '40'),
('permit_edit_a', '100'),
('permit_edit_c', '70'),
('permit_edit_q', '70'),
('permit_edit_silent', '40'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_post_wall', '110'),
('permit_retag_cat', '70'),
('permit_select_a', '100'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_a', '120'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('register_notify_admin', ''),
('register_terms', 'I agree to the Localhost Q&amp;A Terms &amp; Conditions and Privacy Policy'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_comment', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_register', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '0'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', ''),
('show_message_history', '1'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_register_terms', '0'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', ''),
('show_view_count_q_page', ''),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'cleanstrap'),
('site_theme_mobile', 'Classic'),
('site_title', 'Localhost Q&A'),
('site_url', 'http://localhost/q2a/'),
('smtp_active', ''),
('smtp_address', ''),
('smtp_authenticate', ''),
('smtp_password', ''),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', ''),
('sort_answers_by', 'created'),
('styling_open_question', ''),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('typo_googlefonts', ''),
('typo_options_backup_h1', ''),
('typo_options_backup_h2', ''),
('typo_options_backup_h3', ''),
('typo_options_backup_h4', ''),
('typo_options_backup_h5', ''),
('typo_options_backup_mainnav', ''),
('typo_options_backup_p', ''),
('typo_options_backup_pcontent', ''),
('typo_options_backup_qtitle', ''),
('typo_options_backup_qtitlelink', ''),
('typo_options_backup_quote', ''),
('typo_options_backup_span', ''),
('typo_options_family_h1', ''),
('typo_options_family_h2', ''),
('typo_options_family_h3', ''),
('typo_options_family_h4', ''),
('typo_options_family_h5', ''),
('typo_options_family_mainnav', ''),
('typo_options_family_p', ''),
('typo_options_family_pcontent', ''),
('typo_options_family_qtitle', ''),
('typo_options_family_qtitlelink', ''),
('typo_options_family_quote', ''),
('typo_options_family_span', ''),
('typo_options_linehight_h1', ''),
('typo_options_linehight_h2', ''),
('typo_options_linehight_h3', ''),
('typo_options_linehight_h4', ''),
('typo_options_linehight_h5', ''),
('typo_options_linehight_mainnav', ''),
('typo_options_linehight_p', ''),
('typo_options_linehight_pcontent', ''),
('typo_options_linehight_qtitle', ''),
('typo_options_linehight_qtitlelink', ''),
('typo_options_linehight_quote', ''),
('typo_options_linehight_span', ''),
('typo_options_size_h1', ''),
('typo_options_size_h2', ''),
('typo_options_size_h3', ''),
('typo_options_size_h4', ''),
('typo_options_size_h5', ''),
('typo_options_size_mainnav', ''),
('typo_options_size_p', ''),
('typo_options_size_pcontent', ''),
('typo_options_size_qtitle', ''),
('typo_options_size_qtitlelink', ''),
('typo_options_size_quote', ''),
('typo_options_size_span', ''),
('typo_options_style_h1', ''),
('typo_options_style_h2', ''),
('typo_options_style_h3', ''),
('typo_options_style_h4', ''),
('typo_options_style_h5', ''),
('typo_options_style_mainnav', ''),
('typo_options_style_p', ''),
('typo_options_style_pcontent', ''),
('typo_options_style_qtitle', ''),
('typo_options_style_qtitlelink', ''),
('typo_options_style_quote', ''),
('typo_options_style_span', ''),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pages`
--

CREATE TABLE IF NOT EXISTS `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_postmetas`
--

CREATE TABLE IF NOT EXISTS `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_posts`
--

CREATE TABLE IF NOT EXISTS `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `lastip` int(10) unsigned DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `qa_posts`
--

INSERT INTO `qa_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, 41143400000, 0, '', '2016-07-08 23:07:27', NULL, NULL, 'lhdaflhdalf fladhfljadf fladhfladf lfjhdalf lfhad', 'lhdaflhdalf fladhfljadf fladhfladf lfjhdalf lfhad\n\nlhdaflhdalf fladhfljadf fladhfladf lfjhdalf lfhad\n\nlhdaflhdalf fladhfljadf fladhfladf lfjhdalf lfhad\n\nlhdaflhdalf fladhfljadf fladhfladf lfjhdalf lfhad', 'da', NULL, '@');

-- --------------------------------------------------------

--
-- Table structure for table `qa_posttags`
--

CREATE TABLE IF NOT EXISTS `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posttags`
--

INSERT INTO `qa_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(1, 6, '2016-07-08 23:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `qa_sharedevents`
--

CREATE TABLE IF NOT EXISTS `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_sharedevents`
--

INSERT INTO `qa_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 1, '2016-07-08 23:07:28'),
('U', 1, 1, 1, NULL, 1, '2016-07-08 23:07:28'),
('T', 6, 1, 1, NULL, 1, '2016-07-08 23:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagmetas`
--

CREATE TABLE IF NOT EXISTS `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagwords`
--

CREATE TABLE IF NOT EXISTS `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_tagwords`
--

INSERT INTO `qa_tagwords` (`postid`, `wordid`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `qa_titlewords`
--

CREATE TABLE IF NOT EXISTS `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_titlewords`
--

INSERT INTO `qa_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userevents`
--

CREATE TABLE IF NOT EXISTS `qa_userevents` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfavorites`
--

CREATE TABLE IF NOT EXISTS `qa_userfavorites` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfields`
--

CREATE TABLE IF NOT EXISTS `qa_userfields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, NULL),
(2, 'location', NULL, 2, 0, NULL),
(3, 'website', NULL, 3, 2, NULL),
(4, 'about', NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlevels`
--

CREATE TABLE IF NOT EXISTS `qa_userlevels` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlimits`
--

CREATE TABLE IF NOT EXISTS `qa_userlimits` (
  `userid` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userlimits`
--

INSERT INTO `qa_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(1, 'Q', 407776, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlogins`
--

CREATE TABLE IF NOT EXISTS `qa_userlogins` (
  `userid` int(10) unsigned NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  KEY `source` (`source`,`identifiermd5`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermetas`
--

CREATE TABLE IF NOT EXISTS `qa_usermetas` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usernotices`
--

CREATE TABLE IF NOT EXISTS `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userpoints`
--

CREATE TABLE IF NOT EXISTS `qa_userpoints` (
  `userid` int(10) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `qvoteds`, `avoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userprofile`
--

CREATE TABLE IF NOT EXISTS `qa_userprofile` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_users`
--

CREATE TABLE IF NOT EXISTS `qa_users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) unsigned DEFAULT NULL,
  `avatarwidth` smallint(5) unsigned DEFAULT NULL,
  `avatarheight` smallint(5) unsigned DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `handle` (`handle`),
  KEY `level` (`level`),
  KEY `created` (`created`,`level`,`flags`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`) VALUES
(1, '2016-07-08 22:50:56', 0, 'ducchinhbk@gmail.com', 'ducchinhbk', NULL, NULL, NULL, 'cmfd8a8yf6705kyr', '¤¦×ª—UüëNÝÍ³Z¢CXöü', 120, '2016-07-08 22:50:59', 0, '2016-07-08 23:07:28', 0, '', 'o9wzu8db', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_uservotes`
--

CREATE TABLE IF NOT EXISTS `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgets`
--

CREATE TABLE IF NOT EXISTS `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_words`
--

CREATE TABLE IF NOT EXISTS `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `qa_words`
--

INSERT INTO `qa_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'lhdaflhdalf', 1, 1, 0, 0),
(2, 'fladhfljadf', 1, 1, 0, 0),
(3, 'fladhfladf', 1, 1, 0, 0),
(4, 'lfjhdalf', 1, 1, 0, 0),
(5, 'lfhad', 1, 1, 0, 0),
(6, 'da', 0, 0, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`);

--
-- Constraints for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
