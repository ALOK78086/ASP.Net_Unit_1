CREATE DATABASE LabDB;
GO
USE LabDB;
GO
CREATE TABLE tblUser
(
    UserId   VARCHAR(50)  PRIMARY KEY,
    Name     VARCHAR(50),
    Email    VARCHAR(100),
    Mobile   VARCHAR(10),
    Password VARCHAR(50)
);
