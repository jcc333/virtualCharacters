%
% Simple prereq/requirements checker for classes
% User interface:
%    To specify what classes you've taken, run my_classes(List).
%    To check what requirements you've satisfied, do:
%        check_requirements(X, DepthArea1, DepthArea2)
%           where X should really be a variable (it's the output)
%           and DepthArea1, DepthArea2 are the depth areas you want
%	    to study, e.g. systems_depth, theory_depth, security_depth,
%	    etc.
%
% To add a class to the curriculum:
%    name(Class, LongName)
%    Specifies the name of a class
%
%    satisfies(Class, Requirement)
%    Says Class fulfills Requirement
%
%    requires(Class, PrereqClass)
%    Says Class has PrereqClass as a prereq
%
% To add a requirement to the curriculum:
%    requirement(RequirementName, Number)
%    Says students need to do Number classes that satisfy
%    RequirementName.

%%
%%	PREREQ CHECKING
%%	Stuff to answer the question: can I take this class?
%%

%%	can_take(?Class)
% True if Class is a class you can register for.
can_take(Course) :-
	class(Course),
	\+ taken(Course),
	\+ unsatisfied_prereq(Course, _).

%%	unsatisfied_prereq(?Course, ?Prereq)
% True if Course requires Prereq but you haven't taken Prereq.
unsatisfied_prereq(Course, Prereq) :-
	requires(Course, Prereq),
	\+ taken(Prereq).


%%
%%	CHECKING IF YOU CAN GRADUATE
%%

%%	check_requirements(-RequirementsList, +Depth1, +Depth2)
% True when RequirementsList is a list of all requirements and the
% classes that satisfy them, assuming you are specializing the two
% Depth areas specified.
check_requirements(AllReqs, DepthArea1, DepthArea2) :-
	all_requirements(ReqList),
	all_classes_taken(CourseList),
	AllReqs = [DepthArea1:[_,_,_], DepthArea2:[_,_,_] | ReqList],
	check_all(CourseList, AllReqs).

%%	check_all(+CourseList, -RequirementsList)
% For each class in CourseList, finds a requirement in RequirementsList
% to file it under.
check_all([Course | MoreCourses], ReqList) :-
	satisfies_one(Course, ReqList),
	check_all(MoreCourses, ReqList).
check_all([], _).

%%	satisfies_one(+Course, +ReqList)
% Finds a place to put Course within ReqList
satisfies_one(Course, ReqList) :-
	satisfies(Course, ReqName),
	member(ReqName:List, ReqList),
	member(Course, List).

%%
%%	UTILITY PREDICATES
%%

%%	class(?C)
% True if C is a class.
class(X) :- title(X, _).

%%	all_classes_taken(-List)
% True if List is a list of exactly the courses youv'e taken.
all_classes_taken(CourseList) :-
	findall(Course, taken(Course), CourseList).

%%	all_requirements(List)
% True if List is an association list whose keys are names of
% requirements and their values are lists with one free slot
% for each class you need to take to satisfy the requirement
% in question.
all_requirements(ReqList) :-
	findall(Req:List,
		(requirement(Req, Count), length(List, Count)),
		ReqList).

:- dynamic taken/1.

%%	my_classes(List)
% Sets List to be the set of classes you've taken.
% Blows away all clauses of taken/1 and asserts a new clause
% for each class in the List.
my_classes(CourseList) :-
	retractall(taken(_)),
	assert_took(CourseList).
assert_took([Course | MoreCourses]) :-
	assert(taken(Course)),
	assert_took(MoreCourses).
assert_took([]).

:- discontiguous title/2, satisfies/2, requires/2.

%% requirement(?Area, ?NumberOfCourses)
% True if you have to take NumberOfCourses in Area.
requirement(core, 5).
requirement(software_development, 1).
requirement(systems_breadth, 1).
requirement(ai_breadth, 1).
requirement(interfaces_breadth, 1).
requirement(theory_breadth, 1).

title(eecs111, 'scheme programming').
satisfies(eecs111, core).

title(eecs211, 'c++ programming').
satisfies(eecs211, core).

title(eecs213, 'intro to systems').
satisfies(eecs213, core).
requires(eecs213, eecs211).

title(eecs310, 'discrete math').
satisfies(eecs310, core).
requires(eecs310, eecs111).

title(eecs311, 'data structures').
satisfies(eecs311, core).
requires(eecs311, eecs211).

title(eecs321, 'programming languages').
satisfies(eecs321, systems_breadth).
satisfies(eecs321, systems_depth).
requires(eecs321, eecs111).
requires(eecs321, eecs311).
requires(eecs321, eecs213).

title(eecs322, 'compilers').
satisfies(eecs322, systems_breadth).
satisfies(eecs322, systems_depth).
satisfies(eecs332, security_depth).
requires(eecs322, eecs321).

title(eecs325, 'AI programming').
satisfies(eecs325, ai_breadth).
satisfies(eecs325, ai_depth).
requires(eecs325, eecs111).

title(eecs328, 'Numerical methods').
satisfies(eecs328, theory_breadth).
satisfies(eecs328, theory_depth).
requires(eecs328, ea1).
requires(eecs328, ea2).
requires(eecs328, ea3).

title(eecs330, 'HCI').
satisfies(eecs330, interfaces_breadth).
satisfies(eecs330, interfaces_depth).
requires(eecs330, eecs111).

title(eecs332, 'Machine vision').
satisfies(eecs332, interfaces_breadth).
satisfies(eecs332, interfaces_depth).
requires(eecs332, eecs211).

title(eecs335, 'Theory of computation').
satisfies(eecs335, theory_breadth).
satisfies(eecs335, theory_depth).
requires(eecs335, 310).

title(eecs336, 'Algorithms').
satisfies(eecs336, theory_breadth).
satisfies(eecs336, theory_depth).
requires(eecs336, 310).
requires(eecs336, 311).

title(eecs337, 'Magic Larry AI class').
satisfies(eecs337, ai_breadth).
satisfies(eecs337, ai_depth).
requires(eecs337, eecs348).

title(eecs338, 'Practicum in Intelligent Information Systems').
satisfies(eecs338, software_development).
requires(eecs338, eecs348).

title(eecs339, 'databases').
satisfies(eecs339, systems_breadth).
satisfies(eecs339, systems_depth).
satisfies(eecs339, security_depth).
requires(eecs339, eecs311).
requires(eecs339, eecs213).

title(eecs340, 'networking').
satisfies(eecs340, systems_breadth).
satisfies(eecs340, systems_depth).
satisfies(eecs340, security_depth).
requires(eecs340, eecs311).
requires(eecs340, eecs213).

title(eecs343, 'operating systems').
satisfies(eecs343, systems_breadth).
satisfies(eecs343, systems_depth).
satisfies(eecs343, security_depth).
requires(eecs343, eecs311).
requires(eecs343, eecs213).

title(eecs344, 'Building Problem Solvers').
satisfies(eecs344, ai_breadth).
satisfies(eecs344, ai_depth).
requires(eecs344, eecs348).
requires(eecs344, eecs325).

title(eecs345, 'distributed systems').
satisfies(eecs345, systems_breadth).
satisfies(eecs345, systems_depth).
satisfies(eecs345, security_depth).
requires(eecs345, eecs340).
requires(eecs345, eecs343).

title(eecs348, 'AI').
satisfies(eecs348, ai_breadth).
satisfies(eecs348, ai_depth).
requires(eecs348, eecs111).

title(eecs349, 'Machine learning').
satisfies(eecs349, ai_breadth).
satisfies(eecs349, ai_depth).
requires(eecs349, eecs211).

title(eecs350, 'security').
satisfies(eecs350, systems_breadth).
satisfies(eecs350, systems_depth).
satisfies(eecs350, security_depth).
requires(eecs350, eecs340).
requires(eecs350, eecs213).

title(eecs351, 'Graphics').
satisfies(eecs351, interfaces_breadth).
satisfies(eecs351, interfaces_depth).
requires(eecs351, eecs311).

title(eecs352, 'Machine perception of music and audio').
satisfies(eecs352, interfaces_breadth).
satisfies(eecs352, interfaces_depth).
requires(eecs352, eecs211).
requires(eecs352, ea2).

title(eecs354, 'network penetration and security').
% The current curriculum forms only list systems depth
%satisfies(eecs354, systems_breadth).
satisfies(eecs354, systems_depth).
%satisfies(eecs354, security_depth).
requires(eecs354, eecs350).
requires(eecs354, eecs213).

title(eecs358, 'Parallel computing').
satisfies(eecs358, systems_breadth).
satisfies(eecs358, systems_depth).
requires(eecs358, eecs361).
requires(eecs358, eecs211).

title(eecs358, 'Architecture').
satisfies(eecs358, systems_breadth).
satisfies(eecs358, systems_depth).
requires(eecs358, eecs205).
requires(eecs358, eecs303).

title(eecs370, 'Game design').
satisfies(eecs370, interfaces_breadth).
satisfies(eecs370, interfaces_depth).
requires(eecs370, eecs311).

title(eecs371, 'Knowledge representation').
% Not listed as satisfying anything
%satisfies(eecs371, ai_breadth).
%satisfies(eecs371, ai_depth).
requires(eecs371, eecs311).

title(eecs372, 'Multi-agent modeling').
satisfies(eecs372, interfaces_breadth).
satisfies(eecs372, interfaces_depth).
satisfies(eecs372, ai_breadth).
satisfies(eecs372, ai_depth).

title(eecs394, 'Software project management').
satisfies(eecs394, software_development).
% No requirements are actually listed in the departmental web page, so
% I'm just assuming.
requires(eecs394, eecs311).


basic_engineering_area(computer_architecture).
basic_engineering_area(computer_programming).
basic_engineering_area(electrical_science).
basic_engineering_area(fluids_and_solids).
basic_engineering_area(materials).
basic_engineering_area(statistics_et_cetera).
basic_engineering_area(systems_engineering_and_analysis).
basic_engineering_area(thermodynamics).

%
% Computer architecture and numerical methods
%
title(eecs203, 'Introduction to computer engineering').
satisfies(eecs203, computer_architecture).
title(eecs205, 'Assembly language').
satisfies(eecs205, computer_architecture).
% 328 info is in CS curriculum.pl
satisfies(eecs328, computer_architecture).
title(es_appm346, 'Modeling and computation in science and engineering').
satisfies(es_appm346, computer_architecture).

%
% Computer programming
%
satisfies(eecs211, computer_programming).
title(eecs230, 'Programming for engineers').
satisfies(eecs230, computer_programming).
title(eecs317, 'Data management and information processing').
satisfies(eecs317, computer_programming).

%
% Electrical science
%
title(eecs202,'Introduction to Electrical Engineering').
satisfies(eecs202, electrical_science).
title(eecs221, 'Fundamentals of Circuits').
satisfies(eecs221, electrical_science).
title(eecs222, 'Fundamentals of Signals and Systems').
satisfies(eecs222, electrical_science).
title(eecs223, 'Fundamentals of Solid-State Engineering').
satisfies(eecs223, electrical_science).
title(eecs224, 'Fundamentals of Electromagnetics and Photonics').
satisfies(eecs224, electrical_science).
title(eecs270, 'Applications of Electronic Devices').
satisfies(eecs270, electrical_science).
title(mech_eng233, 'Electronics Design').
satisfies(mech_eng233, electrical_science).

%
% Fluids and solids
%
title(bmd_eng270, 'Fluid Mechanics').
satisfies(bmd_eng270, fluids_and_solids).
title(bmd_eng271, 'Introduction to Biomechanics').
satisfies(bmd_eng271, fluids_and_solids).
title(chem_eng321, 'Fluid Mechanics').
satisfies(chem_eng321, fluids_and_solids).
title(civ_env216, 'Mechanics of Materials I').
satisfies(civ_env216, fluids_and_solids).
title(mech_eng241, 'Fluid Mechanics I').
satisfies(mech_eng241, fluids_and_solids).

%
% Materials science and engineering
%
title(mat_sci201, 'Introduction to Materials').
satisfies(mat_sci201, materials).
title(mat_sci203, 'Microstructure and Engineering Properties  of Materials').
satisfies(mat_sci203, materials).
title(mat_sci301, 'Materials Science Principles').
satisfies(mat_sci301, materials).

%
% Probability, statistics, and quality control
%
title(bmd_eng220, 'Introduction to Biomedical Statistics').
satisfies(bmd_eng220, statistics_et_cetera).
title(chem_eng312, 'Probability and Statistics for Chemical Engineering').
satisfies(chem_eng312, statistics_et_cetera).
title(civ_env306, 'Uncertainty Analysis in Civil Engineering').
satisfies(civ_env306, statistics_et_cetera).
title(eecs302, 'Probabilistic Systems and Random Signals').
satisfies(eecs302, statistics_et_cetera).
title(iems201, 'Introduction to Statistics').
satisfies(iems201, statistics_et_cetera).
title(iems303, 'Statistics').
satisfies(iems303, statistics_et_cetera).
title(mech_eng359, 'Reliability Engineering').
satisfies(mech_eng359, statistics_et_cetera).

%
% Systems engineering and analysis
%
title(chem_eng210, 'Analysis of Chemical Process Systems').
satisfies(chem_eng210, systems_engineering_and_analysis).
title(civ_env304, 'Civil and Environmental Engineering Systems Analysis').
satisfies(civ_env304, systems_engineering_and_analysis).
title(iems310, 'Operations Research').
satisfies(iems310, systems_engineering_and_analysis).
title(iems313, 'Deterministic Models and Optimization').
satisfies(iems313, systems_engineering_and_analysis).
title(iems326, 'Economics and Finance for Engineers').
satisfies(iems326, systems_engineering_and_analysis).

%
% Thermodynamics
%
title(bmd_eng250, 'Thermodynamics').
satisfies(bmd_eng250, thermodynamics).
title(chem342-1, 'Thermodynamics').
satisfies(chem342-1, thermodynamics).
title(chem_eng211, 'Thermodynamics').
satisfies(chem_eng211, thermodynamics).
title(mat_sci314, 'Thermodynamics of Materials').
satisfies(mat_sci314, thermodynamics).
title(mat_sci315, 'Phase Equilibria and Diffusion in Materials').
satisfies(mat_sci315, thermodynamics).
title(mech_eng220, 'Thermodynamics I').
satisfies(mech_eng220, thermodynamics).
title(mech_eng370, 'Thermodynamics II').
satisfies(mech_eng370, thermodynamics).




