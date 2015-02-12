%Jason Pearson Moves File Assignment Two

pickUp(Block) :- % you complete this
	nothingOnBlock(Block),
	holdingNothing,
	handleLeftRule(Block),
	pickupBlock(Block).

putDown(Block) :- % you complete this
	write(Block).

putDownOnRight(Block) :- 
	putDown(Block).

putDownOnLeft(Block) :- % you complete this
	write(Block).

putOn(Block,Object) :- % you complete this
	Object == 'table'.
	
putOnCarefully(Block,Object) :- % you complete this
	write(Block).
	
putOnRight(Block) :- 
	putOn(Block, table).

 putOnLeft(Block) :- % you complete this 
	write(Block).
 
 
 pickupBlock(X) :-
	retract(holding(nothing)),
	assert(holding(X)).
 
 holdingNothing :-
	holding(X),
	X == 'nothing'.
 
 handleLeftRule(X) :-
	left(X,Y),
	left(Z,X),
	retract(left(X,Y)),
	retract(left(Z,X)),
	assert(left(Z,Y)).
 
 
 nothingOnBlock(X) :-	%+
	\+ on(Y,X).