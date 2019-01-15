%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TUCAN nEDM experimental sensitivity, code originally written largely by
%Ruediger Picker in the excel document found here: 
%https://ucn.triumf.ca/ucn-source/next-generation-ucn-source-1/detailed-design
%MATLAB code written by Wolfgang Klassen.

%This code follows the calculations found in the above excel document.  As
%such, there are some oddities to how the code works that are inherited
%from this precursor.  The "cryo" object, calculated immediately after par
%and const are generated, contains all the calculations found in the 
%"fT-inverse" and "3Hepumping" tabs of the excel sheet.  I decided to
%organize the code this way because the first version of the code I wrote
%had Temp_HeII as a constant, and having a separate object is a good way to
%avoid variable name issues when adding to existing working code.
%This also made it slightly easier to compare to the existing sheet, as 
%main.m still kinda looks like the "original" tab in the sheet.

%I intend main.m to be mainly a developmental tool, with the real
%calulations using calcFitness, which looks just like main.m, but takes the
%const, par, and cryo objects as arguments, so they're not calculated each
%time.  Ferret has the option to initialize an external patrameters object
%before starting evolution, const and cryo will both be contained in this
%object, and instead of using genPar, Ferret will provide lists of
%parameters to the function calleed "fitness", which will call calcFitness
%with the appropriate parameters, and return the fitness evaluation to the
%"fitness" function.

%The first half of main/calcFitness is every quantity that only depends on
%const or par.  These can be in any order, and I usually add new ones to
%the bottom of the list.

%The second half of main/calcFitness have all the quantities that depend on
%each other.  These calculations must be done in the correct order.  When
%adding a new quantity, add it immediately prior to the first quantity that
%uses it as a parameter.  Don't forget to add it as a parameter wherever
%needed.

%TODO
%Add a function that performs a parameter sweep and outputs a graph.
%Which parameter to sweep could itself be a parameter.

%Pursuant to the above, formalize the list of parameters into an ordered
%array for Ferret to handle.

%make arrays for upper and lower bounds for parameters.

%set up a .gitignore on the server side so ferrets folders don't get
%committed to git.