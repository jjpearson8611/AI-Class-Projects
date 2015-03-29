%ProblemInterface.pl Assignment Three Jason Pearson


% generate_successor( StateIn, StateOut )                      % FUNCTION PRED
%	- generates all IMMEDIATE adjacent states of StateIn, 1 at a time
%	- the caller calls this repeatedly to get all successors of StateIn
%	- NOTE:  search's code checks/handles if StateOut was already opened
%		or closed (e.g., in a graph)
%	- called by add_successor #2 rule

generate_successor(StateIn, StateOut) :- 
	connected(StateIn, StateOut, _).


% goal_reached( StateIn )                                      % BOOLEAN PRED
%	- checks if StateIn is a goal (and hence, search should stop)
%	- multiple goal states are possible for some problems, so multiple
%		goal_reached predicates may be needed
%	- for some problems and/or in testing, this may be a hard-coded fact
%		goal_reached(kalamazoo).
%	- called by add_successor #1 rule

goal_reached( StateIn ) :-
	current(_, StateIn).



% find_hhat( StateIn, HHatOut )                                % FUNCTION PRED
%	- calculates the evaluation function or looks it up in a table
%		i.e., the estimate of "how far" from StateIn to the GoalState
%	- (0 would be returned if this is not an intelligent search)
%	- called by add_state #1 (& #3)

find_hhat(_,HHatOut) :-
	state(djikstra),
	HHatOut is 0.

find_hhat( StateIn, HHatOut) :-
	state(astardirect),
	norm_hhat(StateIn, HHatOut).
	
find_hhat(StateIn, HHatOut) :-
	state(astarbridgeten),
	current(_,GoalState),
	differentPen(StateIn, GoalState),
	airDistance(StateIn, theBridge, Dist1),
	airDistance(theBridge, GoalState, Dist2),
	X is Dist1 + Dist2,
	HHatOut is X * 1.1.	
	
find_hhat( StateIn, HHatOut) :-
	state(astarbridgeten),
	current(_,GoalState),
	\+ differentPen(StateIn, GoalState),
	norm_hhat(StateIn, X),
	HHatOut is X * 1.1.
	
find_hhat(StateIn, HHatOut) :-
	state(astarbridgefifty),
	current(_,GoalState),
	differentPen(StateIn, GoalState),
	airDistance(StateIn, theBridge, Dist1),
	airDistance(theBridge, GoalState, Dist2),
	X is Dist1 + Dist2,
	HHatOut is X * 1.5.

find_hhat( StateIn, HHatOut) :-
	state(astarbridgefifty),
	current(_,GoalState),
	\+ differentPen(StateIn, GoalState),
	norm_hhat(StateIn, X),
	HHatOut is X * 1.5.
	
	
find_hhat(StateIn, HHatOut) :-
	state(astarbridge),
	current(_,GoalState),
	differentPen(StateIn, GoalState),
	airDistance(StateIn, theBridge, Dist1),
	airDistance(theBridge, GoalState, Dist2),
	HHatOut is Dist1 + Dist2.

find_hhat(StateIn, HHatOut) :-
	state(astarbridge),
	norm_hhat(StateIn, HHatOut).
	
find_hhat(StateIn, HHatOut) :-
	state(bestfirst),
	current(_,GoalState),
	differentPen(StateIn, GoalState),
	airDistance(StateIn, theBridge, Dist1),
	airDistance(theBridge, GoalState, Dist2),
	HHatOut is Dist1 + Dist2.
	
find_hhat( StateIn, HHatOut) :-
	state(bestfirst),
	current(_,GoalState),
	\+ differentPen(StateIn, GoalState),
	norm_hhat(StateIn, HHatOut).

	
norm_hhat(StateIn, HHatOut) :-
	current(_,GoalState),
	airDistance(StateIn, GoalState, HHatOut).
	

airDistance(A,B,Distance) :-
	latlong(Lat1,Long1, A),
	latlong(Lat2,Long2, B),
	EarthRadius is 3963.1676,
	Pi is 3.14159265,
	D2R is Pi / 180,
	AOB is acos(cos(Lat1 * D2R) * cos(Lat2 * D2R) * cos((Long1 - Long2) * D2R) + sin(Lat1 * D2R) * sin(Lat2 * D2R)),
	Distance is EarthRadius * AOB.
	
differentPen(A,B) :-
	up(Upper),
	member(A, Upper),
	\+ member(B, Upper).
	
differentPen(A,B) :-
	up(Upper),
	member(B, Upper),
	\+ member(A, Upper).
	
	
% find_cost_of_path( StateListIn, CostSumOut )                 % FUNCTION PRED
%	- computes GPrime, i.e., the cost of path of states in the list, i.e.,
%		[ThisState, Predecessor, ..., StartState]
%	- NOTE:  if there are N states in the list, sum up N-1 edge costs
%	- called by add_state #1 calls this (& #2) (& fix_opened)]

find_cost_of_path([_], Y) :-
	Y is 0.

find_cost_of_path([H1, H2 | Tail], Y) :-
	connected(H1, H2, X),
	costFinder(H2, Tail, G),
	find_cost_of_path(Tail,NewDist),
	Y is NewDist + X + G.
	
find_cost_of_path([H1, H2], Y) :-
	connected(H1, H2, Y).
	
costFinder(X, [H1 | _], Y) :-
	connected(X,H1,G),
	Y is G.
