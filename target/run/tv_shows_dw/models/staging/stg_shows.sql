
  
  create view "tv_shows"."main_staging"."stg_shows__dbt_tmp" as (
    -- ── WHAT IS THIS MODEL? ────────────────────────────────────────────────────────
-- This is our staging model. It sits between raw data and the final mart tables.
-- Its job is to:
--   1. Rename columns to be consistent and readable
--   2. Cast columns to the correct data types
--   3. Filter out rows we can't use (missing critical fields)
--   4. Add a simple derived column (on_air flag)
--
-- We read from raw.shows — the table we loaded with load.py
-- We never modify raw data — we only SELECT from it and transform in this layer
-- ───────────────────────────────────────────────────────────────────────────────

WITH source AS (
    -- Pull everything from the raw table we loaded into DuckDB
    SELECT * FROM raw.shows
),

cleaned AS (
    SELECT
        -- Identifiers
        show_id,
        name                                    AS show_name,
        url                                     AS show_url,

        -- Classification
        show_type,
        language,
        genres,

        -- Status and dates
        status,
        premiered                               AS premiere_date,
        ended                                   AS end_date,

        -- A derived column: is the show currently airing?
        -- CASE WHEN is SQL's version of an if/else statement
        CASE 
            WHEN status = 'Running' THEN TRUE 
            ELSE FALSE 
        END                                     AS is_currently_airing,

        -- Ratings and runtime
        rating                                  AS avg_rating,
        runtime                                 AS runtime_minutes,
        average_runtime                         AS avg_runtime_minutes,
        weight                                  AS popularity_weight,

        -- Network info
        network_name,
        network_country,

        -- Schedule
        schedule_time,
        schedule_days,

        -- Media
        image_url,
        imdb_id

    FROM source

    -- Filter out shows with no name or no show_id
    -- These are unusable rows we don't want polluting our warehouse
    WHERE show_id IS NOT NULL
      AND name IS NOT NULL
)

SELECT * FROM cleaned
  );
