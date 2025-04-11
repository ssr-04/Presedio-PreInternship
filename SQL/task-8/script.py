import mysql.connector
import csv
from datetime import datetime

# Database connection details
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'task8_db'
}

csv_file_path = './employees.csv'

try:
    cnx = mysql.connector.connect(**db_config)
    cursor = cnx.cursor()

    with open(csv_file_path, 'r') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        header = next(csv_reader)

        
        insert_query = """
        INSERT INTO Employees (EmployeeID, FirstName, LastName, PhoneNumber, HireDate,
                               JobID, Salary, CommissionPct, ManagerID, DepartmentID)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        for row in csv_reader:
            if len(row) == 11:
                del row[3]
                for idx, val in enumerate(row):
                    if val.strip() == '' or val.strip() == '-':
                        row[idx] = None
                    elif idx == 4:  # HireDate
                        try:
                            date_object = datetime.strptime(row[idx], '%d-%b-%y')
                            row[idx] = date_object.strftime('%Y-%m-%d')
                        except ValueError as e:
                            print(f"Error parsing HireDate '{row[idx]}': {e}. Setting to None.")
                            row[idx] = None
                    elif idx in [0, 8, 9]:  # Integer fields: EmployeeID, ManagerID, DepartmentID
                        row[idx] = int(row[idx]) if row[idx] else None
                    elif idx == 6:  # Salary
                        row[idx] = float(row[idx]) if row[idx] else None
                    elif idx == 7:  # CommissionPct
                        try:
                            row[idx] = float(row[idx]) if row[idx] else None
                        except ValueError:
                            row[idx] = None

                cursor.execute(insert_query, row)
            else:
                print(f"Skipping row with incorrect number of columns: {row}")

    cnx.commit()
    print(f"Successfully loaded data from {csv_file_path} into task8_db.Employees")

except mysql.connector.Error as err:
    print(f"Error connecting or executing MySQL query: {err}")
    print(row)
except FileNotFoundError:
    print(f"Error: CSV file not found at {csv_file_path}")
except Exception as e:
    print(f"An unexpected error occurred: {e}")

finally:
    if cursor:
        cursor.close()
    if cnx and cnx.is_connected():
        cnx.close()
