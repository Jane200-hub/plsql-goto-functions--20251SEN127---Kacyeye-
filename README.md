# PL/SQL GOTO Statements and Functions — Café Payroll Management System

**Student:** Kacyeye Igihozo Jane  
**Student ID:** 20251SEN127  
**Course:** Database Development with PL/SQL (INSY 8311)  
**Assignment:** Individual Assignment III — PL/SQL GOTO Statements and Functions  
**Instructor:** Eric Maniraguha  
**Database:** Oracle Database 21c

## 1. Project Overview

This project implements a small **Café Payroll Management System** using Oracle PL/SQL. The system stores departments, employees, and payroll records. It is used to demonstrate PL/SQL GOTO statements, GOTO restrictions, structured alternatives to GOTO, reusable functions, SQL function calls, exception handling, and payroll validation.

## 2. Business Scenario

A café employs staff in different departments such as Management, Sales, Kitchen, and Finance. Each employee has a monthly salary and hire date. Payroll records store the gross salary paid for a payroll month.

The system provides simple payroll operations including salary classification, annual salary calculation, years-of-service calculation, tax calculation, department-name lookup, and payroll validation.

## 3. Database Structure

### Departments
| Column | Description |
|---|---|
| dept_id | Unique department identifier |
| dept_name | Department name |

### Employees
| Column | Description |
|---|---|
| employee_id | Unique employee identifier |
| first_name | Employee name |
| dept_id | Employee department |
| monthly_salary | Monthly salary |
| hire_date | Employee hire date |

### Payroll
| Column | Description |
|---|---|
| payroll_id | Unique payroll record |
| employee_id | Employee receiving payroll |
| payroll_month | Payroll month |
| gross_salary | Gross salary recorded |

## 4. Repository Structure

```text
plsql-goto-functions-20251SEN127-Kacyeye/
├── README.md
├── .gitignore
├── 00_setup/
│   └── create_tables.sql
├── 01_goto/
│   ├── A1_number_classifier.sql
│   ├── A2_salary_review.sql
│   ├── A3_illegal_goto.sql
│   └── A4_rewrite_no_goto.sql
├── 02_functions/
│   ├── B1_fn_annual_salary.sql
│   ├── B2_fn_years_of_service.sql
│   ├── B3_fn_calculate_tax.sql
│   ├── B4_fn_dept_name.sql
│   └── C1_fn_validate_payroll.sql
├── 03_tests/
│   ├── B5_functions_in_select.sql
│   ├── test_functions.sql
│   └── test_validate_payroll.sql
├── screenshots/
│   ├── A1_output.png
│   ├── A2_output.png
│   ├── A3_error_and_fix.png
│   ├── A4_output.png
│   ├── B5_select_output.png
│   └── C1_output.png
└── docs/
    └── REFLECTION.md
```

## 5. How to Run

Connect to the student's schema inside the assignment PDB using Oracle SQL*Plus or SQL Developer.

Run the setup first in a **fresh schema**:

```sql
@00_setup/create_tables.sql
```

Then run the GOTO examples:

```sql
@01_goto/A1_number_classifier.sql
@01_goto/A2_salary_review.sql
@01_goto/A3_illegal_goto.sql
@01_goto/A4_rewrite_no_goto.sql
```

Run the functions:

```sql
@02_functions/B1_fn_annual_salary.sql
@02_functions/B2_fn_years_of_service.sql
@02_functions/B3_fn_calculate_tax.sql
@02_functions/B4_fn_dept_name.sql
@02_functions/C1_fn_validate_payroll.sql
```

Run the tests:

```sql
@03_tests/B5_functions_in_select.sql
@03_tests/test_functions.sql
@03_tests/test_validate_payroll.sql
```

> **Important:** If the tables and sample data already exist in your schema, do not run `create_tables.sql` again, because Oracle will report that the objects already exist. Use the existing tables and run the assignment scripts/functions.

## 6. Part A — GOTO Statements

### A1 — Number Classifier

File: `01_goto/A1_number_classifier.sql`

The program classifies a number as positive, negative, or zero. GOTO transfers control to the corresponding label. The test value is `25`, so the expected result is:

```text
The number is POSITIVE
Number classification completed.
```

### Screenshot

<img width="486" height="428" alt="A1_output (2)" src="https://github.com/user-attachments/assets/dbfe1a09-5e75-4d5c-90f0-781716e3bcd6" />


### A2 — Salary Review

File: `01_goto/A2_salary_review.sql`

The program reads employee 101's salary and uses GOTO to classify it as high, average, or low. Employee 101 has a monthly salary of 500,000, so the expected result is:

```text
Jane has a HIGH salary.
Salary review completed.
```

