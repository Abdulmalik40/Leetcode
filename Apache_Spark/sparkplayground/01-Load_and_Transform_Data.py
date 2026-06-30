# Initialize Spark session
from pyspark.sql import *
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Read the CSV file with inferSchema enabled
df_result = spark.read \
    .option("inferSchema", True) \
    .option("header", True) \
    .csv("/datasets/customers.csv")

df_filtered = df_result.filter(
    (df_result.purchase_amount > 100) & 
    (df_result.age >= 30)
)

df_final = df_filtered.select("customer_id", "name", "purchase_amount")

# Display the final DataFrame
display(df_final)
