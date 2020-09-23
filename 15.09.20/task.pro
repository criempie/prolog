% Задача 3.

even(A) :- A mod 2 =:= 0.

% Задача 4.

d_factorial(0, 1).
d_factorial(1, 1).
d_factorial(N, R) :-
    N > 1,
    N1 is N - 2,
    d_factorial(N1, R1),
    R is R1 * N.

% Задача 5.

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

% Задача 6.

sirakuz(N, A0) :-
    sirakuz_(N, A0).

sirakuz_(0, _).
sirakuz_(N, A) :-
    N > 0,
    A mod 2 =:= 0,
    A1 is A div 2,
    write(A), nl,
    N1 is N - 1,
    sirakuz_(N1, A1).

sirakuz_(N, A) :-
    N > 0,
    A mod 2 =\= 0,
    A1 is (A * 3) + 1,
    write(A), nl,
    N1 is N - 1,
    sirakuz_(N1, A1).

% Задача 7.

nextDate(date(M1, D1), date(M2, D2)) :-
    M1 = M2,
    D2 is D1 + 1,
    date(M2, D2).

nextDate(date(M1, D1), date(M2, D2)) :-
    nextMouth(M1, M2),
    numOfDays(M1, D1),
    D2 is 1,
    date(M2, D2).

date(Mouth, Date) :-
    Date > 0,
    numOfDays(Mouth, R), 
    Date =< R.

numOfDays(jan, 31).
numOfDays(feb, 28).
numOfDays(mar, 31).
numOfDays(apr, 30).
numOfDays(may, 31).
numOfDays(jun, 30).
numOfDays(jul, 31).
numOfDays(aug, 31).
numOfDays(sep, 30).
numOfDays(oct, 31).
numOfDays(nov, 30).
numOfDays(dec, 31).

nextMouth(jan, feb).
nextMouth(feb, mar).
nextMouth(mar, apr).
nextMouth(apr, may).
nextMouth(may, jun).
nextMouth(jun, jul).
nextMouth(jul, aug).
nextMouth(aug, sep).
nextMouth(sep, oct).
nextMouth(oct, nov).
nextMouth(nov, dec).
nextMouth(dec, jan).