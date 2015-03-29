%Controller.pl Assignment Three Jason Pearson

:- dynamic search/1.
:- dynamic startstop/2.

go :-
	consult('UserInterface.pl'),
	consult('ProblemInterface.pl'),
	consult('Search.pl'),
	consult('MichiganRoads.pl'),
	consult('CityPairs.pl'),
	consult('MichiganLocations.pl'),
	initUI,
	tell('Report.txt'),
	doSearches,
	told.
	
	
doSearches :-
		startstop(Start,Y),
		retract(startstop(Start,Y)),
		once(getNextPair(Start,Y)),
		newPair,
		once(djikstra(Start)),
		once(aStarDirect(Start)),
		once(aStarBridge(Start)),
		once(aStarBridgeTen(Start)),
		once(aStarBridgeFifty(Start)),
		once(bestFirst(Start)),
		fail.
	
doSearches.

handleFound(StartState, ReturnedList, Cost):-
	printReport(ReturnedList,Cost),	!,
	cleanUp.

cleanUp :-
	retractall(opened(_,_,_,_)),
	retractall(closed(_,_)),
	retractall(state(_)).

djikstra(Start) :-
	assertz(state(djikstra)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
djikstra(X) :-
	cleanUp.

aStarDirect(Start) :-
	assertz(state(astardirect)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
aStarDirect(X) :-
	cleanUp.

aStarBridge(Start) :-
	assertz(state(astarbridge)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
aStarBridge(X) :-
	cleanUp.

aStarBridgeTen(Start) :-
	assertz(state(astarbridgeten)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
aStarBridgeTen(X) :-
	cleanUp.

aStarBridgeFifty(Start) :-
	assertz(state(astarbridgefifty)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
aStarBridgeFifty(X) :-
	cleanUp.


bestFirst(Start) :-
	assertz(state(bestfirst)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost).
	
bestFirst(X) :-
	cleanUp.
	
