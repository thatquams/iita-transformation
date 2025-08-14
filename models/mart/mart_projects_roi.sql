WITH mart_project_roi AS (
    SELECT p.PROJECT_NAME,p.PROJECT_SECTOR, SUM(f.RETURN_ON_INVESTMENT) AS ROI FROM {{ref("dim_projects")}} AS p 
        INNER JOIN {{ref("fct_projects_funding")}} AS f ON p.projectKey = f.projectKey
        GROUP BY p.PROJECT_NAME,p.PROJECT_SECTOR
        ORDER BY SUM(f.RETURN_ON_INVESTMENT) DESC 


)

SELECT * FROM mart_project_roi