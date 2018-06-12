% question1
% borders of Australia
% ?- setof(B,borders(australia,B),List).

% ?- borders(australia).

% Question 2
% ?- setof(B,(borders(france,B),borders(spain,B)),List).

% ?- borders(france,B), borders(spain,B).


% Question 3
% setof(C,(country(C,_,_,_,_,_,_,_),borders(france,C),borders(spain,C)),List).


% Question 4
country(C) :- country(C,_,_,_,_,_,_,_).

% country(C),border(france,B),border(spain,B).


% Question 5
area(C,A) :- country(C,_,_,_,A,_,_,_).

larger(C1,C2) :-
    area(C1,A1),
    area(C2,A2),
    A1 > A2.


% Question 6
river_country(River,Country) :-
    river(River,Countries),
    country(Country),
    member(Country,Countries).

country_region(Country,Region) :-
    country(Country,Region,_,_,_,_,_,_).

% TODO: riverflows between countries in different regions
% ?- river_country(River,Country1),
%    river_country(River,Country2),
%    country_region(Country1,Region1),
%    country_region(Country2,Region2),
%    Region1 \= Region2.
%
