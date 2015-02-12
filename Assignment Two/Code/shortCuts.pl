% FILE:  shortCuts - use this file AS IS

pu(Block)	:- pickUp(Block).
pd(Block)	:- putDown(Block).
pdr(Block)	:- putDownOnRight(Block).
pdl(Block)	:- putDownOnLeft(Block).
po(Block,Obj)	:- putOn(Block,Obj).
poc(Block,Obj)	:- putOnCarefully(Block,Obj).
por(Block)	:- putOnRight(Block).
pol(Block)	:- putOnLeft(Block).

sw	:- showWorld.
csw	:- cheapShowWorld.
