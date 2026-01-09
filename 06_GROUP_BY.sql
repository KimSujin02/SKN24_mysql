# GROUP BY

-- 단일 컬럼 GROUP BY + COUNT 집계 함수(개수)
-- count는 걍 뭘 넣든,.... 행의 수를 count 하는 거임.
SELECT category_code, COUNT(1)
FROM tbl_menu
GROUP BY category_code;

-- 같은 카테고리 코드끼리 묶어서 가격 총합을 구함.
SELECT category_code, SUM(menu_price)
FROM tbl_menu
GROUP BY category_code;

-- 같은 카테고리 코드끼리 묶어서 가격 평균을 구함.
SELECT category_code, CEIL(AVG(menu_price))
FROM tbl_menu
GROUP BY category_code;

-- 다중 group by
-- 카테고리와 가격을 묶어서( 한팀으로 만들어 )
-- => 카테고리랑 가격이랑 겹치는 행들의 개수를 구한거임.
SELECT category_code, menu_price, COUNT(*)
FROM tbl_menu
GROUP BY category_code, menu_price;

# HAVING

-- HAVING은 GROUP으로 묶은 애들이 가지고 있어야되는 조건
select category_code, COUNT(*)
from tbl_menu
group by category_code
having category_code between 5 and 8;

# ROLLUP

-- 제일 마지막에 category_code는 null 값이 나옴
-- 옆 열에는 sum(menu_price)을 모두 합한 값이 나옴.
-- 약간 표에 있는 '총합' under label..?같은 느낌으로다가 나오게 하는 역할임
select category_code, sum(menu_price)
from tbl_menu
group by category_code
with rollup;

-- 다중 group by rollup
-- 다중컬럼 group by + count -> rollup
-- 그룹별 count가 먼저 나옴 -> 먼저나온 category_code 기준의 중계 => 총계(합계)
SELECT category_code, menu_price, COUNT(*)
FROM tbl_menu
GROUP BY category_code, menu_price
with rollup;
