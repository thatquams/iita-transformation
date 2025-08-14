WITH dim_users AS (
    SELECT  {{ dbt_utils.generate_surrogate_key(["id"]) }} AS userKey, id AS user_id, 
    first_name, last_name, date_of_birth AS dob, gender, created_at AS date_created
    FROM {{ref("stg_users")}}
)

SELECT * FROM dim_users