% FILE:  SimpleRunQuestions.pl
%
% This is the "cheap" version of RunQuestions file, to use if you need it
%	until I talk about the GOOD RunQuestions file in class.
%
% This one doesn't write out the actual questions - it just calls your
%	queries which write out the answers themselves.
%
% This assumes that each prior query WILL SUCCEED as a Prolog query,
%	whether the question's actual answer is yes or no.
%	More on this in class.
%
% I commented-out most of the query "calls" so that everything here works as
% 	long as you have q(1), q(2) and q(3) working.  Change the parts that
%	are commented out as you get different queries working.
% NOTE: I put a true on the end of both do???Questions rules so that q(29)
%	and q(63) weren't "special" (i.e., ending with a period vs. a comma)
%	so they can easily be commented-out without causing problems.
%	(Normally, that final true would not be needed).

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

doTrueFalseQuestions :-
	q(1),
	q(2),
	q(3),
/*
	q(4),
	q(5),
	q(6),
	q(7),
	q(8),
	q(9),
	q(10),
	q(11),
	q(12),
	q(13),
	q(14),
	q(15),
	q(16),
	q(17),
	q(18),
	q(19),
	q(20),
	q(21),
	q(22),
	q(23),
	q(24),
	q(25),
	q(26),
	q(27),
	q(28),
	q(29),
*/
	true.

doFillInTheBlankQuestions :-
/*
	q(30),
	q(31),
	q(32),
	q(33),
	q(34),
	q(35),
	q(36),
	q(37),
	q(38),
	q(39),
	q(40),
	q(41),
	q(42),
	q(43),
	q(44),
	q(45),
	q(46),
	q(47),
	q(48),
	q(49),
	q(50),
	q(51),
	q(52),
	q(53),
	q(54),
	q(55),
	q(56),
	q(57),
	q(58),
	q(59),
	q(60),
	q(61),
	q(62),
	q(63),
*/
	true.
