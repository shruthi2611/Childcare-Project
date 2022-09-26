select centre.*
from red_centre_information centre 
join red_early_years_program_information early on centre.center_name=early.center_name
where centre.ward like '%Scarborough%' and early.vacancy='Yes' and early.program_name='Preschool'

select distinct centre.center_name,ward,age,contact
from red_centre_information centre 
join dev.public.red_before_after_school_information early on centre.center_name=early.center_name
where centre.ward like '%Toronto%' 


select count(capacity),program_name,ward
from red_centre_information centre 
join red_early_years_program_information early on centre.center_name=early.center_name
where program_name in ('Infant','Preschool','Kindergarten','Toddler')
group by 
program_name,ward
order by ward,program_name
