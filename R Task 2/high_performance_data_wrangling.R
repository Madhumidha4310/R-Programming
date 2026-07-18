###############################################################
# High-Performance In-Memory Data Wrangling
# Week 2 Project
#
# Student Name :
# Register Number :
###############################################################

rm(list = ls())
cat("\014")

# Install package if required
if(!require(data.table)){
  install.packages("data.table")
}

library(data.table)

# Create Output folder
if(!dir.exists("Output")){
  dir.create("Output")
}


###############################################################
# Part 1 : Generate Dataset
###############################################################

set.seed(123)

n <- 500000


sales <- data.table(

  TransactionID = 1:n,

  CustomerID = sample(10000:99999,n,replace = TRUE),

  CustomerName = paste0("Customer_",sample(1:50000,n,replace=TRUE)),

  Gender = sample(c("Male","Female"),n,replace=TRUE),

  Age = sample(18:70,n,replace=TRUE),

  ProductID = sample(1000:9999,n,replace=TRUE),

  ProductName = paste0("Product_",sample(1:1000,n,replace=TRUE)),

  Category = sample(
    c("Electronics","Clothing","Food",
      "Furniture","Beauty"),n,replace=TRUE),

  Quantity = sample(1:20,n,replace=TRUE),

  UnitPrice = round(runif(n,100,50000),2),

  Discount = sample(0:30,n,replace=TRUE),

  GST = sample(c(5,12,18,28),n,replace=TRUE),

  PaymentMethod = sample(
    c("Cash","Card","UPI","Net Banking"),
    n,replace=TRUE),

  City = sample(
    c("Chennai","Madurai","Coimbatore",
      "Salem","Trichy"),n,replace=TRUE),

  State = "Tamil Nadu",

  OrderDate = sample(
    seq(as.Date("2024-01-01"),
        as.Date("2025-12-31"),
        by="day"),
    n,replace=TRUE),

  SalesPerson = paste0(
    "Sales_",sample(1:100,n,replace=TRUE))
)


# Save dataset

fwrite(
  sales,
  "sales_transactions.csv"
)


print(head(sales,10))

print(tail(sales,10))

dim(sales)

str(sales)



###############################################################
# Part 2 : Import Dataset
###############################################################

sales <- fread(
  "sales_transactions.csv"
)


head(sales)

tail(sales)

names(sales)

str(sales)

summary(sales)



###############################################################
# Part 3 : Explore Dataset
###############################################################

# Missing values

colSums(is.na(sales))


# Duplicate records

sum(duplicated(sales))


# Unique counts

uniqueN(sales$CustomerID)

uniqueN(sales$ProductID)

uniqueN(sales$City)



###############################################################
# Part 4 : Data Cleaning
###############################################################


# Remove duplicates

sales <- unique(sales)


# Rename columns

setnames(
sales,
"UnitPrice",
"Price"
)


# Convert datatypes

sales[,OrderDate := as.Date(OrderDate)]


# Display cleaned data

head(sales)



###############################################################
# Part 5 : Data Manipulation
###############################################################


# Single column

sales[,CustomerName]


# Multiple columns

sales[,.(CustomerName,ProductName,Price)]


# Filter

sales[City=="Chennai"]


sales[
  City=="Chennai" &
  PaymentMethod=="UPI"
]


# Sorting

sales[order(Price)]


sales[order(-Price)]



# Top 20 expensive products

top_products <- sales[
order(-Price)
][1:20]


print(top_products)



# Highest quantity transactions

top_quantity <- sales[
order(-Quantity)
][1:20]

print(top_quantity)



###############################################################
# Part 6 : In-place Column Updates :=
###############################################################


sales[,Revenue :=
       Quantity * Price]


sales[,DiscountAmount :=
       Revenue * Discount /100]


sales[,GSTAmount :=
       Revenue * GST /100]


sales[,NetRevenue :=
       Revenue -
       DiscountAmount +
       GSTAmount]


head(sales)



###############################################################
# Part 7 : Index Keying setkey()
###############################################################


# Customer Index

setkey(
sales,
CustomerID
)


customer_search <-
sales[
.CustomerID==sales$CustomerID[1]
]


print(customer_search)



# Product Index

setkey(
sales,
ProductID
)


product_search <-
sales[
.ProductID==sales$ProductID[1]
]


print(product_search)



###############################################################
# Part 8 : Grouping and Aggregation
###############################################################


# Customer Summary

customer_summary <-
sales[,.(

TotalOrders=.N,

TotalRevenue=sum(NetRevenue),

AverageRevenue=mean(NetRevenue)

),
by=CustomerID]



# Product Summary

product_summary <-
sales[,.(

TotalQuantity=sum(Quantity),

TotalRevenue=sum(NetRevenue)

),
by=ProductName]



# City Summary

city_summary <-
sales[,.(

Transactions=.N,

TotalRevenue=sum(NetRevenue)

),
by=City]



# Category Summary

category_summary <-
sales[,.(

TotalRevenue=sum(NetRevenue),

AverageRevenue=mean(NetRevenue)

),
by=Category]




###############################################################
# Part 9 : Business Reports
###############################################################


fwrite(
customer_summary,
"Output/customer_summary.csv"
)


fwrite(
product_summary,
"Output/product_summary.csv"
)


fwrite(
city_summary,
"Output/city_summary.csv"
)


fwrite(
category_summary,
"Output/category_summary.csv"
)



###############################################################
# Part 10 : Business Analysis
###############################################################


# Highest Revenue City

city_summary[
order(-TotalRevenue)
][1]


# Maximum Sales Product

product_summary[
order(-TotalQuantity)
][1]


# Top Customers

top_customers <-
customer_summary[
order(-TotalRevenue)
][1:20]


print(top_customers)



# Most used payment method

sales[
,.N,
by=PaymentMethod
][order(-N)]



# Average transaction value

mean(
sales$NetRevenue
)



# Maximum category revenue

category_summary[
order(-TotalRevenue)
][1]



###############################################################
# Part 11 : Visualization
###############################################################


# Transactions by City

png(
"Output/city_transactions.png"
)

barplot(
city_summary$Transactions,
names.arg=city_summary$City,
main="Transactions by City"
)

dev.off()



# Revenue by Category

png(
"Output/category_revenue.png"
)

barplot(
category_summary$TotalRevenue,
names.arg=category_summary$Category,
main="Revenue by Category"
)

dev.off()



# Top Customers

png(
"Output/top_customers.png"
)

barplot(
top_customers$TotalRevenue,
names.arg=
top_customers$CustomerID,
las=2,
main="Top 20 Customers"
)

dev.off()



# Payment Distribution

payment <-
sales[,.N,by=PaymentMethod]


png(
"Output/payment_distribution.png"
)

pie(
payment$N,
labels=payment$PaymentMethod,
main="Payment Method Distribution"
)

dev.off()
