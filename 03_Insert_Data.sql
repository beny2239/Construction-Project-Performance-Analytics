-- Construction Project Performance Analytics
-- 03 - Insert Data
-- IMPORTANT:
-- This project uses a synthetic construction dataset.
-- To preserve exact consistency with the Power BI model, this file should contain
-- the INSERT statements from the SQL Server database used to build ConstructionAnalytics.pbix.
-- Do NOT invent or modify the values after exporting them from the source database.

USE ConstructionAnalytics;
GO

/*
STEP 1 - Insert Projects

The project records used in the Power BI model are:
*/

INSERT INTO Projects
    (ProjectID, ProjectName, ProjectType, Location, StartDate, PlannedEndDate, Budget, Client)
VALUES
    (1, 'Green Residence', 'Residential', 'Leiden', '2026-01-01', '2026-12-31', 2500000.00, 'Green Living BV'),
    (2, 'City Office', 'Commercial', 'Den Haag', '2026-02-01', '2027-03-31', 4200000.00, 'City Development BV'),
    (3, 'North Apartments', 'Residential', 'Rotterdam', '2026-03-01', '2027-06-30', 5800000.00, 'North Housing BV');
GO

/*
STEP 2 - Insert Activities, Progress, Costs, Materials and Workers

For the portfolio version, export these rows directly from the source database so that
this repository reproduces the PBIX dataset exactly.

Recommended SSMS workflow:
1. Right-click the ConstructionAnalytics database.
2. Tasks -> Generate Scripts.
3. Select the six data tables below:
   - Activities
   - Progress
   - Costs
   - Materials
   - Workers
   - DimDate
4. In Advanced options, set Types of data to 'Data only'.
5. Save/append the generated INSERT statements to this file.

The source model contains:
- 45 Activities
- Monthly Progress records from January 2026 through June 2027
- Costs by Material, Labor, Equipment, Subcontractor and Other
- Material quantity records
- Worker records by General Labor, Skilled Labor and Supervisor
- DimDate covering 2026-01-01 through 2027-12-31
*/

-- Paste the exact generated INSERT statements below this line.

