use menudb;

# ALIAS (별칭)
-- 컬럼 별칭
select
	menu_code as '메뉴코드'
    , menu_name as Name -- 특문 없는 영어인 경우에는 따옴표를 굳이 붙이지 않아도 됨.
    , menu_price as '가격'
from tbl_menu menu;
    
-- 테이블 별칭
select
	m.menu_code, m.menu_name, m.menu_price
from tbl_menu AS m; -- as 생략 가능

# INNER JOIN
select
	m.menu_name, m.menu_price, c.category_name
from tbl_menu as m
inner join tbl_category as c
	on m.category_code = c.category_code;

--  조인할 컬럼의 명이 동일할 경우 USING으로 중복되는 타이핑을 없앨 수 있음!
-- USJIN (JOIBN 대상인 두 테이블의 JOIN을 위한 컬럼명이 같을 경우 사용함)
select
	m.menu_name, m.menu_price, c.category_name
from tbl_menu as m
inner join tbl_category as c
	USING(category_code);

# OUTER JOIN
-- LEFT JOIN
-- 베이스가되는 테이블의 내용은 다 보이고, join한 테이블의 데이터가 없더라도 null로 표현하더라도 반드시 나오게 함
select c.category_code, c.category_name, m.menu_name
from tbl_category c
left join tbl_menu m
	on m.category_code = c.category_code;
-- RIGHT JOIN
-- 오른쪽에 있는 애가 베이스가 되는거임.
select c.category_code, c.category_name, m.menu_name
from tbl_category c
right join tbl_menu m
	on m.category_code = c.category_code;

# CROSS JOIN
-- 전체 조합을 만들어버림
select
	m.menu_code, c.category_name
from tbl_menu m
cross join tbl_category c;

# SELF JOIN
select
	c1.category_code
	, c1.category_name
	, c1.ref_category_code
	, c2.category_code
	, c2.category_name
from tbl_category c1
join tbl_category c2
	on c1.ref_category_code = c2.category_code;