#!/usr/bin/env python3

# Import stuff
import mariadb
import sys

try:
    conn = mariadb.connect(
            user="fille",
            host="127.0.0.1",
            port=3306,
            database="test"
    )

except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Cursor 
cur = conn.cursor()

cur.execute("SELECT first_name,last_name,email FROM users WHERE first_name='Fille'")

for (first_name, last_name, email) in cur:
    print(f"First name: {first_name}, Last name: {last_name}, Email: {email}")

