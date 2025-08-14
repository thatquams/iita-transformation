WITH src_sectors AS (
    SELECT * FROM {{source("iita_agric", "src_sectors")}}
)

SELECT * FROM src_sectors