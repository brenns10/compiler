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
