% Q1
% modes make sense: (given, given); (not_given, given).
% infinite result: (given, not_given); (not_given, not_given).
list_of(Elt, [Elt]).
list_of(Elt, [Elt|List]) :-
    list_of(Elt,List).

% Q2
% wrong ver
all_same([]).
all_same([_]).
all_same([_|Xs]) :-
    all_same(Xs).


all_same1([_]).
all_same1([X,X]).
all_same1([X,Y|List]) :-
    X = Y,
    all_same1([Y|List]).


% Q3
%adjacent(E1, E2, List) :-
%    append([E1], List, [E1,E2|List]).

adjacent(E1, E2, List) :-
    append(_, [E1,E2|_], List).

% Q4
adjacent1(E1, E2, [E1, E2|_]).
adjacent1(E1, E2, [_|List]) :-
    adjacent1(E1, E2, List).

% Q5
before(E1, E2, [E1|List]) :-
    member(E2, List).
before(E1, E2, [_|List]) :-
    before(E1, E2, List).


member(Elt, [Elt|_]).
member(Elt, [_|Rest]) :-
    member(Elt, Rest).


% Q6-1
intset_member(N, tree(_, N, _)).
intset_member(N, tree(L, M, _)) :-
    N < M,
    intset_member(N, L).
intset_member(N, tree(_, M, R)) :-
    N > M,
    intset_member(N, R).


% Q6-2
intset_insert(N, empty, tree(empty, N, empty)).
intset_insert(N, tree(L, N, R), tree(L, N, R)).
intset_insert(N, tree(L0, N0, R), tree(L, N0, R)) :-
    N < N0,
    intset_insert(N, L0, L).
intset_insert(N, tree(L, N0, R0), tree(L, N0, R)) :-
    N > N0,
    intset_insert(N, R0, R).

pig(fat).
cat(cute).
look(pig,fat).
look(cat,cute).
