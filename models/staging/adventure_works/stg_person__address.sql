with
    source_address as (
        select *
        from {{ source('adventure_works', 'person_address') }}
    ),

    renamed as (
        select
            cast(addressid as int) as pk_address_id,
            cast(stateprovinceid as int) as fk_state_province_id,
            trim(addresline1) as address_line_1,
            trim(addressline2) as address_line_2,
            trim(city) as city_name,
            cast(modifieddate as timestamp) as ts_modified_date
        from source_address
    )

select *
from renamed