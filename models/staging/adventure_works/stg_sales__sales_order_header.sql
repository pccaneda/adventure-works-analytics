with
    source_order_header as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheader') }}
    ),

    renamed as (
        select
            cast(salesorderid as int) as pk_sales_order_id,
            cast(customerid as int) as fk_customer_id,
            cast(salespersonid as int) as fk_salesperson_id,
            cast(territoryid as int) as fk_territory_id,
            cast(creditcardid as int) as fk_credit_card_id,
            cast(currencyrateid as int) as fk_currency_rate_id,
            cast(orderdate as date) as dt_order_date,
            cast(shipdate as date) as dt_ship_date,
            cast(duedate as date) as dt_due_date,
            case
                when status = 1 then 'In process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled'
                else null
            end as order_status,
            onlineorderflag as online_order_flag,
            creditcardapprovalcode as credit_card_approval_code,
            subtotal as order_subtotal,
            taxamt as order_tax_amount,
            freight as order_freight,
            totaldue as order_total,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_order_header
    )

select *
from renamed