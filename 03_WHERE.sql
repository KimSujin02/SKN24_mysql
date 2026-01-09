# WHERE

-- 1) 비교연산자
select
	menu_code
    , menu_name
    , menu_price
    , case
		when orderable_status = 'y' then '가능'
        when orderable_status = 'n' then '불가능'
		else '해당없음'
        end as '주문가능여부'
from tbl_menu
where menu_code = 7;

-- 2) 같지 않음(!=, <>) 
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_code <> 7;

-- 3) 대소 비교
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where 5000 < menu_price <= 10000;

-- 3-1) AND
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where 5000 < menu_price
	AND menu_price <= 10000;

-- 3-2) OR
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_price < 10000
	OR menu_name = '열무김치라떼';

-- 4) [NOT] BEWTEEN
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_price between 5000 and 10000;

select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_price not between 5000 and 10000;

-- 5) [NOT] LIKE
select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_name like '%김치%';

select
	menu_code
    , menu_name
    , menu_price
from tbl_menu
where menu_name not like '%김치%';

-- 6) [NOT] IN
select
	menu_code
    , menu_name
    , menu_price
    , category_code
from tbl_menu
where
	category_code in (4, 5, 6);

select
	menu_code
    , menu_name
    , menu_price
    , category_code
from tbl_menu
where
	category_code not in (4, 5, 6);

-- 7) IS [NOT] NULL
select
	category_code
    , category_name
    , ref_category_code
from tbl_category
where ref_category_code is null;

select
	category_code
    , category_name
    , ref_category_code
from tbl_category
where ref_category_code is not null;