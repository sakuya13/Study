% Naive reverse, first version.  This does not work correctly when the
% second argument is ground and the first is free.
% Try the goal:  rev(X, [a,b,c]), and ask for more solutions after the first.
rev1([], []).
rev1([A|BC], CBA) :-
        rev1(BC, CB),
        append(CB, [A], CBA).


% Naive reverse, second version.  This works for rev(X, [a,b,c]), but not
% for the goal:  rev([a,b,c], Y).
rev2([], []).
rev2([A|BC], CBA) :-
        append(CB, [A], CBA),
        rev2(BC, CB).


% Naive reverse, third version.  This does work correctly in both directions.
% The key is to ensure that when rev1(BC, CB) is called, BC is bound.
% We do this by noting that the list and its reverse must have the same
% length.

rev3(ABC, CBA) :-
        samelength(ABC, CBA),
	rev1(ABC, CBA).


samelength([], []).
samelength([_|Xs], [_|Ys]) :-
	  samelength(Xs, Ys).

% TRO ver.
frev([], A, A).
frev([B|CD], A, DCBA) :-
    frev(CD, [B|A], DCBA).

% how to read rev1:
% Lets examine the execution of rev1([a,b], Y).
%
% rev1([a,b],Y) 
%
% doesnt match the first rule [a,b] = [], Y = []  has no solutions
%
% matches the second, leaving unification [A|BC] = [a,b], CBA = Y,
% so A = a, BC = [b], The new goal is (the body)
%
% rev1([b], CB), append(CB, [a], Y).
%
% we pick the first literal rev1([b], CB) to match
%
% doesnt match the first rule [b] = [], CB = [] has no solutions
%
% matches the second rule with [A'|BC'] = [b] = [A'|BC'], 
% CBA' = CB (A' = b, BC' = []) giving
%
% rev1([], CB'), append(CB', [b], CB), append(CB, [a], Y)
%
% lets pick the first literal
%
% matches the first rule [] = [], CB' = [] leaving goal
%
% append([], [b], CB), append(CB, [a], Y).
%
% try the first literal. it matches the first rule of append giving [] = [], 
% [b] = Y, CB = Y (or CB = [b]), leaving
%
% append([b], [a], Y)
%
% doest match the first rule, does match the second, giving Y = [b|Z]
%
% append([], [a], Z)
%
% matches the first rule, giving Z = [a]. leaving
%
% [] (nothing, the goal has been proved)
%
% If we look at the substitutions Y = [b,a] 
%
% success!
