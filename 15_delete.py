import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost'          # MySQL 서버 주소 (ip)
    , user = 'ohgiraffers'      # 사용자 이름
    , password = 'ohgiraffers'  # 비밀번호
    , database = 'menudb'       # 사용할 DB 스키마
)

cursor = connection.cursor()

# 방어회 메뉴 삭제하기
if connection.is_connected():
    # sql = "DELETE FROM tbl_menu WHERE menu_name='방어회'"
    sql = "DELETE FROM tbl_menu WHERE menu_code=%s"
    menu_code = '113'
    cursor.execute(sql, (menu_code,))
    
    sql = "SELECT * FROM tbl_menu"
    cursor.execute(sql)

    for line in cursor.fetchall() : # 모든 행을 가져옴
        print(line)

connection.commit()
cursor.close()
connection.close()