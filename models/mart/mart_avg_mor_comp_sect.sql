WITH avg_mor_comp_sect AS (
    SELECT 
        c.company_name,
        p.PROJECT_SECTOR,
        AVG(pf.ESTIMATED_MONTHS_FOR_RETURNS) AS avg_estimated_months_for_returns,
    FROM 
        {{ ref('dim_companies') }} AS c

    RIGHT JOIN 
        {{ ref('fct_projects_funding') }} AS pf ON c.companyKey = pf.companyKey
    JOIN 
        {{ ref('dim_projects') }} AS p ON p.projectKey = pf.projectKey

    GROUP BY 
        c.company_name, p.PROJECT_SECTOR
)

SELECT * FROM avg_mor_comp_sect
