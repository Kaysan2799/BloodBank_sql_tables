create database blood_bank_db;

use blood_bank_db;

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

use blood_bank_db;
select * from user;
