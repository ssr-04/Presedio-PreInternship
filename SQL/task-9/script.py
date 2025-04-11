import mysql.connector
import csv
from datetime import datetime

# Database connection details
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'task9_db'
}

csv_file_path = './sales.csv'

try:
    cnx = mysql.connector.connect(**db_config)
    cursor = cnx.cursor()

    with open(csv_file_path, 'r') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        header = next(csv_reader)

        
        insert_query = """
        INSERT INTO Sales (Region, Country, ItemType, SalesChannel, OrderPriority,
                               OrderDate, OrderID, ShipDate, UnitsSold, UnitPrice,
                               UnitCost, TotalRevenue, TotalCost, TotalProfit)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        for row in csv_reader:
            if len(row) == 14:

                for idx, val in enumerate(row):
                    if val.strip() == '' or val.strip() == '-':
                        row[idx] = None

                    elif idx in [5, 7]:  
                        try:
                            date_object = datetime.strptime(row[idx], "%m/%d/%Y")
                            row[idx] = date_object.strftime("%Y-%m-%d")
                        except ValueError as e:
                            print(f"Error parsing Date '{row[idx]}': {e}. Setting to None.")
                            row[idx] = None
                    elif idx in [6, 8]: 
                        row[idx] = int(row[idx]) if row[idx] else None
                    elif idx in [9, 10, 11, 12, 13]:  
                        row[idx] = float(row[idx]) if row[idx] else None

                cursor.execute(insert_query, row)
            else:
                print(f"Skipping row with incorrect number of columns: {row}")

    cnx.commit()
    print(f"Successfully loaded data from {csv_file_path} into task9_db.Sales")

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
