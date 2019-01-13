(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

Minimize[{x1 + 2 y, -5 x1 + y == 7 && x1 + y >= 26 && x1 >= 3 &&
    y >= 4}, {x1, y}]

variables = Table[StringJoin[{"x", ToString[n]}], {n, 1, 10, 1}]
Minimize[{x + 2 y, -5 x + y == 7 && x + y >= 26 && x >= 3 &&
    y >= 4}, {x, y}]