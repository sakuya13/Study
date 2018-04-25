% transform multiply to a TRO tail recursive multiply
multiply_old(X, Y, XY) :-
    ( X = 0
    ->  XY = 0
    ;   X1 is X - 1,
        multiply_old(X1, Y, X1Y),
        XY is X1Y + Y
    ).


% TRO ver, the accumulator is the computing result of X1Y + Y
multiply(X, Y, XY) :-
    multiply1(X, Y, 0, XY).

multiply1(X, Y, A, XY) :-
    ( X = 0
    ->  XY = A
    ;   X1 is X - 1,
        A1 is A + Y,
        multiply1(X1, Y, A1, XY)
    ).


test1(R) :-
    time(multiply(999999,999999,R)).
