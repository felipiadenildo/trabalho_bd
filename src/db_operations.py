import os

class DBOperations:
    def __init__(self, db):
        self.db = db

    def execute_script(self, script_name):
        script_path = os.path.join('scripts', script_name)
        if not os.path.exists(script_path):
            print(f"Script file not found: {script_path}")
            return

        with open(script_path, 'r') as file:
            script = file.read()

        try:
            self.db.cursor.execute(script)
            self.db.connection.commit()
            print(f"Executed script: {script_name}")
        except Exception as e:
            print(f"Failed to execute script: {e}")

    def list_tables(self):
        query = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';"
        self.db.cursor.execute(query)
        tables = self.db.cursor.fetchall()
        return [table[0] for table in tables]

    def insert_data(self, table, data):
        columns = ', '.join(data.keys())
        placeholders = ', '.join(['%s'] * len(data))
        query = f"INSERT INTO {table} ({columns}) VALUES ({placeholders})"
        self.db.cursor.execute(query, tuple(data.values()))
        self.db.connection.commit()

    def select_data(self, table, columns='*'):
        query = f"SELECT {columns} FROM {table}"
        self.db.cursor.execute(query)
        return self.db.cursor.fetchall()

    def update_data(self, table, data, condition):
        set_clause = ', '.join([f"{col} = %s" for col in data.keys()])
        query = f"UPDATE {table} SET {set_clause} WHERE {condition}"
        self.db.cursor.execute(query, tuple(data.values()))
        self.db.connection.commit()

    def delete_data(self, table, condition):
        query = f"DELETE FROM {table} WHERE {condition}"
        self.db.cursor.execute(query)
        self.db.connection.commit()
