% maplist in swilp
map(_, [], []).
map(P, [X|Xs], [Y|Ys]) :-
    call(P, X, Y),
    map(P, Xs, Ys).


