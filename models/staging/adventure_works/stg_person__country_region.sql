with
    source_country_region as (
        select *
        from {{ source('adventure_works', 'person_countryregion') }}
    ),

    renamed as (
        select
            trim(countryregioncode) as pk_country_region_code,
            trim(name) as country_region_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_country_region
    )

select *
from renamed