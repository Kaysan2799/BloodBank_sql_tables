# Blood Bank Management System

This repository contains the SQL scripts for creating and populating a blood bank management system database. The database includes tables for users, patients, donors, and blood bank records.

## Database Schema

### Tables

1. **user**
   - Stores user information including name, user ID, password, and phone number.
   - **Columns**:
     - `name` (VARCHAR, NOT NULL): User's name.
     - `user_id` (VARCHAR, PRIMARY KEY): Unique identifier for the user.
     - `password` (VARCHAR, NOT NULL): User's password.
     - `phone_number` (VARCHAR, NOT NULL): User's phone number.

2. **patient**
   - Stores patient information including first name, last name, disease, and blood group.
   - **Columns**:
     - `patient_id` (VARCHAR, PRIMARY KEY): Unique identifier for the patient.
     - `first_name` (VARCHAR, NOT NULL): Patient's first name.
     - `last_name` (VARCHAR, NOT NULL): Patient's last name.
     - `patient_disease` (VARCHAR, NOT NULL): Disease the patient is suffering from.
     - `blood_group` (VARCHAR, NOT NULL): Patient's blood group.

3. **donor**
   - Stores donor information including first name, last name, medical report, blood group, city, and street.
   - **Columns**:
     - `donor_id` (VARCHAR, PRIMARY KEY): Unique identifier for the donor.
     - `first_name` (VARCHAR, NOT NULL): Donor's first name.
     - `last_name` (VARCHAR, NOT NULL): Donor's last name.
     - `medical_report` (VARCHAR, NOT NULL): Medical report status of the donor.
     - `blood_group` (VARCHAR, NOT NULL): Donor's blood group.
     - `city` (VARCHAR, NOT NULL): Donor's city.
     - `street` (VARCHAR, NOT NULL): Donor's street.

4. **blood_bank**
   - Stores blood bank records linking donors to their blood group.
   - **Columns**:
     - `donor_id` (VARCHAR, NOT NULL): Unique identifier for the donor.
     - `blood_group` (VARCHAR, NOT NULL): Blood group of the donor.
   - **Constraints**:
     - Primary Key: (`donor_id`, `blood_group`)
     - Foreign Key: `donor_id` references `donor(donor_id)`

## Sample Data

### Users

| name           | user_id  | password | phone_number  |
|----------------|----------|----------|---------------|
| John Smith     | jsmith   | abc123   | 555-555-1212  |
| Jane Doe       | jdoe     | def456   | 555-555-1213  |
| Bob Johnson    | bjohnson | ghi789   | 555-555-1214  |
| Alice Williams | awilliams| jkl012   | 555-555-1215  |
| Mike Brown     | mbrown   | mno345   | 555-555-1216  |

### Patients

| patient_id | first_name | last_name | patient_disease       | blood_group |
|------------|------------|-----------|-----------------------|-------------|
| p1         | John       | Doe       | Anemia                | O+          |
| p2         | Jane       | Smith     | Leukemia              | B+          |
| p3         | Bob        | Williams  | Sickle cell disease   | AB-         |
| p4         | Alice      | Johnson   | Thalassemia           | A+          |
| p5         | Mike       | Brown     | Dengue fever          | O-          |

### Donors

| donor_id | first_name | last_name | medical_report | blood_group | city          | street     |
|----------|------------|-----------|----------------|-------------|---------------|------------|
| d1       | John       | Smith     | Fit to donate  | O+          | New York      | 1st Ave    |
| d2       | Jane       | Doe       | Fit to donate  | B+          | Chicago       | 2nd St     |
| d3       | Bob        | Johnson   | Fit to donate  | AB-         | Los Angeles   | 3rd St     |
| d4       | Alice      | Williams  | Fit to donate  | A+          | San Francisco | 4th Ave    |
| d5       | Mike       | Brown     | Fit to donate  | O-          | Houston       | 5th St     |

### Blood Bank Records

| donor_id | blood_group |
|----------|-------------|
| d1       | O+          |
| d2       | B+          |
| d3       | AB-         |
| d4       | A+          |
| d5       | O-          |

## Usage

### Create Database

To create the database and tables, and insert the sample data, run the following SQL commands:

```sql
CREATE DATABASE blood_bank_db;

USE blood_bank_db;

-- Create user table
CREATE TABLE user (
  name varchar(255) NOT NULL,
  user_id varchar(255) PRIMARY KEY,
  password varchar(255) NOT NULL,
  phone_number varchar(255) NOT NULL
);

-- Create patient table
CREATE TABLE patient (
  patient_id varchar(255) PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  patient_disease varchar(255) NOT NULL,
  blood_group varchar(255) NOT NULL
);

-- Create donor table
CREATE TABLE donor (
  donor_id varchar(255) PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  medical_report varchar(255) NOT NULL,
  blood_group varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  street varchar(255) NOT NULL
);

-- Create blood bank table
CREATE TABLE blood_bank (
  donor_id varchar(255) NOT NULL,
  blood_group varchar(255) NOT NULL,
  PRIMARY KEY (donor_id, blood_group),
  FOREIGN KEY (donor_id) REFERENCES donor(donor_id)
);

-- Insert users
INSERT INTO user (name, user_id, password, phone_number) VALUES
  ('John Smith', 'jsmith', 'abc123', '555-555-1212'),
  ('Jane Doe', 'jdoe', 'def456', '555-555-1213'),
  ('Bob Johnson', 'bjohnson', 'ghi789', '555-555-1214'),
  ('Alice Williams', 'awilliams', 'jkl012', '555-555-1215'),
  ('Mike Brown', 'mbrown', 'mno345', '555-555-1216');

-- Insert patients
INSERT INTO patient (patient_id, first_name, last_name, patient_disease, blood_group) VALUES
  ('p1', 'John', 'Doe', 'Anemia', 'O+'),
  ('p2', 'Jane', 'Smith', 'Leukemia', 'B+'),
  ('p3', 'Bob', 'Williams', 'Sickle cell disease', 'AB-'),
  ('p4', 'Alice', 'Johnson', 'Thalassemia', 'A+'),
  ('p5', 'Mike', 'Brown', 'Dengue fever', 'O-');

-- Insert donors
INSERT INTO donor (donor_id, first_name, last_name, medical_report, blood_group, city, street) VALUES
  ('d1', 'John', 'Smith', 'Fit to donate', 'O+', 'New York', '1st Ave'),
  ('d2', 'Jane', 'Doe', 'Fit to donate', 'B+', 'Chicago', '2nd St'),
  ('d3', 'Bob', 'Johnson', 'Fit to donate', 'AB-', 'Los Angeles', '3rd St'),
  ('d4', 'Alice', 'Williams', 'Fit to donate', 'A+', 'San Francisco', '4th Ave'),
  ('d5', 'Mike', 'Brown', 'Fit to donate', 'O-', 'Houston', '5th St');

-- Insert blood bank entries
INSERT INTO blood_bank (donor_id, blood_group) VALUES
  ('d1', 'O+'),
  ('d2', 'B+'),
  ('d3', 'AB-'),
  ('d4', 'A+'),
  ('d5', 'O-');

USE blood_bank_db;
SELECT * FROM user;
