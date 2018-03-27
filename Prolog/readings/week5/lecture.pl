% arguement indexed?
% parent(queen_elizabeth, X), parent(X, Y).
%
siblings(Sib1,Sib2) :-
        parent(Parent, Sib1),
        parent(Parent, SIb2),
        Sib1 \= Sib2.


