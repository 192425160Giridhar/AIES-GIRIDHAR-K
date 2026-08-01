% Facts
man(marcus).
pompeian(marcus).
ruler(caeser).
try_assassinate(marcus, caeser).

% Rule: All Pompeians are Romans
roman(X) :-
    pompeian(X).

% Rule: All men are people
person(X) :-
    man(X).

% Rule: Everyone who tries to assassinate a ruler is not loyal
not_loyal(X, Y) :-
    try_assassinate(X, Y),
    ruler(Y).

% Rule: A Roman who is not loyal to Caesar hates Caesar
hates(X, caeser) :-
    roman(X),
    not_loyal(X, caeser).

% Rule: Loyalty (used for the query)
loyal(X, caeser) :-
    roman(X),
    \+ not_loyal(X, caeser).