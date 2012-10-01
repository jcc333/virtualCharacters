:- dynamic taken/1.

class(X) :- title(X, _).

can_take(Course) :-
	class(Course),
	\+ taken(Course),
	\+ unsatisfied_prereq(Course, _).

unsatisfied_prereq(Course, Prereq) :-
	requires(Course, Prereq),
	\+ taken(Prereq).

check_requirements(AllReqs, DepthArea1, DepthArea2) :-
	all_requirements(ReqList),
	all_classes_taken(CourseList),
	AllReqs = [DepthArea1:[_,_,_], DepthArea2:[_,_,_] | ReqList],
	check_all(CourseList, AllReqs).
check_all([Course | MoreCourses], ReqList) :-
	satisfies_one(Course, ReqList),
	check_all(MoreCourses, ReqList).
check_all([], _).

satisfies_one(Course, ReqList) :-
	satisfies(Course, ReqName),
	member(ReqName:List, ReqList),
	member(Course, List).

all_classes_taken(CourseList) :-
	findall(Course, taken(Course), CourseList).
all_requirements(ReqList) :-
	findall(Req:List,
		(requirement(Req, Count), length(List, Count)),
		ReqList).

% This lets you rewrite the taken/1 predicate from the command prompt.
my_classes(CourseList) :-
	retractall(taken(_)),
	assert_took(CourseList).
assert_took([Course | MoreCourses]) :-
	assert(taken(Course)),
	assert_took(MoreCourses).
assert_took([]).
