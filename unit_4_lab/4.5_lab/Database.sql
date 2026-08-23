USE LabDB;
GO
CREATE TABLE tblMarks
(
    RollNo   VARCHAR(20) PRIMARY KEY,
    Name     VARCHAR(60),
    Course   VARCHAR(30),
    Semester VARCHAR(10),
    Email    VARCHAR(100),
    Mobile   VARCHAR(10),
    M1 INT, M2 INT, M3 INT, M4 INT, M5 INT,
    Total INT, Per DECIMAL(5,2), Grade VARCHAR(3), Result VARCHAR(10)
);
