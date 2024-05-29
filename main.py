import os
from src.database import Database
from src.db_operations import DBOperations
from src.interface import Interface

def main():
    # PostgreSQL database configuration
    postgres_host = 'localhost'
    postgres_port = '5432'
    default_postgres_user = 'postgres'
    default_postgres_password = 'postgres'
    default_postgres_db = 'postgres'

    print("\n\nLets check some credentials before starting the Election System!\n")

    # Prompt user for PostgreSQL username and password, using default values if not provided
    postgres_user = input(f"Enter PostgreSQL username (default: {default_postgres_user}): ").strip() or default_postgres_user
    postgres_password = input(f"Enter PostgreSQL password (default: {default_postgres_password}): ").strip() or default_postgres_password

    # Create an instance of the PostgreSQL database
    db = Database(db_name=default_postgres_db,
                  host=postgres_host,
                  port=postgres_port,
                  user=postgres_user,
                  password=postgres_password)

    # Check PostgreSQL connection
    if not db.check_connection():
        print("Failed to connect to PostgreSQL. Please check your connection settings.")
        return

    # Check if the database 'election' exists
    if not db.database_exists('election'):
        print("Database 'election' does not exist. Creating...")
        db.create_database('election')
        print("Database 'election' created.")
    else:
        print("Database 'election' already exists.")

    # Reconnect to the 'election' database
    db = Database(db_name='election',
                  host=postgres_host,
                  port=postgres_port,
                  user=postgres_user,
                  password=postgres_password)

    # Start the interface
    db_operations = DBOperations(db)

    # Run SQL scripts if requested
    # Check the status of the database
    tables = db_operations.list_tables()
    if not tables:
        print("No tables found in the database.")
        run_initial_scripts = input("Would you like to run the DDL and initial scripts to set up the database? (yes/no) [yes]: ").strip().lower()
        if run_initial_scripts == '' or run_initial_scripts == 'yes':
            db_operations.execute_script('ddl.sql')
            db_operations.execute_script('triggers.sql')
            db_operations.execute_script('dml.sql')

    else:
        print("\nFound tables:\n")
        for table in tables:
            print(f"\t{table}")

    interface = Interface(db_operations)
    interface.start()

if __name__ == "__main__":
    main()
