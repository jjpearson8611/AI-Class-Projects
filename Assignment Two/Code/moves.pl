%Jason Pearson Moves File Assignment Two

slideRight.
slideLeft.

pickUp(Block) :- % completed
	validBlock(Block),
	nothingOnBlock(Block),
	on(Block,'table'),
	holdingNothing,
	handleLeftRule(Block),
	pickupBlock(Block).
	
pickUp(Block) :- % completed
	validBlock(Block),
	nothingOnBlock(Block),
	holdingNothing,
	pickupBlock(Block).
	
pickUp(Block). % here to keep the plan going

putDown(Block) :- % completed
	\+ holdingNothing,
	allOnTable(X),
	findRightMost(X,Y),
	placeBlockOnTable(Block,Y).
	
putDown(Block). % here to keep the plan going
	
putDownOnRight(Block) :- 
	putDown(Block).
	
putDownOnRight(Block).  % here to keep the plan going

putDownOnLeft(Block) :- % completed
	\+ holdingNothing,
	handleOnLeft(Block).
	
putDownOnLeft(block).  % here to keep the plan going

putOn(Block,Object) :- % completed for on Table
	Object == 'table', 
	\+ holdingNothing,
	putDown(Block).
	


putOn(Block,Object) :- % completed for an object
	isCube(Object),
	\+ holdingNothing,
	objectClear(Object),
	handlePuttingOn(Block,Object).
	
putOn(Block, Object).  % here to keep the plan going
	
putOnCarefully(Block,Object) :- %  completed for on Table
	Object == 'table',
	putOn(Block,Object).
	
putOnCarefully(Block,Object) :- % place anything on anything
	\+ holdingNothing,
	objectClear(Object),
	handlePuttingOn(Block,Object).
	
putOnCarefully(Block,Object). %here to keep the plan going
	
putOnRight(Block) :- 
	putOn(Block, table).

putOnRight(Block). %here to keep the plan going
	
 putOnLeft(Block) :- %working maybe
	\+ holdingNothing,
	handleOnLeft(Block).
	
putOnLeft(Block). %here to keep the plan working
	
%Rules for handling conditions and asserting etc
 validBlock(X) :-
	X \= 'robbie',
	X \= 'table'.
 
 
 placeBlockOnTable(Block,Y) :-
	retract(holding(Block)),
	assertz(left(Y,Block)),
	assertz(on(Block,'table')),
	assertz(holding('nothing')).
 
 objectClear(X) :-
	\+ on(Y,X).
 
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
 
 
 nothingOnBlock(X) :-	%+
	\+ on(Y,X).