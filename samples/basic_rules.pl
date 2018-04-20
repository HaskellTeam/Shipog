% basic rules
%
%
% run on terminal:
%   swipl <to enter in prolog terminal mode>
%   consult(basic_rules). <to import prolog rules file>
%
%


person(josh).           % josh is a person
person(alberto).
person(gilda).
person(lineu).
person(alan).
person(regina).
person(robson).
person(rebeca).

man(josh).
man(alberto).
man(lineu).
man(alan).

woman(gilda).
woman(regina).

% josh is married to gilda
married(josh, gilda).

% josh is parent of alberto
parent(josh, alberto).
parent(josh, lineu).
parent(josh, alan).

parent(gilda, alan).
parent(gilda, lineu).
parent(gilda, regina).

parent(robson, regina).
parent(rebeca, alberto).

% lineu is blood brother of alan
% stepbrother of alberto and regina

% lineu has one stepbrother that is alberto.

% X is Brother of Y ... if ... Z is parent of X and Y
brother(X,Y) :-
    X \= Y,
    bloodBrother(X,Y);
    stepBrother(X,Y)
    .

% same mother and same father
bloodBrother(X,Y) :-
    X \= Y,
    father(Man,X), % Same father
    father(Man,Y),
    mother(Woman,X), % Same mother
    mother(Woman,Y)
    .

% A Person is the father of a Child if a man and a parent of a Child
father(Person, Child) :-
    man(Person),
    parent(Person, Child)
    .

% Same as father
mother(Person, Child) :-
    woman(Person),
    parent(Person, Child)
    .

% A Man is a step father of a Child if it is not the father of this child and is married with ther Child's Mother
stepFather(Man, Child) :-
    not(father(Man, Child)),
    mother(Woman, Child),
    married(Man, Woman)
    .

% Same logic of step father
stepMother(Woman, Child) :-
    not(mother(Woman, Child)),
    father(Man, Child),
    married(Man, Woman)
    .

% Person is step brother of StepBrother if his mother or father are step mother or step father of StepBrother
stepBrother(Person,StepBrother) :-
    Person \= StepBrother, % People are not the same
    father(Man, Person), % Person's father
    mother(Woman, Person),
    stepFather(Man, StepBrother); stepMother(Woman, StepBrother) 
    .

% List all brothers of X
listBrothers(X) :-
    write_ln("Brothers:");
    brother(X, Y),
    write_ln(Y),
    fail
    .

% List all blood brothers
listBloodBrothers(X) :-
    write_ln("Blood Brothers:");
    bloodBrother(X, Y),
    write_ln(Y),
    fail
    .

% List all step brothers
listStepBrothers(X) :-
    write_ln("Step Brothers:");
    stepBrother(X, Y),
    write_ln(Y),
    fail
    .
    