%Controller.pl Assignment Three Jason Pearson

:- dynamic search/1.

go :-
	consult('UserInterface.pl'),
	consult('ProblemInterface.pl'),
	consult('Search.pl'),
	consult('MichiganRoads.pl'),
	consult('CityPairs.pl'),
	consult('MichiganLocations.pl'),
	initUI,
	doSearches.
	
doSearches :-
		startstop(Start,Y),
		once(getNextPair(Start,Y)),
		newPair,
		djikstra(Start),
		aStarDirect(Start),
		aStarBridge(Start),
		aStarBridgeTen(Start),
		aStarBridgeFifty(Start),
		bestFirst(Start),
		fail.
	
doSearches.

handleFound(StartState, ReturnedList, Cost):-
	printReport(ReturnedList,Cost),	
	cleanUp.

cleanUp :-
	retractall(opened(_,_,_,_)),
	retractall(closed(_,_)).

djikstra(Start) :-
	assertz(state(djikstra)),
	search(Start,ReturnedList,Cost),
	handleFound(Start,ReturnedList,Cost),
	retract(state(djikstra)).

aStarDirect(Start) :-
	assertz(state(astardirect)),
	retract(state(astardirect)).

aStarBridge(Start) :-
	assertz(state(astarbridge)),
	retract(state(astarbridge)).

aStarBridgeTen(Start) :-
	assertz(state(astarbridgeten)),
	retract(state(astarbridgeten)).

aStarBridgeFifty(Start) :-
	assertz(state(astarbridgefifty)),
	retract(state(astarbridgefifty)).

bestFirst(Start) :-
	assertz(state(bestfirst)),
	retract(state(bestfirst)).
	
