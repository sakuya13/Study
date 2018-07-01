% Qestion 4
p(a). p(b).

q(a,b). q(b,a). q(a,a). q(b,b).

r(a,c). r(d,b).

s(a,b).


% Question 5
intset_insert(N,empty,tree(empty,N,empty)).
intset_insert(N,tree(L,N,R),tree(L,N,R)).
intset_insert(N,tree(L0,N0,R),tree(L,N0,R)) :-
    N < N0,
    intset_insert(N,L0,L).
intset_insert(N,tree(L,N0,R0),tree(L,N0,R)) :-
    N > N0,
    intset_insert(N,R0,R).


% Qustion 6
% sumlist TRO
sumlist(List,Sum) :- sumlist(List,0,Sum).

sumlist([],Sum,Sum).
sumlist([N|Ns],Sum0,Sum) :-
    Sum1 is Sum0 + N,
    sumlist(Ns,Sum1,Sum).


