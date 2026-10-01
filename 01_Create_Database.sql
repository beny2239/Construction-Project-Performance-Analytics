-- Construction Project Performance Analytics
-- 01 - Create Database

IF DB_ID('ConstructionAnalytics') IS NULL
BEGIN
    CREATE DATABASE ConstructionAnalytics;
END;
GO

USE ConstructionAnalytics;
GO
