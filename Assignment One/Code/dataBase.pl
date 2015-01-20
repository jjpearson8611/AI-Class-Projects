The DB of Facts
- include data about Robbie, the table and all of the objects
- data must be stored in record-based format (more like a traditional CS data file, but make it Prolog-friendly)
 rather than as individual property predicates (e.g., size, shape, madeOf, material, …)
- 2 types of facts:
 1) static (fixed) properties – things which can not change in this world – e.g.,
 name, typeOfThing, color, size, material,…
 2) dynamic (relative) properties – a snapshot of this particular current state of the world
– things which can change (e.g., if Robbie moved an object) – e.g., orientation, left, on
 [left means directly left of, with nothing in between & object is actually on the table
on means directly on top of with nothing in between]
- Robbie and each of the objects have 2 facts: a static property fact and a dynamic property fact
 - the table just has a static property fact since it can not change
- Robbie and the table facts might have different number & order of parameters than the objects’ facts do 