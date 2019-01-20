(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2016-11-23 *)

Minimize[x^2 - 3 x + 6, x]

p = {100, 200, 320, 1532, 120, 152};
B = 1356;
c = {200, 3321, 132, 352, 240, 65};
x = {x1, x2, x3, x4, x5, x6};
Maximize[{\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i =
     1\), \(6\)]\(p[\([\)\(i\)\(]\)]*x[\([\)\(i\)\(]\)]\)\), {(\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i =
         1\), \(6\)]\(c[\([\)\(i\)\(]\)] x[\([\)\(i\)\(]\)]\)\) <=
      B) && (x1 == (0 || 1)) && (x2 == (0 || 1)) && (x3 == (0 ||
        1)) && (x4 == (0 || 1)) && (x5 == (0 || 1)) && (x6 == (0 ||
        1))}}, x]

LinearProgramming[p, c, {{-Infinity, 1}, {-Infinity, 1}}]
