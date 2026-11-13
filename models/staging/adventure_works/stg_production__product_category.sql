with
    source_product_category as (
        select *
        from {{ source('adventure_works', 'production_productcategory') }}
    ),

    renamed as (
        select
            cast(productcategoryid as int) as pk_product_category_id,
            trim(name) as category_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_product_category
    )

select *
from renamed