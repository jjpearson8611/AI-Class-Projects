% FILE:  initialState - the dynamic DB
%    - use this file AS IS, but add :- dynamic directives
%	(which SWI Prolog requires) for the 3 predicates


:- dynamic on/2.
:- dynamic holding/1.
:- dynamic left/2.


holding(nothing).

on(a,table).
on(b,table).
on(c,table).
on(d,table).
on(e,table).
on(f,table).
on(g,table).
on(h,b).
on(i,h).
on(j,i).
on(k,c).
on(l,k).
on(m,f).
on(n,m).

left(a,b).
left(b,c).
left(c,d).
left(d,e).
left(e,f).
left(f,g).
