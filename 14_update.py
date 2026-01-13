import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost'          # MySQL 서버 주소 (ip)
    , user = 'ohgiraffers'      # 사용자 이름
    , password = 'ohgiraffers'  # 비밀번호
    , database = 'menudb'       # 사용할 DB 스키마
)

cursor = connection.cursor()

# 7번 메뉴 변경 / 메뉴명을 '럭키쎄븐푸드', 7777원
if connection.is_connected():
    # sql = "UPDATE tbl_menu SET menu_name = '럭키쎄븐푸드', menu_price = 7777 WHERE menu_code = 7"
    sql = "UPDATE tbl_menu SET menu_name = %s, menu_price = %s WHERE menu_code = %s"
    
    menu_name = '럭키쎄븐푸드'
    menu_price = 7778
    menu_code = 7
    
    cursor.execute(sql, (menu_name, menu_price, menu_code))
    
    sql = "SELECT * FROM tbl_menu WHERE menu_code = 7"
    cursor.execute(sql)

    for line in cursor.fetchall() : # 모든 행을 가져옴
        print(line)

connection.commit()
cursor.close()
connection.close()