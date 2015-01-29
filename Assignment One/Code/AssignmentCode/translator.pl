%rules to map KB & query rules (which specify individual-property predicates)
%to the DB facts’ format (stated as record-based facts)
%The KB & query rules never access the DB facts directly. They access translator rule-heads,
%which in turn have the translator rule-bodies access the relevant parameters in the DB facts.
%Use predicates which specify property categories rather than property values – e.g., specify
%size(Thing, TheSize) :-
%objectStaticProperties(Thing, _, TheSize, _).
%rather than the less generic, less broadly usable:
%big(Thing) :-
%objectStaticProperties (Thing, _, big, _).
%small(Thing) :- . . .
%medium(Thing) :- . . .

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
	

	

