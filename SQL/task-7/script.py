import mysql.connector
import csv
from datetime import datetime


# Database connection details
db_config = {
    'host': 'localhost',  
    'user': 'root',      
    'password': 'root',  # No issues to expose as remote connections are disabled :)
    'database': 'task7_db'
}

# Path to your CSV file
csv_file_path = './employee_data.csv'

try:
    cnx = mysql.connector.connect(**db_config)
    cursor = cnx.cursor()

    with open(csv_file_path, 'r') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        header = next(csv_reader) 

        # INSERT SQL query
        insert_query = """
        INSERT INTO Employees (EmployeeID, FirstName,LastName,StartDate,ExitDate,Title,
        Supervisor,Email,BusinessUnit,EmployeeStatus, EmployeeType, PayZone, 
        EmployeeClassificationType, TerminationType, TerminationDescription,DepartmentType,
        DivisionDescription,DOB, State, JobFunction,Gender,Location, RaceEthnicity,
        MaritalStatus, PerformanceScore, CurrentEmployeeRating)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s , %s, %s, %s, %s, %s, %s, %s, %s, %s, %s , %s, %s, %s, %s, %s, %s)
        """

        for row in csv_reader:
            if len(row) == 26:
                # Convert empty string to NONE explicitly
                for idx,val in enumerate(row):
                    if val == '':
                        row[idx] = None
                    elif idx in [3, 4]:
                        try:
                            date_str = row[idx]
                            date_object = datetime.strptime(date_str, '%d-%b-%y')
                            row[idx] = date_object.strftime('%Y-%m-%d')
                        except ValueError as e:
                            print(f"Error parsing StartDate '{date_str}': {e}. Setting to None.")
                            row[idx] = None
                    elif idx == 17:
                        dob_str = row[17]
                        try:
                            date_object_dob = datetime.strptime(dob_str, '%d-%m-%Y')
                            row[17] = date_object_dob.strftime('%Y-%m-%d')
                        except ValueError as e:
                            print(f"Error parsing DOB '{dob_str}': {e}. Setting to None.")
                            row[17] = None

                cursor.execute(insert_query, row)
            else:
                print(f"Skipping row with incorrect number of columns: {row}")

    cnx.commit()
    print(f"Successfully loaded data from {csv_file_path} into task7_db.Employees")

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