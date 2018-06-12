% Herbrand terms
% Hindley-Milner type system (the Haskell type system)
% t_map, t2, t3, and t_r are constraint variables (herbrand terms)
% t_map = t1 -> t2 -> t_r is a constraint on the variables
% map f l = case l of []     -> []
%                     (e:es) -> let t = map f es
%                                   h = f e
%                               in h:t
% ?- Map = F => L => Result
%      L = [_], Result = [_],
%      L = [E], Es = [E],
%      Map = F => Es => T,
%      F = E => H,
%      Result = [H], Result = T.
% Map = (E=>H) => [E] => [H],
% F = E=>H,
% L = Es, Es = [E],
% Result = T, T = [H].
%
% 
% TODO: Quiz: give the set of Herbrand type constraints for this function definition:
% filter f l = case l of
%                   []     -> []
%                   (x:xs) -> let fxs = filter f xs
%                             in if f x then x:fxs else fxs
% 
% ?- Filter = F => L => Result
%         L = [_], Result = [_],
%         L = [X], XS = [X],
%         Filter = F => XS => FXS,
%         F = X => bool,
%         Result = [X], Fxs = [x],
%         Result = Fxs.
% Filter = (X=>bool) => [X] => [X],
% F = X => bool,
% L = Result, Result = Xs, Xs = Fxs, Fxs = [X].
%
%
%
