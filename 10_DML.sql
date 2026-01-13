# DML
-- 데이터의 CRUD
-- C (CREATE) -INSERT
-- R (READ) - SELECT
-- U (UPDATE) UPDATE
-- D (DELETE) DELETE

select menu_code, menu_name, menu_price, category_code, orderable_status
from tbl_menu;

# INSERT
-- INSERT INTO 테이블명 VALUES (컬럼순으로, 들어갈, 데이터, 나열)
INSERT INTO tbl_menu VALUES (NULL, '햄버거', 10000, 4, 'Y');

-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3 ... )
-- VALUES (데이터1, 데이터2, 데이터3, ...)
-- 권장되는 방법
INSERT INTO tbl_menu(menu_code, menu_name, menu_price, category_code, orderable_status)
VALUES (NULL, '맛있는햄버거', 10000, 4, 'Y');

-- MULTI INSERT
INSERT INTO TBL_MENU
VALUES
(NULL, '감자튀김', 2000, 5, 'Y')
, (NULL, '치즈스틱', 1500, 5, 'N')
, (NULL, '코울슬로', 3000, 6, 'Y');

-- AUTO INCREMENT 옵션이 있어도 임의의 PK값 지정 가능
-- 단 번호 자체에 영향으로 중
INSERT INTO tbl_menu VALUES (100, '햄버거', 10000, 4, 'Y');

# UPDATE
-- UPDATE 테이블명
-- SET 컬럼명1 = 수정할 데이터1,
-- 컬럼명2 = 수정할 데이터2, ...
-- WHERE 수정 대상 데이터의 조건
UPDATE TBL_MENU
SET MENU_NAME = '100번이었던 음식'
	, MENU_PRICE = 1000000
WHERE MENU_CODE = 100;

SELECT * FROM TBL_MENU;

# DELETE
-- DELETE FROM 테이블명 [WHERE 삭제 대상 데이터의 조건];

DELETE FROM TBL_MENU WHERE MENU_CODE = 101;

DELETE FROM TBL_MENU
ORDER BY MENU_CODE DESC LIMIT 3;

# REPLACE
-- 중복값에 대해서는 데이터를 덮어쓱소, 중복값이 없다면 insert를 수행
-- INTO 키워드는 생략 가능함.
INSERT INTO TBL_MENU VALUES (100, '한방능이100숙', 1000000, 4, 'Y');
REPLACE INTO TBL_MENU VALUES (100, '한방능이백숙', 100, 4, 'Y');
-- 없는 ROW를 REPLACE 하려고 할때.. 새로운 ROW가 생김.
REPLACE INTO TBL_MENU VALUES (110, '한방능이백숙', 100, 4, 'Y');