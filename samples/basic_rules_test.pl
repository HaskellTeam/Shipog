:- begin_tests('basic_rules_test').
:- consult('basic_rules').

test('test_brother') :- 
    brother(lineu, alan),
    stepBrother(lineu, alberto).

test('test_not_brother') :- 
    not(brother(lineu, josh)).

test('test_step_brother') :- 
    brother(lineu,alberto),
    % member(stepBrother(lineu, X), [alberto, regina, leandro]).
    stepBrother(lineu, alberto).


:- end_tests('basic_rules_test').
:- run_tests.