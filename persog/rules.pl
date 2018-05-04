% Importing 
:- [facts].
:- [debug_helper].

% dynamics
:- dynamic answer/2.


check(Entry, Max) :-
    Entry > 0,
    Entry =< Max.

readAndCheck(Entry, Max) :-
    read(Entry),nl,
    ((check(Entry, Max); 
    write("Digite corretamente."), nl, readAndCheck(Entry, Max) 
    );!).
    
storeAnswer(Question, Answer) :-
    assert(answer(Question,Answer)), answer(Question,Answer).

readAndStore(Question, Reference) :-
    readAndCheck(Choice,5),
    nth1(Choice, Reference, Answer),
    storeAnswer(Question, Answer).

amountOfPersonality(Personality, ReturnAmount) :-
    (bagof(X, answer(X,Personality), List);!),
    length(List, ReturnAmount),
    debug("List ReturnAmount -", List).

checkPersonalityMatch(ReturnPersonality) :-
    amountOfPersonality(greedy, Greedy),
    amountOfPersonality(wise, Wise),
    amountOfPersonality(evil, Evil),
    amountOfPersonality(sexy, Sexy),
    amountOfPersonality(humble, Humble),
    PersonalityList = [greedy, wise, evil, sexy, humble],
    debug("List1 -", PersonalityList),
    AmountList = [Greedy, Wise, Evil, Sexy, Humble],
    debug("List2 -", AmountList),
    max_list(AmountList ,IndexBestPersonality ),
    debug("Index -", IndexBestPersonality),
    nth1(IndexBestPersonality, PersonalityList, ReturnPersonality).

question(1) :-
    write("De que forma o urso pegou seu mel?"), nl,
    write("1 - derrubando uma arvore"), nl, %sexy
    write("2 - escalando uma montanha"), nl, %greedy
    write("3 - comprando no mercado"), nl, %wise
    write("4 - ROUBANDO"), nl, %evil
    write("5 - ele nao tem mel"), nl, nl, %humble
    readAndStore(1, [sexy, greedy, wise, evil, humble]).

question(2) :-
    write("Porque a galinha atravessou a rua?"), nl,
    write("1 - gloria"), nl, % wise
    write("2 - medo"), nl, % evil
    write("3 - porque precisou"), nl, %humble
    write("4 - sem razao especifica"), nl, %sexy
    write("5 - porque queria ir para o outro lado"), nl, nl, %greedy
    readAndStore(2, [wise, evil, humble, sexy, greedy]).

question(3) :-
    write("Se eu fosse um cachorro, o que eu seria?"), nl,
    write("1 - dalmata"), nl, %sexy
    write("2 - husky"), nl, %greedy
    write("3 - pintcher"), nl, %evil
    write("4 - Vira-lata"), nl, % humble
    write("5 - dobberman"), nl, nl, %wize
    readAndStore(3, [sexy, greedy, evil, humble, wize]).

question(4) :-
    write("Qual a melhor magia no mundo de Harry Potter?"), nl,
    write("1 - Expecto Patronum"), nl, %sexy
    write("2 - Petrificus Totalus"), nl, %greedy
    write("3 - Avada Kedavra"), nl, %evil
    write("4 - Wingardium Leviosa"), nl, % humble
    write("5 - Expelliarmus"), nl, nl, %wize
    readAndStore(4, [sexy, greedy, evil, humble, wize]).

question(5) :-
    write("Qual a profissao mais importante na sociedade?"), nl,
    write("1 - Engenheiro"), nl, %sexy
    write("2 - Advogado"), nl, %greedy
    write("3 - Policial"), nl, %evil
    write("4 - Todas sao importantes"), nl, % humble
    write("5 - Professor"), nl, nl, %wize
    readAndStore(4, [sexy, greedy, evil, humble, wize]).

main :-
    (clear;!),
    question(1),
    question(2),
    question(3),
    question(4),
    question(5),
    checkPersonalityMatch(Personality),
    charIs(Person, Personality),
    write("Voce eh..."),nl,
    write(Person), write("!"),nl,
    nl.

clear :-
    retractall(answer(_,_)).
