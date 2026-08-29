# CO5 AT3 – Banking Loan Eligibility

Selected problem: Question 6 – Banking Loan Eligibility.

## Repository Contents
- `Prolog/loan_eligibility.pl` – facts, rules, predicates and queries.
- `Models/production_rules.txt` – production-rule model.
- `Models/propositional_logic.txt` – propositional logic model.
- `Models/first_order_logic.txt` – first-order logic model.
- `Test_Cases/test_cases.txt` – test cases and chaining demonstrations.
- `Documentation/Banking_Loan_Eligibility_Report.docx` – assessment report.

## Run
Use SWI-Prolog.

Load:
`?- consult('Prolog/loan_eligibility.pl').`

Queries:
`?- recommendation(giridhar, R).`
Expected: `R = "APPROVED".`

`?- recommendation(rohan, R).`
Expected: `R = "MANUAL REVIEW".`

`?- recommendation(anita, R).`
Expected: `R = "REJECTED".`
