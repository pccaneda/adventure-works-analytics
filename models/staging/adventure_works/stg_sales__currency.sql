with
    source_currency as (
        select *
        from {{ source('adventure_works', 'sales_currency') }}
    ),

    renamed as (
        select
            currencycode as pk_currency_code,
            name as currency_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_currency
    )

select *
from renamed