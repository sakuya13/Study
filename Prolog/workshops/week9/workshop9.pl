% Q1
same_elements(L1, L2) :-
    all_in(L1, L2),
    all_in(L2, L1).

all_in([], _).
all_in([E|Es], List) :-
    member(E, List),
    all_in(Es, List).

member(E, [E|_]).
member(E, [_|List]) :-
    member(E, List).


% Q2
same_elements1(L1, L2) :-
    sort(L1, Sorted), % generate Sorted based on L1
    sort(L2, Sorted). % returns true if L2 is identical to Sorted


% Q3
times(W,X,Y,Z) :-
    ( integer(W) ->
        Ybound is abs(W) - 1,
        Ybound >= 0,
        ( integer(X) ->
            between(0, Ybound, Y),
            Z is W * X + Y,
            Y is Z - W * X
        ; integer(Z) ->
            ( Z < 0 ->
                X is (Z - Ybound) // W,
                Y is Z - W * X
            ;   X is Z // W,
                Y is Z rem W
            )
        ; throw(error(instantiation_error, context(times/4,_)))
        ) 
    ; throw(error(type_error(integer,W), context(times/4,_)))
    ).

% M div N rounds down, while M // N rounds towards zero (when 
% negative). M mod N produces a negative result when N is negative
% while M rem N produces a negative result when M is negative
% so have to pair // with rem and pair div with mod.
% e.g. 
% 3 div -2 = -2,
% 3 rem -2 = 1,
% (-2)*(-2)+1 = 5.
% or
% 3 // -2 = -1,
% 3 mod -2 = -1,
% (-2)*(-1)-1=1
% both not equals to 3, so both false.
%

% Q4
containers(Moves) :-
    

fill(To).
empty(From).
