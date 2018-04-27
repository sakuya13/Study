% Q1
% modes make sense: (given, given); (not_given, given).
% infinite result: (given, not_given); (not_given, not_given).
list_of(Elt, [Elt]).
list_of(Elt, [Elt|List]) :-
    list_of(Elt,List).

% Q2
all_same([]).
all_same([_]).
all_same([_|Xs]) :-
    all_same(Xs).

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
before(E1, E2, [_,List]) :-
    before(E1, E2, List).


member(Elt, [Elt|_]).
member(Elt, [_|Rest]) :-
    member(Elt, Rest).



