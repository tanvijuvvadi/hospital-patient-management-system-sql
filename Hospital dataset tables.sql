use hospital ;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(255),
    treatment_type VARCHAR(100),
    cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    treatment_id INT,
    medicine VARCHAR(255),
    dosage VARCHAR(100),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    room_number INT,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);