import pandas as pd
import random
from faker import Faker
import mysql.connector

fake = Faker("en_IN")

products = {
    "Laptop": (60000, 45000, "Electronics"),
    "Monitor": (15000, 11000, "Electronics"),
    "Printer": (12000, 9000, "Electronics"),
    "Keyboard": (2500, 1800, "Accessories"),
    "Mouse": (800, 500, "Accessories")
}

regions = ["North", "South", "East", "West"]

salespersons = [
    "Rahul","Priya","Amit","Sneha","Karan",
    "Anjali","Vikram","Neha","Rohit","Pooja"
]

rows = []

for i in range(1,10001):

    product = random.choice(list(products.keys()))
    price, cost, category = products[product]

    quantity = random.randint(1,10)
    discount = random.choice([0,5,10,15,20])

    selling_price = price - (price * discount / 100)

    sales = quantity * selling_price
    total_cost = quantity * cost
    profit = sales - total_cost

    rows.append([
        f"ORD{i:05}",
        fake.date_between(start_date="-2y", end_date="today"),
        fake.name(),
        random.choice(regions),
        random.choice(salespersons),
        category,
        product,
        quantity,
        price,
        discount,
        round(sales,2),
        round(total_cost,2),
        round(profit,2)
    ])

df = pd.DataFrame(rows, columns=[
    "Order_ID",
    "Order_Date",
    "Customer_Name",
    "Region",
    "Salesperson",
    "Category",
    "Product",
    "Quantity",
    "Unit_Price",
    "Discount_Percentage",
    "Sales",
    "Cost",
    "Profit"
])

df.to_csv("Dataset/financial_data.csv", index=False)

print("CSV Created Successfully")

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="financial_analytics"
)

cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS financial_data(

Order_ID VARCHAR(20),
Order_Date DATE,
Customer_Name VARCHAR(100),
Region VARCHAR(20),
Salesperson VARCHAR(50),
Category VARCHAR(50),
Product VARCHAR(50),
Quantity INT,
Unit_Price DECIMAL(10,2),
Discount_Percentage INT,
Sales DECIMAL(12,2),
Cost DECIMAL(12,2),
Profit DECIMAL(12,2)

)
""")

cursor.execute("TRUNCATE TABLE financial_data")

sql = """
INSERT INTO financial_data
(Order_ID,
Order_Date,
Customer_Name,
Region,
Salesperson,
Category,
Product,
Quantity,
Unit_Price,
Discount_Percentage,
Sales,
Cost,
Profit)

VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
"""

cursor.executemany(sql, df.values.tolist())

conn.commit()

print("="*50)
print("10000 RECORDS INSERTED INTO MYSQL")
print("="*50)

cursor.close()
conn.close()