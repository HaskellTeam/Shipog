% testing tests
x(5) :- !.
not(x(6)).

:- begin_tests(foo).

% Fail
test(x) :- not(x(5)).
test(x) :- x(6).

% Success
test(x) :- x(5).
test(x) :- not(x(6)).
    
:- end_tests(foo).