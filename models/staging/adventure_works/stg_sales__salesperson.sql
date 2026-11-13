with
    source_salesperson as (
        select *
        from {{ source('adventure_works', 'sales_salesperson') }}
    ),

    renamed as (
        select
            businessentityid as pk_business_entity_id,
            territoryid as fk_territory_id,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_salesperson
    )

select *
from renamed