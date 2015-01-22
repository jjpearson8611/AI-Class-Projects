




above(X,Y) :-
	on(X,Y).

above(X,Y) :-
	on(X,Z),
	above(Z,Y).

below(X,Y) :-
	above(Y,X).
	
round(X) :-
	shape(X,Y),
	Y = 'sphere'.
	
round(X) :- 
	shape(X,Y),
	Y = 'cylinder'.
	
rightOf(X,Y) :-
	leftOf(Y,X).
	
empty(X) :-
	full(X,Y),
	Y = 'empty'.
	
white(X) :-
	color(X,Y),
	Y = 'white'.