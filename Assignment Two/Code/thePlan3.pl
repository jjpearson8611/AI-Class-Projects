% FILE:  thePlan3 - for RUN 3

thePlan :-
	write('@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ INITIAL STATE'),nl,
		% at prompt from your program, user choses INITIALSTATE
	sw,				%  --> world #1
	csw,			
	pickUp(j),	putDown(j),
	putOn(i,table),	putOnCarefully(h,table),
	pickUp(l),	putDownOnLeft(l),
	pickUp(k),	putDownOnLeft(k),
	putOnLeft(n),	pickUp(m),
	sw,				%  --> world #7
	csw.

% --<<						*** WORLD #1
%
%	   J
%	   i  L        N
%	   h  k        m
%	a  b  c  D  E  f  g
%	____________________________________________


% --<<	m					*** WORLD #7
%	                        
%	N  k  L  a  b  c  D  E  f  g  J  i  h
%	____________________________________________

