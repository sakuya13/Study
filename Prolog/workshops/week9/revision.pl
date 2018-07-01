% Q1
same_elements1(L1,L2) :-
    all_in(L1,L2),
    all_in(L2,L1).

all_in([],_).
all_in([X|Xs],Ys) :-
    member(X,Ys),
    all_in(Xs,Ys).


% Q2 log(N)
same_elements(Xs,Ys) :-
    sort(Xs,L),
    sort(Ys,L).


% Q3

