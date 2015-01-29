


holding(X,Y) :-
	hold(X,Y).
	
holdingNothing(X) :-
	hold(X,Y),
	Y == 'nothing'.
	
holdingSomething(X) :-
	hold(X,Y),
	Y \= 'nothing'.

object(X) :-
	isA(X,Y),
	X \= 'robbie',
	Y \= 'atable'.

popable(X) :-
	type(X,'aballoon').
	
thing(X) :-
	isA(X,Y),
	Y \= 'notAThing'.
	
nextTo(X,Y) :-
	leftOf(X,Y);
	leftOf(Y,X).
	
striped(X) :-
	X == 'thebox'.
	
spotted(X) :-
	X == 'therock'.
	
breakable(X) :-
	madeOf(X,'glass');
	madeOf(X,'china').
	
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
	
canRoll(X) :-
	round(X).

couldRoll(X) :-
	shape(X,'sphere');
	shape(X,'cylinder').
	
directlyLeft(X,Y) :-
	leftOf(X,Y).

large(X) :-
	type(X) = 'arock'.

heavy(X) :-
	weight(X) == 'heavy'.
	
medium(X) :-
	weight(X) == 'medium'.
	
light(X) :-
	weight(X) == 'light'.

above(X,Y) :-
	on(X,Y).	
	
above(X,Y) :-
	on(X,Z),
	above(Z,Y).

below(X,Y) :-
	above(Y,X).
	
under(X,Y) :-
	on(Y,X).
	
flat(X) :-
	isA(X,Y),
	Y = 'adish'.
	
round(X) :-
	shape(X,Y),
	Y = 'sphere'.
	
round(X) :- 
	shape(X,Y),
	Y = 'cylinder'.
	
round(X) :- 
	shape(X,Y),
	Y = 'circle'.
	
rightOf(X,Y) :-
	leftOf(Y,X).
	
empty(X) :-
	fullOf(X,Y),
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