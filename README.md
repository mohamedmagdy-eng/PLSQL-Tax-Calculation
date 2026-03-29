# Progressive Tax Calculation Function

###  Project Overview
This project features a robust **Stored Function** designed to automate income tax calculations based on progressive tax brackets. It demonstrates advanced conditional logic within Oracle PL/SQL to apply varying tax rates depending on the input salary, while ensuring strict data integrity through custom error handling.

###   Features
-**Progressive Tax Engine:** Implemented multi-tier tax brackets (5%, 10%, 15%) using optimized PL/SQL stored functions for accurate financial calculations.

-**Input Validation:** Enforced validation checks for null and negative values to maintain data integrity and prevent calculation errors.

-**Reusable Business Logic:** Designed modular and reusable PL/SQL components that can be integrated with Oracle Forms and reporting systems.

-**Business Rule Implementation:** Applied structured financial logic aligned with payroll and taxation requirements.


###  Technologies
-**PL/SQL** (Stored Functions, Conditional Logic, Exception Handling)

-**SQL** (Data Retrieval & Querying)

-**Oracle Database Programming**

-**Business Logic Automation**

### 🛠️ Technical Skillset
* **Stored Functions:** Using `CREATE OR REPLACE FUNCTION` to encapsulate reusable business logic.
* **Progressive Logic:** Implementing `IF-ELSIF-ELSE` structures to handle tiered financial brackets.
* **Data Validation:** Utilizing `RAISE_APPLICATION_ERROR` (-20001) to enforce business rules and prevent invalid data processing.
* **Exception Management:** Professional handling of system and custom errors using `SQLCODE` and `SQLERRM`.
* **Dynamic Calculations:** Designing logic that adapts output based on defined salary thresholds.

###  Business Rules (Tax Brackets)
The function applies the following progressive rates:
| Salary Range | Tax Rate (%) |
| :--- | :--- |
| **Up to 5,000** | 5% |
| **5,001 - 10,000** | 10% |
| **Above 10,000** | 15% |

###  Logic Breakdown
1. **Input Stage:** The function receives a numeric value representing the salary.
2. **Integrity Check:** It immediately validates the input. If the salary is `NULL` or negative, it triggers a custom exception.
3. **Bracket Identification:** It evaluates the salary against three financial tiers to determine the applicable tax rate.
4. **Execution:** The anonymous block calls the function and captures the result for display or handles any triggered errors gracefully.

---

### 💻 Execution Example (Terminal Output)

**Scenario 1: Standard Calculation (Salary = 5000)**
```text
Tax Amount: 250

PL/SQL procedure successfully completed.
```

**Scenario 2: Invalid Input (Salary = -100)**
```text
!! Check the value of the salary again !!

PL/SQL procedure successfully completed.
```
