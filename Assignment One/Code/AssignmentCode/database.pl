%The DB of Facts
%- include data about Robbie, the table and all of the objects
%- data must be stored in record-based format (themore like a traditional CS data file, but make it Prolog-friendly)
% rather than as individual property predicates (thee.g., size, shape, madeOf, material, )
%- 2 types of facts:
% 1) static (thefixed) properties  things which can not change in this world  e.g.,
% name, typeOfThing, color, size, material,
% 2) dynamic (therelative) properties  a snapshot of this particular current state of the world
% things which can change (thee.g., if Robbie moved an object)  e.g., orientation, left, on
% [left means directly left of, with nothing in between & object is actually on the table
%on means directly on top of with nothing in between]
%- Robbie and each of the objects have 2 facts: a static property fact and a dynamic property fact
% - the table just has a static property fact since it can not change
%- Robbie and the table facts might have different number & order of parameters than the objects facts do 

%static facts
%name, shape, color, material, size, type
staticFact(robbie, claw, gray, userule, large, arobot).
staticFact(thetable, table, gray, metal, large, atable).
staticFact(theprism, pyramid, transparent, userule, medium, aprism).
staticFact(thecube, cube, silver, metal, medium, acube).
staticFact(themarble, sphere, transparent, userule, small, amarble).
staticFact(thebaseball, sphere, white, leather, medium, aball).
staticFact(thebox, rectangularPrism, brown, cardboard, medium, abox).
staticFact(therock, rock, gray, granite, medium, arock).
staticFact(theglass, cylinder, transparent, userule, medium, aglass).
staticFact(thecup, cone, white, paper, medium, acup).
staticFact(thetube, cylinder, brown, cardboard, medium, atube).
staticFact(theball, sphere, black, rubber, medium, aball).
staticFact(thedish, circle, white, userule, medium, adish).
staticFact(theblockA, cube, brown, userule, small, ablock).
staticFact(theblockB, cube, brown, userule, small, ablock).
staticFact(theblockC, cube, brown, userule, small, ablock).
staticFact(theblockD, cube, brown, userule, small, ablock).
staticFact(theblockE, cube, brown, userule, small, ablock).
staticFact(thepencil, cylinder, yellow, userule, small, apencil).
staticFact(theballoon, sphere, yellow, userule, medium, aballoon).

%dynamic facts
%name, orientation, filled
dynFact(robbie, upright, unable).
dynFact(theprism, onBase, unable).
dynFact(thecube, none, unable).
dynFact(themarble, none, unable).
dynFact(thebaseball, none, unable).
dynFact(thebox, onBase, empty).
dynFact(therock, none, unable).
dynFact(theglass, onBase, empty).
dynFact(thecup, onBase, empty).
dynFact(thetube, onBase, empty).
dynFact(theball, none, unable).
dynFact(thedish, onBase, theball).
dynFact(theblockA, none, unable).
dynFact(theblockB, none, unable).
dynFact(theblockC, none, unable).
dynFact(theblockD, none, unable).
dynFact(theblockE, none, unable).
dynFact(thepencil, onSide, unable).
dynFact(theballoon, onSide, air).


%dynamic relation facts
%name, directly to the left of, ontop of
dynRelFact(robbie, nothing, nothing).
dynRelFact(theprism, themarble, thecube).
dynRelFact(thecube, themarble, thetable).
dynRelFact(themarble, thebaseball, thetable).
dynRelFact(thebaseball, thebox, thetable).
dynRelFact(thebox, therock, thetable).
dynRelFact(therock, theglass, thetable).
dynRelFact(theglass, thecup, thetable).
dynRelFact(thecup, thetube, thetable).
dynRelFact(thetube, theball, thetable).
dynRelFact(theball, theblockA, thetable).
dynRelFact(thedish, theblockA, thetable).
dynRelFact(theblockA, thepencil, thetable).
dynRelFact(theblockB, thepencil, theblockA).
dynRelFact(theblockC, thepencil, theblockB).
dynRelFact(theblockD, thepencil, theblockC).
dynRelFact(theblockE, thepencil, theblockD).
dynRelFact(thepencil, theballoon, thetable).
dynRelFact(theballoon, nothing, thetable).

%robbie, holding
robbie(robbie,nothing).
