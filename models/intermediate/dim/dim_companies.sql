WITH dim_companies AS (
    SELECT  {{ dbt_utils.generate_surrogate_key(["id"]) }} AS companyKey, id AS company_id, 
    name AS company_name, size AS company_size, created_at AS date_created
    FROM {{ref("stg_companies")}}
)

SELECT * FROM dim_companies