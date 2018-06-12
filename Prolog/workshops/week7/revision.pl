% Question 1
% list_of/2
list_of(Elt,[Elt]).
list_of(Elt,[Elt|Xs]) :-
    list_of(Elt,Xs).
% all modes: <In,In>, <Out,In>, <In,Out> (infinite).


% Question 2
% all_same/1
all_same([]).
all_same([_]).
all_same([Elt1,Elt2|List]) :-
    Elt1 = Elt2,
    all_same([Elt2|List]).


% Question 3
% TODO: adjacent/3
adjacent1(E1,E2,List) :-
    append(_,[E1,E2|_],List).
% works in any mode.

% TODO: Question 4
% adjacent2(E1,E2,[E1,E2]).
adjacent2(E1,E2,[E1,E2|_]).
adjacent2(E1,E2,[_|Rest]) :-
    adjacent2(E1,E2,Rest). 


% Question 5
% before/3
before(E1,E2,[E1|Tail]) :-
    member(E2,Tail).
before(E1,E2,[_|Tail]) :-
    before(E1,E2,Tail).


% TODO: Question 6
% tree(L,N,R).
% insert_member/2.
insert_member(N,tree(_,N,_)).
insert_member(N,tree(L,N0,_)) :-
    N < N0,
    insert_member(N,L).
insert_member(N,tree(_,N0,R)) :-
    N > N0,
    insert_member(N,R).

% intset_insert/3
intset_insert(N,empty,tree(empty,N,empty)).
intset_insert(N,tree(L,N,R),tree(L,N,R)).
intset_insert(N,tree(L0,N0,R),tree(L,N0,R)) :-
    N < N0,
    intset_insert(N,L0,L).
intset_insert(N,tree(L,N0,R0),tree(L,N0,R)) :-
    N > N0,
    intset_insert(N,R0,R).


