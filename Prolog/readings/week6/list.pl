% proper_list([]).
% proper_list([Head|Tail]) :-
%         proper_list(Tail).

proper_list([]).
proper_list([_|Tail]) :-
    proper_list(Tail).

% similar to ++ in Haskell
my_append([], C, C).
my_append([A|B], C, [A|BC]) :-
    my_append(B, C, BC).

my_take(N, List, Front) :-
    length(Front,N),
    append(Front, _, List).

member1(Elt, List) :-
    append(_, [Elt|_], List).

% @member2 is more efficient because does not igonre the elements befor Elt
% in a list.
member2(Elt, [Elt|_]).
member2(Elt, [_|Rest]) :-
    member2(Elt, Rest).

% @my_square only works if the first arguement is bound, because @is only
% works if its second arguement is ground.
my_square(N, N2) :-
    N2 is N * N.

