
INSERT INTO Doctor (Doctor_ID, Name, Speciality, Phone)
VALUES 
(1, 'Dr. Alice Brown', 'Cardiology', '555-123-4567'),
(2, 'Dr. John Smith', 'Orthopedics', '555-987-6543'),
(3, 'Dr. Sarah Lee', 'Pediatrics', '555-654-3210'),
(4, 'Dr. Laura White', 'Dermatology', '555-111-2222'),
(5, 'Dr. Thomas Green', 'Neurology', '555-333-4444'),
(6, 'Dr. Emily Black', 'Oncology', '555-555-6666'),
(7, 'Dr. Michael King', 'ENT', '555-777-8888'),
(8, 'Dr. Anna Gray', 'Radiology', '555-999-0000'),
(9, 'Dr. Robert Hill', 'Gastroenterology', '555-222-3333'),
(10, 'Dr. Catherine Adams', 'General Medicine', '555-444-5555');

INSERT INTO Patient (Patient_ID, Name, Age, Address)
VALUES
(1, 'Emily Davis', 34, '123 Elm Street'),
(2, 'Michael Young', 45, '456 Oak Avenue'),
(3, 'Sophie Miller', 29, '789 Pine Drive'),
(4, 'James Brown', 50, '321 Maple Lane'),
(5, 'Olivia Taylor', 37, '654 Birch Way'),
(6, 'Liam Johnson', 42, '987 Cedar Circle'),
(7, 'Noah Wilson', 33, '159 Pine Avenue'),
(8, 'Mia Anderson', 48, '753 Walnut Street'),
(9, 'Isabella Thomas', 31, '852 Chestnut Drive'),
(10, 'Ethan Harris', 40, '951 Spruce Road'),
(11, 'Lucas Moore', 28, '369 Poplar Lane'),
(12, 'Emma Lee', 36, '741 Fir Way'),
(13, 'Ava Clark', 39, '852 Willow Drive'),
(14, 'Charlotte King', 27, '159 Redwood Avenue'),
(15, 'Amelia Scott', 44, '753 Sequoia Street');

INSERT INTO Treatment (Treatment_ID, Patient_ID, Doctor_ID, Diagnosis, Prescription)
VALUES
(1, 4, 1, 'Hypertension', 'Lisinopril 10mg daily'),
(2, 11, 2, 'Fractured Ankle', 'Rest, Painkillers'),
(3, 10, 3, 'Seasonal Allergies', 'Antihistamine'),
(4, 12, 4, 'Eczema', 'Topical Steroids'),
(5, 3, 5, 'Migraine', 'Sumatriptan'),
(6, 1, 6, 'Lung Cancer', 'Chemotherapy'),
(7, 2, 7, 'Sinus Infection', 'Amoxicillin'),
(8, 9, 8, 'Broken Rib', 'Rest, Painkillers'),
(9, 7, 9, 'Irritable Bowel Syndrome', 'Fiber Supplements'),
(10, 15, 10, 'Flu', 'Rest, Fluids, Antiviral'),
(11, 5, 1, 'High Cholesterol', 'Atorvastatin'),
(12, 10, 2, 'Sprained Wrist', 'Ice, Compression, Rest'),
(13, 14, 3, 'Asthma', 'Inhaler'),
(14, 4, 4, 'Psoriasis', 'Topical Creams'),
(15, 13, 5, 'Tension Headache', 'Pain Relievers');

INSERT INTO Appointment (Appointment_ID, Treatment_ID, Patient_ID, Date, Time)
VALUES
(1, 1, 1, '2024-12-11', '09:00'),
(2, 2, 2, '2024-12-12', '10:30'),
(3, 3, 3, '2024-12-13', '14:00'),
(4, 4, 4, '2024-12-14', '11:00'),
(5, 5, 5, '2024-12-15', '13:30'),
(6, 6, 6, '2024-12-16', '08:45'),
(7, 7, 7, '2024-12-17', '10:00'),
(8, 8, 8, '2024-12-18', '15:15'),
(9, 9, 9, '2024-12-19', '09:30'),
(10, 10, 10, '2024-12-20', '16:00'),
(11, 11, 11, '2024-12-21', '11:30'),
(12, 12, 12, '2024-12-22', '14:45'),
(13, 13, 13, '2024-12-23', '09:15'),
(14, 14, 14, '2024-12-24', '10:45'),
(15, 15, 15, '2024-12-25', '11:00'),
(16, 3, 3, '2024-12-26', '13:30'),
(17, 6, 6, '2024-12-27', '09:45'),
(18, 9, 9, '2024-12-28', '14:00'),
(19, 12, 12, '2024-12-29', '08:30'),
(20, 15, 15, '2024-12-30', '10:00');
