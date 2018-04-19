% transform multiply to a TRO tail recursive multiply
multiply(X, Y, XY) :-
    ( X = 0
    ->  XY = 0
    ;   X1 is X - 1,
        multiply(X1, Y, X1Y),
        XY is X1Y + Y
    ).


% TRO ver, the accumulator is the computing result of X1Y + Y
multiply1(X, Y, 0, XY).
multiply1(X, Y, A, XY) :-
    ( X = 0
    ->  XY = A
    ;   X1 is X - 1,
        A1 is A + Y,
        multiply1(X1, Y, A1, XY)
    ).



