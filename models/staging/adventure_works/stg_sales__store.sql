with
    source_store as (
        select *
        from {{ source('adventure_works', 'sales_store') }}
    ),

    renamed as (
        select
            businessentityid as pk_business_entity_id,
            name as store_name,
            demographics as store_demographics,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_store
    )

select *
from renamed