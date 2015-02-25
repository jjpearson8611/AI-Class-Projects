% A* Search (Generic Search)
%
% See separate file for extensive comments
%
% Program needs 4 PROBLEM INTERFACE rules (put in separate file) in order to work.
% 	generate_successor( StateIn, StateOut )
%	goal_reached( StateIn )
%	find_hhat( StateIn, HHatOut )
%	find_cost_of_path( StateListIn, CostSumOut )
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

:- dynamic(opened/4).
:- dynamic(closed/2).
:- dynamic(tempBest/1).
:- dynamic(counter/1).				% Move this one to CONTROLLER

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%- - - - - - - - - - - - - - - - M A I N - - - - - - - - - - - - - - - - - - -
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
						       % + - - (FUNCTION PRED)
search( StartState, SolutionList, FinalCost ) :-

     initial_routines,
     add_state( StartState, [] ),			% + +

     repeat_if_still_some_opened,			% backtrack/fail loop
	  pick_best_state( BestState, Pathlist ),	% - -
	  add_successors(  BestState, Pathlist ),	% + +   (the "fail")
						
						  % BestState is now GoalState
     opened( BestState, SolutionList, FinalCost, _ ),	% + - -
						        % so get its Path & G
     final_routines( BestState ).

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%- - - - - - - - - - 3   M A J O R   P R O C E D U R E S - - - - - - - - - - -
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
						      % + + (SIDE-EFFECT PRED)
% called by main search & by add_successors

add_state( Newstate, Pathlist ) :-			
     find_cost_of_path( [Newstate | Pathlist], GPrime ),	% [+ | +], -
     !,
     check_opened( Newstate, GPrime ),			% previously opened?
     !,								% + +
     check_closed( Newstate, Pathlist, GPrime ),	% previously closed?
     !,								% + + +
					    % If it gets this far,
					    % it's never been opened/closed
     find_hhat( Newstate, HHat ),				% + -
     FHat is GPrime + HHat,					% - + +
     asserta( opened( Newstate, [Newstate | Pathlist], GPrime, FHat )),
								% all +
     !.				      % Newstate appended to front of Pathlist
				      %	and GPrime used for G

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
							 % - - (FUNCTION PRED)
% called by main search - returns 2 values:
%	- the BestState out of all the opened states
%		(the state with the minimum FHat value)
%	- Pathlist, the path (a backwards list) from StartState to BestState
% 
% 1st step (rule 1): a backtrack/fail loop
%			- uses global storage for tempBest:
%				tempBest(StateName, PathList, FHat)
% 2nd step (rule 2): returns the 2 values stored in tempBest fact

pick_best_state( _, _ ) :-
     asserta( tempBest( dummyState, [], dummy ) ),  	% initialize
     opened( State, PathList, _, FHat ),	      	% loop: get a State
         tempBest( BestState, _, BestFHat ),	      	% get tempBest's data
         special_less_than( FHat, BestFHat ),	     % if State's Fhat better
             retract( tempBest( BestState, _, _ ) ),	   % replace tempBest
             asserta( tempBest( State, PathList, FHat )),  % with State data
     fail.

pick_best_state( State, Pathlist ) :-		    	% - -
     retract( tempBest( State, Pathlist, _ ) ),    	% grabs values &
     !.							%          cleans up

special_less_than( _, dummy ) :-			% BOOLEAN PRED
     !.							%     utility
special_less_than( X, Y ) :-
     X < Y.

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
					    % + + (BOOLEAN & SIDE-EFFECT PRED)
% called by main search
%	where pick_best_state already instantiated the 2 parameters.
% This predicate serves as the "fail" for main search's backtrack/fail loop,
%	since the NORMAL CASE ultimately fails
%	after doing the side-effects of generating & adding successors
% Rule #1 is the only way to SUCCEED,
%    causing main's search to stop looping and proceeds to the final routines.

add_successors( State, _ ) :-		    % SPECIAL CASE - SUCCEEDS
     goal_reached( State ),
     !.	
					    % NORMAL CASE - FAILS
add_successors( State, Pathlist ) :-		% step 1) BT/FAIL LOOP:
     generate_successor( State, Newstate ),	%    generate 1 child
          add_state( Newstate, Pathlist ),	%    add it to open (maybe..)
     fail.					%    FAIL so keep looping
					% (loop exists when generate_successor
					%   is done generating for this State)

add_successors( State, _ ) :-			% step 2) AFTER LOOP:
     retract( opened( State, _, G, _)),		%    move State from opened
     asserta( closed( State, G )),		%		   to closed
     fail.					% step 3) FAIL

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%- - - - - - - - - - S U P P O R T   U T I L I T I E S - - - - - - - - - - - -
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	            % an "infinite" repeat - as long as there's an opened node

repeat_if_still_some_opened.				% like:	 repeat.
repeat_if_still_some_opened :-				% 	 repeat :-
     opened( _, _, _, _ ),
     repeat_if_still_some_opened.			%	     repeat.

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
			% IF you need to do any 1-time initial things for this
			%         single search on a single Start/Goal pair
			% THEN expand this rule
initial_routines.

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		    % These things should go in CONTROLLER or USER INTERFACE.
		    % Only keep search-specific final tasks in final_routines.

