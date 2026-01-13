import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost'          # MySQL 서버 주소 (ip)
    , user = 'ohgiraffers'      # 사용자 이름
    , password = 'ohgiraffers'  # 비밀번호
    , database = 'menudb'       # 사용할 DB 스키마
)

if connection.is_connected():
    print('@@@ MySQL 서버 연결 성공!!! @@@')

connection.close()