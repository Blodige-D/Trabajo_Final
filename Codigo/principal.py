import cx_Oracle

class connect():
    def __init__(self):

        host = "192.168.20.28"
        user = "Final"
        passw = "1234"
        tsname = "xe"

        cx_Oracle.init_oracle_client(lib_dir=r"C:\oraclexe\app\oracle\instantclient_19_6")
        try:
            self.conexion = cx_Oracle.connect(user, passw, host+"/"+tsname+"?connect_timeout=30")
            print("Conexion Establecida!!")
            
        except Exception as error:
            print("No se pudo conectar a la base de datos. Error : " + error)
        
    def sentenciaCompuesta(self, sentencia):
        cursor = self.conexion.cursor()
        cursor.execute(sentencia)
        datos = cursor.fetchall()
        cursor.close
        return datos
    
    def sentenciaSimple(self, sentencia):
        cursor = self.conexion.cursor()
        cursor.execute(sentencia)
        cursor.close

    def close(self):
        self.conexion.close()

    def commit(self):
        self.conexion.commit()


if __name__ == "__main__":
    nexo = connect()
    nexo.sentenciaSimple("insert into CLIENTE values (1083764589, 'Kevin Andres', 'Forero Gusteiro', '3055874345', 'Av 167 #456-1456')")
    nexo.commit()
    for fila in nexo.sentenciaCompuesta("select * from CLIENTE"):
        print(fila)
       
    
    nexo.close()
        





