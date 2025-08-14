WITH company_avg_roi_est_value AS (
    SELECT 
        c.company_name,
        AVG(p.RETURN_ON_INVESTMENT) AS AVERAGE_ROI,
        AVG(p.ESTIMATED_VALUE) AS AVERAGE_ESTIMATED_VALUE
    FROM 
        {{ ref('dim_companies') }} AS c
    RIGHT JOIN 
        {{ ref('fct_projects_funding') }} AS p ON c.companyKey = p.companyKey
    GROUP BY 
        c.company_name
)


SELECT * FROM company_avg_roi_est_value
