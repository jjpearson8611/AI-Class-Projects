%Prolog queries which correspond to my English-language questions

%There's a rock on the table
q(1) :-
	on(therock,thetable),
	write('TRUE').
	
q(1) :-
	write('FALSE').
	
%The rock is above the table
q(2) :-
	above(therock,thetable),
	write('TRUE').
	
q(2) :-
	write('FALSE').
	
%The table is below a rubber thing which is black
q(3) :-
	below(thetable,Z),
	color(Z,black),
	material(Z,rubber),
	write('TRUE').
	
q(3) :-
	write('FALSE').
	
%There is a round object directly right of an empty white thing
q(4) :-
	round(X),
	rightOf(X,Y),
	empty(Y),
	white(Y),
	write('TRUE').
	
q(4) :-
	write('FALSE').
	
	
	
%There's a cardboard or paper thing next to a small or solid object
q(5) :-
	(material(X,'cardboard');
	material(X,'paper')),
	(size(Y,'small');
	solid(Y)),
	nextTo(X,Y),
	write('TRUE').
	
q(5) :-
	write('FALSE').
	
%There is a hollow striped thing which can roll
q(6) :-
	hollow(X),
	striped(X),
	canRoll(X),
	write('TRUE').
	
q(6) :-
	write('FALSE').

%Theres a large round thing next to something made of glass
q(7) :-
	large(X),
	round(X),
	madeOf(Y,'glass'),
	nextTo(X,Y),
	write('TRUE').
	
q(7) :-
	write('FALSE').

%There is a yellow thing above a black thing
q(8) :-
	thing(X),
	color(X,'black'),
	thing(Y),
	color(Y,'yellow'),
	above(Y,X),
	write('TRUE').
	
q(8) :-
	write('FALSE').

%There is a yellow thing above a black object
q(9) :-
	object(X),
	color(X,'black'),
	thing(Y),
	color(Y,'yellow'),
	above(Y,X),
	write('TRUE').
	
q(9) :-
	write('FALSE').
	
%Block e is above block a
q(10) :-
	above('theblockE','theblockA'),
	write('TRUE').
	
q(10) :-
	write('FALSE').
	
%Block e is on block a
q(11) :-
	on('theblockE','theblockA'),
	write('TRUE').
	
q(11) :-
	write('FALSE').

%The table is under block d
q(12) :-
	under('thetable','theblockD'),
	write('TRUE').
	
q(12) :-
	write('FALSE').

%There is a pyramid directly left of an object which can pop
q(13) :-
	shape(X,'pyramid'),
	directlyLeft(X,Y),
	popable(Y),
	write('TRUE').
	
q(13) :-
	write('FALSE').

%The prism is somewhere left of the balloon
q(14) :-
	somewhereLeft('theprism','theballoon'),
	write('TRUE').
	
q(14) :-
	write('FALSE').

%Robbie's hand is black
q(15) :-
	color('robbie','black'),
	write('TRUE').
	
q(15) :-
	write('FALSE').

%There is an object made of china which can roll
q(16) :-
	object(X),
	madeOf(X,'china'),
	canRoll(X),
	write('TRUE').
	
q(16) :-
	write('FALSE').

%There is an object made of china which could roll
q(17) :-
	object(X),
	madeOf(X,'china'),
	couldRoll(X),
	write('TRUE').
	
q(17) :-
	write('FALSE').

%Robbie is holding nothing
q(18) :-
	holdingNothing('robbie'),
	write('TRUE').
	
q(18) :-
	write('FALSE').

%Robbie is holding something
q(19) :-
	holdingSomething('robbie'),
	write('TRUE').
	
q(19) :-
	write('FALSE').
	
%Robbie is not holding something
q(20) :-
	holdingNothing('robbie'),
	write('TRUE').
	
q(20) :-
	write('FALSE').

%Robbie is holding a flat thing
q(21) :-
	flat(X),
	holding('robbie',X),
	write('TRUE').
	
q(21) :-
	write('FALSE').

%Robbie is above the balloon
q(22) :-
	above('robbie','theballoon'),
	write('TRUE').
	
q(22) :-
	write('FALSE').

%There is a heavy spotted thing next to a small square wood thing
q(23) :-
	heavy(X),
	spotted(X),
	nextTo(X,Y),
	small(Y),
	madeOf(Y,'wood'),
	write('TRUE').
	
q(23) :-
	write('FALSE').

%The box or the cup is made of rubber or metal or glass
q(24) :-
	(madeOf('thebox','metal');
	madeOf('thebox','rubber');
	madeOf('thebox','glass'));
	(madeOf('thecup','metal');
	madeOf('thecup','rubber');
	madeOf('thecup','glass')),
	write('TRUE').
	
