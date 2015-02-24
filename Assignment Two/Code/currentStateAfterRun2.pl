:- dynamic holding/1.

holding(n).

:- dynamic on/2.

on(e, table).
on(b, table).
on(d, table).
on(f, table).
on(h, b).
on(i, h).
on(m, f).
on(a, m).
on(j, a).
on(k, table).
on(c, j).
on(l, c).
on(g, table).

:- dynamic left/2.

left(e, b).
left(k, c).
left(c, a).
left(j, a).
left(a, n).
left(n, l).
left(l, b).
left(b, c).
left(c, d).
left(f, g).
left(d, f).
left(a, e).
left(e, j).
left(g, b).
left(e, j).
left(j, k).
left(e, e).
left(e, k).
left(k, g).

