%Jason Pearson state stuff File Assignment Two

getCorrectState :- %this loads in the current state file
	write('Initial state (i) or Current state (c) to start?'),nl,
	read(X),
	handleInput(X).
	
handleInput(X) :-
	X == 'i',
	consult('initialState.pl').
	
handleInput(X) :-
	X == 'c',
	exists_file('currentState.pl'),
	consult('currentState.pl'),
	write('Current State Loaded').
	
handleInput(X) :-
	X == 'c',
	write('The current state does not exsist we will be using the initial state'),nl,
	consult('initialState.pl').
	
handleInput(_) :-
	write('Please use i or c for initial or current state'),nl,
	getCorrectState.

saveState :-
	tell('currentState.pl'),
	csw,
	told,
	write('Current State Saved').