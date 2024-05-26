class Interface:
    def __init__(self, db_operations):
        """
        Initialize Interface object with DBOperations instance.
        """
        self.db_operations = db_operations

    def start(self):
        """
        Start the interface for interacting with the database.
        """
        print("\n\n----- Welcome to the Election System! -----\n\n")

        while True:
            print("\nOptions:")
            print("1. Run a specific SQL script")
            print("2. Run analysis")
            print("3. Insert data into a table")
            print("4. Select data from a table")
            print("5. Update data in a table")
            print("6. Delete data from a table")
            print("7. View database connection status")
            print("8. List tables in the database")
            print("9. List available SQL scripts")
            print("10. Exit")
            choice = input("Enter your choice: ")

            if choice == '1':
                # Run a specific SQL script
                self.run_specific_sql_script()
            elif choice == '2':
                # Run analysis
                self.run_analysis()
            elif choice == '3':
                # Insert data into a table
                self.insert_data_into_table()
            elif choice == '4':
                # Select data from a table
                self.select_data_from_table()
            elif choice == '5':
                # Update data in a table
                self.update_data_in_table()
            elif choice == '6':
                # Delete data from a table
                self.delete_data_from_table()
            elif choice == '7':
                # View database connection status
                self.view_database_connection_status()
            elif choice == '8':
                # List tables in the database
                self.list_tables_in_database()
            elif choice == '9':
                # List available SQL scripts
                self.list_available_sql_scripts()
            elif choice == '10':
                # Exit the program
                print("Exiting program. Goodbye!")
                break
            else:
                print("Invalid choice. Please enter a valid option.")

        # Close the database connection
        self.db_operations.db.close()

    def run_specific_sql_script(self):
        """
        Execute a specific SQL script.
        """
        print("Available SQL scripts:")
        scripts = self.db_operations.list_folder("scripts")
        for i, script in enumerate(scripts, start=1):
            print(f"{i}. {script.replace('_', ' ').replace('.sql','')}")

        # Ask user to select a script
        script_choice = input("Enter the number of the script to run: ")
        if script_choice.isdigit() and 1 <= int(script_choice) <= len(scripts):
            script_name = scripts[int(script_choice) - 1]
            self.db_operations.execute_script(script_name)
        else:
            print("Invalid script number. Please enter a valid number.")

    def insert_data_into_table(self):
        """
        Insert data into a table.
        """
        table = input("Enter the table name: ")
        columns = input("Enter the column names (comma-separated): ").split(',')
        values = input("Enter the values (comma-separated): ").split(',')
        data = dict(zip(columns, values))
        self.db_operations.insert_data(table, data)

    def select_data_from_table(self):
        """
        Select data from a table.
        """
        table = input("Enter the table name: ")
        columns = input("Enter the column names (comma-separated) or '*' for all columns: ")
        data = self.db_operations.select_data(table, columns)
        for row in data:
            print(row)

    def update_data_in_table(self):
        """
        Update data in a table.
        """
        table = input("Enter the table name: ")
        columns = input("Enter the column names to update (comma-separated): ").split(',')
        values = input("Enter the new values (comma-separated): ").split(',')
        condition = input("Enter the condition for update: ")
        data = dict(zip(columns, values))
        self.db_operations.update_data(table, data, condition)

    def delete_data_from_table(self):
        """
        Delete data from a table.
        """
        table = input("Enter the table name: ")
        condition = input("Enter the condition for delete: ")
        self.db_operations.delete_data(table, condition)

    def view_database_connection_status(self):
        """
        View database connection status.
        """
        print("Database connection status:")
        connected, message = self.db_operations.check_connection()
        print(message)

    def list_tables_in_database(self):
        """
        List tables in the database.
        """
        print("Tables in the database:\n")
        tables = self.db_operations.list_tables()
        for table in tables:
            print(f"\t{table}")

    def list_available_sql_scripts(self):
        """
        List available SQL scripts.
        """
        print("Available SQL scripts:")
        scripts = self.db_operations.list_folder("scripts")
        for script in scripts:
            print(script)

    def run_analysis(self):
        """
        Run analysis.
        """
        print("Available analysis:")
        scripts = self.db_operations.list_folder("analysis")
        for i, script in enumerate(scripts, start=1):
            print(f"{i}. {script.replace('_', ' ').replace('.sql','')}")

        # Ask user to select a script
        script_choice = input("Enter the number of the script to run: ")
        if script_choice.isdigit() and 1 <= int(script_choice) <= len(scripts):
            script_name = scripts[int(script_choice) - 1]
            analysis_result, column_names = self.db_operations.execute_analysis(script_name)

            # Check if the result is not empty and is a list of tuples
            if analysis_result and isinstance(analysis_result, list) and all(isinstance(row, tuple) for row in analysis_result):
                # Print column names
                print(f"\nAnalysis result of {script_name}:")
                print("\t".join(column_names))

                # Print the result data rows
                for row in analysis_result:
                    print("\t".join(map(str, row)))  # Join each element in the row with a tab separator
            else:
                print("Analysis result is empty or not in the correct format.")
        else:
            print("Invalid script number. Please enter a valid number.")