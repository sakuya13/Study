% Q1
% sumlist/2
sumlist(Ns,Sum) :- sumlist(Ns,0,Sum).

sumlist([],Sum,Sum).
sumlist([N|Ns],A,Sum) :-
    A1 is A + N,
    sumlist(Ns,A1,Sum).


% Q2
tree(empty).
tree(node(Left,_,Right)) :-
    tree(Left),
    tree(Right).


% mode: tree_list(In,Out)
tree_list(empty,[]).
%tree_list(node(empty,N,empty),[N]).
tree_list(node(Left,N,Right),Ns) :-
    tree_list(Left,Ns1),
    tree_list(Right,Ns2),
    append(Ns1,[N|Ns2],Ns).


% Q3 TRO of Q2
tree_list1(Tree,List) :- tree_list1(Tree,[],List).

tree_list1(empty,List,List).
tree_list1(node(Left,N,Right),Acc,List) :-
    tree_list1(Left,Acc1,List), % 3. Acc1, with root and right side in it
                                %    starts taking in nodes from left tree
                                %    the List here is the final list
    Acc1 = [N|List1], % 2. now Acc has filled with List1 and root value
    tree_list1(Right,Acc,List1). % 1.just like haskell ver
                                 %   Acc here accumulate from [] to taking in
                                 %   Nodes from Right tree,
                                 %   the result is List1, the right side of the
                                 %   list


% Q4 build a balenced tree
list_tree([],empty).
list_tree([E|List],node(Left,Elt,Right)) :-
    length(List,Len),
    Len1 is Len // 2,
    length(Front,Len1),
    %    length(Rest,Len1), % cant make Front and Back the same length
    %                       % 
    append(Front,[Elt|Rest],[E|List]),
    list_tree(Front,Left),
    list_tree(Rest,Right).






