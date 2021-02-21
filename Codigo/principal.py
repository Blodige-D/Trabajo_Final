import cx_Oracle

conexion = cx_Oracle.connect("system", "1234", "localhost/XE")
cursor = conexion.cursor()
cursor.execute('Select * from cliente')

try:
    for columnas in cursor:
        print(columnas)
        cursor.close()
        conexion.close()
except Exception as e:
    print(str(e))

