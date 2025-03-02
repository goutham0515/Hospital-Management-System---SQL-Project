CREATE DATABASE HospitalDB
USE HospitalDB

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(255) NOT NULL,
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    ExperienceYears INT CHECK (ExperienceYears >= 0)
);

INSERT INTO Doctors (DoctorName, Specialty, PhoneNumber, ExperienceYears) VALUES
('Dr. Smith', 'Cardiologist', '9876543210', 10),
('Dr. Emily Johnson', 'Dermatologist', '8765432109', 7),
('Dr. Robert Brown', 'Neurologist', '7654321098', 15),
('Dr. Olivia Taylor', 'Pediatrician', '6543210987', 5);

SELECT * FROM Doctors

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(255) NOT NULL,
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(255)
);

INSERT INTO Patients (FullName, Age, Gender, PhoneNumber, Address) VALUES
('John Doe', 45, 'Male', '1234567890', '123 Main St'),
('Alice White', 30, 'Female', '2345678901', '456 Elm St'),
('Bob Martin', 50, 'Male', '3456789012', '789 Pine St'),
('Emma Davis', 25, 'Female', '4567890123', '101 Oak St');

SELECT * FROM Patients




CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    AppointmentDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(50) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled'))
);


INSERT INTO Appointments (DoctorID, PatientID, AppointmentDate, Status) VALUES
(1, 1, '2025-02-15 10:00:00', 'Scheduled'),
(2, 2, '2025-02-16 11:30:00', 'Completed'),
(3, 3, '2025-02-17 09:45:00', 'Scheduled'),
(4, 4, '2025-02-18 14:00:00', 'Cancelled');

SELECT * FROM Appointments



1)Retrieve all doctors in the hospital

SELECT * FROM Doctors;

2)Get all patients who are older than 40

SELECT * FROM Patients WHERE Age > 40;


3)Find all appointments that are scheduled

SELECT * FROM Appointments WHERE Status = 'Scheduled';


4) Retrieve all appointments for a specific doctor (e.g., Dr. Smith)

SELECT a.AppointmentID, p.FullName, a.AppointmentDate, a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE d.DoctorName = 'Dr. Smith';


5) List all doctors specialized in 'Neurology'

SELECT * FROM Doctors WHERE Specialty = 'Neurologist';


6) Find the total number of doctors in the hospital

SELECT COUNT(*) AS TotalDoctors FROM Doctors;



7) Find the number of patients by gender

SELECT Gender, COUNT(*) AS PatientCount FROM Patients GROUP BY Gender;


8) Find all appointments scheduled in February 2025

SELECT * FROM Appointments 
WHERE MONTH(AppointmentDate) = 2 AND YEAR(AppointmentDate) = 2025;



9) Retrieve the latest appointment for each doctor

SELECT d.DoctorName, p.FullName, a.AppointmentDate
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Patients p ON a.PatientID = p.PatientID
WHERE a.AppointmentDate = (SELECT MAX(AppointmentDate) FROM Appointments WHERE DoctorID = a.DoctorID);






10) Find patients who have an appointment scheduled but not yet completed

SELECT p.FullName, a.AppointmentDate
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
WHERE a.Status = 'Scheduled';



11) Get details of all appointments with doctor and patient names

SELECT a.AppointmentID, d.DoctorName, p.FullName, a.AppointmentDate, a.Status
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Patients p ON a.PatientID = p.PatientID;


12) Find the doctor with the most scheduled appointments

SELECT TOP 1 d.DoctorName, COUNT(a.AppointmentID) AS TotalAppointments
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorName
ORDER BY COUNT(a.AppointmentID) DESC;


13) Find the patients who have visited more than once

SELECT p.FullName, COUNT(a.AppointmentID) AS Visits
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
GROUP BY p.FullName
HAVING COUNT(a.AppointmentID) > 1;



14) Get all scheduled appointments sorted by date

SELECT * FROM Appointments WHERE Status = 'Scheduled' ORDER BY AppointmentDate;


15) Find the most experienced doctor

SELECT TOP 1 * FROM Doctors ORDER BY ExperienceYears DESC;



16) Find doctors who have no scheduled appointments

SELECT * FROM Doctors 
WHERE DoctorID NOT IN (SELECT DISTINCT DoctorID FROM Appointments WHERE Status = 'Scheduled');



17) List patients who have never booked an appointment

SELECT * FROM Patients 
WHERE PatientID NOT IN (SELECT DISTINCT PatientID FROM Appointments);
