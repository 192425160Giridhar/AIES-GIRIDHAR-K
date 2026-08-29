% Crop Disease Advisory Expert System - SWI-Prolog
:- consult('knowledge_base.pl').

forward_chain(InitialFacts,FinalFacts,Trace):-
    forward_loop(InitialFacts,InitialFacts,FinalFacts,[],RevTrace),
    reverse(RevTrace,Trace).
forward_loop(Facts,KB,Final,Trace0,Trace):-
    applicable_rule(KB,Facts,Name,Conditions,Conclusion),
    \+ memberchk(Conclusion,Facts),
    append(Facts,[Conclusion],NewFacts),
    forward_loop(NewFacts,KB,Final,[step(Name,Conditions,Conclusion)|Trace0],Trace).
forward_loop(Facts,_,Facts,Trace,Trace).
applicable_rule(KB,Facts,Name,Conditions,Conclusion):-
    member(rule(Name,Conditions,Conclusion),KB),
    conditions_true(Conditions,Facts).
conditions_true([],_).
conditions_true([C|Cs],Facts):-memberchk(C,Facts),conditions_true(Cs,Facts).

backward_chain(Goal,Facts,Trace):-prove(Goal,Facts,[],Trace).
prove(Goal,Facts,_,[goal(Goal,fact)]):-memberchk(Goal,Facts).
prove(Goal,Facts,Visited,[rule(Name,Goal)|Trace]):-
    \+ memberchk(Goal,Facts),
    \+ memberchk(Goal,Visited),
    rule(Name,Conditions,Goal),
    prove_conditions(Conditions,Facts,[Goal|Visited],Trace).
prove_conditions([],_,_,[]).
prove_conditions([C|Cs],Facts,Visited,Trace):-
    prove(C,Facts,Visited,T1),
    prove_conditions(Cs,Facts,Visited,T2),
    append(T1,T2,Trace).

diagnose_forward(Facts):-
    forward_chain(Facts,FinalFacts,Trace),
    writeln('--- FORWARD CHAINING ---'),
    writeln('Initial facts:'),writeln(Facts),
    print_forward_trace(Trace),
    findall(D,member(diagnosis(D),FinalFacts),Ds),
    print_diagnoses(Ds).

diagnose_backward(Disease,Facts):-
    backward_chain(diagnosis(Disease),Facts,Trace),
    writeln('--- BACKWARD CHAINING ---'),
    print_backward_trace(Trace),
    writeln('Goal proved:'),writeln(diagnosis(Disease)).

print_forward_trace([]).
print_forward_trace([step(Name,Conditions,Conclusion)|T]):-
    format('Rule ~w fired: IF ~w THEN ~w~n',[Name,Conditions,Conclusion]),
    print_forward_trace(T).
print_backward_trace([]).
print_backward_trace([goal(G,fact)|T]):-
    format('Fact supports: ~w~n',[G]),print_backward_trace(T).
print_backward_trace([rule(Name,G)|T]):-
    format('Trying rule ~w to prove ~w~n',[Name,G]),print_backward_trace(T).
print_diagnoses([]):-writeln('No diagnosis matched the supplied facts.').
print_diagnoses(Ds):-Ds\=[],writeln('Possible diagnosis(es):'),writeln(Ds).

test_case(1,[crop(tomato),leaf_spots(dark_brown),humidity(high),lesion(water_soaked),weather(rainy)]).
test_case(2,[crop(soybean),leaf_surface(white_powder),weather(cool_dry)]).
test_case(3,[crop(rice),leaf_tip(water_soaked),leaf_color(yellow)]).
test_case(4,[leaf_pattern(yellow_mosaic),growth(stunted)]).
test_case(5,[crop(tomato),leaf_spots(light_brown),humidity(low)]).
run_test(N):-test_case(N,Facts),diagnose_forward(Facts),nl.
run_all_tests:-forall(between(1,5,N),run_test(N)).
