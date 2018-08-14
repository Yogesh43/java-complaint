-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2017 at 05:10 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaintms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cmpasgbyemp` (IN `ecod` INT)  NO SQL
select cmpaccno,cmpdat,cmpdsc,cmpsts,(select count(*) from
tbvst where vstcmpcod=a.cmpcod) nov,(select ifnull(avg(vstfed),0) from tbvst where
vstcmpcod=a.cmpcod) fed from tbcmp a where cmpasgempcod=ecod
order by cmpdat desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cmpforcurmon` ()  NO SQL
select cmpaccno,cmpdat,cmpdsc,cmpsts,empnam,(select count(*) from
tbvst where vstcmpcod=a.cmpcod) nov,(select ifnull(avg(vstfed),0) from tbvst where
vstcmpcod=a.cmpcod) fed from tbcmp a,tbemp where cmpasgempcod=empcod
and month(cmpdat)=month(curdate()) and year(cmpdat)=year(curdate())
order by cmpdat desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delacc` (IN `ano` INT)  NO SQL
begin
delete from tbacc where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delcmp` (IN `ccod` INT)  NO SQL
begin
delete from tbcmp where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delemp` (IN `ecod` INT)  NO SQL
begin
delete from tbemp where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delvst` (IN `vcod` INT)  NO SQL
begin
delete from tbvst where vstcod=vcod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dispcurrmonthrep` ()  NO SQL
begin
SELECT cmpcod,cmpaccno,cmpdat,cmpdsc,(select empnam from tbemp where empcod=a.cmpasgempcod) nam
FROM tbcmp a
WHERE MONTH(cmpdat) = MONTH(CURRENT_DATE());
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspacc` ()  NO SQL
begin
select * from tbacc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspcmp` ()  NO SQL
begin
select * from tbcmp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspemp` ()  NO SQL
begin
select * from tbemp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspempbyloc` (IN `loc` VARCHAR(100))  NO SQL
select * from tbemp where emploc=loc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspvst` ()  NO SQL
begin
select * from tbvst;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `empprfformon` ()  NO SQL
select empnam,emppic,(select count(*) from tbcmp where cmpasgempcod=
a.empcod and month(cmpdat)=month(curdate()) and year(cmpdat)=year(curdate()))
noc,(select count(*) from tbcmp where cmpasgempcod=
a.empcod and month(cmpdat)=month(curdate()) and year(cmpdat)=year(curdate()) and cmpsts='C') nc,(select count(*) from tbcmp where cmpasgempcod=
a.empcod and month(cmpdat)=month(curdate()) and year(cmpdat)=year(curdate()) and cmpsts='A') na,(select ifnull(avg(vstfed),0) from tbvst where vstcmpcod in
(select cmpcod from tbcmp where cmpasgempcod=a.empcod and month(cmpdat)
=month(curdate()) and year(cmpdat)=year(curdate()))) fed from tbemp a order by empnam$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findacc` (IN `ano` INT)  NO SQL
begin
select * from tbacc where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findcmp` (IN `ccod` INT)  NO SQL
begin
select * from tbcmp where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findemp` (IN `ecod` INT)  NO SQL
begin
select * from tbemp where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findvst` (IN `vcod` INT)  NO SQL
begin
select * from tbvst where vstcod=vcod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insacc` (IN `anam` VARCHAR(100), IN `acrtdat` DATETIME, IN `aadd` VARCHAR(100), IN `aloc` VARCHAR(100), IN `aphnno` VARCHAR(100), IN `atyp` VARCHAR(100))  NO SQL
begin
insert tbacc values(null,anam,acrtdat,aadd,aloc,aphnno,atyp);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inscmp` (IN `caccno` INT, IN `cdat` DATETIME, IN `cdsc` VARCHAR(1000), IN `casgempcod` INT, IN `csts` CHAR(1), OUT `cod` INT)  NO SQL
begin
insert tbcmp values(null,caccno,cdat,cdsc,casgempcod,csts);
select last_insert_id() into cod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insemp` (IN `enam` VARCHAR(100), IN `epic` VARCHAR(50), IN `eloc` VARCHAR(100), IN `ephnno` VARCHAR(100))  NO SQL
begin
insert tbemp values(null,enam,epic,eloc,ephnno);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insvst` (IN `vdat` DATETIME, IN `vcmpcod` INT, IN `vdsc` VARCHAR(1000), IN `vfed` INT)  NO SQL
begin
insert tbvst values(null,vdat,vcmpcod,vdsc,vfed);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updacc` (IN `ano` INT, IN `anam` VARCHAR(100), IN `acrtdat` DATETIME, IN `aadd` VARCHAR(100), IN `aloc` VARCHAR(100), IN `aphnno` VARCHAR(100), IN `atyp` VARCHAR(100))  NO SQL
begin
update tbacc set accnam=anam,acccrtdat=acrtdat,accadd=aadd,accloc=aloc,accphnno=aphnno,acctyp=atyp where accno=ano;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updcmp` (IN `ccod` INT, IN `csts` CHAR(1))  NO SQL
begin
update tbcmp set cmpsts=csts where cmpcod=ccod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updemp` (IN `ecod` INT, IN `enam` VARCHAR(100), IN `epic` VARCHAR(50), IN `eloc` VARCHAR(100), IN `ephnno` VARCHAR(100))  NO SQL
begin
update tbemp set empnam=enam,emppic=epic,emploc=eloc,empphnno=ephnno where empcod=ecod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updvst` (IN `vcod` INT, IN `vdat` INT, IN `vcmpcod` INT, IN `vdsc` INT, IN `vfet` INT)  NO SQL
begin
update tbvst set vstdat=vdat,vstcmpcod=vcmpcod,vstdsc=vdsc,vstfed=vfed where vstcod=vcod;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbacc`
--

CREATE TABLE `tbacc` (
  `accno` int(11) NOT NULL,
  `accnam` varchar(100) NOT NULL,
  `acccrtdat` datetime NOT NULL,
  `accadd` varchar(100) NOT NULL,
  `accloc` varchar(100) NOT NULL,
  `accphnno` varchar(100) NOT NULL,
  `acctyp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbacc`
--

INSERT INTO `tbacc` (`accno`, `accnam`, `acccrtdat`, `accadd`, `accloc`, `accphnno`, `acctyp`) VALUES
(2, 'Connect', '2017-07-08 00:00:00', 'CONNECT CARE : S.C.O. (COMM) # 451-452, FF, SECTOR 35C, CHANDIGARH', 'Chandigarh', '098152 69973', 'BroadBand'),
(3, 'Airtal', '2017-07-09 00:00:00', 'Airtal CARE : Sco- 461-462, Sector – 35C, Chandigarh', 'Panchkula', '099152 15200', 'DTH'),
(4, 'Dish TV', '2017-07-13 00:00:00', 'sector 41 Chandigarh', 'Chandigarh', '9876543210', 'DTH'),
(5, 'Tata Sky', '2017-07-13 00:00:00', 'sector 22 Chandigarh', 'Chandigarh', '9876543210', 'DTH'),
(6, 'Sun Direct', '2017-07-13 00:00:00', 'sector 35 Chandigarh', 'Chandigarh', '9876543210', 'DTH'),
(7, 'Reliance', '2017-07-13 00:00:00', 'sector 40 Chandigarh', 'Chandigarh', '9876543210', 'DTH'),
(8, 'Airtel', '2017-07-13 00:00:00', 'sector 23 Chandigarh', 'Chandigarh', '9876543210', 'Broadband'),
(9, 'Vodafone', '2017-07-13 00:00:00', 'sector 17 Chandigarh', 'Chandigarh', '9876543210', 'Broadband'),
(10, 'Idea Cellular', '2017-07-13 00:00:00', 'sector 22 Chandigarh', 'Chandigarh', '9876543210', 'Broadband'),
(11, 'Reliance Communications', '2017-07-13 00:00:00', 'sector 22 Chandigarh', 'Chandigarh', '9876543210', 'Broadband');

-- --------------------------------------------------------

--
-- Table structure for table `tbcmp`
--

CREATE TABLE `tbcmp` (
  `cmpcod` int(11) NOT NULL,
  `cmpaccno` int(11) NOT NULL,
  `cmpdat` datetime NOT NULL,
  `cmpdsc` varchar(1000) NOT NULL,
  `cmpasgempcod` int(11) NOT NULL,
  `cmpsts` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcmp`
