%UserInterface.pl Assigment Three Jason Pearson

go :-
	consult('CityPairs.pl').
	
:- go.

getStartCity(X) :-
	startstop(X,_).
	
getStopCity(X,Y) :-
	startstop(X,Y).
	
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
	
getLastElement([X],Y):-
	Y = X.
	
lengthOfList([],0).
lengthOfList([H|T], Y) :-
	lengthOfList(T,N),
	Y is N + 1.
	
getLastElement([H|T],Y) :-
	getLastElement(T,Y).
	
getFirstElement([H|T], Y) :-
	Y = H.