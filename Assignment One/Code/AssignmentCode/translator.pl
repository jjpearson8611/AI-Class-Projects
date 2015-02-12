%translator Jason Pearson CS5820 Asgn1

color(X,Y) :-
	staticFact(X,_,Y,_,_,_).

size(X,Y) :-
	staticFact(X,_,_,_,Y,_).
	
shape(X,Y) :-
	staticFact(X,Y,_,_,_,_).
	
material(X,Y) :-
	staticFact(X,_,_,Y,_,_).
	
type(X,Y) :-
	staticFact(X,_,_,_,_,Y).
	
isA(X,Y) :-
	staticFact(X,_,_,_,_,Y).
	
orientation(X,Y) :-
	dynFact(X,Y).
	
on(X,Y) :-
	dynRelFact(X,_,Y,_).
	
leftOf(X,Y) :-
	dynRelFact(X,Y,_,_).
	
fullOf(X,Y) :-
	dynRelFact(X,_,_,Y).
	
hold(X,Y) :-
	robbie(X,Y).
	

	

