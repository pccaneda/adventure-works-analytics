with
    source_customer as (
        select *
        from {{ source('adventure_works', 'sales_customer') }}
    ),

    renamed as (
        select
            customerid as pk_customer_id,
            personid as fk_person_id,
            storeid as fk_store_id,
            territoryid as fk_territory_id,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_customer
    )

select *
from renamed