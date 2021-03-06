%database jason pearson cs5820 assgn 1

%static facts
%name, shape, color, material, size, type
staticFact(robbie, 		claw, 		black, 			userule, 	large, 		arobot).
staticFact(thetable, 	table, 		black, 			metal, 		large, 		atable).
staticFact(theprism, 	pyramid, 	transparent, 	userule, 	medium, 	aprism).
staticFact(thecube, 	cube, 		black, 			metal,		medium, 	acube).
staticFact(themarble, 	sphere, 	transparent, 	userule,	small, 		amarble).
staticFact(thebaseball, sphere, 	white, 			leather, 	medium,		aball).
staticFact(thebox, 		cube, 		grey, 			cardboard,	large, 		abox).
staticFact(therock, 	sphere, 	grey, 			granite, 	large, 		arock).
staticFact(theglass, 	cylinder, 	black,		 	userule, 	medium,		aglass).
staticFact(thecup, 		cylinder, 	white, 			paper, 		medium, 	acup).
staticFact(thetube, 	cylinder, 	black, 			cardboard, 	large, 		atube).
staticFact(theball, 	sphere, 	black, 			rubber, 	medium, 	aball).
staticFact(thedish, 	circle, 	white, 			userule, 	large,		adish).
staticFact(theblockA, 	cube, 		white, 			userule, 	small, 		ablock).
staticFact(theblockB, 	cube, 		white, 			userule, 	small, 		ablock).
staticFact(theblockC, 	cube, 		white, 			userule, 	small, 		ablock).
staticFact(theblockD, 	cube, 		white, 			userule, 	small, 		ablock).
staticFact(theblockE, 	cube, 		white, 			userule, 	small, 		ablock).
staticFact(thepencil, 	cylinder, 	yellow, 		userule, 	small, 		apencil).
staticFact(theballoon, 	sphere, 	white, 			userule, 	medium, 	aballoon).

%dynamic facts
%name, orientation
dynFact(theprism, 		onBase).
dynFact(thecube, 		none).
dynFact(themarble, 		none).
dynFact(thebaseball, 	none).
dynFact(thebox, 		onBase).
dynFact(therock, 		none).
dynFact(theglass, 		onBase).
dynFact(thecup, 		onBase).
dynFact(thetube, 		onBase).
dynFact(theball, 		none).
dynFact(thedish, 		onBase).
dynFact(theblockA, 		none).
dynFact(theblockB, 		none).
dynFact(theblockC, 		none).
dynFact(theblockD, 		none).
dynFact(theblockE, 		none).
dynFact(thepencil, 		onSide).
dynFact(theballoon, 	onSide).


%dynamic relation facts
%name, directly to the left of, ontop of, in the object
dynRelFact(theprism, 	nothing, 		thecube, 	unable).
dynRelFact(thecube, 	themarble, 		thetable,	unable).
dynRelFact(themarble, 	thebaseball,	thetable,	unable).
dynRelFact(thebaseball, thebox, 		thetable,	unable).
dynRelFact(thebox, 		therock, 		thetable,	empty).
dynRelFact(therock, 	theglass, 		thetable,	unable).
dynRelFact(theglass, 	thecup, 		thetable,	empty).
dynRelFact(thecup, 		thetube, 		thetable,	empty).
dynRelFact(thetube, 	thedish, 		thetable,	empty).
dynRelFact(theball, 	nothing, 		thedish, 	unable).
dynRelFact(thedish, 	theblockA, 		thetable,	theball).
dynRelFact(theblockA, 	thepencil, 		thetable,	unable).
dynRelFact(theblockB, 	nothing, 		theblockA,	unable).
dynRelFact(theblockC, 	nothing, 		theblockB,	unable).
dynRelFact(theblockD, 	nothing, 		theblockC,	unable).
dynRelFact(theblockE, 	nothing, 		theblockD, 	unable).
dynRelFact(thepencil, 	theballoon, 	thetable, 	unable).
dynRelFact(theballoon, 	nothing, 		thetable, 	air).

%robbie, holding
robbie(robbie,nothing).
