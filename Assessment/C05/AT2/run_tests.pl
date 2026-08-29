% run_tests.pl
% Test cases for Vehicle Fault Diagnosis Expert System

:- consult('Kb.pl').

% -------------------------
% Test Case 1 - Weak Battery
% -------------------------

test_case(1) :-
    writeln('TEST CASE 1: Difficult starting + slow cranking'),
    forward_diagnosis(
        [difficult_starting, slow_cranking],
        Fault),
    writeln('Probable Fault:'),
    writeln(Fault),
    diagnose(Fault, Action),
    writeln('Recommended Action:'),
    writeln(Action),
    nl.

% -------------------------
% Test Case 2 - Cooling System
% -------------------------

test_case(2) :-
    writeln('TEST CASE 2: Engine overheating + high temperature'),
    forward_diagnosis(
        [engine_overheating, temperature_high],
        Fault),
    writeln('Probable Fault:'),
    writeln(Fault),
    diagnose(Fault, Action),
    writeln('Recommended Action:'),
    writeln(Action),
    nl.

% -------------------------
% Test Case 3 - Cooling System
% -------------------------

test_case(3) :-
    writeln('TEST CASE 3: Engine overheating + low coolant'),
    diagnose_backward(cooling_system_fault),
    writeln('Probable Fault: cooling_system_fault'),
    recommendation(cooling_system_fault, Action),
    writeln('Recommended Action:'),
    writeln(Action),
    nl.

% -------------------------
% Test Case 4 - Low Engine Oil
% -------------------------

test_case(4) :-
    writeln('TEST CASE 4: Abnormal noise + ticking noise'),
    diagnose_backward(low_engine_oil),
    writeln('Probable Fault: low_engine_oil'),
    recommendation(low_engine_oil, Action),
    writeln('Recommended Action:'),
    writeln(Action),
    nl.

% -------------------------
% Test Case 5 - Fuel/Tuning Issue
% -------------------------

test_case(5) :-
    writeln('TEST CASE 5: Low mileage + high fuel consumption'),
    diagnose_backward(fuel_system_or_engine_tuning_issue),
    writeln('Probable Fault: fuel_system_or_engine_tuning_issue'),
    recommendation(fuel_system_or_engine_tuning_issue, Action),
    writeln('Recommended Action:'),
    writeln(Action),
    nl.

% -------------------------
% Run all test cases
% -------------------------

run_tests :-
    test_case(1),
    test_case(2),
    test_case(3),
    test_case(4),
    test_case(5),
    writeln('All test cases completed successfully.').

% To run:
% ?- run_tests.
