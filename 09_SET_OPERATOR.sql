# SET OPERATORS (결과셋 집합 연산)
use menudb;
# UNION (합집합)
-- 두개 이상의 SELECT문의 결과를 중복을 제거해서 결합한 결과를 반환하는 SQL 연산자임
-- 그럼 아래의 쿼리문을 실행하면 카테고리 코드가 10인거랑 메뉴 가격이 9000원 이하인 애들중에 두 결과가 동일한 레코드인 애들만 나옴.
-- 10rows
select
	menu_code, menu_name, menu_price, category_code
from tbl_menu
where category_code = 10
union
select
	menu_code, menu_name, menu_price, category_code
from tbl_menu
where menu_price < 9000;

# UNION ALL (합집합 + 교집합)
-- 두개 이상의 SELECT문의 결과를 중복을 포함하여! 결합한 결과를 반환하는 SQL 연산자임
-- 그럼 아래의 쿼리문을 실행하면 카테고리 코드가 10인거랑 메뉴 가격이 9000원 이하인 애들이 모두 나옴.
-- 15rows
select
	menu_code, menu_name, menu_price, category_code
from tbl_menu
where category_code = 10
union all
select
	menu_code, menu_name, menu_price, category_code
from tbl_menu
where menu_price < 9000
order by menu_code; -- 이거 해서 보면 중복되는 레코드가 잘 보임

# INTERSECT (교집합)
-- 두개 이상의 select문에서 공통되는 레코드만 반환하는 sql 연산자임
-- sql 에서는 지원하지 않은 연산자 명임
-- 그러나 inner join문으로 구현할 수는 있음.
SELECT 
    a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
FROM tbl_menu a
INNER JOIN (SELECT  menu_code, menu_name, menu_price, category_code, orderable_status FROM tbl_menu 
			WHERE menu_price < 9000) b 
	on (a.menu_code = b.menu_code)
WHERE
    a.category_code = 10;
-- IN 연산자 활용
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
FROM tbl_menu
WHERE category_code = 10
	AND menu_code IN (SELECT menu_code
						FROM tbl_menu 
						WHERE menu_price < 9000);


# MINUS (차집합)
-- LEFT JOIN을 사용해서 MINUS를 구한 할 수도 있음.
SELECT 
    a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
FROM tbl_menu a
LEFT JOIN (SELECT  menu_code, menu_name, menu_price, category_code, orderable_status FROM tbl_menu 
			WHERE menu_price < 9000) b
	on (a.menu_code = b.menu_code)
WHERE
    a.category_code = 10 AND
    b.menu_code IS NULL;