%UserInterface.pl Assigment Three Jason Pearson

:- dynamic current/2.

initUI :-
	consult('CityPairs.pl'),
	assertz(current(none,none)).


getNextPair(X,Y) :-
	retract(current(_,_)),
	assertz(current(X,Y)).
	
printReport(List, Distance) :-
	write('Distance '),
	write(Distance),
	write(' Open: '),
	countOpen(OpenCount),
	write(OpenCount),
	!,
	write(' Closed: '),
	countClosed(ClosedCount),
	write(ClosedCount),nl,
	!,
	printBackwardsList(List),nl.
%	printSearchName,
%	write(Distance),
%	printBackwardsList(List),nl,
%	printListOfClosed,nl,
%	printListOfOpen,nl.
	
final_routines(_) :-
	nl.
	
newPair :-
	write('#######################################'),nl,
	current(X,Y),
	write('Start City: '),
	write(X),
	write(' End City: '),
	write(Y), nl.
	
handleOpen(X) :-
	bagof(Y,opened(Y,_,_,_), List),
	lengthOfList(List,X)

handleClosed(X) :-
	bagof(Y,closed(Y,_), List),
	lengthOfList(List,X).
	
countClosed(X) :-
	X is 0.
	
printBackwardsList([]).
printBackwardsList([H|T]) :-
	printBackwardsList(T),
	write(H),
	write(' ').
	
printSearchName :-
	search(X),
	write(X).
	
printFirstPortion(List) :-
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