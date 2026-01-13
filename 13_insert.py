import mysql.connector

connection = mysql.connector.connect(
    host = 'localhost'          # MySQL 서버 주소 (ip)
    , user = 'ohgiraffers'      # 사용자 이름
    , password = 'ohgiraffers'  # 비밀번호
    , database = 'menudb'       # 사용할 DB 스키마
)

cursor = connection.cursor()

if connection.is_connected():
    # sql = "INSERT INTO tbl_menu VALUES(NULL, '방어회', 30000, 4, 'Y')"
    sql = """
            INSERT INTO menudb.tbl_menu
            (menu_name, menu_price, category_code, orderable_status)
            VALUES(%s, %s, %s, %s)
            """
    values = ('방어회', 30000, 4, 'Y')
    
    cursor.execute(sql, values)
    
    print(f'@@@ {cursor.rowcount}개의 행 삽입 완료 @@@')
    
    sql = "SELECT * FROM tbl_menu WHERE menu_name = '방어회'"
    cursor.execute(sql)

    for line in cursor.fetchall() : # 모든 행을 가져옴
        print(line)

connection.commit()
cursor.close()
connection.close()