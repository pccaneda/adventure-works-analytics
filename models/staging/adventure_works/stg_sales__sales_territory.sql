with
    source_sales_territory as (
        select *
        from {{ source('adventure_works', 'sales_salesterritory') }}
    ),

    renamed as (
        select
            territoryid as pk_territory_id,
            name as territory_name,
            countryregioncode as country_region_code,
            group as territory_group,
            salesytd as sales_ytd,
            saleslastyear as sales_last_year,
            costytd as cost_ytd,
            costlastyear as cost_last_year,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_sales_territory
    )

select *
from renamed