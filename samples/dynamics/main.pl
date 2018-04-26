:- [rules].

main :- 
    write("Hello there!"), nl.

:- begin_tests(tests).

test('Testing if hammer can be used by person') :-
    canUse(jorge, hammer).

test('Testing if dynamic person can use tool') :-
    canUse(jerry, hammer).

:- end_tests(tests).
:- assert(person(jerry)).
:- run_tests.

