% Write a simple turing machine in prolog
turing(Tape0, Tape) :-
  go(q0, [], Ls, Tape0, Rs),
  reverse(Ls, Ls1),
  append(Ls1, Rs, Tape).

go(qf, Ls, Ls, Rs, Rs) :- !.
go(Q0, Ls0, Ls, Rs0, Rs) :-
  symbol(Rs0, Sym, RsRest),
  once(rule(Q0, Sym, Q1, NewSymbol, Action)),
  action(Action, Ls0, Ls1, [NewSymbol|RsRest], Rs1),
  go(Q1, Ls1, Ls, Rs1, Rs).

symbol([], b, []).
symbol([Sym|Rs], Sym, Rs).

action(left, Ls0, Ls, Rs0, Rs) :- left(Ls0, Ls, Rs0, Rs).
action(stay, Ls, Ls, Rs, Rs).
action(right, Ls0, [Sym|Ls0], [Sym|Rs], Rs).

left([], [], Rs0, [b|Rs0]).
left([L|Ls], Ls, Rs, [L|Rs]).


% example usage: 
% increment a unary number:
% rule(q0, 1, q0, 1, right).
% rule(q0, b, qf, 1, stay).
% ?- turing([1, 1, 1, 1, 1, 1, 1], Result).
% Result = [1, 1, 1, 1, 1, 1, 1, 1].


