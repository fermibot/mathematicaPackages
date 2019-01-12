(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)


list = Import[
  "D:\\Programming\\Data Mining in Python\\Word Count\\analysis.txt",
  "Words"];
sorted = Reverse@
    SortBy[Table[{list[[n]], ToExpression@list[[n + 1]]}, {n, 1,
      Length[list] - 1, 2}], {#[[2]]} &];
ListLogPlot[
  Table[Callout[sorted[[n, 2]], sorted[[n, 1]]], {n, 1, 50}],
  PlotStyle -> PointSize[0.002], ImageSize -> 1300]

(*
pts=Table[{RandomReal[{0,100}],RandomInteger[{-10,10}]},20];
Graphics[{
{Opacity[0.1],Line[pts[[Last[FindShortestTour[pts]]]]]},
{Hue[RandomReal[{0,0.2}],0.4],Disk[#,0.5]}&/@pts},ImageSize\[Rule]Full]
*)
Module[{pts =
    Table[{RandomReal[{0, 100}], RandomInteger[{-10, 10}]}, 200]}
  , Graphics[{Hue[RandomReal[{0, 0.2}], 0.4], Disk[#, 0.5]} & /@ pts,
  ImageSize -> Full]]