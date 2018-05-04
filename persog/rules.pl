% Importing 
:- [facts].
:- [helpers].

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
    debug(Reference),
    debug(Choice,Answer),
    storeAnswer(Question, Answer),
    debug("storing Question Answer."),
    debug(Question),debug(Answer).

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
    max_list(AmountList ,BestPersonality ),
    nth1(IndexBestPersonality, AmountList, BestPersonality),
    debug("Index -", IndexBestPersonality),
    nth1(IndexBestPersonality, PersonalityList, ReturnPersonality).

question(1) :-
    write("** Q1 ** "),
    write("De que forma o urso pegou seu mel?"), nl,
    write("1 - derrubando uma arvore"), nl, %sexy
    write("2 - escalando uma montanha"), nl, %greedy
    write("3 - comprando no mercado"), nl, %wise
    write("4 - ROUBANDO"), nl, %evil
    write("5 - ele nao tem mel"), nl, nl, %humble
    readAndStore(1, [sexy, greedy, wise, evil, humble]).

question(2) :-
    write("** Q2 ** "),
    write("Porque a galinha atravessou a rua?"), nl,
    write("1 - gloria"), nl,                                % greedy
    write("2 - medo"), nl,                                  % evil
    write("3 - porque precisou"), nl,                       % wise
    write("4 - sem razao especifica"), nl,                  % humble
    write("5 - porque queria ir para o outro lado"), nl, nl, % sexy
    readAndStore(2, [greedy, evil, wise, humble, sexy]).

question(3) :-
    write("** Q3 ** "),
    write("Se eu fosse um cachorro, o que eu seria?"), nl,
    write("1 - dalmata"), nl, %sexy
    write("2 - husky"), nl, %greedy
    write("3 - pintcher"), nl, %evil
    write("4 - Vira-lata"), nl, % humble
    write("5 - dobberman"), nl, nl, %wize
    readAndStore(3, [sexy, greedy, evil, humble, wise]).

question(4) :-
    write("** Q4 ** "),
    write("Qual a melhor magia no mundo de Harry Potter?"), nl,
    write("1 - Expecto Patronum"), nl, %sexy
    write("2 - Petrificus Totalus"), nl, %greedy
    write("3 - Avada Kedavra"), nl, %evil
    write("4 - Wingardium Leviosa"), nl, % humble
    write("5 - Expelliarmus"), nl, nl, %wize
    readAndStore(4, [sexy, greedy, evil, humble, wise]).

question(5) :-
    write("** Q5 ** "),
    write("Qual a profissao mais importante na sociedade?"), nl,
    write("1 - Engenheiro"), nl, %sexy
    write("2 - Advogado"), nl, %greedy
    write("3 - Policial"), nl, %evil
    write("4 - Todas sao importantes"), nl, % humble
    write("5 - Professor"), nl, nl, %wize
    readAndStore(5, [sexy, greedy, evil, humble, wise]).

delayTesion :-
    sleep(1), write("."),nl,
    sleep(1), write("."),nl,
    sleep(2), write("."),nl.

drawBar :-
    write("*-------------*"),nl.

askQuestions :-
    question(1),
    question(2),
    question(3),
    question(4),
    question(5).

presentResult(Person) :-
    write("Voce eh..."),nl,
    delayTesion,
    drawBar,
    write("   "),write(Person), write("!"),nl,
    drawBar.

main :-
    (clear;!),
    askQuestions,
    checkPersonalityMatch(Personality),
    charIs(Person, Personality),
    presentResult(Person),
    nl.

clear :-
    retractall(answer(_,_)).

:- main.