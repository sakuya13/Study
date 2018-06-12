% all solutions
% 
% setof/3 (sort and removes duplicates)
% setof(P-C,parent(P,C),List).
% find all the distinct parent-child combinations and bind them to the List.
% setof(P,parent(P,C),List).
% find all the distinct parent of child C and bind them to the List.
%
% existential quantification
% setof(P,C^parent(P,C),List).
% find all the people in the database who are parents of any child.


% bagof/3 (no sorting and remains duplicates)
% bagof(P,C^parent(P,C),List).


% higher order programming

% call/1
% ?- X=append([1,2],[3],L),call(X).
% X = append([1,2],[3],[1,2,3]),
% List = [1,2,3].
% this is the same as:
% ?- X=append([1,2],[3],L),X.
% 
% ?- X=append(A,B,[1]),X.
% append([1],[],[1]),
% A = [1],
% B = [];
% append([],[1],[1]),
% A = [],
% B = [1];
% false.


% currying
% ?- X = append([1,2],[3]), call(X,L).
% X = append([1,2],[3]),
% L = [1,2,3].

% map/3
% plus(X,Y,Z). is X + Y = Z.
map(_,[],[]).
map(P,[X|Xs],[Y|Ys]) :-
    call(P,X,Y),
    map(P,Xs,Ys).
% ?- X = 1, call(plus(1),X,Y).
% X = 1,
% Y = 2.

% TODO: Quiz: filter(Pred, List, Filtered).
filter(_,[],[]).
filter(P,[X|Xs],Filtered) :-
    (call(P,X) -> % ?- P = <(0),call(P,1). -> P = <(0). (there is a hidden true).
                  % ?- P = >(0),call(P,1). -> false.
                  % <(0) X can be seen as 0 < X.
        Filtered = [X|Filtered1]
    ;   Filtered = Filtered1
    ), 
    filter(P,Xs,Filtered1).
% filter(<(0),[-5,5,-2,2]).
% predicate <(0) means whether the argument it takes is larger than 0?


% similar haskell ver.
% filter :: (a -> Bool) -> [a] -> [a]
% filter _ [] = []
% filter f (x:xs) =
%     if f x then x:filtered
%     else filtered
%     where
%         filtered = filter f xs


% comparing

% @<, @=<, @>=, @>
% Variables < Numbers < Atoms < CompoundTerms
% X @< 1 @< a @< p(a,b).
% ?- hello @< hi.  compare first, then second, then...
% true.
% ?- X @< 7, X = foo.  there is a hidden true.
% X = foo, X @< 7.
% false.


% sorting
%
% sort/2: sort removing duplicates
% msort/2: sort without removing duplicates
% keysort/2: sort based on key
% ?- keysort([7-a,3-c,3,b],L).
% L = [3-c,3-b,7-a].


% term types
%
% integer/1
% float/1
% number/1: recognises either integer or float
% atom/1
% compound/1
% ?- integer(1).
% true.
% ?- integer(a).
% false.
% ?- integer(X).
% false.
% all of them fails for variables

% var/1: holds for unbound variables
% nonvar/1: holds for any term other than unbound variable
% ground/1: holds for ground terms (will traverse through the term)
%
% use them for differnt modes
% mode: len2(Out,In).
len2(L,N) :-
    (N =:= 0 ->
        L = []
    ;   N1 is N - 1,
        L = [_|L1],
        len2(L1,N1)
    ).

% mode: len1(In, 0, Out).
%       len1(Out,0, Out).
%
 len1([],N,N).
 len1([_|L],N0,N) :-
     N1 is N0 + 1,
     len1(L,N1,N).

% using type tests
len(L,N) :-
    (integer(N) ->
        len2(L,N)
    ;   nonvar(N) ->
        throw(error(type_error(integer,N), context(len/2,'')))
    ;   
        len1(L,0,N)
    ).









