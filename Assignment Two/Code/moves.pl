%Jason Pearson Moves File Assignment Two

slideRight.
slideLeft.

pickUp(Block) :- % completed
	validBlock(Block),
	clearedOff(Block),
	on(Block,'table'),
	holdingNothing,
	handleLeftRule(Block),
	pickupBlock(Block),
	write('OK I did a pick up '),
	write(Block),
	slideLeft.
	
pickUp(Block) :- % completed
	validBlock(Block),
	clearedOff(Block),
	holdingNothing,
	pickupBlock(Block),
	write('OK I did a pick up '),
	write(Block).
	
pickUp(X) :- % here to keep the plan going
	write('SORRY, I can\'t pick up '),
	write(X).

putDown(Block) :- % completed
	\+ holdingNothing,
	holdingBlockRequested(Block),
	allOnTable(X),
	findRightMost(X,Y),
	placeBlockOnTable(Block,Y),
	write('OK I did a put down '),
	write(Block),
	write(' on the table').
	
putDown(X) :- % here to keep the plan going
	write('SORRY I can\'t put down '),
	write(X),nl.
	
	
putDownOnRight(Block) :- 
	holdingBlockRequested(Block),allOnTable(X),
	findRightMost(X,Y),
	placeBlockOnTable(Block,Y),
	write('OK I did a put down on right '),
	write(Block),
	write(' on the table').
	
putDownOnRight(Block) :-  % here to keep the plan going
	write('Sorry I can\'t put down right '),
	write(Block).

putDownOnLeft(Block) :- % completed
	slideRight,
	\+ holdingNothing,
	holdingBlockRequested(Block),
	handleOnLeft(Block),
	write('OK, I did a put down on left '),
	write(Block).
	
putDownOnLeft(Block):-  % here to keep the plan going
	write('SORRY, I cant\'t put down on left '),
	write(Block).

putOn(Block,Object) :- % completed for on Table
	Object == 'table', 
	holdingNothing,
	validBlock(Block),
	clearedOff(Block),
	allOnTable(X),
	findRightMost(X,Y),
	pickupBlock(Block),
	placeBlockOnTable(Block,Y),
	write('OK, I did a put on '),
	write(Block),
	write(' on the table').
	
putOn(Block,Object) :- % completed for an object
	holdingNothing,
	validBlock(Block),
	clearedOff(Block),
	clearedOff(Object),
	isCube(Object),
	pickupBlock(Block),	
	handlePuttingOn(Block,Object), 
	write('OK, I did a put on '),
	write(Block),
	write(' on '),
	write(Object).
	
putOn(Block, Object) :-  % here to keep the plan going
	write('Sorry I cant\'t put on'),
	write(Block),
	write(' on '),
	write(Object),nl.
	
putOnCarefully(Block,Object) :- %  completed for on Table
	Object == 'table', 
	holdingNothing,
	validBlock(Block),
	clearedOff(Block),
	allOnTable(X),
	findRightMost(X,Y),
	pickupBlock(Block),
	placeBlockOnTable(Block,Y),
	write('OK, I did a put carefully on '),
	write(Block),
	write(' on the table'),nl.
	
putOnCarefully(Block,Object) :- % place anything on anything
	holdingNothing,
	validBlock(Block),
	validBlock(Object),
	clearedOff(Block),
	clearedOff(Object),
	pickupBlock(Block),	
	handlePuttingOn(Block,Object),
	write('OK, I did a carefully put on '),
	write(Block),
	write(' on '),
	write(Object), nl.

putOnCarefully(Block,Object) :- %already holding the object we want to put down
	holding(X),
	Block == X,
	validBlock(Object),
	clearedOff(Object),	
	handlePuttingOn(Block,Object),
	write('OK, I did a carefully put on '),
	write(Block),
	write(' on '),
	write(Object), nl.
	
putOnCarefully(X,Y) :- %here to keep the plan going
	write('SORRY I can\'t put carefully on '),
	write(X),
	write(' on '),
	write(Y),nl.
	
	
putOnRight(Block) :- 
	holdingNothing,
	validBlock(Block),
	clearedOff(Block),
	allOnTable(X),
	findRightMost(X,Y),
	pickupBlock(Block),
	placeBlockOnTable(Block,Y),
	write('OK, I did a put on right '),
	write(Block),nl.

putOnRight(X) :- %here to keep the plan going
	write('Sorry I can\'t put on right '),
	write(X),nl.
	
	
 putOnLeft(Block) :- 
	slideRight,
	holdingNothing,
	validBlock(Block),
	clearedOff(Block),
	pickupBlock(Block),
	handleOnLeft(Block),
	write('OK, I did a put on left '),
	write(Block), nl.
	
putOnLeft(X):- %here to keep the plan working
	write('SORRY, I can\'t put on left '),
	write(X),nl.
	
	
%Rules for handling conditions and asserting etc
 validBlock(X) :-
	X \= 'robbie',
	X \= 'table',
	on(X,_).
 
 validBlock(X) :-
	X \= 'robbie',
	X \= 'table',
	holding(X).
 
 placeBlockOnTable(Block,Y) :-
	retract(holding(Block)),
	assertz(left(Y,Block)),
	assertz(on(Block,'table')),
	assertz(holding('nothing')).
 
 clearedOff(X) :-
	\+ on(_,X).
 
 handlePuttingOn(Block,Object) :-
	assertz(on(Block,Object)),
	assertz(holding(nothing)),
	retract(holding(Block)).
 
 isCube(Object) :-
	shape(Object,X),
	X == 'cube'.
 
 handleOnLeft(Block) :-
	on(X,'table'),
	asserta(left(Block,X)),
	asserta(on(Block,'table')),
	retract(holding(Block)),
	assertz(holding('nothing')).
 
 pickupBlock(X) :-
	on(X,Y),
	retract(on(X,Y)),
	retract(holding(nothing)),
	assert(holding(X)).
 
 holdingBlockRequested(Block) :-
	holding(Y),
	Block == Y.
 
 holdingNothing :-
	holding(X),
	X == 'nothing'.

allOnTable(List) :-	%-
	bagof(Z,on(Z,'table'),List).
	
findRightMost([_,E],E). 
	
findRightMost([_ | Tail], E) :-
		findRightMost(Tail,E).
	
 handleLeftRule(X) :-
	left(X,Y),
	left(Z,X),
	retract(left(X,Y)),
	retract(left(Z,X)),
	assertz(left(Z,Y)).
