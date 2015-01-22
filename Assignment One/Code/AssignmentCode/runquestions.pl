% FILE:  RunQuestions.pl
%	(This is the good file to use with Questions.pl file
%		for the final demo).

% --------------------------------------------------------------------------
% the DRIVER rule for this module

doExam :-
	write('* * * * * * * * * * * * * * * * * * * TRUE / FALSE'), nl,
	doTrueFalseQuestions,
	nl,nl,
	write('* * * * * * * * * * * * * * * * * * * FILL IN THE BLANK'), nl,
	doFillInTheBlankQuestions,
	nl,
	write('* * * * * * * * * * * * * * * * * * * END OF EXAM'), nl.

% --------------------------------------------------------------------------
% The following 2 rules use a backtrack/fail "loop" to go through all the
%	questions/queries of the specified type (tf_item or ans_ques)
%	in the Questions.pl file.

% NOTE: These rules assume that your queries have rule heads which are of
%	the form:  q(1), q(2), q(3), . . .
%	rather than q1, q2, q3, . . .


doTrueFalseQuestions :-
	tf_item(Num, Text),	% grabs the next question,
				% instantiating the 2 parameter values.
	write(Num),
	write(' - '),
	write(Text),
	write('.'), nl,
	once(q(Num)),		% calls YOUR query which writes an answer
				%	AND which MUST succeed.
	fail.			% fail causes backtracking to the top.

doTrueFalseQuestions.		% guarantees this rule succeeds.


doFillInTheBlankQuestions :-
	ans_ques(Num, Text),
	write(Num),
	write(' - '),
	write(Text),
	write('?'), nl,
	once(q(Num)), 
	fail.
doFillInTheBlankQuestions.
