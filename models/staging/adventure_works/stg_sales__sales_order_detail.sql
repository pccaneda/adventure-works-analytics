with
    source_order_detail as (
        select *
        from {{ source('adventure_works', 'sales_salesorderdetail') }}
    ),

    renamed as (
        select
            salesorderid as pk_sales_order_id,
            salesorderdetailid as pk_sales_order_detail_id,
            productid as fk_product_id,
            specialofferid as fk_special_offer_id,
            orderqty as order_quantity,
            unitprice as unit_price,
            unitpricediscount as unit_price_discount,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_order_detail
    )

select *
from renamed