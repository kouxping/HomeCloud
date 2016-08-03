CREATE DATABASE IF NOT EXISTS HOMECLOUD;
USE HOMECLOUD;

DROP TABLE IF EXISTS `Tenant`;
CREATE TABLE `Tenant` (
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(50),
  `lastName` varchar(50),
  PRIMARY KEY (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `Owner`;
CREATE TABLE `Owner` (
  `ownerEmail` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(50),
  `lastName` varchar(50),
  PRIMARY KEY (`ownerEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE `rent` (
  `rentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerEmail` varchar(50) NOT NULL,
  `price` int(11),
  `type` varchar(50),
  `date` varchar(50),
  `bedrooms` varchar(10),
  `bathrooms` varchar(10),
  `street1` varchar(100),
  `street2` varchar(45),
  `city` varchar(45),
  `state` varchar(45),
  `zipcode` varchar(20),
  `description` longtext,
  `image` varchar(100),
  PRIMARY KEY (`rentID`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
