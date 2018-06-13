% week7
% Q1
%list_of(Elt,[Elt]).
list_of(_,[]).  % this automatically holds for an empty list, no matter what the element is.
list_of(Elt,[Elt|Elts]) :-
    list_of(Elt,Elts).

% Q2
%all_same([]).
%all_same([_]).
%all_same([X|Xs]) :- list_of(X,Xs).
all_same(List) :- list_of(_,List).

% Q3
adjacent1(E1,E2,List) :-
    append(_,[E1,E2|_],List).


% Q4
adjacent(E1,E2,[E1,E2|_]).
adjacent(E1,E2,[_|Rest]) :-
    adjacent(E1,E2,Rest).


% Q5
before(E1,E2,[E1|Rest]) :-
    member(E2,Rest).
before(E1,E2,[_|Rest]) :-
    before(E1,E2,Rest).


% Q6
intset_member(N,tree(_,N,_)).
intset_member(N,tree(Left,N0,_)) :-
    N < N0,
    intset_member(N,Left).
intset_member(N,tree(_,N0,Right)) :-
    N > N0,
    intset_member(N,Right).

% TODO
intset_insert(N,empty,tree(empty,N,empty)).
intset_insert(N,tree(L,N,R),tree(L,N,R)).
intset_insert(N,tree(L0,N0,R),tree(L,N0,R)) :-
    N < N0,
    intset_insert(N,L0,L).
intset_insert(N,tree(L,N0,R0),tree(L,N0,R)) :-
    N > N0,
    intset_insert(N,R0,R).


% week8
% Q2
tree(empty).
tree(node(Left,_,Right)) :-
    tree(Left),
    tree(Right).


tree_list0(empty,[]).
tree_list0(node(Left,Elt,Right),List) :-
    tree_list0(Left,List1),
    tree_list0(Right,List2),
    append(List1,[Elt|List2],List).

% Q3
tree_list(Tree,List) :- tree_list(Tree,[],List).

tree_list(empty,List,List).
tree_list(node(Left,Elt,Right),Acc,List) :-
    tree_list(Left,Acc1,List),
    Acc1 = [Elt|List1],
    tree_list(Right,Acc,List1).

% Q4
list_tree([],empty).
list_tree([Head|List],node(Left,Elt,Right)) :-
    length(List,Len),
    Len1 is Len // 2,
    length(Front,Len1),
    append(Front,[Elt|Back],[Head|List]),
    list_tree(Front,Left),
    list_tree(Back,Right).


