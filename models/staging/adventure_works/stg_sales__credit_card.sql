with
    source_credit_card as (
        select *
        from {{ source('adventure_works', 'sales_creditcard') }}
    ),

    renamed as (
        select
            cast(creditcardid as int) as pk_credit_card_id,
            cardtype as card_type,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_credit_card
    )

select *
from renamed