with
    source_sales_order_header_sales_reason as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
    ),

    renamed as (
        select
            salesorderid as pk_sales_order_id,
            salesreasonid as pk_sales_reason_id,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_sales_order_header_sales_reason
    )

select *
from renamed