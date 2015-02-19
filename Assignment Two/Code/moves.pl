%Jason Pearson Moves File Assignment Two

pickUp(Block) :- % you complete this
	nothingOnBlock(Block),
	on(Block,'table'),
	holdingNothing,
	handleLeftRule(Block),
	pickupBlock(Block).
	
pickUp(Block) :- % you complete this
	nothingOnBlock(Block),
	holdingNothing,
	pickupBlock(Block).

putDown(Block) :- % you complete this
	\+ holdingNothing,
	allOnTable(X),
	findRightMost(X,Y),
	placeBlockOnTable(Block,Y).
	
putDownOnRight(Block) :- 
	putDown(Block).

putDownOnLeft(Block) :- % you complete this
	\+ holdingNothing,
	handleOnLeft(Block).

putOn(Block,Object) :- % you complete this
	Object == 'table'.
	
putOnCarefully(Block,Object) :- % you complete this
	write(Block).
	
putOnRight(Block) :- 
	putOn(Block, table).

 putOnLeft(Block) :- % you complete this 
	write(Block).
 
 placeBlockOnTable(Block,Y) :-
	retract(holding(Block)),
	assertz(left(Y,Block)),
	assertz(on(Block,'table')),
	assertz(holding('nothing')).
 
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