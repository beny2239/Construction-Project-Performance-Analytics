-- Construction Project Performance Analytics
-- 02 - Create Tables

USE ConstructionAnalytics;
GO

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    ProjectType VARCHAR(50),
    Location VARCHAR(100),
    StartDate DATE,
    PlannedEndDate DATE,
    Budget DECIMAL(18,2),
    Client VARCHAR(100)
);
GO

CREATE TABLE Activities (
    ActivityID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    ActivityName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    BuildingLevel VARCHAR(50),
    PlannedStart DATE,
    PlannedEnd DATE,
    ActualStart DATE,
    ActualEnd DATE,
    PlannedDuration INT,
    ActualDuration INT,
    PlannedCost DECIMAL(18,2),
    ActualCost DECIMAL(18,2),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
GO

CREATE TABLE Progress (
    ProgressID INT PRIMARY KEY,
    ActivityID INT NOT NULL,
    ProgressDate DATE NOT NULL,
    PlannedProgress DECIMAL(5,2),
    ActualProgress DECIMAL(5,2),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);
GO

CREATE TABLE Costs (
    CostID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    ActivityID INT NOT NULL,
    CostDate DATE NOT NULL,
    CostType VARCHAR(50),
    PlannedCost DECIMAL(18,2),
    ActualCost DECIMAL(18,2),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);
GO

CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY,
    ActivityID INT NOT NULL,
    MaterialDate DATE NOT NULL,
    MaterialName VARCHAR(100),
    Unit VARCHAR(20),
    PlannedQuantity DECIMAL(18,2),
    ActualQuantity DECIMAL(18,2),
    UnitCost DECIMAL(18,2),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);
GO

CREATE TABLE Workers (
    WorkerID INT PRIMARY KEY,
    ActivityID INT NOT NULL,
    WorkDate DATE NOT NULL,
    WorkerType VARCHAR(50),
    NumberOfWorkers INT,
    WorkingHours DECIMAL(10,2),
    LaborCost DECIMAL(18,2),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);
GO

CREATE TABLE DimDate (
    Date DATE PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    MonthName VARCHAR(20),
    Week INT,
    Day INT
);
GO
