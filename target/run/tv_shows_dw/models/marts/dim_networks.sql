
  
    
    

    create  table
      "tv_shows"."main_marts"."dim_networks__dbt_tmp"
  
    as (
      WITH staging AS (
    SELECT * FROM "tv_shows"."main_staging"."stg_shows"
),

network_stats AS (
    SELECT
        network_name,
        network_country,
        COUNT(show_id) AS total_shows,
        COUNT(CASE WHEN is_currently_airing = TRUE THEN 1 END) AS shows_currently_airing,
        ROUND(AVG(avg_rating), 2) AS avg_show_rating,
        ROUND(MAX(avg_rating), 2) AS highest_rated_show,
        MODE(language) AS primary_language
    FROM staging
    WHERE network_name IS NOT NULL
    GROUP BY network_name, network_country
)

SELECT * FROM network_stats
ORDER BY total_shows DESC
    );
  
  