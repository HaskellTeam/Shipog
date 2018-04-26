:- ensure_loaded(facts).

tool(Thing) :-
        grabber(Thing),
        usefull(Thing), !.
    
canUse(Person, Tool) :- 
    tool(Tool),
    person(Person), !.

