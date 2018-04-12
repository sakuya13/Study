% branch(branch(leaf(X), leaf(X)), leaf(Z))
% branch(branch(leaf(a), leaf(b)), leaf(c))
% 
% 
% branch(X, 1, X)
% branch(leaf(X), Z, Y)
% 
drop(N, List, Back) :-
    length(List, M),
    L is M-N,
    length(Back, L),
    append(_, Back, List).

drop(N, List, Back) :-
    length(Front,N),
    append(Front, Back, List).

rev4([], []).
rev4([A|BC], CBA) :-
    length(ABC, N),
    length(CBA, N),
    append(CB, [A], CBA),
    rev4(BC, CB).

% all modes but (out,in,out).
take(N, List, Front) :-
    length(Front, N),
    append(Front, _, List).

% all modes but (in,out,out).
take(N, List, Front) :-
    append(Front, _, List),
    length(Front, N).


