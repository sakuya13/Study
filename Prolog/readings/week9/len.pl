% withour TRO
len2([], 0).
len2([_|Xs], N) :-
    len(Xs, N1),
    N is N1 + 1.

% with TRO, works when length is unknown
len([], 0).
len(L, N) :- len(L, 1, N).
len(L, A, N) :-
    ( L = [_] ->
        N = A
    ;   L = [_|Xs],
        A1 is 1 + A,
        len(Xs, A1, N)
    ).




% choose between len3 and len1 based on the input
len4(L, N) :-
    ( integer(N) ->
        len3(L, N)
    ;   nonvar(L), % why throw error here (lecturenotes, p.section14, slides 14)? 
        len1(L, 0, N)
    ).

% with TRO, works when length is known
len3(L, N) :-
    ( N =:= 0 ->
        L = []
    ;   N1 is N - 1,
        L = [_|L1],
        len3(L1, N1)
    ).

% works when list is known
len1([], N, N).
len1([_|List], N0, N) :-
    N1 is N0 + 1,
    len1(List, N1, N).

