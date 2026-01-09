# ORDER BY

-- 정렬 (오름차순) / 오름차순은 굳이 ASC를 붙이지 않아도 되긴함.
-- ASC의 뜻 (Ascending)
select
	menu_code
	, menu_name
	, menu_price
from
	tbl_menu
ORDER BY menu_name ASC;

-- 정렬 (내림차순)
-- DESC의 뜻 (Descending) / 이 친구는 명시적으로 작성해줘야되는거임.
select
	menu_code,
	menu_name,
	menu_price
from
	tbl_menu
ORDER BY menu_name DESC;


-- 다중 정렬
-- 메뉴 가격의 내림차로 먼저 정렬하고,
-- 같은 금액대의 행에서는 메뉴이름의 오름차순으로 정렬하겠다는 뜻.
select
	menu_code,
	menu_name,
	menu_price
from
	tbl_menu
ORDER BY menu_price DESC, menu_name;

-- as로 연산한거 닉네임 붙여서 orderby 해버리기
select
	menu_code,
	menu_name,
	menu_price * menu_code as '곱한거'
from
	tbl_menu
ORDER BY 곱한거;

-- is null하면 null을 맨아래로 보냄.
select
	category_code, category_name, ref_category_code
from
	tbl_category
order by ref_category_code is null;

-- is null desc을 붙이면 null을 맨처음으로 보냄
-- 그리고 추가로 ref 기준 내림차 또 한거임 (null먼저 정렬하고)
select
	category_code, category_name, ref_category_code
from
	tbl_category
order by ref_category_code is null desc, ref_category_code desc;