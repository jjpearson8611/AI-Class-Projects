%The DB of Facts
%- include data about Robbie, the table and all of the objects
%- data must be stored in record-based format (themore like a traditional CS data file, but make it Prolog-friendly)
% rather than as individual property predicates (thee.g., size, shape, madeOf, material, …)
%- 2 types of facts:
% 1) static (thefixed) properties – things which can not change in this world – e.g.,
% name, typeOfThing, color, size, material,…
% 2) dynamic (therelative) properties – a snapshot of this particular current state of the world
%– things which can change (thee.g., if Robbie moved an object) – e.g., orientation, left, on
% [left means directly left of, with nothing in between & object is actually on the table
%on means directly on top of with nothing in between]
%- Robbie and each of the objects have 2 facts: a static property fact and a dynamic property fact
% - the table just has a static property fact since it can not change
%- Robbie and the table facts might have different number & order of parameters than the objects’ facts do 

%static facts
%name, shape, color, material, size, type, weight
staticFact(robbie, claw, gray, userule, large, arobot, heavy).
staticFact(thetable, table, gray, metal, large, atable, heavy).
staticFact(theprism, pyramid, transparent, userule, medium, aprism, medium).
staticFact(thecube, cube, silver, metal, medium, acube, heavy).
staticFact(themarble, sphere, transparent, userule, small, amarble, light).
staticFact(thebaseball, sphere, white, leather, medium, aball, medium).
staticFact(thebox, rectangularPrism, brown, cardboard, medium, abox, light).
staticFact(therock, rock, gray, granite, medium, arock, heavy).
staticFact(theglass, cylinder, transparent, userule, medium, aglass, medium).
staticFact(thecup, cone, white, paper, medium, acup, light).
staticFact(thetube, cylinder, brown, cardboard, medium, atube, light).
staticFact(theball, sphere, black, rubber, medium, aball, light).
staticFact(thedish, circle, white, userule, medium, adish, light).
staticFact(theblockA, cube, brown, userule, small, ablock, light).
staticFact(theblockB, cube, brown, userule, small, ablock, light).
staticFact(theblockC, cube, brown, userule, small, ablock, light).
staticFact(theblockD, cube, brown, userule, small, ablock, light).
staticFact(theblockE, cube, brown, userule, small, ablock, light).
staticFact(thepencil, cylinder, yellow, userule, small, apencil, light).
staticFact(theballoon, sphere, yellow, userule, medium, aballoon, light).

%dynamic facts
%name, orientation, filled
dynFact(robbie, upright).
dynFact(theprism, onBase).
dynFact(thecube, none).
dynFact(themarble, none).
dynFact(thebaseball, none).
dynFact(thebox, onBase).
dynFact(therock, none).
dynFact(theglass, onBase).
dynFact(thecup, onBase).
dynFact(thetube, onBase).
dynFact(theball, none).
dynFact(thedish, onBase).
dynFact(theblockA, none).
dynFact(theblockB, none).
dynFact(theblockC, none).
dynFact(theblockD, none).
dynFact(theblockE, none).
dynFact(thepencil, onSide).
dynFact(theballoon, onSide).


%dynamic relation facts
%name, directly to the left of, ontop of, in the object
dynRelFact(robbie, nothing, nothing, unable).
dynRelFact(theprism, themarble, thecube, unable).
dynRelFact(thecube, themarble, thetable, unable).
dynRelFact(themarble, thebaseball, thetable, unable).
dynRelFact(thebaseball, thebox, thetable, unable).
dynRelFact(thebox, therock, thetable, empty).
dynRelFact(therock, theglass, thetable, unable).
dynRelFact(theglass, thecup, thetable, empty).
dynRelFact(thecup, thetube, thetable, empty).
dynRelFact(thetube, theball, thetable, empty).
dynRelFact(theball, theblockA, thetable, unable).
dynRelFact(thedish, theblockA, thetable, theball).
dynRelFact(theblockA, thepencil, thetable, unable).
dynRelFact(theblockB, thepencil, theblockA, unable).
dynRelFact(theblockC, thepencil, theblockB, unable).
dynRelFact(theblockD, thepencil, theblockC, unable).
dynRelFact(theblockE, thepencil, theblockD, unable).
dynRelFact(thepencil, theballoon, thetable, unable).
dynRelFact(theballoon, nothing, thetable, air).

%robbie, holding
robbie(robbie,nothing).
