% FILE:  TestSomewhereLeft.pl
% INSTRUCTIONS:  plug in your somewhereLeft rule,
%       then load this into Prolog

% tiny DB -----------------------------------------
% --<<              << Robbie's hand
%
%           O
%   M       N
%   K       L
%   I       J
%   G       H
%   A B C D E F
% ----------------- << the table

left(a,b).
left(b,c).
left(c,d).
left(d,e).
left(e,f).

on(a,table).
on(b,table).
on(c,table).
on(d,table).
on(e,table).
on(f,table).
on(m,k).
on(k,i).
on(i,g).
on(g,a).
on(o,n).
on(n,l).
on(l,j).
on(j,h).
on(h,e).

% tiny KB -----------------------------------------
above(X,Y) :-
        on(X,Y).
above(X,Y) :-
        on(X,Z),
        above(Z,Y).

% *** PLUG IN YOUR somewhereLeft RULE HERE ***


somewhereLeft(X,Y) :-
	left(X,Y).
	
somewhereLeft(X,Y) :-
	(left(X,Z),
	somewhereLeft(Z,Y));
	(left(X,Z),
	above(Y,Z));
	(above(X,Z),
	somewhereLeft(Z,Y)).
	











% *************************************************

% SET OF QUESTION VALUES --------------------------
aPair(a,b).
aPair(a,e).
aPair(d,h).
aPair(d,o).
aPair(a,o).
aPair(m,e).
aPair(m,o).
aPair(i,j).
aPair(c,b).
aPair(f,a).
aPair(j,i).
aPair(o,a).
aPair(o,m).
aPair(o,e).
aPair(a,a).
aPair(a,table).
aPair(table,a).

% THE GENERIC QUERY -------------------------------
checkSomewhereLeft(X,Y) :-
        somewhereLeft(X,Y),
        write(yes),nl.
checkSomewhereLeft(_,_) :-
        write(no),nl.

% SERVICE METHODS ---------------------------------
showPictureOfWorld :-
        write('--<<'),nl,nl,
        write('           O  '),nl,
        write('   M       N  '),nl,
        write('   K       L  '),nl,
        write('   I       J  '),nl,
        write('   G       H  '),nl,
        write('   A B C D E F'),nl,
        write('-----------------'),nl,nl.

doTrueFalseQuestions :-
        aPair(X,Y),
        write('Is '), write(X),
                write(' somewhere left of '), write(Y),
                write('?   '),
        once(checkSomewhereLeft(X,Y)),
        fail.
doTrueFalseQuestions.

% MAIN CONTROLLER ---------------------------------
go :-
        tell('LogResults.txt'),
        showPictureOfWorld,
        doTrueFalseQuestions,
        told,
        write('print LogResults.txt to see answers'),
        nl.

% run the CONTROLLER ------------------------------
% :- go.



