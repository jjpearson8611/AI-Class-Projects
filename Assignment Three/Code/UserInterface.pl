%UserInterface.pl Assigment Three Jason Pearson

:- dynamic current/2.

initUI :-
	consult('CityPairs.pl'),
	assertz(current(none,none)).


getNextPair(X,Y) :-
	retract(current(_,_)),
	assertz(current(X,Y)).
	
printReport(List, Distance) :-
	state(X),
	write('Search: '),
	write(X),
	write(' Distance: '),
	write(Distance),nl,
	handleList(List,ListCount),
	write('Nodes: '),
	reverse(List,Reversed),
	write(ListCount),
	write(' '),
	write(Reversed),nl,
	write('Open: '),
	handleOpen(OpenCount,OpenBag),
	write(OpenCount),
	write(' '),
	write(OpenBag),nl,
	write('Closed: '),
	handleClosed(ClosedCount,ClosedBag),
	write(ClosedCount),
	write(' '),
	write(ClosedBag),nl.
	
final_routines(_) :-
	nl.
	
newPair :-
	nl,write('#############################################################################'),nl,
	current(X,Y),
	write('Start City: '),
	write(X),
	write(' End City: '),
	write(Y), nl.
	
handleOpen(X, List) :-
	bagof(A,B^C^D^opened(A,B,C,D), List),
	lengthOfList(List,X).
	
handleOpen(X,Y):-
	X is 0,
	Y = [].

handleClosed(X, List) :-
	bagof(Y,Z^closed(Y,Z), List),
	lengthOfList(List,X).
	
handleClosed(X,Y):-
	X is 0,
	Y = [].
	
handleList(X, Y) :-
	lengthOfList(X,Length),
	Y is Length.
	

	
printBackwardsList([]).
printBackwardsList([H|T]) :-
	printBackwardsList(T),
	write(H),
	write(' ').
	
printSearchName :-
	search(X),
	write(X).

lengthOfList([],0).
lengthOfList([_|T], Y) :-
	lengthOfList(T,N),
	Y is N + 1.
	
getLastElement([_|T],Y) :-
	getLastElement(T,Y).
	
getLastElement([X],Y):-
	Y = X.
	
getFirstElement([H|_], Y) :-
	Y = H.