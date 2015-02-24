%Jason Pearson state stuff File Assignment Two

getCorrectState :- %this loads in the current state file
	write('Initial state (i) or Current state (c) to start?'),nl,
	read(X),
	handleInput(X).
	
handleInput(X) :-
	X == 'i',
	assert(state(initial)),
	consult('initialState.pl').
	
handleInput(X) :-
	X == 'c',
	exists_file('currentState.pl'),
	consult('currentState.pl'),
	assert(state(current)),
	write('Current State Loaded'),nl.
	
handleInput(X) :-
	X == 'c',
	write('The current state does not exsist we will be using the initial state'),nl,
	consult('initialState.pl'),
	assert(state(initial)).
	
handleInput(_) :-
	write('Please use i or c for initial or current state'),nl,
	getCorrectState.

saveState :-
	tell('currentState.pl'),
	csw,
	told,
	write('Current State Saved'),nl.