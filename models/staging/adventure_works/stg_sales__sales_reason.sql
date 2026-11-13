with
    source_sales_reason as (
        select *
        from {{ source('adventure_works', 'sales_salesreason') }}
    ),

    renamed as (
        select
            salesreasonid as pk_sales_reason_id,
            name as sales_reason_name,
            reasontype as sales_reason_type,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_sales_reason
    )

select *
from renamed