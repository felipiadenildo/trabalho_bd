import os


class Interface:
    def __init__(self, db_operations):
        self.db_operations = db_operations

    def start(self):
        print("Welcome to the Election System!")

        # Connect to the database
        self.db_operations.db.connect()

        # Check the status of the database
        tables = self.db_operations.list_tables()
        if not tables:
            print("No tables found in the database.")
            run_initial_scripts = input("Would you like to run the DDL and initial scripts to set up the database? (yes/no): ")
            if run_initial_scripts.lower() == 'yes':
                self.db_operations.execute_script('ddl.sql')
                self.db_operations.execute_script('triggers.sql')
                self.db_operations.execute_script('dml.sql')
                print("Database setup complete.")
        else:
            print(f"Found tables: {', '.join(tables)}")

        while True:
            print("\nOptions:")
            print("1. Run a specific SQL script")
            print("2. Insert data into a table")
            print("3. Select data from a table")
            print("4. Update data in a table")
            print("5. Delete data from a table")
            print("6. View database connection status")
            print("7. List tables in the database")
            print("8. List available SQL scripts")
            print("9. Exit")
            choice = input("Enter your choice: ")

            if choice == '1':
                script_name = input("Enter the name of the SQL script: ")
                self.db_operations.execute_script(script_name)
            elif choice == '2':
                table = input("Enter the table name: ")
                columns = input("Enter the column names (comma-separated): ").split(',')
                values = input("Enter the values (comma-separated): ").split(',')
                data = dict(zip(columns, values))
                self.db_operations.insert_data(table, data)
            elif choice == '3':
                table = input("Enter the table name: ")
                columns = input("Enter the column names (comma-separated) or '*' for all columns: ")
                data = self.db_operations.select_data(table, columns)
                for row in data:
                    print(row)
            elif choice == '4':
                table = input("Enter the table name: ")
                columns = input("Enter the column names to update (comma-separated): ").split(',')
                values = input("Enter the new values (comma-separated): ").split(',')
                condition = input("Enter the condition for update: ")
                data = dict(zip(columns, values))
                self.db_operations.update_data(table, data, condition)
            elif choice == '5':
                table = input("Enter the table name: ")
                condition = input("Enter the condition for delete: ")
                self.db_operations.delete_data(table, condition)
            elif choice == '6':
                print("Database connection status:")
                if self.db_operations.check_connection():
                    print("Connected to the database.")
                else:
                    print("Not connected to the database.")
            elif choice == '7':
                print("Tables in the database:")
                tables = self.db_operations.list_tables()
                for table in tables:
                    print(table)
            elif choice == '8':
                print("Available SQL scripts:")
                scripts = self.db_operations.list_scripts()
                for script in scripts:
                    print(script)
            elif choice == '9':
                print("Exiting program. Goodbye!")
                break
            else:
                print("Invalid choice. Please enter a valid option.")

        # Close the database connection
        self.db_operations.db.close()