q(24) :-
	write('FALSE').

%The glass can not crack
q(25) :-
	\+ crack('theglass'),
	write('TRUE').
	
q(25) :-
	write('FALSE').

%There is something which is not black or cardboard or wood
q(26) :-
	thing(X),
	color(X,Y),
	material(X,Z),
	\+ Y == 'black',
	\+ Z == 'cardboard',
	\+ Z == 'wood',
	write('TRUE').
	
q(26) :-
	write('FALSE').
	
%There is an object with nothing on it
q(27) :-
	object(X),
	object(Z),
	\+ on(Z,X),
	write('TRUE').
	
q(27) :-
	write('FALSE').

%There is something with nothing on it
q(28) :-
	type(X,_),
	type(Z,_),
	\+ on(Z,X),
	write('TRUE').
	
q(28) :-
	write('FALSE').

%There is not something not on the table
q(29) :-
	thing(X),
	\+ on(X,'thetable'),
	write('TRUE').
	
q(29) :-
	write('FALSE').

	
%Short answer questions
%Which are black metal things
q(30) :-
	thing(X),
	color(X,'black'),
	madeOf(X,'metal'),
	write(X),
	nl,
	fail.
	
q(30) :-
	nl.

%Which are black metal objects
q(31) :-
	object(X),
	color(X,'black'),
	madeOf(X,'metal'),
	write(X),
	nl,
	fail.
	
q(31) :-
	nl.


%Which black or grey things could not roll
q(32) :-
	thing(X),
	(color(X,'black');
	color(X,'grey')),
	\+ couldRoll(X),
	write(X),
	nl,
	fail.
	
q(32) :-
	nl.

%Which things are neither black nor white, but are round
q(33) :-
	thing(X),
	color(X,Y),
	\+ Y == 'black',
	\+ Y == 'white',
	round(X),
	write(X),
	nl,
	fail.
	
q(33) :-
	nl.
	
%Which white china objects are the same shape as another object
q(34) :-
	color(X,'white'),
	madeOf(X,'china'),
	shape(X,Y),
	shape(_,W),
	Y == W,
	write(X),
	nl,
	fail.
	
q(34) :-
	nl.
	
%What color is robbie
q(35) :-
	color('robbie',X),
	write(X),
	nl,
	nl.
	
q(35) :-
	nl.

%What shape is the thing made of grey cardboard
q(36) :-
	thing(Y),
	color(Y,'grey'),
	madeOf(Y,'cardboard'),
	shape(Y,X),
	write(X).
		
q(36) :-
	write('Nothing'),
	nl,
	nl.
%What are all the things that are flat on top
q(37) :-
	flatTop(X),
	write(X),
	nl,
	fail.
		
q(37) :-
	nl.
	
%What are all the things that are flat on top made of wood
q(38) :-
	flatTop(X),
	madeOf(X,'wood'),
	write(X),
	nl,
	fail.
		
q(38) :-
	nl.
	
%Which big things are next to small things
q(39) :-
	big(X),
	small(Y),
	nextTo(X,Y),
	write(X),
	nl,
	fail.
	
q(39) :-
	nl.


%Which things are round and can not roll
q(40) :-
	thing(X),
	round(X),
	\+ canRoll(X),
	write(X),
	nl,
	fail.
	
q(40) :-
	nl.

%Which things can not have something put on them
q(41) :-
	thing(X),
	\+ canPlaceOnTop(X),
	write(X),
	nl,
	fail.
	
q(41) :-
	nl.

%What is robbie holding
q(42) :-
	hold('robbie',Y),
	write(Y),
	nl,
	fail.
	
q(42) :-
	nl.

%Which things are somewhere right of paper object
q(43) :-
	thing(X),
	object(Y),
	madeOf(Y,'paper'),
	somewhereRight(X,Y),
	write(X),
	nl,
	fail.
	
q(43) :-
	nl.

%What's crushable or popable things but not grey or white

%What things could not crack

%Which things can roll and could not roll

%What's not on the table

%Block D is above which things

%Which things is the dish next to

%What has a breakable object directly left or right of itself

%Which flat things could roll and not shatter

%Which objects are below something

%Which things can robbie not pickup

%Which cubes are under something

%What's on the table and not on the table

%Which red striped cubes are somewhere left of blue spotted rocks

%What can bounce or make rainbows

%Which hollow objects are dark or light

%What solid things are transparent

%Which things could not have something put on them

%Which things are on their sides

%What has nothing on it

%What kind of things are the cardboard, metal and wood things
