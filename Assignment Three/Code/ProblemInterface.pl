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

find_hhat( StateIn, HHatOut) :-
	latlong(X,Y,StateIn),
	current(_, GoalState),
	latlong(A,B,GoalState),
	Lat is 68.686 * (A - X),
	Long is 69.171 * (B - Y) * cos(A - X),
	ASquared is Lat * Lat,
	BSquared is Long * Long,
	HHatOut is sqrt(ASquared + BSquared).




% find_cost_of_path( StateListIn, CostSumOut )                 % FUNCTION PRED
%	- computes GPrime, i.e., the cost of path of states in the list, i.e.,
%		[ThisState, Predecessor, ..., StartState]
%	- NOTE:  if there are N states in the list, sum up N-1 edge costs
%	- called by add_state #1 calls this (& #2) (& fix_opened)]

find_cost_of_path([_], Y) :-
	Y is 42.

%find_cost_of_path([H1, H2 | Tail], Y) :-
%	connected(H1, H2, X),
%	NewDist is X + Y,
%	append(H2,Tail),
%	find_cost_of_path(Tail,NewDist).
	
find_cost_of_path([_, _|_],Y) :-
	Y is 42.
