USE LabDB;
GO
CREATE TABLE tblStudent
(
    StudentId INT IDENTITY(1,1) PRIMARY KEY,
    Name      VARCHAR(60),
    Course    VARCHAR(30),
    DOB       DATE,
    Mobile    VARCHAR(10),
    Address   VARCHAR(200),
    UserId    VARCHAR(100),
    Password  VARCHAR(50)
);
