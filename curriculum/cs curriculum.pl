:- discontiguous title/2, satisfies/2, requires/2.

%% requirement(Area, NumberOfCourses)
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
