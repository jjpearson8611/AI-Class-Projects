% FILE:  Questions.pl

% NOTE: "a rock" refers to a TYPE of object
%		(i.e., ALL objects that are a type of rock),
%	whereas "the rock" specifies a NAME of a particular object.
%		(Similarly for other object types/names).
%	RULES would always refer to types of objects (aRock).
%	QUERIES could refer to either all objects of a certain type (aRock)
%		OR a particular named object (theRock) depending on what the
%		question stated.
% NOTE: "an object" does NOT include Robbie nor the table,
%	whereas "a thing" includes objects, Robbie and the table.
% NOTE: "can..." means is "can do it NOW given it's current orientation/state"
%	whereas "could..." means "it has the potential to do it,
%		but perhaps it's orientation would need to be changed
%		or it would need to be cleared off or moved somewhere or ...".
% --------------------------------------------------------------------------------

%number, question
tf_item(1, 'There''s a rock on the table'). 												%true
tf_item(2, 'The rock is above the table'). 													%true
tf_item(3, 'The table is below a rubber thing which is black'). 							%true
tf_item(4, 'There is a round object directly right of an empty white thing'). 				%true
tf_item(5, 'There''s a cardboard or paper thing next to a small or solid object').  		%true
tf_item(6, 'There is a hollow striped thing which can roll'). 								%false
tf_item(7, 'There''s a large round thing next to something made of glass'). 				%true
tf_item(8, 'There is a yellow thing above a black thing'). 									%false
tf_item(9, 'There is a yellow thing above a black object'). 								%true table below pencil
tf_item(10, 'Block e is above block a'). 													%true
tf_item(11, 'Block e is on block a'). 														%false
tf_item(12, 'The table is under block d'). 													%true
tf_item(13, 'There is a pyramid directly left of an object which can pop'). 				%false
tf_item(14, 'The prism is somewhere left of the balloon'). 									%true
tf_item(15, 'Robbie''s hand is black'). 													%false
tf_item(16, 'There is an object made of china which can roll').  							%false
tf_item(17, 'There is an object made of china which could roll'). 							%true
tf_item(18, 'Robbie is holding nothing'). 													%true
tf_item(19, 'Robbie is holding something'). 												%false
tf_item(20, 'Robbie is not holding something'). 											%true
tf_item(21, 'Robbie is holding a flat thing'). 												%false
tf_item(22, 'Robbie is above the balloon'). 												%false
tf_item(23, 'There is a heavy spotted thing next to a small square wood thing'). 			%false
tf_item(24, 'The box or the cup is made of rubber or metal or glass'). 						%true
tf_item(25, 'The glass can not crack'). 													%False
tf_item(26, 'There is something which is not black or cardboard or wood'). 					%true
tf_item(27, 'There is an object with nothing on it'). 										%true
tf_item(28, 'There is something with nothing on it').										%true
tf_item(29, 'There is not something not on the table'). 									%true

ans_ques(30, 'Which are black metal things').
ans_ques(31, 'Which are black metal objects').
ans_ques(32, 'Which black or grey things could not roll').
ans_ques(33, 'Which things are neither black nor white, but are round').
ans_ques(34, 'Which white china objects are the same shape as another object').
ans_ques(35, 'What color is robbie').
ans_ques(36, 'What shape is the thing made of grey cardboard').
ans_ques(37, 'What are all the things that are flat on top').
ans_ques(38, 'What are all the things that are flat on top made of wood').
ans_ques(39, 'Which big things are next to small things').
ans_ques(40, 'Which things are round and can not roll').
ans_ques(41, 'Which things can not have something put on them').
ans_ques(42, 'What is robbie holding').
ans_ques(43, 'Which things are somewhere right of paper object').
ans_ques(44, 'What''s crushable or popable things but not grey or white').
ans_ques(45, 'What things could not crack').
ans_ques(46, 'Which things can roll and could not roll').
ans_ques(47, 'What''s not on the table').
ans_ques(48, 'Block D is above which things').
ans_ques(49, 'Which things is the dish next to').
ans_ques(50, 'What has a breakable object directly left or right of itself').
ans_ques(51, 'Which flat things could roll and not shatter').
ans_ques(52, 'Which objects are below something').
ans_ques(53, 'Which things can robbie not pickup').
ans_ques(54, 'Which cubes are under something').
ans_ques(55, 'What''s on the table and not on the table').
ans_ques(56, 'Which red striped cubes are somewhere left of blue spotted rocks').
ans_ques(57, 'What can bounce or make rainbows').
ans_ques(58, 'Which hollow objects are dark or light').
ans_ques(59, 'What solid things are transparent').
ans_ques(60, 'Which things could not have something put on them').
ans_ques(61, 'Which things are on their sides').
ans_ques(62, 'What has nothing on it').
ans_ques(63, 'What kind of things are the cardboard, metal and wood things').
