(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate:  2016-12-28*)

Plot[Sin[x], {x, 0, 10}]

no = 20;
dsk = Table[{RandomReal[{-5, 5}], RandomReal[{-5, 5}]}, {n, 1, no}];
Graphics[
  {
    Table[{Opacity[0.2], Hue[RandomChoice[{0.0, 0.7}]],
      Disk[dsk[[n]], 0.2]}, {n, 1, no}],
    Table[{Opacity[0.1], Thickness[0], Black,
      Line[{RandomChoice[dsk], RandomChoice[dsk]}]}, {n, 1, 100 no}]
  }, ImageSize -> 900, PlotRange -> {{-14, 14}, {-7, 7}}]