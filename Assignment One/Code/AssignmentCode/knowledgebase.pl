%This is robbie's brain.
%this defines how robbie thinks
%there isn't much structure to this list just a pile of information
%Best strategy to find something is to ctrl + f to find it


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
	
crushable(X) :-
	material(X,Y),
	Y == 'paper'.
	
crushable(X) :-
	material(X,Y),
	Y == 'cardboard'.
	
thing(X) :-
	isA(X,Y),
	Y \= 'notAThing'.
	
nextTo(X,Y) :-
	directlyLeft(X,Y);
	directlyLeft(Y,X).
	
somewhereLeft(X,Y) :-
	directlyLeft(X,Y).
	
somewhereLeft(X,Y) :-
	(directlyLeft(X,Z),
	somewhereLeft(Z,Y));
	(directlyLeft(X,Z),
	above(Y,Z));
	(above(X,Z),
	somewhereLeft(Z,Y)).
	
somewhereRight(X,Y) :-
	somewhereLeft(Y,X).
	
striped(X) :-
	X == 'thebox'.
	
	
darkColor(X) :-
	color(X,Y),
	( Y == 'black';
	Y == 'brown';
	Y == 'grey').
	
lightColor(X) :-
	\+ darkColor(X).
	
spotted(X) :-
	X == 'therock'.
	
shatter(X) :-
	breakable(X).
	
breakable(X) :-
	madeOf(X,'glass');
	madeOf(X,'china').
	
solid(X) :-
	isA(X,Y),
	(Y == 'arobot';
	Y == 'acube';
	Y == 'atable';
	Y == 'aprism';
	Y == 'amarble';
	Y == 'aball';
	Y == 'ablock';
	Y == 'arock';
	Y == 'adish';
	Y == 'apencil').
	
hollow(X) :-
	thing(X),
	\+ solid(X).
	
canRoll(X) :-
	shape(X,'sphere');
	shape(X,'cylinder').

couldRoll(X) :-
	round(X).
	
directlyLeft(X,Y) :-
	leftOf(X,Y),
	Y \= 'unable',
	Y \= 'nothing'.
	
onSide(X) :-
	orientation(X,Y),
	Y == 'onSide'.

large(X) :-
	size(X,Y),
	Y == 'large'.
	
canPickup(X) :-
	object(X),
	\+ on(_,X).
	
medium(X) :-
	size(X,Y),
	Y == 'medium'.
	
canPlaceOnTop(X) :-	
	shape(X,Y),
	(Y == 'cube';
	Y == 'cylinder';
	Y == 'circle'),
	orientation(X,Z),
	(Z == 'onBase';
	Z == 'none'),
	\+ on(_,X).
	
canPlaceOnTop(X) :-
	X == 'thetable'.
	
small(X) :-
	size(X,Y),
	Y == 'small'.

heavy(X) :-
	isA(X,Y),
	( Y == 'arock';
	Y == 'atable';
	Y == 'aball';
	Y == 'robbie').
	
heavy(X) :-
	material(X,Y),
	(Y == 'glass'; 
	 Y == 'metal';
	 Y == 'china').
	
light(X) :-
	isA(X,Y),
	(Y == 'apencil';
	Y == 'aballoon').
	
light(X) :-
	material(X,Y),
	( Y == 'wood';
	Y == 'cardboard';
	Y == 'paper').

above(X,Y) :-
	on(X,Y).	
	
above(X,Y) :-
	on(X,Z),
	above(Z,Y).

below(X,Y) :-
	above(Y,X).
	
flatTop(X) :-
	shape(X,Y),
	( Y == 'cube';
	 Y == 'cylinder';
	 Y == 'circle').
	
flatTop(X) :-
	X == 'thetable'.
	
crack(X) :-
	breakable(X).
	
big(X) :-
	large(X).
	
under(X,Y) :-
	on(Y,X).
	
flat(X) :-
	isA(X,Y),
	Y = 'adish'.
	
round(X) :-
	shape(X,Z),
	Z = 'sphere'.
	
round(X) :- 
	shape(X,Z),
	Z= 'cylinder'.
	
round(X) :- 
	shape(X,Z),
	Z = 'circle'.
	
rightOf(X,Y) :-
	directlyLeft(Y,X).
	
bounce(X) :-
	isA(X,Y),
	Y == 'aball',
	madeOf(X,Z),
	Z == 'rubber'.
	
makeRainbows(X) :-
	isA(X,'aunicorn').
	
empty(X) :-
	fullOf(X,Y),
	Y = 'empty'.
	
white(X) :-
	color(X,Y),
	Y = 'white'.

madeOf(X,Y) :-
	isA(X,W),
	W == 'adish',
	Y = 'china'.
	
madeOf(X,Y) :-
	isA(X,W),
	W == 'ablock',
	Y =  'wood'.
	
madeOf(X,Y) :-
	isA(X,W),
	W == 'aballoon',
	Y = 'rubber'.
	
madeOf(X,Y) :-
	isA(X,W),
	W == 'apencil',
	Y = 'wood'.
	
madeOf(X,Y) :-
	isA(X,W),
	W == 'arobot',
	Y = 'metal'.
	
madeOf(X,Y) :-
	isA(X,W),
	(W == 'aglass';
	 W == 'aprism';
	 W == 'amarble'),
	Y = 'glass'.	
	
	
madeOf(X,Y) :-
	material(X,Y),
	Y \= 'userule'.