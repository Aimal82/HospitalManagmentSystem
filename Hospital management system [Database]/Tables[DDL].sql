DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;

CREATE TABLE Doctor (
    Doctor_ID int PRIMARY KEY,
    Name varchar(100),
    Speciality varchar(50),
    Phone varchar(15)
);

CREATE TABLE Patient (
    Patient_ID int PRIMARY KEY,
    Name varchar(100),
    Age int,
    Address varchar(200)
);

CREATE TABLE Treatment (
    Treatment_ID int PRIMARY KEY,
    Patient_ID int,
    Doctor_ID int,
    Diagnosis TEXT,
    Prescription TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Appointment (
    Appointment_ID int PRIMARY KEY,
    Treatment_ID int,
    Patient_ID int,
    Date DATE,
    Time TIME,
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);
