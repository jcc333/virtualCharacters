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
name(eecs203, 'Introduction to computer engineering').
satisfies(eecs203, computer_architecture).
name(eecs205, 'Assembly language').
satisfies(eecs205, computer_architecture).
% 328 info is in CS curriculum.pl
satisfies(eecs328, computer_architecture).
name(es_appm346, 'Modeling and computation in science and engineering').
satisfies(es_appm346, computer_architecture).

%
% Computer programming
%
satisfies(eecs211, computer_programming).
name(eecs230, 'Programming for engineers').
satisfies(eecs230, computer_programming).
name(eecs317, 'Data management and information processing').
satisfies(eecs317, computer_programming).

%
% Electrical science
%
name(eecs202,'Introduction to Electrical Engineering').
satisfies(eecs202, electrical_science).
name(eecs221, 'Fundamentals of Circuits').
satisfies(eecs221, electrical_science).
name(eecs222, 'Fundamentals of Signals and Systems').
satisfies(eecs222, electrical_science).
name(eecs223, 'Fundamentals of Solid-State Engineering').
satisfies(eecs223, electrical_science).
name(eecs224, 'Fundamentals of Electromagnetics and Photonics').
satisfies(eecs224, electrical_science).
name(eecs270, 'Applications of Electronic Devices').
satisfies(eecs270, electrical_science).
name(mech_eng233, 'Electronics Design').
satisfies(mech_eng233, electrical_science).

%
% Fluids and solids
%
name(bmd_eng270, 'Fluid Mechanics').
satisfies(bmd_eng270, fluids_and_solids).
name(bmd_eng271, 'Introduction to Biomechanics').
satisfies(bmd_eng271, fluids_and_solids).
name(chem_eng321, 'Fluid Mechanics').
satisfies(chem_eng321, fluids_and_solids).
name(civ_env216, 'Mechanics of Materials I').
satisfies(civ_env216, fluids_and_solids).
name(mech_eng241, 'Fluid Mechanics I').
satisfies(mech_eng241, fluids_and_solids).

%
% Materials science and engineering
%
name(mat_sci201, 'Introduction to Materials').
satisfies(mat_sci201, materials).
name(mat_sci203, 'Microstructure and Engineering Properties  of Materials').
satisfies(mat_sci203, materials).
name(mat_sci301, 'Materials Science Principles').
satisfies(mat_sci301, materials).

%
% Probability, statistics, and quality control
%
name(bmd_eng220, 'Introduction to Biomedical Statistics').
satisfies(bmd_eng220, statistics_et_cetera).
name(chem_eng312, 'Probability and Statistics for Chemical Engineering').
satisfies(chem_eng312, statistics_et_cetera).
name(civ_env306, 'Uncertainty Analysis in Civil Engineering').
satisfies(civ_env306, statistics_et_cetera).
name(eecs302, 'Probabilistic Systems and Random Signals').
satisfies(eecs302, statistics_et_cetera).
name(iems201, 'Introduction to Statistics').
satisfies(iems201, statistics_et_cetera).
name(iems303, 'Statistics').
satisfies(iems303, statistics_et_cetera).
name(mech_eng359, 'Reliability Engineering').
satisfies(mech_eng359, statistics_et_cetera).

%
% Systems engineering and analysis
%
name(chem_eng210, 'Analysis of Chemical Process Systems').
satisfies(chem_eng210, systems_engineering_and_analysis).
name(civ_env304, 'Civil and Environmental Engineering Systems Analysis').
satisfies(civ_env304, systems_engineering_and_analysis).
name(iems310, 'Operations Research').
satisfies(iems310, systems_engineering_and_analysis).
name(iems313, 'Deterministic Models and Optimization').
satisfies(iems313, systems_engineering_and_analysis).
name(iems326, 'Economics and Finance for Engineers').
satisfies(iems326, systems_engineering_and_analysis).

%
% Thermodynamics
%
name(bmd_eng250, 'Thermodynamics').
satisfies(bmd_eng250, thermodynamics).
name(chem342-1, 'Thermodynamics').
satisfies(chem342-1, thermodynamics).
name(chem_eng211, 'Thermodynamics').
satisfies(chem_eng211, thermodynamics).
name(mat_sci314, 'Thermodynamics of Materials').
satisfies(mat_sci314, thermodynamics).
name(mat_sci315, 'Phase Equilibria and Diffusion in Materials').
satisfies(mat_sci315, thermodynamics).
name(mech_eng220, 'Thermodynamics I').
satisfies(mech_eng220, thermodynamics).
name(mech_eng370, 'Thermodynamics II').
satisfies(mech_eng370, thermodynamics).









