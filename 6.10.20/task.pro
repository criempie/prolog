:- initialization(consult('kinship.pro')).

% task1

findMaleParent(P, X) :-
    male(P),
    parent(P, X).

%findMaleParent(_, _) :- !, fail.

findFemaleParent(P, X) :-
    parent(P, X),
    female(P).

%findFemaleParent(_, _) :- !, fail.

pred(X, Y) :-
    findMaleParent(P1, Y),
    findFemaleParent(P2, Y),

    (
        pred_(X, P1);
        pred_(X, P2)
    ).

pred_(X, Y) :- parent(X, Y).
pred_(X, Y) :-
    findMaleParent(P1, Y),
    findFemaleParent(P2, Y),

    ( 
        pred_(X, P1);
        pred_(X, P2)
    ).

% task2

brother(X, Y) :-
    male(X),
    findMaleParent(P1, X),
    findFemaleParent(P2, X),

    findMaleParent(PP1, Y),
    findFemaleParent(PP2, Y),

    X \== Y,

    P1 = PP1,
    P2 = PP2.

% task3


married(X, Y) :-
    bagof(A1, parent(X, A1), Res1),
    bagof(A2, parent(Y, A2), Res2),

    X \== Y,
    Res1 \== [],
    Res2 \== [],
    sublist(Res1, Res2).
    

% task4

husband(X, Y) :-
    male(X),
    bagof(A1, parent(X, A1), Res1),
    bagof(A2, parent(Y, A2), Res2),

    X \== Y,
    sublist(Res1, Res2).

% task5
bruhsis(X, Y) :-
    findMaleParent(P1, X),
    findFemaleParent(P2, X),

    findMaleParent(PP1, Y),
    findFemaleParent(PP2, Y),

    X \== Y,

    P1 = PP1,
    P2 = PP2.

cousin(X, Y) :-
    findMaleParent(P1, X),
    findFemaleParent(P2, X),

    bruhsis(BS1, P1),
    parent(BS1, Y); !;
    
    bruhsis(BS2, P2),
    parent(BS2, Y).



% task6 

num_of_children(X, N) :-
    bagof(A, parent(X, A), Res),
    length(Res, N).

% task7

nephews(X, Y) :-
    bruhsis(BS, Y),
    setof(N, parent(BS, N), X).

% task8

family(X) :-
    married(Y, Z),   
    setof(N, parent(Y, N), Children),
    append([Y, Z], Children, X).

