%Prolog queries which correspond to my English-language questions

%There's a rock on the table
q1 :-
	on(therock,thetable).
	
%The rock is above the table
q2 :-
	above(therock,thetable).
	
%The table is below a rubber thing which is black
q3 :-
	below(thetable,Z),
	color(Z,black),
	material(Z,rubber).
	
%There is a round object directly right of an empty white thing
q4 :-
	round(X),
	rightOf(X,Y),
	empty(Y),
	white(Y).
	
	
	
%There's a cardboard or paper thing next to a small or solid object
%There is a hollow striped thing which can roll
%There's a large round thing next to something made of glass
%There is a yellow thing above a black thing
%There is a yellow thing above a black object
%Block e is above block a
%Block e is on block a
%The table is under block d
%There is a pyramid directly left of an object which can pop
%The prism is somewhere left of the balloon
%Robbie's hand is black
%There is an object made of china which can roll
%There is an object made of china which could roll
%Robbie is holding nothing
%Robbie is holding something
%Robbie is not holding something
%Robbie is holding a flat thing
%Robbie is above the balloon
%There is a heavy spotted thing next to a small square wood thing
%The box or the cup is made of rubber or metal or glass
%The glass can not crack
%There is something which is not black or cardboard or wood
%There is an object with nothing on it
%There is something with nothing on it
%There is not something not on the table

%Which are black metal things
%Which are black metal objects
%Which black or grey things could not roll
%Which things are neither black nor white, but are round
%Which white china objects are the same shape as another object
%What color is robbie
%What shape is the thing made of grey cardboard
%What are all the things that are flat on top
%What are all the things that are flat on top made of wood
%Which big things are next to small things
%Which things are round and can not roll
%Which things can not have something put on them
%What is robbie holding
%Which things are somewhere right of paper object
%What's crushable or popable things but not grey or white
%What things could not crack
%Which things can roll and could not roll
%What's not on the table
%Block D is above which things
%Which things is the dish next to
%What has a breakable object directly left or right of itself
%Which flat things could roll and not shatter
%Which objects are below something
%Which things can robbie not pickup
%Which cubes are under something
%What's on the table and not on the table
%Which red striped cubes are somewhere left of blue spotted rocks
%What can bounce or make rainbows
%Which hollow objects are dark or light
%What solid things are transparent
%Which things could not have something put on them
%Which things are on their sides
%What has nothing on it
%What kind of things are the cardboard, metal and wood things
