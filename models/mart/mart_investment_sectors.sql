WITH top_investment_sectors AS (
    SELECT 
        p.PROJECT_SECTOR,
        AVG(f.ESTIMATED_VALUE) AS AVERAGE_ESTIMATED_VALUE
    FROM 
        {{ ref('dim_projects') }} AS p
    JOIN 
        {{ ref('fct_projects_funding') }} AS f ON f.projectKey = p.projectKey
    GROUP BY 
        p.PROJECT_SECTOR
)

SELECT * 
FROM top_investment_sectors
ORDER BY AVERAGE_ESTIMATED_VALUE DESC
