-- Construction Project Performance Analytics
-- 04 - Analysis Queries

USE ConstructionAnalytics;
GO

/* ============================================================
   1. PROJECT COST PERFORMANCE
   ============================================================ */
SELECT
    p.ProjectName,
    SUM(a.PlannedCost) AS PlannedCost,
    SUM(a.ActualCost) AS ActualCost,
    SUM(a.ActualCost) - SUM(a.PlannedCost) AS CostVariance,
    CASE
        WHEN SUM(a.PlannedCost) = 0 THEN NULL
        ELSE (SUM(a.ActualCost) - SUM(a.PlannedCost)) / SUM(a.PlannedCost)
    END AS CostVariancePct
FROM Projects p
JOIN Activities a
    ON p.ProjectID = a.ProjectID
GROUP BY p.ProjectName
ORDER BY p.ProjectName;
GO

/* ============================================================
   2. ACTIVITY DELAYS
   ============================================================ */
SELECT
    p.ProjectName,
    a.ActivityID,
    a.ActivityName,
    a.Category,
    a.BuildingLevel,
    a.PlannedDuration,
    a.ActualDuration,
    a.ActualDuration - a.PlannedDuration AS DelayDays
FROM Activities a
JOIN Projects p
    ON a.ProjectID = p.ProjectID
WHERE a.ActualDuration IS NOT NULL
  AND a.ActualDuration > a.PlannedDuration
ORDER BY DelayDays DESC;
GO

/* ============================================================
   3. DELAY BY CATEGORY
   ============================================================ */
SELECT
    Category,
    COUNT(*) AS DelayedActivities,
    AVG(CAST(ActualDuration - PlannedDuration AS DECIMAL(10,2))) AS AvgDelayDays
FROM Activities
WHERE ActualDuration IS NOT NULL
  AND ActualDuration > PlannedDuration
GROUP BY Category
ORDER BY AvgDelayDays DESC;
GO

/* ============================================================
   4. COST BY COST TYPE
   ============================================================ */
SELECT
    CostType,
    SUM(PlannedCost) AS PlannedCost,
    SUM(ActualCost) AS ActualCost,
    SUM(ActualCost) - SUM(PlannedCost) AS CostVariance
FROM Costs
GROUP BY CostType
ORDER BY ActualCost DESC;
GO

/* ============================================================
   5. MATERIAL QUANTITY VARIANCE
   ============================================================ */
SELECT
    m.MaterialName,
    m.Unit,
    SUM(m.PlannedQuantity) AS PlannedQuantity,
    SUM(m.ActualQuantity) AS ActualQuantity,
    SUM(m.ActualQuantity) - SUM(m.PlannedQuantity) AS QuantityVariance,
    CASE
        WHEN SUM(m.PlannedQuantity) = 0 THEN NULL
        ELSE (SUM(m.ActualQuantity) - SUM(m.PlannedQuantity))
             / SUM(m.PlannedQuantity)
    END AS QuantityVariancePct
FROM Materials m
GROUP BY m.MaterialName, m.Unit
ORDER BY ABS(SUM(m.ActualQuantity) - SUM(m.PlannedQuantity)) DESC;
GO

/* ============================================================
   6. LABOR PRODUCTIVITY
   ============================================================ */
SELECT
    p.ProjectName,
    SUM(w.NumberOfWorkers * w.WorkingHours) AS LaborHours,
    SUM(w.LaborCost) AS LaborCost
FROM Workers w
JOIN Activities a
    ON w.ActivityID = a.ActivityID
JOIN Projects p
    ON a.ProjectID = p.ProjectID
GROUP BY p.ProjectName
ORDER BY LaborHours DESC;
GO

/* ============================================================
   7. PROGRESS BY MONTH
   ============================================================ */
SELECT
    ProgressDate,
    AVG(PlannedProgress) AS AvgPlannedProgress,
    AVG(ActualProgress) AS AvgActualProgress,
    AVG(ActualProgress) - AVG(PlannedProgress) AS ProgressVariance
FROM Progress
GROUP BY ProgressDate
ORDER BY ProgressDate;
GO

/* ============================================================
   8. PROJECT-LEVEL PROGRESS
   ============================================================ */
SELECT
    p.ProjectName,
    AVG(pr.PlannedProgress) AS AvgPlannedProgress,
    AVG(pr.ActualProgress) AS AvgActualProgress,
    AVG(pr.ActualProgress) - AVG(pr.PlannedProgress) AS ProgressVariance
FROM Projects p
JOIN Activities a
    ON p.ProjectID = a.ProjectID
JOIN Progress pr
    ON a.ActivityID = pr.ActivityID
GROUP BY p.ProjectName
ORDER BY p.ProjectName;
GO

/* ============================================================
   9. EARNED VALUE SUPPORTING DATA
   ============================================================ */
SELECT
    p.ProjectName,
    SUM(a.PlannedCost) AS PlannedCost,
    SUM(a.ActualCost) AS ActualCost,
    AVG(pr.PlannedProgress) AS AvgPlannedProgress,
    AVG(pr.ActualProgress) AS AvgActualProgress
FROM Projects p
JOIN Activities a
    ON p.ProjectID = a.ProjectID
LEFT JOIN Progress pr
    ON a.ActivityID = pr.ActivityID
GROUP BY p.ProjectName
ORDER BY p.ProjectName;
GO

/* ============================================================
   10. DATA QUALITY CHECKS
   ============================================================ */
SELECT 'Projects' AS TableName, COUNT(*) AS RowCount FROM Projects
UNION ALL
SELECT 'Activities', COUNT(*) FROM Activities
UNION ALL
SELECT 'Progress', COUNT(*) FROM Progress
UNION ALL
SELECT 'Costs', COUNT(*) FROM Costs
UNION ALL
SELECT 'Materials', COUNT(*) FROM Materials
UNION ALL
SELECT 'Workers', COUNT(*) FROM Workers
UNION ALL
SELECT 'DimDate', COUNT(*) FROM DimDate;
GO
