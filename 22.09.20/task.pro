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


factorial(0,1).
factorial(N,F) :-
    N #> 0,
    factorial_(N, F, 1, 1).

factorial_(N, F, N, F).
factorial_(N, F, I, R) :-
    I1 #= I + 1,
    R1 #= R * I1,
    factorial_(N, F, I1, R1). 

% Задание 4а.
insert_(nil, I, tr(I, nil, nil)).
insert_(tr(X, L, R), I, tr(Y, LL, RR)) :-
    (   I < X
    ->  insert(L, I, U),
        (Y, LL, RR) = (X, U, R)
    ;   I > X
    ->  insert(R, I, U),
        (Y, LL, RR) = (X, L, U)
    ;   (Y, LL, RR) = (X, L, R)  
    ).

% Задание 4б.

contains(tr(X, _, _), X).

contains(tr(E, L, _), X) :-
    integer(X),
    X < E,
    contains(L, X).

contains(tr(E, _, R), X) :-
    integer(X),
    X > E,
    contains(R, X).

contains(tr(_, L, _), X) :-
    var(X),
    contains(L, X).

contains(tr(_, _, R), X) :-
    var(X),
    contains(R, X).

% Задание 4в.
isSearchTree(Tree) :-
    current_prolog_flag(min_integer, Min),
    current_prolog_flag(max_integer, Max),    
    check(Tree, Min, Max).

check(nil, _, _).
check(tr(E, L, R), Min, Max) :-
    E > Min,
    E < Max,
    check(L, Min, E),
    check(R, E, Max). 

