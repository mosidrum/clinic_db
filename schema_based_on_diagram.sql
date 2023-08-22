CREATE DATABASE clinic

CREATE TABLE patients(
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);


CREATE TABLE medical_histories(
  id INT PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(50)
);

CREATE TABLE treatments (
  id INT PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(255)
);

CREATE TABLE invoice_item (
  id INT PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT
);

CREATE TABLE invoices (
  id INT PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT
);

CREATE TABLE medical_histories_treatments (
  medical_histories_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);
