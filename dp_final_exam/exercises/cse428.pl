% % Q1
% % 1 TODO
% brother(X,Y) :-
%     father(F,X),
%     father(F,Y),
%     X \= Y.
% 
% % 2 TODO
% cousin(X,Y) :-
%     father(FX,X),
%     father(FY,Y),
%     brother(FX,FY).
% 
% % 3
% grandson(X,Y) :-
%     father(Z,X),
%     father(Y,Z).
% 
% % 4 TODO
% descendent(X,Y) :-
%     father(Y,X).
% descendent(X,Y) :-
%     father(Z,X),
%     descendent(Z,Y).


% Q2
rev(L1,L2) :- rev(L1,[],L2).

rev([],L2,L2).
rev([L|L1],Acc,L2) :-
    rev(L1,[L|Acc],L2).


% Q3
% 1
member1(X,[X|_]).
member1(X,[_|Rest]) :-
    member1(X,Rest).

% 2
subset([],_).
subset([Elt|L],K) :-
    member(Elt,K),
    subset(L,K).


% 3
disjoint([],_).
disjoint([Elt|L],K) :-
    \+ member(Elt,K),
    disjoint(L,K).

% 4
union([],K,K).
union(L,[],L).
union(L,K,M) :-
    append(L,K,M).

% 5
intersection(L,K,M) :- intersection(L,K,[],M).

intersection([],_,M,M).
intersection([Elt|L],K,Acc,M) :-
    (member(Elt,K) ->
        intersection(L,K,[Elt|Acc],M)
    ;   intersection(L,K,Acc,M)
    ).

% 6
difference(L,K,M) :- difference(L,K,[],M).

difference([],_,M,M).
difference([Elt|L],K,Acc,M) :-
    (\+ member(Elt,K) ->
        difference(L,K,[Elt|Acc],M)
    ;   difference(L,K,Acc,M)
    ).


% Q4
length1(L,N) :- length1(L,0,N).

length1([],N,N).
length1([_|Xs],A,N) :-
    A1 is A + 1,
    length1(Xs,A1,N).


% Q5
occurrences(X,L,N) :- occurrences(X,L,0,N).

occurrences(_,[],N,N).
occurrences(X,[Head|Rest],A,N) :-
    (X = Head ->
        A1 is A + 1,
        occurrences(X,Rest,A1,N)
    ;   occurrences(X,Rest,A,N)
    ).


% Q6
occurs(L,N,X) :- occurs(L,N,0,X).

occurs([Head|Rest],N,A,X) :-
    (Head \= X ->
        A1 is A + 1,
        occurs(Rest,N,A1,X)
    ;   A = N,
        true
    ).


% Q7
sumlist(L,N) :- sumlist(L,0,N).

sumlist([],N,N).
sumlist([Head|Rest],A,N) :-
    A1 is A + Head,
    sumlist(Rest,A1,N).


% Q8
add_up_list(L,K) :- 
    add_up_list(L,0,[],K1),
    reverse(K1,K).

add_up_list([],_,K,K).
add_up_list([Head|Rest],Sum,Acc,K) :-
    Sum1 is Sum + Head,
    add_up_list(Rest,Sum1,[Sum1|Acc],K).

% TODO
% fibo(L,K) :- 
%     fibo(L,0,[],K1),
%     reverse(K1,K).
% 
% fibo([],_,K,K).
% fibo([Elt1,Elt2|Rest],Sum,Acc,K) :-
%     Sum1 is Elt1 + Elt2,
%     fibo([Elt2|Rest],Sum1,[Sum1|Acc],K).


% Q9
quicksort([],[]).
quicksort([P|Rest],K) :-
    filter(>(P),Rest,Lesser),
    filter(=<(P),Rest,Greater),
    append(Lesser,[P|Greater],K).


% TRO
quicksort1(L,K) :- quicksort1(L,[],K).

quicksort1([],K,K).
quicksort1([P|Rest],Acc,K) :-
    filter(>(P),Rest,Lesser),
    filter(=<(P),Rest,Greater),
    quicksort1(Lesser,Acc1,K),
    Acc1 = [P|K1],
    quicksort1(Greater,Acc,K1).

% call(>(0),Elt). call(=<(0),Elt).
filter(Pred,List,Filtered) :- filter(Pred,List,[],Filtered).

filter(_,[],Filtered,Filtered).
filter(Pred,[Elt|Rest],Acc,Filtered) :-
    (call(Pred,Elt) ->
        Acc1 = [Elt|Acc],
        filter(Pred,Rest,Acc1,Filtered)
    ;   
        filter(Pred,Rest,Acc,Filtered)
    ).

% Q11
% 1
preorder(T,L) :- preorder(T,[],L).

preorder(empty,L,L).
preorder(consbt(N,T1,T2),A,L) :-
    preorder(T1,A1,L),
    A1 = [N|L1],
    preorder(T2,A,L1).

%2
search_tree([],empty).
search_tree([Head|Rest],consbt(Elt,T1,T2)) :-
    length(Rest,Len),
    Len1 is Len // 2,
    length(Front,Len1),
    append(Front,[Elt|Back],[Head|Rest]),
    search_tree(Front,T1),
    search_tree(Back,T2).


