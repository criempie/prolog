% Задача 1.

toSquares(0, _, R) :- !, R = 0.
toSquares(_, 0, R) :- !, R = 0. 
toSquares(X, Y, I) :-
    MinLength is min(X, Y),
    MaxLength is max(X, Y),
    Diff is MaxLength - MinLength,
    toSquares(MinLength, Diff, I1),
    I is I1 + 1.
    
% Задача 2.

qntDigit(X, Y, _, R) :- X > Y, R = 0.
qntDigit(X, Y, DIG, N) :-
    X =< Y,
    XAbs is abs(X),
    existDigit(XAbs, DIG),
    X1 is X + 1,
    qntDigit(X1, Y, DIG, N1),
    N is N1 + 1.

qntDigit(X, Y, DIG, N) :-
    X =< Y,
    XAbs is abs(X),
    \+ existDigit(XAbs, DIG),
    X1 is X + 1,
    qntDigit(X1, Y, DIG, N).

existDigit(0, 0).
existDigit(NUM, DIG) :-
    NUM > 0,
    DIG =:= NUM rem 10.

existDigit(NUM, DIG) :-
    NUM > 0,
    DIG =\= NUM mod 10,
    REMAIN_NUM is NUM div 10,
    REMAIN_NUM =\= 0,
    existDigit(REMAIN_NUM, DIG).

% Задача 3.

fact(0, 1).
fact(1, 1).
fact(N, R) :-
    fact(N1, R1),
    N is N1 + 1,
    R is R1 * N.

% Задание 4а.

insert(nil, E, tr(E, nil, nil)).
insert(tr(X, L, R), E, tr(Y, LL, RR)) :-
    E < X,
    insert(L, E, U),
    (Y, LL, RR) = (X, U, R).

insert(tr(X, L, R), E, tr(Y, LL, RR)) :-
    E > X,
    insert(R, E, U),
    (Y, LL, RR) = (X, L, U),
    (Y, LL, RR) = (X, L, R).

% Задание 4б.

contains(tr(X, _, _), X).
contains(tr(X, L, R), N) :-
    contains(L, N);
    contains(R, N).

% Задание 4в.

isSearchTree(tr(X, L, R)) :-
    isSearchTree_(L, X, left),
    isSearchTree_(R, X, right).

isSearchTree_(nil, _, _).
isSearchTree_(tr(X, L, R), PREV, DIR) :-
    DIR = left,
    PREV > X,
    isSearchTree_(L, X, left),
    isSearchTree_(R, X, right).

isSearchTree_(tr(X, L, R), PREV, DIR) :-
    DIR = right,
    PREV < X,
    isSearchTree_(L, X, left),
    isSearchTree_(R, X, right).

