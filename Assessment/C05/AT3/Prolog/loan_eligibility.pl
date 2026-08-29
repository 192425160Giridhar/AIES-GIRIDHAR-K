% CO5 AT3 - Banking Loan Eligibility Expert System

applicant(giridhar).
income(giridhar, high).
credit_score(giridhar, excellent).
employment(giridhar, permanent).
existing_loans(giridhar, none).
repayment_history(giridhar, good).

applicant(rohan).
income(rohan, medium).
credit_score(rohan, good).
employment(rohan, permanent).
existing_loans(rohan, one).
repayment_history(rohan, good).

applicant(anita).
income(anita, low).
credit_score(anita, poor).
employment(anita, temporary).
existing_loans(anita, two_or_more).
repayment_history(anita, poor).

loan_eligible(X) :-
    income(X, high),
    credit_score(X, excellent),
    employment(X, permanent),
    existing_loans(X, none),
    repayment_history(X, good).

loan_review(X) :-
    income(X, medium),
    credit_score(X, good),
    employment(X, permanent),
    existing_loans(X, one),
    repayment_history(X, good).

loan_rejected(X) :-
    credit_score(X, poor),
    repayment_history(X, poor).

loan_rejected(X) :-
    existing_loans(X, two_or_more),
    repayment_history(X, poor).

recommendation(X, "APPROVED") :- loan_eligible(X).
recommendation(X, "MANUAL REVIEW") :- loan_review(X).
recommendation(X, "REJECTED") :- loan_rejected(X).

applicant_summary(X) :-
    applicant(X),
    income(X, I),
    credit_score(X, C),
    employment(X, E),
    existing_loans(X, L),
    repayment_history(X, R),
    recommendation(X, Result),
    format("Applicant: ~w~nIncome: ~w~nCredit Score: ~w~nEmployment: ~w~nExisting Loans: ~w~nRepayment History: ~w~nDecision: ~w~n",
           [X, I, C, E, L, R, Result]).
