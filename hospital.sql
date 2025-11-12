CREATE DATABASE hospital_management;
USE hospital_management;

-- creating a patient table
CREATE TABLE patients (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR  (100),
age INT,
gender CHAR(1),
city VARCHAR(100),
phone VARCHAR(15)
);

-- creating a table doctors
CREATE TABLE doctors (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (100),
specialization VARCHAR(100),
experience_years INT,
fees DECIMAL (10,2)
);

-- creating a table for appointments
CREATE TABLE appointments ( 
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
problem_description VARCHAR (255),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

# creating a table for bills

CREATE TABLE bills (
bill_id INT AUTO_INCREMENT PRIMARY KEY,
appointment_id INT,
bill_date DATE,
payment_mode VARCHAR(50),
total_amount DECIMAL(10,2),
FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- inserting a values for a patients table
INSERT INTO patients (name, age, gender, city, phone) VALUES
					('Ravi Kumar', 32, 'M', 'Chennai', '9876543210'),
					('Sneha Reddy', 27, 'F', 'Hyderabad', '9123456780'),
					('Suresh Babu', 45, 'M', 'Coimbatore', '9988776655'),
					('Priya Sharma', 30, 'F', 'Bangalore', '9000012345'),
					('Sanjay Patel', 39, 'M', 'Mumbai', '9812345678'),
					('Divya Mehta', 34, 'F', 'Delhi', '9898989898'),
					('Shreya Nair', 29, 'F', 'Kochi', '9765432109'),
					('Vikram Singh', 50, 'M', 'Jaipur', '9345678901'),
					('Rahul Das', 36, 'M', 'Kolkata', '9432012345'),
					('Anjali Menon', 28, 'F', 'Kochi', '9801234567'),
					('Sathish Raj', 40, 'M', 'Chennai', '9021012345'),
					('Meena Iyer', 31, 'F', 'Pune', '9823012345'),
					('Surya Prakash', 26, 'M', 'Madurai', '9789456123'),
					('Lakshmi Devi', 55, 'F', 'Chennai', '9848123456'),
					('Sonia Paul', 33, 'F', 'Trivandrum', '9900112233');
                    

-- inserting a data for a doctors table

INSERT INTO doctors (name, specialization, experience_years, fees) VALUES
					('Dr. Arjun Mehta', 'Cardiology', 15, 1800.00),
					('Dr. Nisha Rao', 'Dermatology', 10, 900.00),
					('Dr. Ramesh Gupta', 'Orthopedics', 12, 1200.00),
					('Dr. Kavita Joshi', 'Pediatrics', 8, 850.00),
					('Dr. Manoj Verma', 'Neurology', 18, 2500.00),
					('Dr. Snehal Patil', 'Cardiology', 9, 1600.00),
					('Dr. Anand Iyer', 'ENT', 11, 950.00),
					('Dr. Reena Shah', 'Gynecology', 14, 2000.00),
					('Dr. Rohit Jain', 'General Medicine', 6, 700.00),
					('Dr. Vinod Kumar', 'Orthopedics', 20, 2200.00),
					('Dr. Smita Nair', 'Psychiatry', 7, 1100.00),
					('Dr. Karan Sethi', 'Cardiology', 22, 2700.00),
					('Dr. Neha Bhat', 'Dermatology', 5, 1050.00),
					('Dr. Harish Menon', 'General Medicine', 9, 850.00),
					('Dr. Deepa Raj', 'Neurology', 16, 2300.00);
                    

-- inserting a data into the appointment table
INSERT INTO appointments (patient_id, doctor_id, appointment_date, problem_description) VALUES
								(1, 1, '2025-11-01', 'Chest pain and breathlessness'),
								(2, 4, '2025-10-25', 'Fever and cough'),
								(3, 9, '2025-08-15', 'Fatigue and headache'),
								(4, 2, '2025-11-02', 'Skin rashes'),
								(5, 5, '2025-09-20', 'Migraine issues'),
								(6, 3, '2025-11-05', 'Joint pain'),
								(7, 7, '2025-10-10', 'Ear infection'),
								(8, 6, '2025-10-30', 'Heart palpitations'),
								(9, 10, '2025-09-28', 'Back pain'),
								(10, 8, '2025-11-04', 'Prenatal check-up'),
								(11, 11, '2025-10-15', 'Sleep disorder'),
								(12, 12, '2025-10-27', 'Heart check-up'),
								(13, 5, '2025-09-05', 'Headache and dizziness'),
								(14, 13, '2025-11-06', 'Acne treatment'),
								(15, 14, '2025-10-08', 'Cold and flu symptoms');


-- inserting a data into a bills table

INSERT INTO bills (appointment_id, bill_date, payment_mode, total_amount) VALUES
					(1, '2025-11-01', 'Cash', 1800.00),
					(2, '2025-10-25', 'UPI', 850.00),
					(3, '2025-08-15', 'Card', 700.00),
					(4, '2025-11-02', 'Cash', 900.00),
					(5, '2025-09-20', 'Card', 2500.00),
					(6, '2025-11-05', 'UPI', 1200.00),
					(7, '2025-10-10', 'Cash', 950.00),
					(8, '2025-10-30', 'Card', 1600.00),
					(9, '2025-09-28', 'UPI', 2200.00),
					(10, '2025-11-04', 'Cash', 2000.00),
					(11, '2025-10-15', 'Card', 1100.00),
					(12, '2025-10-27', 'Cash', 2700.00),
					(13, '2025-09-05', 'UPI', 2500.00),
					(14, '2025-11-06', 'Card', 1050.00),
					(15, '2025-10-08', 'Cash', 850.00);


-- performing tasks

SELECT p.name AS patient_name,
 d.name AS doctor_name,
 d.specialization,
 a.appointment_date,
 a.problem_description
FROM appointments a
JOIN doctors d ON d.doctor_id = a.doctor_id 
JOIN patients p ON p.patient_id = a.patient_id;

SELECT name AS patient_name, city FROM patients;

SELECT name AS patient_name, city FROM patients WHERE city LIKE 'che%';

SELECT name AS doctor_name, fees FROM doctors WHERE fees >= 1000;

SELECT count(*) AS total_doctors, specialization FROM doctors GROUP BY specialization;

SELECT avg(fees) AS average_fees, specialization FROM doctors GROUP BY specialization;

SELECT name AS patient_name FROM patients WHERE name LIKE 's%';

SELECT avg(fees) AS average_fees, specialization FROM doctors GROUP BY specialization HAVING avg(fees) > 1500;

-- task 9 pending

SELECT name AS doctor_name, experience_years FROM doctors ORDER BY experience_years desc;

SELECT name AS doctor_name, experience_years,specialization
FROM doctors 
ORDER BY experience_years desc LIMIT 3;

UPDATE doctors SET fees = ROUND(fees *1.15,2) WHERE specialization = 'Cardiology';

SELECT name, fees FROM doctors WHERE specialization = 'Cardiology';


SELECT name,city FROM patients WHERE name = 'Ravi Kumar';

UPDATE patients SET city = 'Bangalore' WHERE name = 'Ravi Kumar';

-- task 14 pending

SELECT name FROM patients WHERE name = 'Sneha Rao';

UPDATE patients SET name = 'Sneha Rao' WHERE name = 'Sneha Reddy';

SELECT * FROM appointments 
WHERE appointment_date 
BETWEEN DATE_SUB(CURDATE(),INTERVAL 30 DAY) AND CURDATE();

SELECT SUM(total_amount) AS revenue FROM bills;

SELECT p.name AS patient_name,
count(appointment_id) AS total_appointments
FROM appointments a 
JOIN patients p ON a.patient_id = p.patient_id 
GROUP BY p.patient_id, p.name
HAVING count(a.appointment_id) > 1;

SELECT d.* , a.problem_description
FROM doctors d
LEFT JOIN appointments a
ON a.doctor_id = d.doctor_id
WHERE a.appointment_id IS NULL;