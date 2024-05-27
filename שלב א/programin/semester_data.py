import pandas as pd
from faker import Faker
import random

# Initialize Faker
faker = Faker()

# Define the possible semester names
semester_names = [f"{season} {year}" for year in range(2010, 2023) for season in ["Summer", "Fall", "Winter"]]
# Ensure the list has exactly 500 entries
semester_names = (semester_names * ((500 // len(semester_names)) + 1))[:500]

# Generate 500 rows of data
data = {
    "semester_id": range(1, 501),
    "start_date": [faker.date_between(start_date='-10y', end_date='today') for _ in range(500)],
    "semester_name": semester_names,
    "end_date": []
}

# Ensure 'end_date' is always after 'start_date'
for start_date in data['start_date']:
    end_date = faker.date_between(start_date=start_date, end_date=start_date + pd.DateOffset(months=4))
    data['end_date'].append(end_date)

# Convert to DataFrame
df = pd.DataFrame(data)

# Save DataFrame to CSV
df.to_csv('semesters.csv', index=False)
