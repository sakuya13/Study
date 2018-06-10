% relation
%
% this is a predicate, a kind a clause.
% it is also a fact.
parent(queen_elizabeth, prince_charles).
parent(prince_philip, prince_charles).
parent(prince_charles, prince_william).
parent(prince_charles, prince_harry).
parent(princess_diana, prince_william).
parent(princess_diana, prince_harry).

% in swipl these are different modes.
% ?- parent(X, prince_charles).
% ?- parent(X, Y).
% 
% compound queries
% ?- parent(queen_elizabeth, X), parent(X, Y).
%
% Quiz: find the grandparent(s) of Prince Harry.
% rules Head :- Body
% rule is a kind of clause.
grandparent(X, Z) :- parent(X, Y), parent(Y,Z).

% recursion
ancestor(Anc, Desc) :-
    parent(Anc, Desc).
ancestor(Anc, Desc) :-
    parent(Parent, Desc),
    ancestor(Anc, Parent).

% single-assignment
% ?- X = 7.
% X = 7.
% ?- a = b.
% false.
% ?- X = 7, X = a.
% false.
% ?- X = 7, X = 8, X = Y.
% false.

% disjunction
% parent of queen or princess?
% ?- parent(queen_elizabeth, X) ; parent(princess_diana, X).

% Negation
% ?- parent(X, prince_william). \+ X = prince_charles.
% 
% disequality
% ?- parent(X, prince_william). X \= prince_charles.

% Quiz: siblings
siblings(Sib1, Sib2) :-
    parent(X, Sib1),
    parent(X, Sib2),
    \+ Sib1 = Sib2.

% execution order: ensure all variables in a negated goal are bound 
% before the goal is executed.
% ?- (parent(X,_); parent(_,X)), X \= queen_elizabeth.

% datalog

