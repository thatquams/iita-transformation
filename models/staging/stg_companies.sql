WITH src_companies AS (
    SELECT * FROM {{source("iita_agric", "src_companies")}}
)

SELECT * FROM src_companies