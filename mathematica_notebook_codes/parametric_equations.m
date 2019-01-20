(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2016-11-21 *)

Graphics[{Opacity[0.2], Blue,
  Line[Table[{Sin[649 t], Cos[656 t]}, {t, 0.001 \[Pi], 2 \[Pi],
     0.001 \[Pi]}]]}]

Manipulate[
 Graphics[{Opacity[0.2], Blue,
   Line[Table[{Sin[119 t], Cos[120 t]}, {t, r, 2 \[Pi], r}]]}], {r,
  0.001, 0.1, 0.001}]

Manipulate[
 Graphics[{Opacity[0.2], Blue,
   Line[Table[{Sin[118 t] + t, Cos[120 t]}, {t, r, 2 \[Pi], r}]]},
  ImageSize -> 1300], {r, 0.012, 0.014, 0.00001}]

Manipulate[
 Graphics[{Opacity[0.2], Blue,
   Line[Table[{Sin[118 t] + t, Cos[120 t]}, {t, r, 2 \[Pi], r}]]},
  ImageSize -> 1300], {r, 0.0012, 0.0014, 0.00001}]

Graphics[Table[Point[{{1, 3} r + {3, 1}*(1 - r)}], {r, -10, 10, 0.5}],
  Axes -> True]

