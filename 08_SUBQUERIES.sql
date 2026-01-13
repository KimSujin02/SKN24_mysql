# SUBQUERY (서브쿼리)
use menudb;

-- 메뉴명이 '열무김치라뗴'인 메뉴의 카테고리와 동일한 카테고리의 메뉴 정보 조회
-- 1) where 절에 서브쿼리를 사용하여 해결하는 방법
select
	menu_name
    , category_code
from tbl_menu
where category_code = (select category_code from tbl_menu where menu_name = '열무김치라떼');

-- 가장 많은 메뉴가 포함된 카테고리의 메뉴 개수 조회
select
	max(count_table.count)
from (select count(*) as count from tbl_menu group by category_code) count_table;

-- select
-- 	category_code
--     , count(*) as 'count'
-- from tbl_menu
-- group by category_code
-- order by count desc
-- limit 1;

-- 상관 서브쿼리
-- 메인쿼리가 서브쿼리의 결과에 영향을 주는 경우
-- 메뉴 가격이 평균보다 높은 카테고리를 가진 메뉴에 대한 정보를 뽑기
select
	menu_code
    , menu_name
    , menu_price
    , category_code
    , orderable_status
from tbl_menu m1
where menu_price > (
					select avg(menu_price)
					from tbl_menu
                    where category_code = m1.category_code
                    group by category_code
				);

# EXISTS
-- 메뉴 테이블에 해당 카테고리가 존재하는 카테고리에 대한 정보들만 뽑기
select category_code, category_name
from tbl_category c
where exists (
				select 1
                from tbl_menu m
                where c.category_code = m.category_code
                );