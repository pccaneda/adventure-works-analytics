with
    source_sales_territory_history as (
        select *
        from {{ source('adventure_works', 'sales_salesterritoryhistory') }}
    ),

    renamed as (
        select
            businessentityid as pk_business_entity_id,
            territoryid as pk_territory_id,
            cast(startdate as date) as pk_dt_start_date,
            cast(enddate as date) as dt_end_date,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_sales_territory_history
    )

select *
from renamed