--

INSERT INTO `tbcmp` (`cmpcod`, `cmpaccno`, `cmpdat`, `cmpdsc`, `cmpasgempcod`, `cmpsts`) VALUES
(1, 2, '2017-07-12 00:00:00', 'We mainly buy airtel products because it emerged as a big brand and we often think that airtel provides quality and best customer service.But think once before going to airtel dth.The signal quality and even hd quality is pretty good but the problem comes while paying to it.Its too costly and if we opt for the HD channels we cant even bare the bill! and the customer service is worst because we are not allowed to call them or talk to them the entire customer service is provided only via messaging.We have to send messages every time to stop or start a channel which is a time taking and we also get only a limited information', 1, 'A'),
(2, 2, '2017-08-02 00:00:00', 'The setup very small and of less cost but the monthly bill for all channels is very high . I was also having this connection monthly I was paying 700Rs for all channels but after few months I have changed my connection to cable TV( siti digital) this is also having same quality like airtel digital TV but siti digital costs only 150 for all channels . so friends hope you like my review on airtel digital TV ', 1, 'C'),
(3, 1, '2017-07-14 00:00:00', 'I am using this dth for over 7 years now it is still working great also in some remote areas this dth works perfectly the picture quality is also good and the service provided by the airtel is good the customer service is also great no problems at all since 7 years', 3, 'A'),
(4, 4, '2017-07-14 00:00:00', 'I have purchased a Samsung LED TV in which inbuilt airtel cam connection is installed. Last week I was facing issues regarding the non availability of all the channels except Channel no-99, 100, 121, 131 and 134. I have made a complaint on May 15, 2016 and called more than 25 times to the customer care but till now the issue has not been resolved. Four service engineers have visited for this issue but could not resolve the issue even once. But every time they closed the case without confirming from me.', 4, 'A'),
(5, 3, '2017-07-14 00:00:00', 'AIRTEL DIGITAL SERVICE has worst service. Consumer complaints are never handled and service complaints are disconnected. for fault of "No Signal of Airtel issue"  for last 15 days, 3 times altended by incompetent service engineers, I have been told as set of box problem. On 4th visit by service engineer, he shook the cable and started working.', 3, 'A'),
(6, 1, '2017-07-14 00:00:00', 'It is the best to buy electronics items and in this all the items of are good less mrp and in this mobile phones and large appliances are very good and in this discount offers and festival offers are given and in this store I have taken the mobile it is very good and extended warranty is given for extra amount and discpunt offers are very good in this staor and in this store every thing is below mrp and I advice to buy electronic items  in this store.', 5, 'A'),
(7, 7, '2017-07-14 00:00:00', 'Its a very fine online digital shop.you cn have ur desired electronic goods from here. All the products are trustable and well finished. I have bought many things from here and really every product I have frm here are well finished and anyhow more than bettter. ', 7, 'A'),
(8, 7, '2017-07-14 00:00:00', 'I have purchased a kindle from reliance digital and found the store very attractive with all the gadgets in one store .They also have all the latest as well as trending gadgets with good discount price .There agent also help us in buying the product which fulfill our needs in our budget.They deliver the product on the spot.We can reliable on the products because we get store as well brand warranty so we do not have to worry of that.', 2, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tbemp`
--

CREATE TABLE `tbemp` (
  `empcod` int(11) NOT NULL,
  `empnam` varchar(100) NOT NULL,
  `emppic` varchar(50) NOT NULL,
  `emploc` varchar(100) NOT NULL,
  `empphnno` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbemp`
--

INSERT INTO `tbemp` (`empcod`, `empnam`, `emppic`, `emploc`, `empphnno`) VALUES
(1, 'Amit Sharma', 'e1.jpg', 'Chandigarh', '9779261111'),
(2, 'Suman', 'e2.jpg', 'Mohali', '98765456743'),
(3, 'Rahul Sharma', 'Emp1.jpg', 'Sactor 22', '9876543210'),
(4, 'Naveen Rana', 'Emp2.jpg', '7 Phase', '9876543210'),
(5, 'Amit Sharma', 'Emp3.jpg', 'Sactor 22', '9876543210'),
(6, 'Rahul Rana', 'Emp4.jpg', 'Sactor 33', '9876543210'),
(7, 'Pardeep Singh', 'Emp5.jpg', '7 Phase', '9876543210'),
(8, 'Ajay Khanna', 'Emp6.jpg', '7 Phase', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `tbvst`
--

CREATE TABLE `tbvst` (
  `vstcod` int(11) NOT NULL,
  `vstdat` datetime NOT NULL,
  `vstcmpcod` int(11) NOT NULL,
  `vstdsc` varchar(1000) NOT NULL,
  `vstfed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbvst`
--

INSERT INTO `tbvst` (`vstcod`, `vstdat`, `vstcmpcod`, `vstdsc`, `vstfed`) VALUES
(1, '2016-12-12 00:00:00', 2, 'We are now bored by the Airtel advertisement of claiming the fastest network. Slow network speeds, bad pricing and the baseless allegations on JIO has made understand that Airtel would never rectify itself and will reduce prices only on receiving competion from JIO', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbacc`
--
ALTER TABLE `tbacc`
  ADD PRIMARY KEY (`accno`);

--
-- Indexes for table `tbcmp`
--
ALTER TABLE `tbcmp`
  ADD PRIMARY KEY (`cmpcod`);

--
-- Indexes for table `tbemp`
--
ALTER TABLE `tbemp`
  ADD PRIMARY KEY (`empcod`);

--
-- Indexes for table `tbvst`
--
ALTER TABLE `tbvst`
  ADD PRIMARY KEY (`vstcod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbacc`
--
ALTER TABLE `tbacc`
  MODIFY `accno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbcmp`
--
ALTER TABLE `tbcmp`
  MODIFY `cmpcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbemp`
--
ALTER TABLE `tbemp`
  MODIFY `empcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbvst`
--
ALTER TABLE `tbvst`
  MODIFY `vstcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
