% Section 10

% QUIZ: Unification
% branch(branch(leaf(X), leaf(b)), leaf(Z))
% branch(branch(leaf(a), leaf(Y)), leaf(Z))
% 
% branch(branch(leaf(X), leaf(X)), leaf(Z))
% branch(branch(leaf(a), leaf(b)), leaf(c))

% the position of elements in compound term matters. 
% branch(branch(leaf(X),leaf(b)), leaf(Z))
% branch(leaf(a), branch(leaf(Y), leaf(Z)))

% X = leaf(X) impossible! Prolog only deal with finite terms.
% branch(X, 1, X)
% branch(leaf(X), Z, Y)

% check if somthing is a list.
% valid but get a warning.
proper_list([]).
proper_list([Head|Tail]) :-
    proper_list(Tail).

% _Head or _ to avoid warning.
proper_list1([]).
proper_list1([_Head|Tail]) :-
    proper_list1(Tail).

% append
append1([], C, C).
append1([A|B], C, [A|BC]) :-
    append1(B, C, BC).

% take
take(N, List, Front) :-
    length(Front, N),
    append(Front, _, List).

% drop faster ver.
drop(N, List, Back) :-
    length(Front, N),
    append(Front, Back, List).
 
drop1(N, List, Back) :-
    length(List, M),
    L is M-N,
    length(Back, L),
    append(_, Back, List).
 
% membership
member1(Elt, List) :-
    append(_, [Elt|_], List).

% more efficient
member2(Elt, [Elt|_]).
member2(Elt, [_|Rest]) :-
    member2(Elt, Rest).

% only works for the pattern of square(5, X).
square(N, N2) :-
    N2 is N * N.


% Section 11
% reverse ver 1, only works for the pattern rev1([a,b,c], X).
rev1([], []).
rev1([A|BC], CBA) :-
    rev1(BC, CB),
    append(CB, [A], CBA).

% ver2, only works for the pattern rev2(X, [a,b,c]).
rev2([], []).
rev2([A|BC], CBA) :-
    append(CB, [A], CBA),
    rev2(BC, CB).

% reverss ver 2 
rev3([], []).
rev3([A|BC], CBA) :-
    length([A|BC], N),
    length(CBA, N),
    append(CB, [A], CBA),
    rev3(BC, CB).

% two list with the same length 
samelength([], []).
samelength([_|Xs], [_|Ys]) :-
    samelength(Xs, Ys).

%rev4([], []).
rev4(ABC, CBA) :-
    samelength(ABC, CBA),
    rev1(ABC, CBA).
    %    rev4(BC, CB),
    %    append(CB, [A], CBA).

rev5([], []).
rev5([A|BC], CBA) :-
    samelength([A|BC], CBA),
    rev5(BC, CB),
    apppend(CB, [A], CBA).

% QUIZ: Modes
% % all modes hang but (out,in,out).
take1(N, List, Front) :-
    length(Front, N),
    append(Front, _, List).

% all modes hang but (in,out,out).
% doubt if this is the right answer.
take2(N, List, Front) :-
    append(Front, _, List),
    length(Front, N).


revTro([], A, A).
revTro([B|CD], A, DCBA) :-
    revTro(CD, [B|A], DCBA).


