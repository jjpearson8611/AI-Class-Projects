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
%name, shape, color, material
staticFact(robbie, claw, gray, metal).
staticFact(thetable, table, gray, metal).
staticFact(theprism, prism, transparent, glass).
staticFact(thecube, cube, silver, metal).
staticFact(themarble, sphere, transparent, glass).
staticFact(thebaseball, sphere, white, leather).
staticFact(thebox, rectangularPrism, brown, cardboard).
staticFact(therock, rock, gray, granite).
staticFact(theglass, cylinder, transparent, glass).
staticFact(thecup, cone, white, paper).
staticFact(thetube, cylinder, brown, cardboard).
staticFact(theball, sphere, black, rubber).
staticFact(thedish, circle, white, china).
staticFact(theblockA, cube, brown, wood).
staticFact(theblockB, cube, brown, wood).
staticFact(theblockC, cube, brown, wood).
staticFact(theblockD, cube, brown, wood).
staticFact(theblockE, cube, brown, wood).
staticFact(thepencil, cylinder, yellow, wood).
staticFact(theballoon, sphere, yellow, rubber).

%dynamic facts
%name, orientation, 
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
%name, directly to the left of, ontop of
dynrelFact(robbie, nothing, nothing)
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