### Screenshot

<img width="448" height="490" alt="A2_output (2)" src="https://github.com/user-attachments/assets/186ef787-5145-440a-84a6-092e6629d416" />


### A3 — Illegal GOTO and Fix

File: `01_goto/A3_illegal_goto.sql`

The first block intentionally attempts to jump into a nested block. Oracle rejects this because GOTO cannot transfer control into a nested block from outside that block. The same file then contains a corrected version where the label is placed in a valid location.

### Screenshot

<img width="398" height="426" alt="A3_error_and_fix" src="https://github.com/user-attachments/assets/d66cfa13-7972-4266-987d-5c1413145aed" />


### A4 — Rewrite Without GOTO

File: `01_goto/A4_rewrite_no_goto.sql`

The salary-review logic is rewritten using normal IF/ELSIF/ELSE structured control flow. This version is easier to read and maintain because it does not require jumps between labels.

### Screenshot

<img width="472" height="339" alt="A4_output" src="https://github.com/user-attachments/assets/048703d7-36ff-4b83-b7bb-b8eabb7eed04" />


## 7. Part B — Functions

### B1 — Annual Salary

File: `02_functions/B1_fn_annual_salary.sql`

`calculate_annual_salary` accepts a monthly salary and returns monthly salary multiplied by 12.

Example: 500,000 monthly salary → 6,000,000 annual salary.

### B2 — Years of Service

File: `02_functions/B2_fn_years_of_service.sql`

`calculate_years_service` calculates completed years between the hire date and the current date using `MONTHS_BETWEEN` and `TRUNC`.

### B3 — Tax Calculator

File: `02_functions/B3_fn_calculate_tax.sql`

The function applies the assignment tax rules:

- Salary up to 300,000 → 0%
- Salary from 300,001 to 500,000 → 10%
- Salary above 500,000 → 20%

For a salary of 500,000, the tax is 50,000.

### B4 — Department Name

File: `02_functions/B4_fn_dept_name.sql`

`get_department_name` receives a department ID and returns its department name. If the ID does not exist, the function handles `NO_DATA_FOUND` and returns `Department Not Found`.

### B5 — Functions in SELECT

File: `03_tests/B5_functions_in_select.sql`

The query demonstrates that the created functions can be called directly inside a SQL SELECT statement. It displays employee information together with annual salary, years of service, tax, and department name.

### Screenshot

<img width="550" height="597" alt="B5_select_output" src="https://github.com/user-attachments/assets/878f28d2-2c1d-439e-9513-ba346ba4dcef" />


## 8. Part C — Payroll Validator

### C1 — Payroll Validator

File: `02_functions/C1_fn_validate_payroll.sql`

`validate_payroll` compares an employee's payroll gross salary with the employee's monthly salary.

Possible results:

- `VALID PAYROLL` — the values match.
- `INVALID PAYROLL` — the values do not match.
- `EMPLOYEE NOT FOUND` — the employee ID does not exist.

The test file also includes an intentionally invalid salary test to demonstrate the second result.

### Screenshot

<img width="567" height="473" alt="C1_output" src="https://github.com/user-attachments/assets/2fef1b0e-aeae-49da-ab0f-6f289b3ba0fe" />


## 9. Function Testing

The files in `03_tests/` provide separate tests for the functions and payroll validation.

`test_functions.sql` checks individual function calls and confirms the function objects are valid.

`test_validate_payroll.sql` checks valid payroll records and also tests invalid and nonexistent employee cases.

## 10. Expected Function Objects

After creating the functions, the following five functions should exist and have status `VALID`:

- `CALCULATE_ANNUAL_SALARY`
- `CALCULATE_TAX`
- `CALCULATE_YEARS_SERVICE`
- `GET_DEPARTMENT_NAME`
- `VALIDATE_PAYROLL`

## 11. Screenshots

The `screenshots/` folder contains placeholders for the required evidence. Before final submission, replace the placeholder files with the actual screenshots captured from Oracle SQL*Plus or SQL Developer.

Required screenshots:

1. `A1_output.png`
2. `A2_output.png`
3. `A3_error_and_fix.png`
4. `A4_output.png`
5. `B5_select_output.png`
6. `C1_output.png`

Make sure the screenshots clearly show the relevant SQL/result and, where appropriate, the Oracle prompt or execution result.

## 12. Reflection

The full reflection for C2 is available in `docs/REFLECTION.md`.

## 13. Conclusion

This project demonstrates the required PL/SQL GOTO statements and functions using a simple café payroll scenario. The repository separates setup, GOTO exercises, functions, testing, screenshots, and reflection so that each assignment requirement can be located and reviewed easily.
