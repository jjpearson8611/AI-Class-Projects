% FILE:  thePlan - for RUN #1
% DO NOT CHANGE THIS FILE - IT'S A DEMO TEST FILE

% NOTE: Pictures here show cubes as small letters and balls & pyramids as CAPS
%	just for my demo comments.  This is NOT what yours should do.
%	Your showWorld should always show block names in CAPITALS with edges:
%		cubes should show as		|X|
%		balls should show as		(Y)
%		pyramids should show as		/Z\

% REMINDER:  Robbie responds ONCE to each user request (not once for each
%	Prolog rule) using the exact words in the specs

% / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /

thePlan :-
	write('@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ CURRENT STATE @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @'),nl,
		% at prompt from your program, user chooses currentState
		% but it does NOT exist so initial state is automatically used
	csw,
	sw,			%  --> WORLD #1
	slideRight,		% Robbie's just "warming up" here
	slideLeft,
	group1Moves,
	showWorld,		%  --> WORLD #2
	group2Moves,
	showWorld,		%  --> WORLD #3
	group3Moves,
	showWorld,		%  --> WORLD #4
	group4Moves,
	sw,			%  --> WORLD #5
	csw.

% --<<						*** WORLD #1
%
%	   J
%	   i  L        N
%	   h  k        m
%	a  b  c  D  E  f  g
%	____________________________________________

group1Moves :-
    nl,write('* * * * * * *  group 1 moves  * * * * * * * * *'),nl,
	pickUp(a),	putDown(a),	pickUp(e),	putDown(e),
	pickUp(robbie),	pickUp(table),	putDown(table),	pickUp(z),
	pickUp(j),	putDown(j),	pickUp(n),	putDown(n),
	pu(j),      	pd(j),		pd(robbie),	pd(z),
	pickUp(b),	putDown(i),	pickUp(l),	pickUp(l),
	pickUp(j).

% --<< L					*** WORLD #2
%
%	i          
%	h  k     m
%	b  c  D  f  g  a  E  N  J
%	____________________________________________

group2Moves :-
    nl,write('* * * * * * *  group 2 moves  * * * * * * * * *'),nl,
	pickUp(n),	putDownOnLeft(l),	 pickUp(n),
	pdl(n),		putDownOnRight(n),
	pickUp(table),	putDownOnRight(table),   putDownOnLeft(table),
	pickUp(robbie),	pdr(robbie),		 pdl(robbie),
	pickUp(floor),	putDownOnRight(floor),	 putDownOnLeft(floor),
	pickUp(b),	pickUp(a),		 pdl(a),
	pu(j).

% --<< J					*** WORLD #3
%
%	         i        
%	         h  k     m
%	a  N  L  b  c  D  f  g  E
%	____________________________________________

group3Moves :-
    nl,write('* * * * * * *  group 3 moves  * * * * * * * * *'),nl,
	putOn(e,table), putOn(z,table), putDownOnLeft(j),
	putOn(i,h),	putOn(b,g),	putOn(l,c),	putOn(table,d),
	putOn(j,a),	putOn(g,i),	putOn(g,i),	putOn(i,g),
	po(b,table),	po(i,h),	po(g,m),	po(g,i),
	putOn(l,d),	putOn(l,e),	putOn(l,l),	putOn(l,g),
	putOn(m,f),	putOn(f,table),	po(z,floor),	putOn(robbie,table),
	putOnRight(j),	putOnRight(k),	pol(c),		putOnLeft(k),
	putOn(a,m),	putOn(j,a),	putOn(k,d),     putOn(k,c).

% --<< 						*** WORLD #4
%
%	      L
%	      g     J
%	      i     a     
%	k     h     m
%	c  N  b  D  f  E
%	____________________________________________


group4Moves :-
    nl,write('* * * * * * *  group 4 moves  * * * * * * * * *'),nl,
	slideRight,	slideLeft,
	putOnCarefully(c,n),	putOnCarefully(robbie,table),
	putOnCarefully(z,table), putOnCarefully(k,z),
	putOnCarefully(c,z),	putOnCarefully(e,table),
	putOnCarefully(n,d),	putOnCarefully(d,e),
	putOnCarefully(e,d),	putOnCarefully(k,table),
	putOnCarefully(c,j),	pol(e),
	pickUp(l),		putOnCarefully(k,n),
	poc(l,c),		pickUp(g).

% --<< g					*** WORLD #5
%
%	         L
%	         c
%	         J
%	   i     a   
%	   h  N  m
%	E  b  D  f  k
%	____________________________________________
