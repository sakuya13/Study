% Qestion 4
p(a). p(b).

q(a,b). q(b,a). q(a,a). q(b,b).

r(a,c). r(d,b).

s(a,b).


% Question 5



% Qustion 6
% sumlist TRO
sumlist(List,Sum) :- sumlist(List,0,Sum).

sumlist([],Sum,Sum).
sumlist([N|Ns],Sum0,Sum) :-
    Sum1 is Sum0 + N,
    sumlist(Ns,Sum1,Sum).


