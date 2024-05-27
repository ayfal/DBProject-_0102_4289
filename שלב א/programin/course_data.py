import pandas as pd
from faker import Faker
import random

# Initialize Faker
faker = Faker()

# Define possible department names
departments = ["Computer Science", "Mathematics", "Physics", "Chemistry", "Biology", "History", "English", "Philosophy",
               "Economics", "Psychology"]

# Define possible course names (20 unique names)
course_names = ["Intro to CS", "Algorithms", "Data Structures", "Operating Systems", "Database Systems",
                "Calculus I", "Calculus II", "Linear Algebra", "Discrete Math", "Statistics",
                "Classical Mechanics", "Quantum Physics", "Organic Chemistry", "Inorganic Chemistry",
                "Genetics", "Microbiology", "World History", "Literature", "Ethics", "Macroeconomics"]

# Define possible credit_hours
credit_hours = [1.0, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]

# Generate 500 rows of data
data = {
    "department": [random.choice(departments) for _ in range(500)],
    "course_name": [random.choice(course_names) for _ in range(500)],
    "credit_hours": [random.choice(credit_hours) for _ in range(500)],
    "course_id": range(1, 501),
    "coordinator_id": [random.randint(1, 100) for _ in range(500)],  # Assuming 100 possible coordinators
    "test_id": [random.randint(1, 100) for _ in range(500)]  # Assuming 100 possible test IDs
}

# Convert to DataFrame
df = pd.DataFrame(data)

# Save DataFrame to CSV
df.to_csv('courses.csv', index=False)

print("Data generation complete. The 'courses.csv' file has been created.")
