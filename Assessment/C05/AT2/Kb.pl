% Kb.pl
% Vehicle Fault Diagnosis Knowledge Base
% Artificial Intelligence and Expert Systems - CO5 AT2

% -------------------------
% Vehicle symptom facts
% -------------------------

symptom(engine_overheating).
symptom(temperature_high).
symptom(coolant_low).
symptom(steam_from_hood).

symptom(difficult_starting).
symptom(slow_cranking).
symptom(headlights_dim).

symptom(abnormal_noise).
symptom(ticking_noise).

symptom(low_mileage).
symptom(high_fuel_consumption).

symptom(check_engine_light).

% -------------------------
% Production rules
% -------------------------

rule(cooling_system_fault,
     [engine_overheating, temperature_high]).

rule(cooling_system_fault,
     [engine_overheating, coolant_low]).

rule(cooling_system_fault,
     [temperature_high, steam_from_hood]).

rule(weak_battery,
     [difficult_starting, slow_cranking]).

rule(weak_battery,
     [difficult_starting, headlights_dim]).

rule(low_engine_oil,
     [abnormal_noise, ticking_noise]).

rule(fuel_system_or_engine_tuning_issue,
     [low_mileage, high_fuel_consumption]).

rule(engine_control_fault,
     [check_engine_light, low_mileage]).

% -------------------------
% Recommended actions
% -------------------------

recommendation(cooling_system_fault,
 'Allow the vehicle to cool and inspect the cooling system / seek service.').

recommendation(weak_battery,
 'Inspect the battery, terminals and charging system.').

recommendation(low_engine_oil,
 'Check engine oil level and arrange professional inspection.').

recommendation(fuel_system_or_engine_tuning_issue,
 'Inspect the fuel/air system, ignition components and engine tuning.').

recommendation(engine_control_fault,
 'Perform an OBD diagnostic scan and inspect the engine control system.').

% -------------------------
% Backward chaining
% -------------------------

diagnose_backward(Fault) :-
    rule(Fault, Conditions),
    all_symptoms_true(Conditions).

all_symptoms_true([]).

all_symptoms_true([H|T]) :-
    symptom(H),
    all_symptoms_true(T).

diagnose(Fault, Action) :-
    diagnose_backward(Fault),
    recommendation(Fault, Action).

% -------------------------
% Forward chaining
% -------------------------

forward_diagnosis(Facts, Fault) :-
    forward_closure(Facts, Closure),
    rule(Fault, Conditions),
    subset_of(Conditions, Closure).

forward_closure(Facts, Closure) :-
    add_new_facts(Facts, Facts, Closure).

add_new_facts(_, Current, Closure) :-
    applicable_rule(Current, NewFact),
    \+ memberchk(NewFact, Current),
    !,
    append(Current, [NewFact], Next),
    add_new_facts([], Next, Closure).

add_new_facts(_, Current, Current).

applicable_rule(Facts, NewFact) :-
    rule(NewFact, Conditions),
    subset_of(Conditions, Facts).

subset_of([], _).

subset_of([H|T], Set) :-
    memberchk(H, Set),
    subset_of(T, Set).
