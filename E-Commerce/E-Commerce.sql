DROP DATABASE IF EXISTS `e_commerce`;
CREATE DATABASE `e_commerce`; 
USE `e_commerce`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `Users` (
	
    `UserId` INT NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(50) NOT NULL,
    `LastName` varchar(50) NOT NULL,
    `UserName` varchar(50) NOT NULL,
    `Email` varchar(50) NOT NULL,
    `PhoneNumber` varchar(50) NOT NULL,
    `UPasssword` text(2000) NOT NULL,
    `BirthDay` date NOT NULL,
    `UserImg` TEXT(2000),
    
    PRIMARY KEY (`UserId`)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Brands` (
	
    `BrandId` INT NOT NULL AUTO_INCREMENT,
    `BrandName` VARCHAR(50) NOT NULL,
    `BrandLogo` TEXT(2000),
    `BrandContry` VARCHAR(50),
    
    PRIMARY KEY (`BrandId`)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Categories` (
	
    `CategoryId` INT NOT NULL AUTO_INCREMENT,
    `CatagoryName` VARCHAR(50) NOT NULL,
    `CatagoryLogo` TEXT(2000),
    
    PRIMARY KEY (`CategoryId`)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Orders` (
	
    `OrderId` INT NOT NULL AUTO_INCREMENT,
    `UserId` INT NOT NULL,
    `Time` timestamp,
    
    PRIMARY KEY (`OrderId`),
    
    KEY `FK_UserId` (`UserId`),
	CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE RESTRICT ON UPDATE CASCADE
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Products` (
	
    `ProductId` INT NOT NULL AUTO_INCREMENT,
    `ProductName` VARCHAR(50) NOT NULL,
    `BrandId` INT NOT NULL,
    `CategoryId` INT NOT NULL,
    
    PRIMARY KEY (`ProductId`),
    
    KEY `FK_BrandId` (`BrandId`),
    KEY `FK_CategoryId` (`CategoryId`),
	CONSTRAINT `FK_BrandId` FOREIGN KEY (`BrandId`) REFERENCES `Brands` (`BrandId`) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `FK_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`CategoryId`) ON DELETE RESTRICT ON UPDATE CASCADE
   
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `OrdProd` (
	
    `OrdProdId` INT NOT NULL AUTO_INCREMENT,
    `OrderId` INT NOT NULL,
    `ProductId` INT NOT NULL,
    `Quantity` INT NOT NULL,
    
    
    PRIMARY KEY (`OrdProdId`),
    
	KEY `FK_OrderId` (`OrderId`),
    KEY `FK_ProductsId` (`ProductId`),
	CONSTRAINT `FK_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`OrderId`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `FK_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`ProductId`) ON DELETE RESTRICT ON UPDATE CASCADE
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;