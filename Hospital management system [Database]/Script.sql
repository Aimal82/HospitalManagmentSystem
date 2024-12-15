--Retrieve a list of patients with their assigned doctors
SELECT 
    Patient.Patient_ID, 
    Patient.Name AS Patient_Name, 
    Doctor.Name AS Doctor_Name
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
JOIN 
    Doctor ON Treatment.Doctor_ID = Doctor.Doctor_ID;

--Find the total number of appointments for a specific doctor
   SELECT 
    Doctor.Name AS Doctor_Name, 
    COUNT(Appointment.Appointment_ID) AS TotalAppointments
FROM 
    Doctor
JOIN 
    Treatment ON Doctor.Doctor_ID = Treatment.Doctor_ID
JOIN 
    Appointment ON Treatment.Treatment_ID = Appointment.Treatment_ID
GROUP BY 
    Doctor.Name;
   
--List patients who have more than one treatment.
SELECT 
    Patient.Patient_ID, 
    Patient.Name
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
GROUP BY 
    Patient.Patient_ID
HAVING 
    COUNT(Treatment.Treatment_ID) > 1;
   
--Identify the top N doctors with the highest number of appointments.
SELECT 
    Doctor.Name AS DoctorName, 
    COUNT(Appointment.Appointment_ID) AS TotalAppointments
FROM 
    Doctor
JOIN 
    Treatment ON Doctor.Doctor_ID = Treatment.Doctor_ID
JOIN 
    Appointment ON Treatment.Treatment_ID = Appointment.Treatment_ID
GROUP BY 
    Doctor.Name
ORDER BY 
    TotalAppointments DESC
LIMIT 
    N;  

-- Retrieve doctors who have treated the most patients.
SELECT 
    Doctor.Name AS DoctorName, 
    COUNT(DISTINCT Treatment.Patient_ID) AS TotalPatients
FROM 
    Doctor
JOIN 
    Treatment ON Doctor.Doctor_ID = Treatment.Doctor_ID
GROUP BY 
    Doctor.Name
ORDER BY 
    TotalPatients DESC;

-- Find patients with the highest total number of treatments.
SELECT 
    Patient.Patient_ID, 
    Patient.Name, 
    COUNT(Treatment.Treatment_ID) AS TotalTreatments
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
GROUP BY 
    Patient.Patient_ID
ORDER BY 
    TotalTreatments DESC
LIMIT 1;  

-- Identify treatments that have not been assigned to any doctor.
SELECT 
    Treatment.Treatment_ID, 
    Treatment.Diagnosis, 
    'Unassigned' AS DoctorName
FROM 
    Treatment
LEFT JOIN 
    Doctor ON Treatment.Doctor_ID = Doctor.Doctor_ID
WHERE 
    Doctor.Doctor_ID IS NULL;

-- Retrieve the latest appointments scheduled.
SELECT 
    Appointment.Appointment_ID, 
    Appointment.Date, 
    Appointment.Time, 
    Patient.Name AS PatientName, 
    Doctor.Name AS DoctorName
FROM 
    Appointment
JOIN 
    Treatment ON Appointment.Treatment_ID = Treatment.Treatment_ID
JOIN 
    Patient ON Treatment.Patient_ID = Patient.Patient_ID
JOIN 
    Doctor ON Treatment.Doctor_ID = Doctor.Doctor_ID
ORDER BY 
    Appointment.Date DESC, Appointment.Time DESC
LIMIT 
    1; 

-- Calculate the total number of patients treated so far.
SELECT 
    COUNT(DISTINCT Patient_ID) AS TotalPatients
FROM 
    Treatment;

-- List patients who have never had an appointment.
SELECT 
    Patient.Patient_ID, 
    Patient.Name
FROM 
    Patient
LEFT JOIN 
    Appointment ON Patient.Patient_ID = Appointment.Patient_ID
WHERE 
    Appointment.Patient_ID IS NULL;

