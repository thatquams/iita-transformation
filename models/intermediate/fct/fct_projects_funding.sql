WITH fct__projects_funding AS (
    
    SELECT  {{ dbt_utils.generate_surrogate_key(["p.id"]) }} AS projectKey, p.id AS project_id, 
    p.estimated_duration, p.estimated_value, p.roi AS return_on_investment, p.estimated_months_for_returns,
    u.userKey, c.companyKey, {{ dbt_utils.generate_surrogate_key(["p.bid_date"]) }} AS bid_date_key,
    {{ dbt_utils.generate_surrogate_key(["p.award_date"]) }} AS award_date_key,
    {{ dbt_utils.generate_surrogate_key(["p.start_date"]) }} AS start_date_key,
    {{ dbt_utils.generate_surrogate_key(["p.end_date"]) }} AS end_date_key

    FROM {{ref("stg_projects")}} AS p LEFT JOIN {{ref("dim_users")}} AS u ON p.user_id = u.user_id
    LEFT JOIN {{ref("dim_companies")}} AS c ON p.company_id = c.company_id

)

SELECT * FROM fct__projects_funding