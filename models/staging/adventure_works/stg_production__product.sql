with
    source_product as (
        select *
        from {{ source('adventure_works', 'production_product') }}
    ),

    renamed as (
        select
            cast(productid as int) as pk_product_id,
            cast(productsubcategoryid as int) as fk_product_subcategory_id,
            trim(name) as product_name,
            makeflag as make_flag,
            finishedgoodsflag as finished_goods_flag,
            trim(color) as product_color,
            trim(size) as product_size,
            weight as product_weight,
            trim(productline) as product_line,
            trim(class) as product_class,
            trim(style) as product_style,
            cast(sellstartdate as date) as product_sell_start_date,
            cast(sellenddate as date) as product_sell_end_date,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_product
    )

select *
from renamed