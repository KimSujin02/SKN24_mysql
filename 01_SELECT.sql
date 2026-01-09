use menudb;

-- 단일 컬럼 조회
select menu_name from tbl_menu;

-- 다중 컬럼 조회
select menu_code, menu_name, menu_price, orderable_status, category_code from tbl_menu;

-- 모든 컬럼 한번에 조회
select *  from tbl_menu;

-- 연산자 사용
select 4 + 7 from dual;
select 4 + 7; -- 이런거는 from 없이도 사용할 수 있음.

-- 컬럼에 이름 지정
select
	menu_code as 'mc'
	, menu_name as 'mn'
	, menu_price as 'mp'
	, orderable_status as 'os'
	, category_code as 'cc'
from
	tbl_menu;