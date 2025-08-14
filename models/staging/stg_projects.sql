WITH src_projects AS (
    SELECT * FROM {{source("iita_agric", "src_projects")}}
)

SELECT * FROM src_projects