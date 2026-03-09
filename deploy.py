import snowflake.connector
import os
from dotenv import load_dotenv

load_dotenv()

conn = snowflake.connector.connect(
    user=os.getenv("SNOWFLAKE_USER"),
    password=os.getenv("SNOWFLAKE_PASSWORD"),
    account=os.getenv("SNOWFLAKE_ACCOUNT"),
    warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
    role=os.getenv("SNOWFLAKE_ROLE")
)

cursor = conn.cursor()

def run_sql_file(path):
    with open(path, 'r') as file:
        sql = file.read()
        for statement in sql.split(';'):
            if statement.strip():
                cursor.execute(statement)

sql_folder = "sql"

for file in sorted(os.listdir(sql_folder)):
    if file.endswith(".sql"):
        print(f"Running {file}...")
        run_sql_file(os.path.join(sql_folder, file))

print("Deployment Complete.")

cursor.close()
conn.close()