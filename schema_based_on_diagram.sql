CREATE DATABASE clinic;

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


ALTER TABLE medical_histories ADD CONSTRAINT pk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE invoices ADD CONSTRAINT pk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE invoice_item ADD CONSTRAINT pk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE invoice_item ADD CONSTRAINT pk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id);


CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_item(invoice_id);
CREATE INDEX ON invoice_item(treatment_id);
CREATE INDEX ON medical_histories_treatments(medical_history_id);
CREATE INDEX ON medical_histories_treatments(treatment_id);