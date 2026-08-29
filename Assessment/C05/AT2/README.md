# Vehicle Fault Diagnosis Expert System

## Files

- `Kb.pl` - Knowledge base containing facts, production rules and recommendations.
- `run_tests.pl` - Five industry-based test cases and test runner.

## Software

SWI-Prolog

## Run

1. Open SWI-Prolog.
2. Keep `Kb.pl` and `run_tests.pl` in the same folder.
3. Load the test file:

`?- [run_tests].`

4. Run all test cases:

`?- run_tests.`

## Example Query

`?- diagnose(weak_battery, Action).`

`?- forward_diagnosis([difficult_starting, slow_cranking], Fault).`

## Domain

Automobile Industry - Vehicle Fault Diagnosis

## Purpose

The system identifies probable vehicle faults from observed symptoms using production rules and logical inference. It is an academic decision-support prototype and does not replace professional vehicle inspection.
