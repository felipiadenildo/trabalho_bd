import psycopg2
from psycopg2 import OperationalError

class Database:
    def __init__(self, db_name, host, port, user, password):
        self.db_name = db_name
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.connection = None
        self.cursor = None

    def connect(self):
        try:
            self.connection = psycopg2.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.db_name
            )
            self.cursor = self.connection.cursor()
            print("PostgreSQL database connection successful.")
        except OperationalError as e:
            print(f"Failed to connect to PostgreSQL: {e}")

    def close(self):
        if self.connection:
            self.connection.close()
            print("PostgreSQL database connection closed.")

    def execute_script(self, script_name):
        try:
            with open(script_name, 'r') as script_file:
                script = script_file.read()
                self.cursor.execute(script)
                self.connection.commit()
                print("Script executed successfully.")
        except Exception as e:
            print(f"An error occurred while executing the script: {e}")

    def list_tables(self):
        try:
            query = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';"
            self.cursor.execute(query)
            tables = self.cursor.fetchall()
            table_names = [table[0] for table in tables]
            return table_names
        except Exception as e:
            print(f"An error occurred while listing tables: {e}")
            return []

    def check_connection(self):
        return self.connection is not None
    
    def database_exists(self, database_name):
        try:
            query = f"SELECT 1 FROM pg_database WHERE datname='{database_name}'"
            self.cursor.execute(query)
            result = self.cursor.fetchone()
            return bool(result)
        except Exception as e:
            print(f"An error occurred while checking if database exists: {e}")
            return False

    def create_database(self, database_name):
        try:
            # Conectar ao banco de dados padrão 'postgres' para criar o novo banco de dados
            conn = psycopg2.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database='postgres'
            )
            conn.autocommit = True  # Desativar o modo de transação

            # Criar o banco de dados
            with conn.cursor() as cursor:
                query = f"CREATE DATABASE {database_name}"
                cursor.execute(query)

            print(f"Database '{database_name}' created successfully.")
        except Exception as e:
            print(f"An error occurred while creating database '{database_name}': {e}")
        finally:
            if conn:
                conn.close()