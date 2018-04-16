:- ensure_loaded(borders).
:- ensure_loaded(cities).
:- ensure_loaded(countries).
:- ensure_loaded(rivers).

% Q4
country(C) :- country(C,_,_,_,_,_,_,_).


% Q5
larger(C1,C2) :-
    country(C1,_,_,_,P1,_,_,_),
    country(C2,_,_,_,P2,_,_,_),
    P1 > P2.

% wrong answer?
larger1(C1, C2) :-
    area1(C1, A1),
    area1(C2, A2),
    A1 > A2.

area1(C, _A) :-
    country(C,_,_,_,_A_,_,_,_).


larger2(C1, C2) :-
	area2(C1, Area1),
	area2(C2, Area2),
	Area1 > Area2.

area2(Country, Area) :-
	country(Country,_,_,_,Area,_,_,_).

% Q6
river_country(River, Country) :-
    river(River, Countries),
    country(Country),
    member(Country, Countries).

country_region(Country, Region) :-
    country(Country, Region,_,_,_,_,_,_).

% query:
% river_country(R, C1),
% river_country(R, C2),
% country_region(C1, Region1),
% country_region(C2, Region2),
% Region1 \= Region2.
%
