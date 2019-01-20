(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Module[{data = Accumulate[Table[RandomReal[{-1.2, 1}], 365]],
  weight = 85},
  ListLinePlot[{-data, Max[60, #] & /@ (data + weight)},
    PlotRange -> {All, {Min@(-data), Max@{data + weight}}},
    ImageSize -> 1500, AspectRatio -> 0.25, Mesh -> All,
    MeshStyle -> {Green, Red, PointSize@0.001}]]