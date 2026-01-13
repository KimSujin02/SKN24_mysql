import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost'          # MySQL 서버 주소 (ip)
    , user = 'ohgiraffers'      # 사용자 이름
    , password = 'ohgiraffers'  # 비밀번호
    , database = 'menudb'       # 사용할 DB 스키마
)

cursor = connection.cursor()

if connection.is_connected():
    sql = "SELECT * FROM tbl_menu"
    cursor.execute(sql)

    for line in cursor.fetchall() : # 모든 행을 가져옴
        for n in line :
            print(n, end='\t')
        print()

cursor.close()
connection.close()