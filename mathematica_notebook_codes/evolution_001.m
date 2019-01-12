(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

SeedRandom[1];
Module[{list = {{0, 0, 0}}},
  Table[AppendTo[list,
    Table[r = RandomReal[{-0.001, 0.001}];
    Max[Last[list]] + If[r + Max[Last[list]] < 0, 0, r], {3}]], 20];
  Framed@TableForm[list,
    TableHeadings -> {None, {Style["Column 01", Darker[Green]],
      Style["Column 02", Blue], Style["Column 03", Pink]}}]]

SeedRandom[1];
Module[{list = {{0, 0, 0}}},
  Table[AppendTo[list,
    Table[r = RandomReal[{-0.001, 0.001}];
    Max[Last[list]] + If[r + Max[Last[list]] < 0, 0, r], {3}]], 200];
  ListLinePlot[{Table[Max[list[[n]]], {n, 1, Length[list]}],
    Table[Min[list[[n]]], {n, 1, Length[list]}]}, ImageSize -> 1000,
    PlotStyle -> Thickness[0], Mesh -> All,
    MeshStyle -> {PointSize[0.002]}]]

SeedRandom[1]; list = {{0, 0, 0}};
Module[{list = {{0, 0, 0}}},
  Table[AppendTo[list,
    Table[r = RandomReal[{-0.001, 0.001}];
    Min[Last[list]] + If[r + Min[Last[list]] < 0, 0, r], {3}]], 20];
  Framed@TableForm[list,
    TableHeadings -> {None, {Style["Column 01", Darker[Green]],
      Style["Column 02", Blue], Style["Column 03", Pink]}}]]

Module[{list = {{0, 0, 0}}},
  Table[AppendTo[list,
    Table[r = RandomReal[{-0.1, 0.1}];
    Min[Last[list]] + If[r + Min[Last[list]] < 0, 0, r], {3}]], 1200];
  ListLinePlot[{Table[Max[list[[n]]], {n, 1, Length[list]}],
    Table[Min[list[[n]]], {n, 1, Length[list]}]}, ImageSize -> 1000,
    PlotStyle -> Thickness[0], Mesh -> All,
    MeshStyle -> {PointSize[0.002]}]]

SeedRandom[1];
Module[{list = {{0, 0, 0}}},
  Table[AppendTo[list,
    Table[r = RandomReal[{-0.001, 0.001}];
    If[RandomReal[] < .1,
      Min[Last[list]] + If[r + Min[Last[list]] < 0, 0, r],
      Max[Last[list]] + If[r + Max[Last[list]] < 0, 0, r]], {3}]], 20];
  Framed@TableForm[list,
    TableHeadings -> {None, {Style["Column 01", Darker[Green]],
      Style["Column 02", Blue], Style["Column 03", Pink]}}]]

(*
First Arg   : population size,
Second Arg  : percetage of support,
Third Arg   : no of generations
*)

NRand[___] := RandomVariate[NormalDistribution[0, 0.00001]];
URand[___] := RandomReal[{-0.00001, 0.00001}];
ReserParse[num_] := If[num < 1, num, If[1 < num <= 100, num / 100]];

Evolution[pop_Integer, reser_, generations_?IntegerQ,
  func_ : NRand | URand] := Module[{reser2 = ReserParse[reser], list},
  (list = {Table[0, pop]};
  Table[AppendTo[list, Table[r = func[];
  If[RandomReal[] <= reser2,
    Min[Last[list]] + If[r + Min[Last[list]] < 0, 0, r],
    Max[Last[list]] + If[r + Max[Last[list]] < 0, 0, r]], {pop}]],
    generations];
  Return@
      ListLinePlot[{Table[Max[list[[n]]], {n, 1, Length[list]}],
        Table[Sort[list[[n]]][[Ceiling[pop / 2]]], {n, 1, Length[list]}],
        Table[Min[list[[n]]], {n, 1, Length[list]}]}, ImageSize -> 800,
        PlotStyle -> Thickness[0], Mesh -> All,
        MeshStyle -> {PointSize[0.002]}, PlotRange -> All,
        PlotLegends -> {"Highest", "Middle", "Lowest"}])]



Evolution[5, .39, 200, URand]