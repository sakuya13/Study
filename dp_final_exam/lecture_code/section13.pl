% rememver haskell vannishing (++)?
% use if-then-else or indexing?


fact0(N,F) :-
    (N =:= 0 ->
        F = 1
    ;   N > 0,
        N1 is N - 1,
        fact0(N1,F1),
        F is F1 * N
    ).

% TRO1
fact(N,F) :- fact1(N,1,F).

fact1(N,A,F) :-
    (N =:= 0 ->
        F = A
    ;   N > 0,
        N1 is N - 1,
        A1 is A * N,
        fact1(N1,A1,F)
    ).


% TRO2: a while loop
f(N,F) :- f1(N,1,F).

f1(N,A,F) :-
    (N > 0,
        N1 is N - 1,
        A1 is A * N,
        f1(N1,A1,F)
    ;   N =:= 0 ->
        F = A
    ).


% Quiz: multiplication
% mode: multiply(In,In,Out).
multiply0(X,Y,XY) :-
    (X=0 ->
        XY = 0
    ;   
        X1 is X - 1,
        multiply0(X1,Y,X1Y),
        XY is X1Y + Y
    ).

% TRO
multiply(X,Y,XY) :- multiply1(X,Y,0,XY).

multiply1(X,Y,A,XY) :-
    (X =:= 0 ->
        XY = A
    ;
        X1 is X - 1,
        A1 is A + Y,
        multiply1(X1,Y,A1,XY)
    ).


% rev1/2
rev1([],[]).
rev1([A|BC],CBA) :-
    rev1(BC,CB),
    append(CB,[A],CBA).

% TRO when doing list, no need to evaluate all those value like above
% so the code become more elegent and concise
rev2(Xs,Ys) :- rev2(Xs,[],Ys).

rev2([],Acc,Acc).
rev2([X|Xs],Acc,Ys) :-
    rev2(Xs,[X|Acc],Ys).


% difference pairs
generate_whole(X,L,L0) :-
    generate_first_part(X,L,L1),
    generate_second_part(X,L1,L0).



% workshops

% sumlist/2
sumlist([],0).
sumlist([N|Ns],Sum) :-
    sumlist(Ns,Sum0),
    Sum is N + Sum0.

% TRO
sumlist1(Ns,Sum) :- sumlist1(Ns,0,Sum).

sumlist1([],A,A).
sumlist1([N|Ns],A,Sum) :-
    A1 is A + N,
    sumlist1(Ns,A1,Sum).




















