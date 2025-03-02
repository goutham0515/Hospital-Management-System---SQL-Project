# Hospital-Management-System---SQL-Project
#  Project Overview

The Hospital Management System is a database project designed to manage hospital operations such as doctors, patients, and appointments. This project helps in organizing patient records, tracking doctor schedules, and managing appointment statuses efficiently using SQL Server Management Studio (SSMS).

# Database Schema

* 1️⃣ Doctors Table

Stores details of doctors working in the hospital.

CREATE TABLE Doctors (

    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(255) NOT NULL,
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    ExperienceYears INT CHECK (ExperienceYears >= 0)

);

* 2️⃣ Patients Table

Stores information about patients visiting the hospital.

CREATE TABLE Patients (

    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(255) NOT NULL,
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(255)

);

* 3️⃣ Appointments Table

Records all patient appointments with doctors.

CREATE TABLE Appointments (

    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    AppointmentDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(50) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled'))

);

# Sample Data

* Insert Data into Doctors Table

INSERT INTO Doctors (DoctorName, Specialty, PhoneNumber, ExperienceYears) VALUES

('Dr. Smith', 'Cardiologist', '9876543210', 10),

('Dr. Emily Johnson', 'Dermatologist', '8765432109', 7),

('Dr. Robert Brown', 'Neurologist', '7654321098', 15),

('Dr. Olivia Taylor', 'Pediatrician', '6543210987', 5);


* Insert Data into Patients Table

INSERT INTO Patients (FullName, Age, Gender, PhoneNumber, Address) VALUES

('John Doe', 45, 'Male', '1234567890', '123 Main St'),

('Alice White', 30, 'Female', '2345678901', '456 Elm St'),

('Bob Martin', 50, 'Male', '3456789012', '789 Pine St'),

('Emma Davis', 25, 'Female', '4567890123', '101 Oak St');

* Insert Data into Appointments Table

INSERT INTO Appointments (DoctorID, PatientID, AppointmentDate, Status) VALUES

(1, 1, '2025-02-15 10:00:00', 'Scheduled'),

(2, 2, '2025-02-16 11:30:00', 'Completed'),

(3, 3, '2025-02-17 09:45:00', 'Scheduled'),

(4, 4, '2025-02-18 14:00:00', 'Cancelled');


# SQL Queries

# Basic Queries

1️⃣ Retrieve all doctors

![Image](https://github.com/user-attachments/assets/f3f75ed4-3a02-46b8-8862-0ee31d5f5740)

2️⃣ Find all patients older than 40

![Image](https://github.com/user-attachments/assets/9bdeb77e-91a3-49e7-a883-5add1bb84985)

3️⃣ Get all scheduled appointments

![Image](https://github.com/user-attachments/assets/e4afb9dc-5b98-4965-a361-b39aad8673a6)

4️⃣ Retrieve all appointments for a specific doctor (e.g., Dr. Smith)

![Image](https://github.com/user-attachments/assets/1e3f3a31-35d1-479d-a7cb-b3e1d3dc9628)

5️⃣ List all doctors specialized in 'Neurology'

![Image](https://github.com/user-attachments/assets/293018cf-db94-4646-a5d4-702346ae1173)



#  Intermediate Queries



6️⃣ Total number of doctors

![Image](https://github.com/user-attachments/assets/3e7f5039-02f0-4770-8d32-8118f8cf7648)

7️⃣ Patients grouped by gender

![Image](https://github.com/user-attachments/assets/c4143fed-253c-4e4e-a640-699a72ca7711)

8️⃣ Find all appointments scheduled in february 2025

![Image](https://github.com/user-attachments/assets/2eb62887-aea3-4b36-9c34-870410f70225)

9️⃣ Select the latest appointment for each doctor

![Image](https://github.com/user-attachments/assets/f930e27f-3b63-473c-870b-5d9e7ac6a0d4)

🔟 Find patients who have never booked an appointment

![Image](https://github.com/user-attachments/assets/f33b31a8-02e0-42ac-8056-b20f10c284ac)



# Advanced Queries



1️⃣1️⃣ List of all appointments with doctor and patient names

![Image](https://github.com/user-attachments/assets/eb658b0d-c739-45ee-be4c-044b577a0a42)

1️⃣2️⃣ Find the patient with the most scheduled appointments

![Image](https://github.com/user-attachments/assets/eb949b47-4b33-4506-b180-dc8b8aaf37d1)

1️⃣3️⃣ Find patients who have visited more than once

![Image](https://github.com/user-attachments/assets/f63db3ca-7d40-4b07-b493-618aef4e4cf2)

1️⃣4️⃣ Get all scheduled appointments sorted by date

![Image](https://github.com/user-attachments/assets/4c028570-5d05-44a0-b19f-5d0e2f16baa2)

1️⃣5️⃣ Find the most experienced doctor

![Image](https://github.com/user-attachments/assets/86918695-ea27-4a5d-934e-4f357ce6a0b8)

1️⃣6️⃣ Find doctor who have no scheduled appointments

![Image](https://github.com/user-attachments/assets/96246b0a-1c56-46d4-809d-8f4ba9d6e1cb)

1️⃣7️⃣ List patients who have never booked an appointment

![Image](https://github.com/user-attachments/assets/3419ece9-d4b3-4538-90e6-aca0b95e750c)
