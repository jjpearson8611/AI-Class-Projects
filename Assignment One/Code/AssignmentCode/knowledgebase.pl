


nextTo(X,Y) :-
	leftOf(X,Y);
	leftOf(Y,X).
	
striped(X) :-
	X == 'abox'.
	
solid(X) :-
	X == 'arobot';
	X == 'atable';
	X == 'aprism';
	X == 'amarble';
	X == 'aball';
	X == 'ablock';
	X == 'arock';
	X == 'adish';
	X == 'apencil'.
	
hollow(X) :-
	solid(X) \= 'true'.

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
	
madeOf(X,Y) :-
	material(X,Y) \= 'userule'.
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'amarble',
	Y == 'glass'.
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'aprism',
	Y == 'glass'.
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'aglass',
	Y == 'glass'.
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'ablock',
	Y == 'wood'.

madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'apencil',
	Y == 'wood'.	
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'aballoon',
	Y == 'rubber'.
	
	
madeOf(X,Y) :-
	material(X,Y) == 'userule',
	type(X,Y) == 'adish',
	Y == 'china'.