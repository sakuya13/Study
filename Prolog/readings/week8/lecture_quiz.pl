% filter(Predicate, List, Filtered)

filter(_, [], []).
filter(P, [X|Xs], Filtered) :-
    ( call(P, X) ->
        Filtered = [X|Filtered1]
    ;   Filtered = Filtered1
    ).
    filter(P, Xs, Filtered1).

