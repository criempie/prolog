% task1
creverse(Lst, RLst) :- creverse_(Lst, RLst, []).
creverse_([], RLst, RLst).
creverse_([H|T], RLst, Curr) :-
    creverse_(T, RLst, [H|Curr]).

charEq(A1, A2) :-
    char_code(A1, C1),
    char_code(A2, C2),
    Diff is abs(C1-C2),
    (0 is Diff ; 32 is Diff).

checkListCharEq([], []).
checkListCharEq([H1|T1], [H2|T2]) :-
    charEq(H1, H2),
    checkListCharEq(T1, T2).

palindrome(Lst) :-
    creverse(Lst, RLst),
    checkListCharEq(Lst, RLst).

% task2
prime(1).
prime(2).
prime(3).

prime(A) :-
    A > 3,
    A mod 2 =\= 0,
    prime_(A, 3).

prime_(N, I) :- I * I > N.
prime_(N, I) :-
    I * I =< N,
    N mod I =\= 0,
    I1 is I + 2,
    prime_(N, I1).

filterPrime([H1|T1], [H2|T2]) :-
    H1 = H2,
    prime(H1),
    filterPrime(T1, T2).

filterPrime([H1|T1], [H2|T2]) :-
    \+ prime(H1),
    filterPrime(T1, [H2|T2]).

filterPrime([], []).
filterPrime([H1|T1], []) :- \+ prime(H1), filterPrime(T1, []).

% task3
cprefix([H], [H|_]).
cprefix([H1|T1], [H2|T2]) :-
    H1 = H2,
    cprefix(T1, T2).

csublist(S, [H|T]) :-
    cprefix(S, [H|T]);
    csublist(S, T).

% task4
merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], L) :- 
    (   
        H1 < H2 -> L = [H1|R],
                   merge(T1, [H2|T2], R) ;
        H1 > H2 -> L = [H2|R],
                   merge([H1|T1], T2, R) ;
        L = [H1, H2|R],
        merge(T1, T2, R)
    ).


% task5
numlst(0, [0]).
numlst(N, Lst) :-
    var(N),
    numlst_1(1, N, Lst).

numlst(N, Lst) :-
    N > 0,
    numlst_(N, Lst, []).

numlst_(0, R, R).
numlst_(N, Lst, R) :-
    N > 0,
    N1 is N // 10,
    D is N mod 10,
    numlst_(N1, Lst, [D|R]).

numlst_1(I, N, Lst) :-
    numlst(I, Lst),
    N = I;
    I1 is I + 1,
    numlst_1(I1, N, Lst).

