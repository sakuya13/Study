% reverse
% mode: rev1(In,Out).
rev1([],[]).
rev1([A|BC],CBA) :-
    rev1(BC,CB),
    append(CB,[A],CBA).

% mode: rev2(Out,In).
rev2([],[]).
rev2([A|BC],CBA) :-
    rev2(BC,CB),
    append(CB,[A],CBA).

% mode: rev3(In,Out).
%       rev3(Out,In).
rev3(ABC,CBA) :-
    samelength(ABC,CBA),
    rev1(ABC,CBA).

samelength([],[]).
samelength([_|Xs],[_|Ys]) :-
    samelength(Xs,Ys).

% Quiz: modes
% which modes will these definition of take/3 work (without hanging)?
% all but take(Out,In,Out).
take(N,List,Front) :-
    length(Front,N),
    append(Front,_,List).

% all but take(In,Out,Out).
take1(N,List,Front) :-
    append(Front,_,List),
    length(Front,N).

% avoid nondeterminism
fact(0,1).
fact(N,F) :-
    N > 0, % avoid nondeterminism
    N1 is N - 1,
    fact(N1,F1),
    F is N * F1.

% avoid choice point
fact1(N,F) :-
    ( N =:= 0 ->
        F = 1
    ; N > 0,
        N1 is N - 1,
        fact(N1,F1),
        F is N * F1
    ).

% prefer indexing more than this
% not correct with modes (not hanging, but incorrect):
% ap(Out,In,In).
% ap(Out,Out,In).
ap(X,Y,Z) :-
    ( X = [] ->
        Z = Y
    ; X = [U|V],
        ap(V,Y,W),
        Z = [U|W]
    ).


