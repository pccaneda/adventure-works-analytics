with
    source_person as (
        select *
        from {{ source('adventure_works', 'person_person') }}
    ),

    renamed as (
        select
            cast(businessentityid as int) as pk_business_entity_id,
            
            case trim(persontype)
                when 'EM' then 'Employee'
                when 'GC' then 'General Contact'
                when 'IN' then 'Individual'
                when 'SC' then 'Store Contact'
                when 'SP' then 'Salesperson'
                when 'VC' then 'Vendor Contact'
            end as person_type,

            coalesce(trim(title), '') 
                || ' ' 
                || trim(firstname) 
                || ' ' 
                || coalesce(trim(middlename), '') 
                || ' ' 
                || trim(lastname) 
                || ' ' 
                || coalesce(trim(suffix), '') as person_full_name,

            cast(modifieddate as timestamp) as ts_modified_date

        from source_person
    )

select *
from renamed