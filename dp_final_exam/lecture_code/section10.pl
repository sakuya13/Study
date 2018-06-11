% all data structures are called terms
% atomic or compound, or can be a variable
% datalog has only atomic terms and variables..
love(fat, cat).

% compound terms
% each compound term is a functor
% tree
%     1
%  L     2
%     L     L
node(leaf, 1, node(leaf, 2, leaf)).

% f(A,A).
% f(_,_).
% [X1, X2 | Xs].

% ground term
% contains no variable
% 3.
% f(a, b).

% substitutions
% node(leaf,1,leaf).
% is an instance of node(X1,X2,X3).

% TODO: unification
% the substitution {X -> a,Y -> b} is the unifier of the terms
% f(X,b). and f(a,Y).

% Quiz: what substitution unifies the term
branch(branch(leaf(X),leaf(b)), leaf(Z)).
branch(branch(leaf(a),leaf(Y)), leaf(Z)).
% {X -> a, Y -> b}
branch(branch(leaf(X),leaf(X)), leaf(Z)).
branch(branch(leaf(a),leaf(b)), leaf(c)).
% none
branch(branch(leaf(X),leaf(b)), leaf(Z)).
branch(leaf(a), branch(leaf(Y), leaf(Z))).
% none. the first arguments of the top-level branch have different
% function symbols (functors) in the two terms.

% proper list
proper_list([]).
proper_list([_Head|Tail]) :-
    proper_list(Tail).

% append
% modes
% append1(Out, In, In).
% append1(In, Out, In).
% append1(Out, Out, In).
append1([],C,C).
append1([A|B],C,[A|BC]) :-
    append1(B,C,BC).

% TODO: length
% TRO
% len([1,2,3,4],0,N).
len([], N, N).
len([_|Xs], N0, N) :-
    N1 is N0 + 1,
    len(Xs, N1, N).

% take(N,List,Front).
take(N,List,Front) :-
    length(Front,N),
    append(Front,_,List).

% Quiz: drop(N,List,Back)
drop(N,List,Back) :-
    length(Front,N), % should be front, because we drop the first N elts (N not included in back)
    append(Front,Back,List).

% member
% member1 more efficient
member1(Elt,[Elt|_]).
member1(Elt,[_|Rest]) :- member1(Elt,Rest).

member2(Elt,List) :- append(_, [Elt|_], List).


% arithmetic
% only 'is' evaluates expressions
% ?- X = 6 * 7.
% X = 6*7.
% ?- X is 6*7.
% X = 42.
square(N, N2) :- N2 is N*N.
% only mode (In,Out) works.

% todo: less or equal: =<
%       equal/not equal (number): =:=  =\=







