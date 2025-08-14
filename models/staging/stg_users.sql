WITH src_users AS (
    SELECT * FROM {{source("iita_agric", "src_users")}}
)

SELECT * FROM src_users