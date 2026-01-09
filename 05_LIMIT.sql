# LIMIT
use menudb;

-- row_count = 3
select menu_code, menu_name, menu_price
from tbl_menu
order by menu_price desc
limit 3;

-- offset = 2, row_count = 5
select menu_code, menu_name, menu_price
from tbl_menu
order by menu_price desc
limit 2, 5; -- 인덱스 2에서 부터 5개 뽑기