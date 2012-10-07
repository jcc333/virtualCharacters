%
% Write a rule for a prolog predicate area_satisfied(Area), that will match basic engineering areas that you have taken a classe in.
%

% an area has been satisfied if there exists a class I've taken which satisfies it.

area_satisfied(Area) :- 
    taken(Course),
    satisfies(Course, Area).

% Write a Prolog predicate can_take_basic_engineering(Course,Area) that will match a course you can take it (have prereqs, etc.), and it satisfies a basic engineering area you haven't taken a class in.

% canTakeBasicEngineering = \ course area kb -> [courses | courses <- (not area_satisfied area), can_take course] 
% so this will always return a binding list of length 1.

can_take_basic_engineering(Course, Area) :-
    can_take(Course),
    \+ area_satisfied(Area),
    satisfies(Course, Area). % assuming that 'Area' represents a supposedly valid category for 'Course' to fill.

% The editor in SWI prolog sometimes displays variables in boldface. What makes it display a variable in boldface? Why would this be useful?
% unfortunately, I've been writing in VIM, so I have no idea. 
