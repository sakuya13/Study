% Q1 sumlist/2
sumlist1([], 0).
sumlist1([N|Ns], Sum) :-
    sumlist1(Ns, Sum0),
    Sum is N + Sum0.

sumlist([N|Ns], A, Sum) :-
    ( N =:= 0 ->
        Sum = A
    ;   N > 0, 
        A1 is N + A,
        sumlist(Ns, A1, Sum)
    ).

% Q2 
tree(empty).
tree(node(Left, _, Right)) :-
    tree(Left),
    tree(Right).

tree_list(empty, []).
tree_list(node(Left, Elt, Right), List) :-
    tree_list(Left, List1),
    tree_list(Right, List2),
    append(List1, [Elt|List2], List).

% Q3
tree_list1(Tree, List) :-
    tree_list1(Tree, List, []).

tree_list1(empty, List, List).
tree_list1(node(Left, Elt, Right), List, List0) :-
    tree_list1(Left, List, List1),
    List1 = [Elt|List2],
    tree_list1(Right, List2, List0).



