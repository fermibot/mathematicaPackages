(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2017-01-07 *)

ListLinePlot[Accumulate[Table[RandomReal[{0, 1}], {n, 1, 50}]],
  Mesh -> All, PlotStyle -> Thickness[0],
  MeshStyle -> {Blue, PointSize[0.01]}]

ListLinePlot[Accumulate[Table[RandomReal[{-0.5, 1}], {n, 1, 50}]],
 Mesh -> All, PlotStyle -> Thickness[0],
 MeshStyle -> {Blue, PointSize[0.01]}]

ListLinePlot[Accumulate[Table[RandomReal[{-1, 1}], {n, 1, 50}]],
 Mesh -> All, PlotStyle -> Thickness[0],
 MeshStyle -> {Blue, PointSize[0.01]}]