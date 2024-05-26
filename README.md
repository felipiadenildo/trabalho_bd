# Election System Prototype

Project made by:

- Anlee Feng Chang 12563690
- Felipi Adenildo Soares Sousa 10438790
- Gustav Shigueo Nicioka Asano 11212355
- Matheus Rodrigues dos Santos 11212866

This project is a prototype of an election system that interacts with a PostgreSQL database. It provides various functionalities for managing and querying the database through a command-line interface.

## Project Structure

The project is organized into several directories and files as follows:

```
.
├── analysis
│   └── *.sql
├── scripts
│   ├── ddl.sql
│   ├── triggers.sql
│   ├── dml.sql
│   └── *.sql
├── src
│   ├── database.py
│   ├── db_operations.py
│   └── interface.py
└── main.py
```

### `src/database.py`
This module contains the `Database` class responsible for managing the connection to the PostgreSQL database. It provides methods to connect to the database, check the connection status, create databases, and close the connection.

### `src/db_operations.py`
This module contains the `DBOperations` class, which handles various database operations such as executing scripts, listing tables, inserting data, selecting data, updating data, deleting data, and executing analysis scripts.

### `src/interface.py`
This module contains the `Interface` class, which provides a command-line interface for interacting with the database. It presents a menu of options to the user and calls the appropriate methods in the `DBOperations` class based on the user's choices.

### `scripts/`
This directory contains SQL scripts for setting up and managing the database. These include:
- `ddl.sql`: Data Definition Language script for creating tables and other database objects.
- `triggers.sql`: SQL script for creating triggers.
- `dml.sql`: Data Manipulation Language script for inserting initial data into the database.
- Other SQL scripts for various purposes.

### `analysis/`
This directory contains SQL scripts for performing specific queries and analyses on the database.

### `main.py`
This is the entry point of the application. It initializes the database connection, checks the database setup, and starts the interface for user interaction.

## Getting Started

### Prerequisites
- PostgreSQL installed on your system.

### Installing PostgreSQL on Ubuntu

```sh
sudo apt update
sudo apt install postgresql postgresql-contrib
```

### Starting PostgreSQL Service

```sh
sudo service postgresql start
```

### Creating a PostgreSQL User and Database

```sh
sudo -i -u postgres
psql
```

In the PostgreSQL prompt:

```sql
CREATE USER myuser WITH PASSWORD 'mypassword';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
```

### Running the Project

1. Clone the repository.
2. Navigate to the project directory.
3. Run the main script:
    ```sh
    python main.py
    ```

The default database credentials are:
- User: `postgres`
- Password: `postgres`
- Database: `postgres`

You will be prompted to enter the PostgreSQL username and password. If you have a different setup, enter the appropriate credentials.

## Program Flow

When the program starts, it performs the following steps:
1. Connects to the PostgreSQL server.
2. Checks if the `election` database exists; if not, it creates and connects to it.
3. Checks if there are tables in the database; if not, it prompts the user to run the DDL, Triggers, and DML scripts to set up the database.

After the setup, it presents the following menu options:

### Menu Options

1. **Run a specific SQL script**: Lists all available scripts in the `scripts` directory and prompts the user to select one to execute.
2. **Run analysis**: Lists all available analysis scripts in the `analysis` directory and prompts the user to select one to execute. The result is displayed in a table format.
3. **Insert data into a table**: Prompts the user to enter the table name, column names, and values to insert data into the specified table.
4. **Select data from a table**: Prompts the user to enter the table name and columns to select data from the specified table. Displays the result.
5. **Update data in a table**: Prompts the user to enter the table name, columns to update, new values, and condition to update data in the specified table.
6. **Delete data from a table**: Prompts the user to enter the table name and condition to delete data from the specified table.
7. **View database connection status**: Displays the current status of the database connection.
8. **List tables in the database**: Lists all tables in the connected database.
9. **List available SQL scripts**: Lists all available scripts in the `scripts` directory.
10. **Exit**: Exits the program.

### Detailed Explanation of Menu Options

1. **Run a specific SQL script**:
    - Lists all scripts in the `scripts` directory.
    - Prompts the user to select a script by entering its number.
    - Executes the selected script.

2. **Run analysis**:
    - Lists all scripts in the `analysis` directory.
    - Prompts the user to select a script by entering its number.
    - Executes the selected analysis script and displays the results in a table format.

3. **Insert data into a table**:
    - Prompts for table name, columns, and values.
    - Inserts the data into the specified table.

4. **Select data from a table**:
    - Prompts for table name and columns.
    - Retrieves and displays the data from the specified table.

5. **Update data in a table**:
    - Prompts for table name, columns to update, new values, and condition.
    - Updates the data in the specified table based on the condition.

6. **Delete data from a table**:
    - Prompts for table name and condition.
    - Deletes the data from the specified table based on the condition.

7. **View database connection status**:
    - Displays the current connection status of the database.

8. **List tables in the database**:
    - Lists all tables present in the connected database.

9. **List available SQL scripts**:
    - Lists all scripts present in the `scripts` directory.

10. **Exit**:
    - Exits the program.

---

This README provides an overview of the election system prototype, instructions for setting up and running the project, and a detailed explanation of its functionalities. For any further questions or issues, please refer to the project documentation or contact the project maintainer.

## Project Maintainers

For any questions or issues, please contact the project maintainers:


| Name                          | Email                     |
|-------------------------------|---------------------------|
| Anlee Feng Chang              | anlee(at)usp.br           |
| Felipi Adenildo Soares Sousa  | felipiadenildo(at)usp.br  |
| Gustav Shigueo Nicioka Asano  |                           |
| Matheus Rodrigues dos Santos  |                           |
