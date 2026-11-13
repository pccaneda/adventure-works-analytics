with
    source_state_province as (
        select *
        from {{ source('adventure_works', 'person_stateprovince') }}
    ),

    renamed as (
        select
            cast(stateprovinceid as int) as pk_state_province_id,
            trim(countryregioncode) as fk_country_region_code,
            cast(territoryid as int) as fk_territory_id,
            trim(stateprovincecode) as state_province_code,
            trim(name) as state_province_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_state_province
    )

select *
from renamed