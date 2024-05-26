import os
from src.database import Database
from src.db_operations import DBOperations
from src.interface import Interface

def main():
    # Configurações do banco de dados PostgreSQL
    postgres_host = 'localhost'
    postgres_port = '5432'
    default_postgres_user = 'postgres'
    default_postgres_password = '1234'
    default_postgres_db = 'postgres'

    postgres_user = input(f"Enter PostgreSQL username (default: {default_postgres_user}): ").strip() or default_postgres_user
    postgres_password = input(f"Enter PostgreSQL password (default: {default_postgres_password}): ").strip() or default_postgres_password

    # Criar uma instância do banco de dados PostgreSQL
    db = Database(db_name=default_postgres_db,
                  host= postgres_host,
                  port=postgres_port,
                  user= postgres_user,
                  password=postgres_password)

    # Conectar
    db.connect()
    # Verificar conexão com o PostgreSQL
    postgres_connected = db.check_connection()

    if postgres_connected:
        print("PostgreSQL connection successful.")
        
        # Verificar se o banco de dados "election" existe
        if not db.database_exists('election'):
            print("Database 'election' does not exist. Creating...")
            db.create_database('election')
            print("Database 'election' created.")

            db = Database(db_name=postgres_db,
                  host= postgres_host,
                  port=postgres_port,
                  user= postgres_user,
                  password=postgres_password)
            
            print("Connected to the 'election' database.")

            # Perguntar ao usuário se deseja rodar os scripts SQL
            run_scripts = input("Would you like to run DDL, triggers, and DML scripts? (yes/no): ")
            if run_scripts.lower() == 'yes':
                db_operations = DBOperations(db)
                db_operations.execute_script('ddl.sql')
                db_operations.execute_script('triggers.sql')
                db_operations.execute_script('dml.sql')
                print("Scripts executed successfully.")
            else:
                print("Skipping script execution.")

        else:
            print("Database 'election' already exists.")
        
        # Iniciar a interface
        db_operations = DBOperations(db)
        interface = Interface(db_operations)
        interface.start()
    else:
        print("Failed to connect to PostgreSQL. Please check your connection settings.")

if __name__ == "__main__":
    main()
