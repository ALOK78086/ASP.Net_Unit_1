USE LabDB;
GO
CREATE TABLE tblEmployee
(
    EmpId       INT PRIMARY KEY,
    Name        VARCHAR(60),
    Post        VARCHAR(40),
    Qualification VARCHAR(60),
    Experience  INT,
    Email       VARCHAR(100),
    Mobile      VARCHAR(10)
);
