with
    source_currency_rate as (
        select *
        from {{ source('adventure_works', 'sales_currencyrate') }}
    ),

    renamed as (
        select
            currencyrateid as pk_currency_rate_id,
            fromcurrencycode as fk_from_currency_code,
            tocurrencycode as fk_to_currency_code,
            cast(currencyratedate as date) as dt_currency_rate_date,
            averagerate as average_rate,
            endofdayrate as end_of_day_rate,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_currency_rate
    )

select *
from renamed