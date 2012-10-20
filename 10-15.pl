assoc(Alist, Key, Value) :- member(Key:Value, Alist).

assoc_list(Alist, KeyList, ValueList) :- maplist(assoc(Alist), KeyList, ValueList).

fold(_, Accumulator, [], Accumulator).
fold(P, Accumulator, [Head|Tail], ReturnValue) :- 
  fold(P, call(P,Head, Accumulator), Tail, ReturnValue).

parse([X], X) :- number(X).
parse(Expression, X+Y):- append(Temp, YExp, Expression),
                         append(XExp, [+], Temp),
                         parse(XExp, X),
                         parse(YExp, Y).

% find(:Predicate, ?List, ?Element).
find(Predicate, List, Element) :- member(Element, List),call(Predicate,Element).
all(Predicate, List, SubList) :- findall(Element,
                                  ( member(Element, List),
                                    call(Predicate, Element) ),
                                  SubList).

eval(X + Y, A, Z):- 
  eval(X, A, XValue),
  eval(Y, A, YValue),
  Z is XValue + YValue.

with(X, Y, Z):-
   



eval(Var, AList, Value):-
  assoc(AList, Var, Value).
eval(Number, _, Number):-
  number(Number).

% (app (fun (X (eval Y))))
eval(with X is Y, 