-- Identify doctors who specialize in treating a specific diagnosis.
SELECT 
    Doctor.Name AS DoctorName, 
    Treatment.Diagnosis
FROM 
    Doctor
JOIN 
    Treatment ON Doctor.Doctor_ID = Treatment.Doctor_ID
WHERE 
    Treatment.Diagnosis = 'SpecificDiagnosis'; 

-- Find patients treated by multiple doctors.
SELECT 
    Patient.Patient_ID, 
    Patient.Name
FROM 
    Patient
JOIN 
    Treatment t1 ON Patient.Patient_ID = t1.Patient_ID
JOIN 
    Treatment t2 ON t1.Treatment_ID != t2.Treatment_ID AND t1.Patient_ID = t2.Patient_ID
GROUP BY 
    Patient.Patient_ID
HAVING 
    COUNT(DISTINCT t2.Doctor_ID) > 1;

-- Retrieve a list of appointments scheduled on a specific date.
SELECT 
    Appointment.Appointment_ID, 
    Appointment.Date, 
    Appointment.Time, 
    Patient.Name AS PatientName, 
    Doctor.Name AS DoctorName
FROM 
    Appointment
JOIN 
    Treatment ON Appointment.Treatment_ID = Treatment.Treatment_ID
JOIN 
    Patient ON Treatment.Patient_ID = Patient.Patient_ID
JOIN 
    Doctor ON Treatment.Doctor_ID = Doctor.Doctor_ID
WHERE 
    Appointment.Date = 'SpecificDate'; 

-- List treatments with incomplete prescription details.
SELECT 
    Treatment.Treatment_ID, 
    Treatment.Diagnosis, 
    'Incomplete Prescription' AS Issue
FROM 
    Treatment
WHERE 
    Treatment.Prescription IS NULL;  

-- Identify patients who have had the most follow-up appointments.
SELECT 
    Patient.Patient_ID, 
    Patient.Name, 
    COUNT(Appointment.Appointment_ID) AS FollowUpAppointments
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
JOIN 
    Appointment ON Treatment.Treatment_ID = Appointment.Treatment_ID
GROUP BY 
    Patient.Patient_ID
ORDER BY 
    FollowUpAppointments DESC;

-- Retrieve doctors who are associated with a specific department (specialty).
SELECT 
    Doctor.Name AS DoctorName, 
    Doctor.Speciality
FROM 
    Doctor
WHERE 
    Doctor.Speciality = 'SpecificSpecialty';
   
-- Find the number of appointments scheduled for the upcoming week.
SELECT 
    COUNT(Appointment.Appointment_ID) AS UpcomingAppointments
FROM 
    Appointment
WHERE 
    WEEK(Date) = WEEK(CURDATE());  

-- List patients based on their age group and assigned treatments.
SELECT 
    Patient.Age, 
    COUNT(Treatment.Treatment_ID) AS TotalTreatments
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
GROUP BY 
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 40 THEN '18-40'
        ELSE '40+'
    END;

-- Retrieve all patients treated by a specific doctor within a given time frame.
SELECT 
    Patient.Patient_ID, 
    Patient.Name
FROM 
    Patient
JOIN 
    Treatment ON Patient.Patient_ID = Treatment.Patient_ID
JOIN 
    Appointment ON Treatment.Treatment_ID = Appointment.Treatment_ID
WHERE 
    Appointment.Doctor_ID = SpecificDoctorID AND
    Appointment.Date BETWEEN 'StartDate' AND 'EndDate'; 

-- Identify any overlaps in appointment times for the same doctor.
SELECT 
    Appointment.Doctor_ID, 
    Appointment.Date, 
    Appointment.Time
FROM 
    Appointment
GROUP BY 
    Appointment.Doctor_ID, Appointment.Date, Appointment.Time
HAVING 
    COUNT(Appointment.Appointment_ID) > 1;


