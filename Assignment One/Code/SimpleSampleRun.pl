% FILE:  SimpleSampleRun.pl
%    Demo of a simplified RunQuestions file (just the 1st 3 TF questions)
%	used to show part of how the real RunQuestions rules work.
%	(It does not show the looping part, however).

% --------------------------------------------------------------------------
% These are from the Questions file
%	- question 1 is actually hard-coded in the rule and so is not here.

tf_item(2, 'The rock is above the table').
tf_item(3, 'The table is below a rubber thing which is black').

% --------------------------------------------------------------------------
% These are simplified versions (i.e., no actual conditions checked)
%	from your Queries file.
% These will always succeed since write and nl are always true - though
%	YOUR actual queries could fail because of the condition-checking.
% NOTE:  YOUR queries will each need a second rule (like I've done for q(1))
%	to guarantee that the rule ALWAYS SUCCEEDS, Prolog-wise.  Without
%	that, you can't force Prolog to continue with the
%	doTrueFalseQuestions after a failing query.

q(1) :-
	% some "conditions" here about rock and on and table
	write(yes), nl.
q(1) :-
	write(no), nl.

q(2) :-
	% some "conditions" here about . . . 
	write(yes), nl.

q(3) :-
	% some "conditions" here about . . .
	write(whatever), nl.

% --------------------------------------------------------------------------
% The DRIVER rule from the RunQuestions file

doExam :-
	write('* * * * * * * * * * * * * * * * * * * TRUE / FALSE'), nl,
	do_true_false_questions,
	nl,nl,
	write('* * * * * * * * * * * * * * * * * * * FILL IN THE BLANK'), nl,
	do_fill_in_the_blank_questions,
	nl,
	write('* * * * * * * * * * * * * * * * * * * END OF EXAM'), nl.

% --------------------------------------------------------------------------
% Simplified versions of these 2 rules from RunQuestions file

% These rules MUST ALWAYS SUCCEED in order to allow doExam to proceed
%	and finish.  They will, given the way I wrote the 3 queries above,
%	so I didn't add an additional "always true" 2nd rule for both of these
%	(as you see in the GOOD RunQuestions file).

doTrueFalseQuestions :-
				% HARD-CODED - NOT THE BEST APPROACH
	write('1 - There''s a rock on the table'), nl,		
	q(1),			% Call YOUR query 1 (which MUST succeed)

				% A BETTER WAY
	tf_item(2, Question2),	% Grab question 2's text using
				%	instantiation of variable to value

	write('2 - '),
	write(Question2), nl,	% Question2 now has the actual question text
	q(2),			% Call YOUR query 2 (which MUST succeed)

				% AN EVEN BETTER WAY
	Num = 3,
	tf_item(Num, Text),	% both variables now have values
	write(Num),		%	so we can use Num's value
	write(' - '),
	write(Text),		%	and use Text's value here
	write('.'), nl,		%	and call the correct q(?) below
	q(Num).			% And since Num now has a 3 in it we can call
				%	YOUR query 3 (which MUST succeed) 


% Assuming the following queries don't yet work, we guarantee that a call to 
%	this rule from doExam WILL succeed (and thus make progress and so be
%	able to finish the doExam rule) by making this a "dummy stub".

doFillInTheBlankQuestions :-
	write('these questions not yet working'), nl.		

