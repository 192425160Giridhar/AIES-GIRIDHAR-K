:- consult('crop_expert_system.pl').

start:-
    writeln('CROP DISEASE ADVISORY EXPERT SYSTEM'),
    writeln('Enter a test case number from 1 to 5.'),
    read(N),
    ( test_case(N,Facts) -> diagnose_forward(Facts) ; writeln('Invalid test case.') ).
