% Several definitions of factorial with various problems or solutions

% infinite backtracking
fact1(0, 1).
fact1(N, F) :-
	N1 is N - 1,
	fact1(N1, F1),
	F is N * F1.

% fixes infinite backtracking, but still creates a choicepoint
fact2(0, 1).
fact2(N, F) :-
	N > 0,
	N1 is N - 1,
	fact2(N1, F1),
	F is F1 * N.


% no choicepoint
fact3(N, F) :-
	(   N =:= 0
	->  F = 1
	;   N > 0,
	    N1 is N - 1,
	    fact3(N1, F1),
	    F is F1 * N
	).

% TRO by adding an accumulator
fact4(N, F) :- fact41(N, 1, F).
fact41(N, A, F) :-
    (   N =:= 0
    ->  F = A
    ;   N > 0,
        N1 is N - 1,
        A1 is A * N,
        fact41(N1, A1, F)
    ).

% TRO by thinking it as a while loop
fact5(N, F) :- fact51(N, 1, F).
fact51(N, A, F) :-
    ( N > 0,
        A1 is A * N,
        N1 is N - 1,
        fact51(N1, A1, F)
    ; N =:= 0
    ->  F = A
    ).


% no choicepoint, even when there should be
% actually false: try ap(L, [c], [b,c]).
% ap(L, M, [b,c]).
ap(X, Y, Z) :-
	(   X = []
	->  Z=Y
	;   X = [U|V],
	    ap(V, Y, W),
	    Z = [U|W]
	).

ap1([], C, C).
ap1([A|B], C, [A|BC]) :-
    ap1(B, C, BC).

% similar but the correct ver of ap.
ap2([], Y, Y).
ap2([A|X], Y, [A|Z]) :-
    ap2(X, Y, Z).

