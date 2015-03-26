% A* Search (Generic Search)

:- dynamic(opened/4).
:- dynamic(closed/2).
:- dynamic(tempBest/1).
:- dynamic(counter/1).

search( StartState, SolutionList, FinalCost ) :-

     initial_routines,
     add_state( StartState, [] ),
     repeat_if_still_some_opened,
	  pick_best_state( BestState, Pathlist ),
	  add_successors(  BestState, Pathlist ),
     opened( BestState, SolutionList, FinalCost, _ ),
     final_routines( BestState ).

add_state( Newstate, Pathlist ) :-			
     find_cost_of_path( [Newstate | Pathlist], GPrime ),
     !,
     check_opened( Newstate, GPrime ),
     !,
     check_closed( Newstate, Pathlist, GPrime ),
     !,
     find_hhat( Newstate, HHat ),
     FHat is GPrime + HHat,
     asserta( opened( Newstate, [Newstate | Pathlist], GPrime, FHat )),
     !.

pick_best_state( _, _ ) :-
     asserta( tempBest( dummyState, [], dummy ) ),
     opened( State, PathList, _, FHat ),
         tempBest( BestState, _, BestFHat ),
         special_less_than( FHat, BestFHat ),
             retract( tempBest( BestState, _, _ ) ),
             asserta( tempBest( State, PathList, FHat )),
     fail.
pick_best_state( State, Pathlist ) :-
     retract( tempBest( State, Pathlist, _ ) ),
     !.

special_less_than( _, dummy ) :-
     !.
special_less_than( X, Y ) :-
     X < Y.

add_successors( State, _ ) :-
     goal_reached( State ),
     !.	
add_successors( State, Pathlist ) :-
     generate_successor( State, Newstate ),
          add_state( Newstate, Pathlist ),
     fail.
add_successors( State, _ ) :-
     retract( opened( State, _, G, _)),
     asserta( closed( State, G )),
     fail.

repeat_if_still_some_opened.
repeat_if_still_some_opened :-
     opened( _, _, _, _ ),
     repeat_if_still_some_opened.

initial_routines.

check_opened( State, Gprime ) :-
     opened( State, _, G, _ ),
     Gprime < G,
          retract( opened( State, _, _, _ )),
          !.
check_opened( State, _ ) :-
     opened( State, _, _, _ ),
          !,
          fail.
check_opened( _, _ ).

check_closed( State, PathList, GPrime ) :-
     closed( State, G ),
     GPrime < G,
          retract( closed( State, G )),
          asserta( closed( State, GPrime )),
          !,
	  ExcessG is G - GPrime,
          fix_opened( State, PathList, ExcessG ). 
check_closed( State, _, _ ) :-
     closed( State, _ ),
          !,
          fail.
check_closed( _, _, _ ).

fix_opened( Parent, ParPathList, ExcessG ) :-
     opened( Child, ChPathList, _, ChFHat ),
          fix_path( Parent, ParPathList, ChPathList,
				 NewPathList ),
          find_cost_of_path( NewPathList, NewG ),
          NewFHat is ChFHat - ExcessG,
          retract( opened( Child, _, _, _ ) ),
          asserta( opened( Child, NewPathList, NewG, NewFHat ) ),
     fail.

fix_path( Parent, ParPath, ChPath, NewPath ) :-
     append( BeforeList, [Parent | _], ChPath ),
     append( BeforeList, [Parent | ParPath], NewPath ),
     !.

append(  [], L, L ).
append(  [I | L1], L2, [I | L3] ) :-
     append( L1, L2, L3 ).
