import psycopg2
from psycopg2 import OperationalError

class Database:
    def __init__(self, db_name, host, port, user, password):
        """
        Initialize Database object with connection parameters.
        """
        self.db_name = db_name
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.connection = None
        self.cursor = None
        # Connect to the database
        self.connect()

    def connect(self):
        """
        Connect to the PostgreSQL database.
        """
        try:
            self.connection = psycopg2.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.db_name
            )
            self.cursor = self.connection.cursor()
            print(f"PostgreSQL database connection successful at {self.db_name}.")
        except OperationalError as e:
            print(f"Failed to connect to PostgreSQL: {e}")

    def close(self):
        """
        Close the database connection.
        """
        if self.connection:
            self.connection.close()
            print("PostgreSQL database connection closed.")

    def execute_script(self, script_name):
        """
        Execute SQL script from file.
        """
        try:
            with open(script_name, 'r') as script_file:
                script = script_file.read()
                self.cursor.execute(script)
                self.connection.commit()
                print("Script executed successfully.")
        except Exception as e:
            print(f"An error occurred while executing the script: {e}")

    def list_tables(self):
        """
        List all tables in the database.
        """
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
        """
        Check if there is an active database connection.
        """
        return self.connection is not None
    
    def database_exists(self, database_name):
        """
        Check if a database with the given name exists.
        """
        try:
            query = f"SELECT 1 FROM pg_database WHERE datname='{database_name}'"
            self.cursor.execute(query)
            result = self.cursor.fetchone()
            return bool(result)
        except Exception as e:
            print(f"An error occurred while checking if database exists: {e}")
            return False

    def create_database(self, database_name):
        """
        Create a new database with the given name.
        """
        conn = None
        try:
            # Connect to the default 'postgres' database to create the new database
            conn = psycopg2.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database='postgres'
            )
            conn.autocommit = True  # Disable transaction mode

            # Create the database
            with conn.cursor() as cursor:
                query = f"CREATE DATABASE {database_name}"
                cursor.execute(query)

            print(f"Database '{database_name}' created successfully.")
        except Exception as e:
            print(f"An error occurred while creating database '{database_name}': {e}")
        finally:
            if conn:
                conn.close()
