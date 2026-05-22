import pandas as pd

# Load Dataset
df = pd.read_csv("blinkit_sales_dataset.csv")

# Display First 5 Rows
print(df.head())

# Dataset Information
print(df.info())

# Check Missing Values
print(df.isnull().sum())

# Remove Duplicate Rows
df = df.drop_duplicates()

# Clean Item Fat Content Column
df['Item Fat Content'] = df['Item Fat Content'].replace({
    'LF': 'Low Fat',
    'low fat': 'Low Fat',
    'reg': 'Regular'
})

# Dataset Shape
print("Dataset Shape:", df.shape)

# Save Cleaned Dataset
df.to_csv("cleaned_blinkit_data.csv", index=False)

print("Data Cleaning Completed Successfully")