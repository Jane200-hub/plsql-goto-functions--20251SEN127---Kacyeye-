# C2 — Reflection

## What I Learned
Through this assignment, I learned how PL/SQL GOTO statements work and how they transfer control to labeled statements within a PL/SQL block. I also learned that GOTO has restrictions and cannot jump into certain nested blocks. The illegal GOTO example helped me understand these restrictions.

I also learned how to create and use PL/SQL functions. Functions allow calculations and business logic to be written once and reused. In my Café Payroll Management System, I created functions for annual salary, years of service, tax calculation, department names, and payroll validation.

## How Functions Helped the Project
The functions made the payroll system easier to organize. Instead of repeating calculations, I could call functions such as `calculate_annual_salary`, `calculate_tax`, and `calculate_years_service`. The department function converts department IDs into meaningful names.

The payroll validation function compares gross salary with the employee's monthly salary and returns a clear result such as `VALID PAYROLL` or `INVALID PAYROLL`.

## Challenges and Solutions
One challenge was understanding GOTO restrictions, especially the illegal jump into a nested block. I solved this by moving the label to a valid location and then rewriting the logic without GOTO.

Another challenge was creating functions with the correct privileges and in the correct Oracle schema. I resolved this by connecting to the correct PDB and ensuring that the student account had the `CREATE PROCEDURE` privilege.

I also learned the importance of checking compilation errors with `SHOW ERRORS` instead of assuming that a function was created successfully.

## Conclusion
This assignment improved my understanding of PL/SQL control flow, functions, exception handling, SQL queries, and database programming. It also showed me that although GOTO can be used in PL/SQL, structured IF/ELSIF/ELSE logic is often easier to read and maintain.
