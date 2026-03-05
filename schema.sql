-- Patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender TINYINT NOT NULL,   -- 0 = Female, 1 = Male
    city VARCHAR(100)
);

-- Symptoms table
CREATE TABLE symptoms (
    symptom_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    cough TINYINT NOT NULL,    -- 0 = No, 1 = Yes
    fever TINYINT NOT NULL,    -- 0 = No, 1 = Yes
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- Medical history table
CREATE TABLE medical_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    vaccination TINYINT NOT NULL,       -- 0 = No, 1 = Yes
    chronic_disease VARCHAR(100),       -- e.g., "Diabetes", "None"
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- Predictions table
CREATE TABLE predictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    result VARCHAR(20) NOT NULL,        -- "Positive" / "Negative"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);
