import mysql.connector
import csv

# Database connection details
db_config = {
    'host': 'localhost',  
    'user': 'root',      
    'password': 'root',  # No issues to expose as remote connections are disabled :)
    'database': 'task6_db'
}

# Path to your CSV file
csv_file_path = './orders.csv'

try:
    cnx = mysql.connector.connect(**db_config)
    cursor = cnx.cursor()

    with open(csv_file_path, 'r') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        header = next(csv_reader) 

        # INSERT SQL query
        insert_query = """
        INSERT INTO Orders (order_id, customer_id, order_status,
                           order_purchase_timestamp, order_approved_at,
                           order_delivered_timestamp, order_estimated_delivery_date)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """

        for row in csv_reader:
            if len(row) == 7:
                # Convert empty string to NONE explicitly
                for idx,val in enumerate(row):
                    if val == '':
                        row[idx] = None

                cursor.execute(insert_query, row)
            else:
                print(f"Skipping row with incorrect number of columns: {row}")

    cnx.commit()
    print(f"Successfully loaded data from {csv_file_path} into task6_db.Orders")

except mysql.connector.Error as err:
    print(f"Error connecting or executing MySQL query: {err}")
except FileNotFoundError:
    print(f"Error: CSV file not found at {csv_file_path}")
except Exception as e:
    print(f"An unexpected error occurred: {e}")

finally:
    if cursor:
        cursor.close()
    if cnx and cnx.is_connected():
        cnx.close()