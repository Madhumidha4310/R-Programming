# High-Performance In-Memory Data Wrangling using data.table

## Project Overview

This project demonstrates high-performance data processing using the **data.table** package in R. It generates a large sales transaction dataset, performs data cleaning, manipulation, aggregation, business analysis, and visualization to extract meaningful business insights.

## Features

- Generates 500,000 sales transaction records.
- Imports and exports CSV files using `fread()` and `fwrite()`.
- Performs data exploration and cleaning.
- Manipulates data efficiently using `data.table`.
- Calculates Revenue, Discount, GST, and Net Revenue.
- Creates customer, product, city, and category summaries.
- Generates business reports.
- Visualizes business insights using charts.

## Dataset Description

The generated dataset contains the following fields:

- Transaction ID
- Customer ID
- Customer Name
- Gender
- Age
- Product ID
- Product Name
- Category
- Quantity
- Price
- Discount
- GST
- Payment Method
- City
- State
- Order Date
- Sales Person

## Project Workflow

### 1. Dataset Generation

- Generates 500,000 sales records.
- Creates customer, product, payment, and sales details.
- Saves the dataset as `sales_transactions.csv`.

### 2. Data Import

- Reads the CSV file using `fread()`.
- Displays dataset information.

### 3. Data Exploration

- Checks missing values.
- Identifies duplicate records.
- Finds unique customers, products, and cities.

### 4. Data Cleaning

- Removes duplicate records.
- Renames `UnitPrice` to `Price`.
- Converts `OrderDate` into Date format.

### 5. Data Manipulation

- Selects required columns.
- Filters records.
- Sorts data.
- Finds top expensive products.
- Finds highest quantity transactions.

### 6. Revenue Calculation

Creates new columns:

- Revenue
- Discount Amount
- GST Amount
- Net Revenue

### 7. Indexing

- Creates indexes using `setkey()`.
- Performs faster searching using Customer ID and Product ID.

### 8. Grouping & Aggregation

Generates summaries for:

- Customers
- Products
- Cities
- Categories

### 9. Business Reports

Exports summary reports as CSV files:

- customer_summary.csv
- product_summary.csv
- city_summary.csv
- category_summary.csv

### 10. Business Analysis

Performs analysis such as:

- Highest Revenue City
- Maximum Sales Product
- Top Customers
- Most Used Payment Method
- Average Transaction Value
- Highest Revenue Category

### 11. Visualization

Creates the following charts:

- Transactions by City
- Revenue by Category
- Top 20 Customers
- Payment Method Distribution

## Technologies Used

- R Programming
- data.table Package
- Base R Functions

## Project Structure

```text
High-Performance-Data-Wrangling
│
├── Data_Wrangling_Project.R
├── sales_transactions.csv
├── README.md
│
└── Output
    ├── customer_summary.csv
    ├── product_summary.csv
    ├── city_summary.csv
    ├── category_summary.csv
    ├── city_transactions.png
    ├── category_revenue.png
    ├── top_customers.png
    └── payment_distribution.png
```

## How to Run

1. Install R or RStudio.
2. Install the `data.table` package.
3. Open `Data_Wrangling_Project.R`.
4. Run the complete script.
5. Check the generated CSV reports and charts inside the **Output** folder.

## Output

The project generates:

### Reports

- Customer Summary
- Product Summary
- City Summary
- Category Summary

### Charts

- Transactions by City
<img width="480" height="480" alt="city_transactions" src="https://github.com/user-attachments/assets/117f4b22-913c-4881-9f8d-3ae3f3ee1fa7" />

- Revenue by Category
<img width="480" height="480" alt="category_revenue" src="https://github.com/user-attachments/assets/7b657ffc-597b-4238-96e0-1a20f96cfb21" />

- Top Customers
<img width="480" height="480" alt="top_customers" src="https://github.com/user-attachments/assets/68159e07-29fb-41cd-92ce-db1e1943ed8c" />

- Payment Distribution
<img width="480" height="480" alt="payment_distribution" src="https://github.com/user-attachments/assets/77884810-86f4-4ace-a410-de8d5d0d6082" />


## Learning Outcomes

This project helps to understand:

- High-performance data processing
- Data cleaning and preprocessing
- Data manipulation using data.table
- Grouping and aggregation
- Business analytics
- Data visualization

## Future Enhancements

- Use real-world sales datasets.
- Add interactive dashboards.
- Perform predictive sales analysis.
- Generate advanced business reports.
