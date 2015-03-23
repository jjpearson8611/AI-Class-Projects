%UserInterface.pl Assigment Three Jason Pearson

:- dynamic current/2.

initUI :-
	consult('CityPairs.pl'),
	assertz(current(none,none)).


getNextPair :-
	retract(current(_,_)),
	startstop(X,Y),
	assertz(current(X,Y)).
	
printReport(List, Distance) :-
	write('One Line of Numbers'),
	printNumberTwo(List),
	printSearchName,
	write(Distance),
	printBackwardsList(List),nl,
	printListOfClosed,nl,
	printListOfOpen,nl.
	
	
	
printListOfOpen :-
	bagof(X,open(X), List),
	lengthOfList(List,Count),
	write(Count), 
	write(' '),
	printBackwardsList(List).
	

printListOfClosed :-
	bagof(X,closed(X), List),
	lengthOfList(List,Count),
	write(Count), 
	write(' '),
	printBackwardsList(List).
	
printBackwardsList([]).
printBackwardsList([H|T]) :-
	printBackwardsList(T),
	write(H),
	write(' ').
	
printSearchName :-
	search(X),
	write(X).
	
printNumberTwo(List) :-
	getLastElement(List, First),
	getFirstElement(List, Last),
	print("First Location "),
	print(First),
	print(" Ending Location "),
	print(Last),
	nl.
	

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
	
append([],X,X).
append([H1|T1], X, [H1|Z]) :-
	append(T1, X, Z).