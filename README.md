compiler
========

Why not write a C compiler?

Stages
------

1. Expression language interpreter for only integers
2. Expression language to 3-address code
3. Convert 3-address code output to intermediate code data structure
4. Add support for assignment, statements, and some control flow in grammar
5. Add stage to convert 3-address code to ARM assembly
6. Add ARM assembly binary output
7. Functions?

Example Output
--------------

Currently I'm at stage 2.

```
stephen at greed in ~/repos/compiler (master %)
$ ./main
5/9*7-(1+3)
t0 = 5
t1 = 9
t2 = t0 / t1
t3 = 7
t4 = t2 * t3
t5 = 1
t6 = 3
t7 = t5 + t6
t8 = t4 - t7
OUT: t8
7-5+3
t9 = 7
t10 = 5
t11 = t9 - t10
t12 = 3
t13 = t11 + t12
OUT: t13
```
