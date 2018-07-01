% workshop7
% Q1
list_of(_,[]).
list_of(Elt,[Elt|List]) :-
    list_of(Elt,List).


