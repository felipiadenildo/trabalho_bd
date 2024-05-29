import os

class DBOperations:
    def __init__(self, db):
        """
        Initialize DBOperations object with a Database instance.
        """
        self.db = db

    def execute_script(self, script_name):
        script_path = os.path.join('scripts', script_name)
        if not os.path.exists(script_path):
            print(f"Script file not found: {script_path}")
            return

        with open(script_path, 'r') as file:
            script = file.read()

        try:
            if self.db.connection:
                self.db.cursor.execute(script)
                self.db.connection.commit()
                print(f"Executed script: {script_name}")
            else:
                print("Database connection is not established.")
        except Exception as e:
            if self.db.connection:
                self.db.connection.rollback()  # Rollback transaction in case of error
            print(f"Failed to execute script: {e}")

    def list_tables(self):
        """
        List all tables in the database.
        """
        try:
            query = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';"
            self.db.cursor.execute(query)
            tables = self.db.cursor.fetchall()
            table_names = [table[0] for table in tables]
            return table_names
        except Exception as e:
            self.db.connection.rollback()  # Rollback transaction in case of error
            print(f"An error occurred while listing tables: {e}")
            return []

    def get_table_columns(self, table):
        """
        Get the columns of the specified table in the correct order.
        """
        try:
            query = (f"SELECT column_name "
                     f"FROM information_schema.columns "
                     f"WHERE table_name = '{table}' "
                     f"ORDER BY ordinal_position;")
            self.db.cursor.execute(query)
            columns = self.db.cursor.fetchall()
            column_names = [column[0] for column in columns]
            return column_names
        except Exception as e:
            self.db.connection.rollback()  # Rollback transaction in case of error
            print(f"An error occurred while retrieving columns for table '{table}': {e}")
            return []


    def insert_data(self, table, data):
        """
        Insert data into the specified table.
        """
        columns = ', '.join(data.keys())
        placeholders = ', '.join(['%s'] * len(data))
        query = f"INSERT INTO {table} ({columns}) VALUES ({placeholders})"
        try:
            confirmation = input("Press Enter to confirm insertion or anything else to cancel: ")
            if confirmation == '':
                self.db.cursor.execute(query, tuple(data.values()))
                self.db.connection.commit()
                print(f"Insert successful on table '{table}'")
            else:
                print("Insert cancelled.")
                return
        except Exception as e:
            print(f"Failed to insert data: {e}")
            self.db.connection.rollback()

    def select_data(self, table, columns='*'):
        """
        Select data from the specified table.
        """
        try:
            columns = ', '.join(columns)
            query = f"SELECT {columns} FROM {table}"
            self.db.cursor.execute(query)
            data = self.db.cursor.fetchall()
            return data
        except Exception as e:
            print(f"An error occurred while selecting data: {e}")
            return []

    def update_data(self, table, data, condition):
        """
        Update data in the specified table.
        """
        set_clause = ', '.join([f"{col} = %s" for col in data.keys()])
        query = f"UPDATE {table} SET {set_clause} WHERE {condition}"
        try:
            confirmation = input("Press Enter to confirm update or anything else to cancel: ")

            if confirmation == '':
                self.db.cursor.execute(query, tuple(data.values()))
                self.db.connection.commit()
                print(f"Update successful on table '{table}'")
            else:
                print("Update cancelled.")
                return
        except Exception as e:
            print(f"Failed to update data: {e}")
            self.db.connection.rollback()

    def delete_data(self, table, condition):
        """
        Delete data from the specified table.
        """
        query = f"DELETE FROM {table} WHERE {condition}"
        try:
            self.db.cursor.execute(query)
            self.db.connection.commit()
            print(f"Delete successful on table '{table}'")
        except Exception as e:
            print(f"Failed to delete data: {e}")
            self.db.connection.rollback()

    def list_folder(self, folder_name):
        """
        List files in the specified folder.
        """
        folder_path = os.path.join(folder_name)
        if not os.path.exists(folder_path):
            print(f"Folder '{folder_name}' not found.")
            return []

        files = [file for file in os.listdir(folder_path) if file.endswith('.sql')]
        return files

    def execute_analysis(self, script_name):
        """
        Execute an analysis SQL script and return the result data and column names.
        """
        script_path = os.path.join('analysis', script_name)
        if not os.path.exists(script_path):
            print(f"Analysis script not found: {script_path}")
            return [], []

        with open(script_path, 'r') as file:
            script = file.read()

        try:
            self.db.cursor.execute(script)
            column_names = [desc[0] for desc in self.db.cursor.description]  # Get column names from cursor description
            data = self.db.cursor.fetchall()
            return data, column_names
        except Exception as e:
            print(f"Failed to execute analysis script: {e}")
            return [], []

    def check_connection(self):
        """
        Check if there is an active connection to the database.
        """
        if self.db.connection:
            return True, f"Connected to PostgreSQL database '{self.db.db_name}' at {self.db.host}:{self.db.port} as user '{self.db.user}'"
        else:
            return False, "Not connected to any database."

    def execute_analysis_script(self, script_name):
        script_path = os.path.join('analysis', script_name)
        if not os.path.exists(script_path):
            print(f"Analysis script not found: {script_path}")
            return

        with open(script_path, 'r') as file:
            script = file.read()

        try:
            self.db.cursor.execute(script)
            data = self.db.cursor.fetchall()
            self.db.connection.commit()
            return data
        except Exception as e:
            self.db.connection.rollback()  # Rollback transaction in case of error
            print(f"An error occurred while executing analysis script: {e}")
            return []
