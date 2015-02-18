% FILE:  showWorld - some of these rules need finishing

% This rule is only used during early testing until
%	your good showWorld works correctly.
cheapShowWorld :-
	listing(holding),
	listing(on),
	listing(left).

showWorld :-
	showRobbie,
	showBlockRobbieIsHolding,
	showAllOtherBlocks,
	showTable.

showRobbie :-			% finish this rule
	write('--<<').
	
showBlockRobbieIsHolding :-	% finish this rule
	holding(X),
	X \= 'nothing',
	showOneBlock(X),
	nl,nl,nl.
	
showBlockRobbieIsHolding :-
	holding(X),
	X == 'nothing',
	write('Empty'),
	nl,nl,nl.
	
showAllOtherBlocks :-
	bagof(X,onTableBlocks(X),List),
	handleNotBagBlocks(List),
	writeList(List),
	nl.
	
	
	
handleNotBagBlocks(List) :-
	showStackedBlocks(List,X),
	\+ isAllNothing(X),
	handleNotBagBlocks(X),
	writeList(X),nl.
	
handleNotBagBlocks(List).
	
isAllNothing([]).

isAllNothing([Head | Tail]) :- 
	Head == 'nothing',
	isAllNothing(Tail).
	
showAllOtherBlocks.

showStackedBlocks([],[]).
	
showStackedBlocks([HeadOne | TailOne], [HeadTwo | TailTwo]) :-
	isSomethingOn(HeadOne,HeadTwo),
	showStackedBlocks(TailOne,TailTwo).
	

writeList([]).

writeList([Head | Tail]) :-
	showOneBlock(Head),
	writeList(Tail).

	
isSomethingOn(X,Y) :-
	on(Y,X).
	
isSomethingOn(X,Y) :-
	\+ on(Y,X),
	Y = 'nothing'.
	
onTableBlocks(X) :-
	on(X,'table').
	
showTable :-			% finish this rule
	write('_____________________________________'),
	nl,
	write('   | |                      | |      '),
	nl,
	write('   | |                      | |      '),
	nl,
	write('   | |                      | |      '),
	nl.
	
showOneBlock(X) :-			% finish this rule
	shape(X,Y),
	Y == 'ball',
	write(' ('),
	capitalizeIt(X,Z),
	write(Z),
	write(') ').
	
showOneBlock(X) :-			% finish this rule
	shape(X,Y),
	Y == 'cube',
	write(' ['),
	write(X),
	write('] ').

showOneBlock(X) :-			% finish this rule
	shape(X,Y),
	Y == 'pyramid',
	write(' /'),
	capitalizeIt(X,Z),
	write(Z),
	write('\\ ').
	
showOneBlock(X) :-
	X == 'nothing',
	write('     ').

% NOTES:
% - allow for any number of blocks high &
%	any number across
% - print block names in CAPS even though they're stored
%	as small letters (so they're constants) in the DB
% - print the blocks' shapes using:   [X]   (X)   /X\
%      ("issue" with \ in Prolog - see book for help)
% - the strategy:
%     - determine what's where, going from table UP then
%     - write out what's where, going from top DOWN

% here's a support rule (param1: IN, param2: OUT)
capitalizeIt(table,'TABLE').
capitalizeIt(robbie,'ROBBIE').
capitalizeIt(X, CapX) :-         	% converts 1 small letter
	name(X, [AsciiNum]), 		%     to its CAP version
	CapAsciiNum is AsciiNum - 32,
	name(CapX, [CapAsciiNum]).
