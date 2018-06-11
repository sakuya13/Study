% TODO: what is the semantics of this logic program?
p(1,2). p(2,3). p(2,6). p(3,4).

q(A,B) :- p(A,B).
q(A,C) :- q(A,B), q(B,C).

r(A,C) :- r(A,B), r(B,C).

% all the ground unit clauses including the above four.
q(1,2). q(2,3). q(2,6). q(3,4).

q(1,3). q(1,6). q(2,4).

q(1,4).

% the key is to generate all!
% no clauses for r.

% Quiz: which is more efficient?
% X = prince_charles, parent(X,Y).
% parent(X,Y), X = prince_charles.


