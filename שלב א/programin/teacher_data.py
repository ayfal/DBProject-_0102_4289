import pandas as pd
from faker import Faker
import random

# Initialize Faker
faker = Faker()

# Generate 500 rows of data
data = {
    "l_name": [faker.last_name() for _ in range(500)],
    "f_name": [faker.first_name() for _ in range(500)],
    "id": range(1, 501),
    "start_learning": [random.randint(2000, 2023) for _ in range(500)],
    "course_id": [random.randint(1, 500) for _ in range(500)]  # Assuming 500 possible course IDs
}

# Convert to DataFrame
df = pd.DataFrame(data)

# Save DataFrame to CSV
df.to_csv('teachers.csv', index=False)

print("Data generation complete. The 'teachers.csv' file has been created.")
