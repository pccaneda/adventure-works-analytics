with
    source_product_subcategory as (
        select *
        from {{ source('adventure_works', 'production_productsubcategory') }}
    ),

    renamed as (
        select
            cast(productsubcategoryid as int) as pk_product_subcategory_id,
            cast(productcategoryid as int) as fk_product_category_id,
            trim(name) as subcategory_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_product_subcategory
    )

select *
from renamed