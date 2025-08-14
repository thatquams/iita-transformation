WITH dim_projects AS (
    SELECT  {{ dbt_utils.generate_surrogate_key(["p.id"]) }} AS projectKey, p.id AS project_id, 
    p.project_name, s.name AS project_sector, p.status AS project_status,
    p.created_at AS date_created
    FROM {{ref("stg_projects")}} AS p LEFT JOIN {{ref("stg_sectors")}} AS s ON p.sector_id = s.id
)

SELECT * FROM dim_projects