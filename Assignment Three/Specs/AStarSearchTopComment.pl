% A* Search (Generic Search)
%
% PURPOSE:  To find the minimum cost path between a Start and Goal state,
%    using less effort than a non-intelligent search (e.g., Dijkstra's).
%    However, it can only guarantee to produce the optimal solution if
%    it's evaluation function always underestimates the true costs at each
%    stage - which is not always knowable for all types of problems.
%    Overestimating will still produce a solution, but it may not always
%    be optimal.  The closer the estimate is to the true cost, the less
%    effort spent in searching.
%
%    As an intelligent search, A* is only applicable for problems where
%    there is sufficient domain-specific knowledge for estimating the
%    cost from the Current state to the Goal state.  A* uses the function,
%    FHat = G + HHat, to guide the search (i.e., the minimum FHat), where
%        G = cost from Start to Current state (known measureable data)
%        HHat = estimate of H, the cost from Current to Goal state
%
% GENERIC SEARCH:  A* search can be seen as generic in that it can easily
%    be changed to:
%        - plain informed search (e.g., Dijkstra's)  --> FHat = G + 0
%        - BestFirst (intelligent) search            --> FHat = 0 + HHat
%        - HillClimbing (intelligent) search         --> FHat = 0 + HHat
%            and clearing out opened each time around
%        - DepthFirst and BreadthFirst (systematic) searches
%            by keeping opened nodes as a stack (DFS) or queue (BFS),
%                (e.g., asserta (DFS) vs. assertz (BFS))
%            selecting from the top/front (e.g., retract)
%                (vs. the node with the best FHat)
%            and calculating GPrime's using new edge-cost as 1
%        - other variations of these types of searches
%        - tree-search variations of these
%    This code is also generic in that it can be used on any specific
%    search problem by just defining 4 problem-specific rules for the
%    paricular application, e.g., map problem, (robot) visibility graph,
%    theorem-proving, blocks world, maze, . . . either explicit or implicit.
%
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%
% An application program uses the following modules (#2-5 need writing):
%
% 1) SEARCH (the code in this file) does the actual searching.  To start it,
%    call search (rule) with a specific StartState parameter value, and it
%    returns the FinalCost and SolutionList.  This does just a SINGLE search
%    (using A*) of the SEARCH SPACE for a given StartState and GoalState(s).
%    (This file also contains some code for user I/O, cleanup, etc. to
%    demonstrate how these might be done - move this code to modules 4 & 5).
%    [Code adapted from Rowe's Prolog book, with significant changes].
%
% 2) SEARCH SPACE contains an instance of the problem - either:
%    - explicit (a graph as the state space) OR
%    - implicit (a production system: i.e., the DB & production rules).
%
% 3) PROBLEM INTERFACE (between the SEARCH and the SEARCH SPACE) contains
%    4 problem-specific rules (described in detail in comments below) which
%    are called by rules in the SEARCH code.  These 4 rules call/use the
%    knowledge/data in the SEARCH SPACE.
%
% 4) USER INTERFACE contains the end-user interaction code - e.g.,
%    - getting various user options (if any)
%    - getting the StartState & GoalState (if interactive vs. batch)
%        - the CONTROLLER uses StartState when it calls search
%        - goal_reached (in PROBLEM INTERFACE) uses GoalState
%    - displaying the final answers:  FinalCost & SolutionList
%    - displaying the cost of finding the solution (if requested)
%        (i.e., the number of states visited = the closed nodes)
%    - displaying intermediate information to the user (if requested)
%        (e.g., information about opened & closed nodes)
%    [Some of this code is now in this SEARCH file - move it here instead].
%    [NOTE:  to pass data (e.g., user options, GoalState, data to display)
%        between rules in different parts of the program, use parameters
%        or global storage (assert stores it, unification can retrieve it,
%        and remember to include a :- dynamic command)] 
%
% 5) CONTROLLER automates the overall program execution so all a user
%    needs to do is consult just the CONTROLLER file.  The controller does
%    such things as these (depending on the application requirements):
%    - (re)consult the other files at the appropriate times
%    - do looping (if needed) in the appropriate places (nested loops) to do:
%        - >1 different sets of user options
%        - >1 different search strategies for a particular Start/Goal pair
%        - >1 different Start/Goal pairs
%    - call procedure(s) in USER INTERFACE to get user options (if needed)
%    - determine a StartState and GoalState - by one of the following:
%        - the already consulted DB of pairs (as facts), or
%        - "reading" a pair from a file (with some text conversion)
%        - getting a pair from the user (using a rule in USER INTERFACE)
%    - run the search by calling the search rule,
%    - call a USER INTERFACE procedure to print FinalCost & SolutionList
%    - if looping, do necessary cleanup to prepare for next time around
%        e.g., global storage in DB (things asserted or consulted) such as
%        (depending on what's required and how you implement the project)
%        switches, counters, user option choices, StartState & GoalState.
%        SEARCH already has code to cleanup opened/closed/beststate/counter
%        which should be moved to CONTROLLER.
%    - halt for self-stopping code
%    - the :-go. command at the end to make it it self-starting
%        assuming all the above is in a go rule.
%
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%
% The PROBLEM INTERFACE file has these 4 "RULES" which need to be expanded - 
%	usually necessitating a body to the rule (Prolog-wise).  The rules
%	must have these particular names, arities, parameter-orders and
%	functionality - since that's what the search code uses.
%
% generate_successor( StateIn, StateOut )                      % FUNCTION PRED
%	- generates all IMMEDIATE adjacent states of StateIn, 1 at a time
%	- the caller calls this repeatedly to get all successors of StateIn
%	- NOTE:  search's code checks/handles if StateOut was already opened
%		or closed (e.g., in a graph)
%	- called by add_successor #2 rule
%
% goal_reached( StateIn )                                      % BOOLEAN PRED
%	- checks if StateIn is a goal (and hence, search should stop)
%	- multiple goal states are possible for some problems, so multiple
%		goal_reached predicates may be needed
%	- for some problems and/or in testing, this may be a hard-coded fact
%		goal_reached(kalamazoo).
%	- called by add_successor #1 rule
%
% find_hhat( StateIn, HHatOut )                                % FUNCTION PRED
%	- calculates the evaluation function or looks it up in a table
%		i.e., the estimate of "how far" from StateIn to the GoalState
%	- (0 would be returned if this is not an intelligent search)
%	- called by add_state #1 (& #3)
%
% find_cost_of_path( StateListIn, CostSumOut )                 % FUNCTION PRED
%	- computes GPrime, i.e., the cost of path of states in the list, i.e.,
%		[ThisState, Predecessor, ..., StartState]
%	- NOTE:  if there are N states in the list, sum up N-1 edge costs
%	- called by add_state #1 calls this (& #2) (& fix_opened)
%
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% opened & closed - stored in fact DB (asserted/retracted) - format:
%	opened( StateName, PathList, G, FHat ).
%		where PathList is a list of states from THIS state back to the
%		INITIAL state:  [StateName, Predecessor, ..., StartState]
%	closed( StateName, G ).
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
