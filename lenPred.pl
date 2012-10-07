% write rules/facts for length/2:
% takes a list as first argument
% takes a number as its second
% is true iff number is the length of the list

% length [] = 0
% length _:tail = length (tail xs) - 1

len([], 0).
len([_|Tail], LocalNumber) :-
    len(Tail, LocalNumber),
    TotalNumber is LocalNumber + 1.

% member predicate:
member(X, [X|_]).
member(X, [_|Tail]) :-
  member(X, Tail).

