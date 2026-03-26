# PL/SQL Tax Calculation Function

### 🚀 Project Overview
This project introduces a **Stored Function** designed to handle financial logic within the Oracle Database. Unlike anonymous blocks or procedures, this function is built to return a specific calculated value (Tax Amount) and includes rigorous data validation rules to ensure system stability and data integrity.

### 🛠️ Technical Skillset
* **Stored Functions:** Using `CREATE OR REPLACE FUNCTION` with a strictly defined `RETURN` data type.
* **Data Validation:** Implementing logical checks to prevent `NULL` or negative input values.
* **Custom Exception Handling:** Utilizing `RAISE_APPLICATION_ERROR` with custom error codes (e.g., -20001) for professional and clear debugging.
* **Constants:** Using `CONSTANT NUMBER` for fixed variables like tax rates to ensure code maintainability.
* **Exception Mapping:** Capturing specific `SQLCODE` within the execution block to provide user-friendly feedback.

### 📝 Logic Breakdown
1. **Definition:** The function `calculate_tax` accepts a numeric parameter (`p_salary`).
2. **Validation Logic:** It first verifies that the input is valid. If the salary is negative or missing, it immediately halts and raises error `-20001`.
3. **Calculation:** If the data is valid, it calculates a 10% tax rate using a declared constant.
4. **Execution:** The accompanying anonymous block calls the function, handles the returned value, and maps any exceptions to clean console output.

---

### 💻 Execution Example (Terminal Output)

**Scenario 1: Valid Input (Salary = 5000)**
```text
Tax Amount: 500

PL/SQL procedure successfully completed.
```
**Scenario 2: nvalid Input (Salary = -550)**
```text
!! Check the value of the salary again !!

PL/SQL procedure successfully completed.
