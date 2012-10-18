late_night_burgers(Eatery) :-
    cuisine(Eatery, burgers),
    open_late(Eatery).

late_night_burger_list(BurgerJoints) :-
    findall(BurgerJoint, late_night_burgers(BurgerJoint), BurgerJoints).

serves(Cuisine, Restaurant) :-
    cuisine(Restaurant, Cuisine).

% Write a predicate, filter(:P, +InList, -OutList), that takes 
%     a predicate, P,
%     a list, InList, as inputs 
%     and outputs a list, OutList, which has 
%         all the elements of InList for which P is true. 
% For example, filter(integer, [a, 1, b, 2, foo], X) should return X=[1,2].
%filter(_, [], []).
%filter(P, [H|T], OutList):-
%  member(call(P, H), filter(T)).

filter(Predicate, InList, OutList) :- findall(Element,
                                              (member(Element, InList),
                                                      call(Predicate, Element)),
                                              OutList).


