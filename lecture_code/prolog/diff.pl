
first_part(X,L) :- fpart(X,0,L).
fpart(X, I, L) :-
     (X = I -> 
        L = []
     ;
        L = [I|L1],
        I1 is I + 1,
        fpart(X,I1,L1)
     ).

second_part(X, L) :-
     (X = 0 ->
        L = []
     ;
        L = [X|L1],
        X1 is X-1,
        second_part(X1,L1)
     ).

whole(X,L) :- first_part(X,L1), second_part(X,L2), append(L1,L2,L).

whole(X,L) :- diffl_whole(X,L,[]).

diffl_whole(X,L,L0) :-
   	diffl_first_part(X,L,L1),
	diffl_second_part(X,L1,L0).

diffl_first_part(X,L,L0) :- diffl_fpart(X,0,L,L0).
diffl_fpart(X, I, L, L0) :-
      (X = I ->
           L = L0
      ;
           L = [I|L1],
           I1 is I + 1,
	   diffl_fpart(X,I1,L1, L0)
      ). 

diffl_second_part(X, L, L0) :-
     (X = 0 ->
        L = L0
     ;
        L = [X|L1],
        X1 is X-1,
        diffl_second_part(X1,L1,L0)
     ).
