%Jason Pearson Driver File Assignment Two


go :-	
	consult('shortCuts.pl'),
	consult('showWorld.pl'),
	consult('staticDatabase.pl'),
	consult('moves.pl'),
	consult('stateStuff.pl'),
	determineMode(X).

determineMode(X) :-  %this is used for determining which mode
	write('Batch mode(b) or Interative mode(i)'),
	nl,
	read(X),
	handleMode(X).

handleMode(X) :-
	X == 'b',
	assert(mode(batch)),
	getCorrectState,
	consult('thePlan3.pl'),
	tell('A2LogFile.txt'),
	thePlan,
	told,
	saveState,
	write('The plan has been ran and saved to currentState.pl'),nl.
	
handleMode(X) :-
	X == 'i',
	assert(mode(interactive)),
	getCorrectState,
	write('You are in charge of robbie now!'),nl,
	!,
	enterInteractive('legend'),
	saveState,
	write('Current state written to currentState.pl'), nl.
	
handleMode(X) :-
	X \= 'i',
	X \= 'b',
	write('please use i or b to denote interactive or batch'),
	determineMode(X).
	

	
enterInteractive(X) :-
	X == 'quit'.
	
enterInteractive(X) :-
	call(X),
	read(Y),
	enterInteractive(Y).
	

	
	
legend :-
	write('Here are the moves you can use'),nl,
	write('pu(Block) attempts to pick up the block'),nl,
	write('pd(Block) attempts to put down the block being held.'),nl,
	write('pdr(Block) attempts to put down held block on right side.'),nl,
	write('pdl(Block) attempts to put down held block on left side.'),nl,
	write('po(Block,Obj) attempts to pick up and then put block on object.'),nl,
	write('poc(Block,Obj) attempts to pick up and then put block on object carefully.'),nl,
	write('por(Block) attempts to pick up block and place it on the right.'),nl,
	write('pol(Block) attempts to pick up block and place it on the left.'),nl,
	write('sw shows a picture of the world.'),nl,
	write('csw writes out the facts for the world.'),nl.


:- go.
	