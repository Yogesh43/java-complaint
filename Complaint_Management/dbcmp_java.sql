-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2017 at 04:06 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbcmp_java`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delacc`(IN `ano` INT)
    NO SQL
begin
delete from tbacc where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delcmp`(IN `ccod` INT)
    NO SQL
begin
delete from tbcmp where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delemp`(IN `ecod` INT)
    NO SQL
begin
delete from tbemp where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delvst`(IN `vcod` INT)
    NO SQL
begin
delete from tbvst where vstcod=vcod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspacc`()
    NO SQL
begin
select * from tbacc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspcmp`()
    NO SQL
begin
select * from tbcmp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspemp`()
    NO SQL
begin
select * from tbemp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspvst`()
    NO SQL
begin
select * from tbvst;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findacc`(IN `ano` INT)
    NO SQL
begin
select * from tbacc where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findcmp`(IN `ccod` INT)
    NO SQL
begin
select * from tbcmp where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findemp`(IN `ecod` INT)
    NO SQL
begin
select * from tbemp where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findvst`(IN `vcod` INT)
    NO SQL
begin
select * from tbvst where vstcod=vcod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insacc`(IN `anam` VARCHAR(100), IN `acrtdat` DATETIME, IN `aadd` VARCHAR(100), IN `aloc` VARCHAR(100), IN `aphnno` VARCHAR(100), IN `atyp` VARCHAR(100))
    NO SQL
begin
insert tbacc values(null,anam,acrtdat,aadd,aloc,aphnno,atyp);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inscmp`(IN `caccno` INT, IN `cdat` DATETIME, IN `cdsc` VARCHAR(1000), IN `casgempcod` INT, IN `csts` CHAR(1))
    NO SQL
begin
insert tbcmp values(null,caccno,cdat,cdsc,casgempcod,csts);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insemp`(IN `enam` VARCHAR(100), IN `epic` VARCHAR(50), IN `eloc` VARCHAR(100), IN `ephnno` VARCHAR(100))
    NO SQL
begin
insert tbemp values(null,enam,epic,eloc,ephnno);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insvst`(IN `vdat` DATETIME, IN `vcmpcod` INT, IN `vdsc` VARCHAR(1000), IN `vfed` INT)
    NO SQL
begin
insert tbvst values(null,vdat,vcmpcod,vdsc,vfed);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updacc`(IN `ano` INT, IN `anam` VARCHAR(100), IN `acrtdat` DATETIME, IN `aadd` VARCHAR(100), IN `aloc` VARCHAR(100), IN `aphnno` VARCHAR(100), IN `atyp` VARCHAR(100))
    NO SQL
begin
update tbacc set accnam=anam,acccrtdat=acrtdat,accadd=aadd,accloc=aloc,accphnno=aphnno,acctyp=atyp where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updcmp`(IN `ccod` INT, IN `caccno` INT, IN `cdat` DATETIME, IN `cdsc` VARCHAR(1000), IN `casgempcod` INT, IN `csts` CHAR(1))
    NO SQL
begin
update tbcmp set cmpaccno=caccno,cmpdat=cdat,cmpdsc=cdsc,cmpasgempcod=casgempcod,cmpsts=csts where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updemp`(IN `ecod` INT, IN `enam` VARCHAR(100), IN `epic` VARCHAR(50), IN `eloc` VARCHAR(100), IN `ephnno` VARCHAR(100))
    NO SQL
begin
update tbemp set empnam=enam,emppic=epic,emploc=eloc,empphnno=ephnno where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updvst`(IN `vcod` INT, IN `vdat` INT, IN `vcmpcod` INT, IN `vdsc` INT, IN `vfet` INT)
    NO SQL
begin
update tbvst set vstdat=vdat,vstcmpcod=vcmpcod,vstdsc=vdsc,vstfed=vfed where vstcod=vcod;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbacc`
--

CREATE TABLE IF NOT EXISTS `tbacc` (
  `accno` int(11) NOT NULL AUTO_INCREMENT,
  `accnam` varchar(100) NOT NULL,
  `acccrtdat` datetime NOT NULL,
  `accadd` varchar(100) NOT NULL,
  `accloc` varchar(100) NOT NULL,
  `accphnno` varchar(100) NOT NULL,
  `acctyp` varchar(100) NOT NULL,
  PRIMARY KEY (`accno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbcmp`
--

CREATE TABLE IF NOT EXISTS `tbcmp` (
  `cmpcod` int(11) NOT NULL AUTO_INCREMENT,
  `cmpaccno` int(11) NOT NULL,
  `cmpdat` datetime NOT NULL,
  `cmpdsc` varchar(1000) NOT NULL,
  `cmpasgempcod` int(11) NOT NULL,
  `cmpsts` char(1) NOT NULL,
  PRIMARY KEY (`cmpcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbemp`
--

CREATE TABLE IF NOT EXISTS `tbemp` (
  `empcod` int(11) NOT NULL AUTO_INCREMENT,
  `empnam` varchar(100) NOT NULL,
  `emppic` varchar(50) NOT NULL,
  `emploc` varchar(100) NOT NULL,
  `empphnno` varchar(100) NOT NULL,
  PRIMARY KEY (`empcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbvst`
--

CREATE TABLE IF NOT EXISTS `tbvst` (
  `vstcod` int(11) NOT NULL AUTO_INCREMENT,
  `vstdat` datetime NOT NULL,
  `vstcmpcod` int(11) NOT NULL,
  `vstdsc` varchar(1000) NOT NULL,
  `vstfed` int(11) NOT NULL,
  PRIMARY KEY (`vstcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
