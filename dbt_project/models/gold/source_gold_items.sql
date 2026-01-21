WITH dedup_query AS (
    SELECT
        *,
        row_number() OVER (PARTITION BY id ORDER BY updateddate DESC) AS deduplication_id
    FROM 
        {{ source('source', 'items') }}
)

SELECT
    *
FROM 
    dedup_query
WHERE
    deduplication_id = 1