final_routines(GoalState) :-					% +
     write('Goal State: '), write(GoalState), nl,
     measure_effort,
     cleanup.				% not need if CONTROLLER doesn't loop

measure_effort :-
     count_states( opened( _, _, _, _), N_Opened ),		% + -
         write( N_Opened ),
	 write( ' states still OPENED' ), nl,
     count_states( closed( _, _ ),      N_Closed ),		% + -
         write( N_Closed ),
	 write( ' states CLOSED' ), nl,
     !.

					% works for counting up any Predicate
count_states( Predicate, _ ) :-		% 1st) count them   (+ -)
     asserta( counter( 0 )),		%         initialize
     call( Predicate ),			%         backtrack/fail loop
          retract( counter( I )),
          NewI is I + 1,
          asserta( counter( NewI )),
     fail.
count_states( _, N ) :-			% 2nd) return total N
     retract( counter( N )),		%          (grab N & cleanup)
     !.

cleanup :-
     retractall( opened(_,_,_,_) ),	% all opened nodes stored as FACTS
     retractall( closed(_,_)      ),	% all closed nodes stored as FACTS
     retractall( tempBest(_)    ).	% temp storage from pick_best_state

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
					    % + + (BOOLEAN & SIDE-EFFECT PRED)
check_opened( State, Gprime ) :-		
     opened( State, _, G, _ ),		    % case 1: State was prev. opened
     Gprime < G,				%	  and g' < g
          retract( opened( State, _, _, _ )),	% so delete old one
          !.					% & succeed to allow add_state
						%    to continue
						% (where new one is asserted)

check_opened( State, _ ) :-		    % case 2: State was prev. opened
     opened( State, _, _, _ ),			%	  and g' NOT < g
          !,					% so leave it opened
          fail.					%    and return FAIL
						% so add_state WON'T continue

check_opened( _, _ ).			    % case 3: It was NOT prev. opened
						% so add_state WILL continue
						% (where new one is asserted)

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
					    % + + (BOOLEAN & SIDE-EFFECT PRED)
check_closed( State, PathList, GPrime ) :-
     closed( State, G ),		    % case 1: State was prev. closed 
     GPrime < G,				%	  and g' < g
          retract( closed( State, G )),		%   so change the G
          asserta( closed( State, GPrime )),	%   to GPrime
          !,
	  ExcessG is G - GPrime,		% & determine difference to:
          fix_opened( State, PathList, ExcessG ). % fix all opened children
						%       by this excess amount
				  % (fix_opened will FAIL, so add_state WON'T
				  % continue so State WON'T be opened again

check_closed( State, _, _ ) :-		    % case 2: State was prev. closed 
     closed( State, _ ),			%	  and g' NOT < g
          !,
          fail.					% so return FAIL
						% so add_state WON'T continue

check_closed( _, _, _ ).		    % case 3: It was NOT prev. closed
						% so add_state WILL continue

%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
						    % + + + (SIDE-EFFECT PRED)
fix_opened( Parent, ParPathList, ExcessG ) :-
						% (backtrack/fail loop)
     opened( Child, ChPathList, _, ChFHat ),	% try every opened state
				    % IF Parent state is part of ChPathList
				    % then fix_path replaces the tail of
				    % ChPathList to reflect new tail obtained
				    % from ParPathList producing NewPathList
          fix_path( Parent, ParPathList, ChPathList,	% + + + -
				 NewPathList ),		% produce NewPathList
          find_cost_of_path( NewPathList, NewG ),	% produce NewG
          NewFHat is ChFHat - ExcessG,			% produce NewFHat
          retract( opened( Child, _, _, _ ) ),
          asserta( opened( Child, NewPathList, NewG, NewFHat ) ),
					% assert new corrected data
     fail.				% (fix_opened WILL ultimately fail)

% NOTE on fix_path
% 1st append:  splits ChPath list (which needs fixing) into 3 parts:
%   1) List of states from Child to Parent  (the BEFORE part which we'll keep)
%   2) Parent itself (which we'll keep)
%   3) List of states from Parent to StartState (the "_" part)
%      (the AFTER part gets replaced since there's a cheaper way, ParPath)			
% 2nd append:  combines 3 parts to produce NewPath
%   1) List of states from Child to Parent (the BEFORE part from above)
%   2) Parent itself (from above)
%   3) ParentPath (the corrected Parent to StartState path which doesn't yet
%	have Parent state added to the front of it)
%	[note add_state's call to find_cost_of_path to see that]

fix_path( Parent, ParPath, ChPath, NewPath ) :-			% + + + -
     append( BeforeList, [Parent | _], ChPath ),		% - [+ | -] +
     append( BeforeList, [Parent | ParPath], NewPath ),		% + [+ | +] -
     !.

% NOTE:  append(L1, L2, L3) is a reversable predicate which can either:
% 	- concatenate L1 & L2 producing L3 (if IN, IN, OUT parameters)
% 	- or split L3 into L1 and L2 (if OUT/IN/IN or IN/OUT/IN)

append(  [], L, L ).
append(  [I | L1], L2, [I | L3] ) :-
     append( L1, L2, L3 ).
