WITH staging AS (
    SELECT * FROM "tv_shows"."main_staging"."stg_shows"
),

final AS (
    SELECT
        show_id,
        show_name,
        show_type,
        language,
        genres,
        status,
        is_currently_airing,
        premiere_date,
        end_date,
        CASE
            WHEN end_date IS NOT NULL
                THEN DATEDIFF('year', premiere_date, end_date)
            WHEN is_currently_airing = TRUE
                THEN DATEDIFF('year', premiere_date, CURRENT_DATE)
            ELSE NULL
        END AS years_on_air,
        avg_rating,
        runtime_minutes,
        avg_runtime_minutes,
        popularity_weight,
        network_name,
        network_country,
        schedule_time,
        schedule_days,
        show_url,
        image_url,
        imdb_id
    FROM staging
)

SELECT * FROM final