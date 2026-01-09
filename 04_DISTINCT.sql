# DISTINCT

-- 단일 컬럼 distinct
select distinct category_code
from tbl_menu
order by category_code;

-- 단일 컬럼 distinct with null
-- null이 포함된 경우 null도 조회함
select distinct ref_category_code
from tbl_category;
-- where ref_category_code is not null;

-- 다중 컬럼 distinct
-- 이 두개를 묶은 결과의 중복을 없앰.
select distinct category_code, orderable_status
from tbl_menu
order by category_code, orderable_status;