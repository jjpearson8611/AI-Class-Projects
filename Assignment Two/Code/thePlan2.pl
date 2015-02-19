% FILE:  thePlan2 - for RUN 2

thePlan :-
	write('@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ CURRENT STATE @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @'),nl,
		% at prompt from your program, user chooses currentState
		% and it DOES exist, so it's used
	sw,
	csw,
	putDown(g),	pickUp(n),
	sw,
	csw.
