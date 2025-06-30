# Zomato.io

Zomato SQL Data Analysis 🍽️

📊 Project Overview
This project explores a cleaned Zomato dataset using MySQL to perform various SQL operations. The goal is to analyze restaurant trends, customer preferences, cost patterns, and rating distributions using structured queries — perfect for showcasing practical SQL skills as a data analyst.

🛠️ Tech Stack
Database: MySQL 8.x (Workbench)
Language: SQL
Tools: MySQL Workbench, CSV (Zomato dataset)

📁 Dataset Columns
Column Name	Description
r_name	Name of the restaurant
online_order	Whether online ordering is available
book_table	Whether table booking is available
rate	Raw rating as string (e.g., "4.5/5")
votes	Number of votes received
approx_cost	Approximate cost for two people (in ₹)
listed_in	Restaurant type/category
numeric_rate	Cleaned numeric version of rate column

🔍 Key SQL Operations Performed

Table Creation & Cleaning
  Extracted numeric ratings from text using SUBSTRING_INDEX()
  Created numeric_rate column for easier analysis

Exploratory Queries
  Unique restaurant types
  Restaurants with both online order & table booking
  Top voted restaurants
  Restaurants with rating > 4.5

Aggregations & Insights
  Average rating by restaurant type
  Total votes by category
  Cost buckets: Low, Medium, High
  Rating vs Online Order breakdown

Advanced Filters & Grouping
  High-rated, budget-friendly restaurants
  Restaurant types with highest average ratings
  Categorized rating buckets for distribution analysis

💡 Sample Query Highlight

-- Count of restaurants by cost buckets
SELECT 
  CASE 
    WHEN approx_cost <= 500 THEN 'LOW'
    WHEN approx_cost BETWEEN 501 AND 1000 THEN 'MEDIUM'
    ELSE 'HIGH'
  END AS cost_category,
  COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cost_category;

📌 How to Use
Clone the repo or download the .sql script
Import the dataset into MySQL Workbench
Run the script step-by-step or as a batch
Modify queries or explore deeper insights as needed

🧠 What You’ll Learn
How to clean and format messy data (e.g., ratings like “4.1/5”)
Use of CASE, GROUP BY, CAST, AGGREGATE FUNCTIONS
Real-world SQL problem solving on a restaurant dataset
Structuring and organizing SQL queries for analysis

👩‍💻 Author
Shreya Patil
Aspiring Data Analyst | SQL | Python | Power BI | Storytelling with Data
📧 shreyaxpatil3@gmail.com
🔗 www.linkedin.com/in/shreya-patil-79b6222ba

