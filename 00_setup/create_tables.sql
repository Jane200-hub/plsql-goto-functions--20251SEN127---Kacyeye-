-- Café Payroll Management System
-- Setup: tables and sample data

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    dept_id NUMBER,
    monthly_salary NUMBER(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_employee_dept FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

CREATE TABLE payroll (
    payroll_id NUMBER PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    payroll_month VARCHAR2(20) NOT NULL,
    gross_salary NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_payroll_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

INSERT INTO departments VALUES (10, 'Management');
INSERT INTO departments VALUES (20, 'Sales');
INSERT INTO departments VALUES (30, 'Kitchen');
INSERT INTO departments VALUES (40, 'Finance');

INSERT INTO employees VALUES (101, 'Jane', 10, 500000, DATE '2023-01-15');
INSERT INTO employees VALUES (102, 'Alice', 20, 350000, DATE '2024-03-10');
INSERT INTO employees VALUES (103, 'Eric', 30, 300000, DATE '2022-06-20');
INSERT INTO employees VALUES (104, 'David', 40, 450000, DATE '2021-09-05');

INSERT INTO payroll VALUES (1, 101, 'September', 500000);
INSERT INTO payroll VALUES (2, 102, 'September', 350000);
INSERT INTO payroll VALUES (3, 103, 'September', 300000);
INSERT INTO payroll VALUES (4, 104, 'September', 450000);

COMMIT;
