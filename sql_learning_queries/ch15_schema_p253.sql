select table_name, table_type
from information_schema.tables
where table_schema = 'sakila'
##	AND table_type = 'BASE TABLE'
order by 1;