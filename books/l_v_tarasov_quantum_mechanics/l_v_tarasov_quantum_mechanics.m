(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Plot[Exp[Divide[-t, 1000]], {t, 0, 1000}, AspectRatio -> 1,
  PlotRange -> {All, {0, 1}},
  GridLines -> {Range[0, 1000, 100], Range[0, 1, 0.1]}]

Graphics[Table[
  Line[{{Divide[1, Power[r, 2]] - Divide[1, Power[n, 2]],
    0}, {Divide[1, Power[r, 2]] - Divide[1, Power[n, 2]],
    0.01}}], {r, 3, 7, 1}, {n, r, 20}], ImageSize -> 1200]

Graphics[Table[{Hue[Divide[1, Power[r, 2]] - 1],
  Circle[{0, 0},
    Divide[1, Power[r, 2]] - Divide[1, Power[n, 2]]]}, {r, 2, 4,
  1}, {n, r, 20}], ImageSize -> 500]

(*Energy as a function of n^th orbit*)
ListPlot[Table[Divide[-1, Power[n, 2]], {n, 1, 10}]]

ClearAll[Col];
Col[val_] := If[val == 1, Black, White];
Module[{div = 0.005 \[Pi]},
  Graphics[Table[
    Table[{ Hue@RandomReal[], Disk[{0, 0}, r, { n, n + div}]}, {n,
      Divide[div, r], 2 \[Pi], Divide[div, r] }], {r, 2, 0.5, -0.05}],
    ImageSize -> 600]]

Plot[Plus @@ Table[Cos[(c x)], {c, -6, 6, 0.1}], {x, -10 \[Pi],
  10 \[Pi]}, PlotRange -> All, PerformanceGoal -> "Quality",
  PlotPoints -> 20, ImageSize -> 1000]

Plot[Table[c + Cos[(c x)], {c, -10, 10, 0.5}], {x, -10 \[Pi],
  10 \[Pi]}, PlotRange -> All, PerformanceGoal -> "Quality",
  PlotPoints -> 20, ImageSize -> 1000]