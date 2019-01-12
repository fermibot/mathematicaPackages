(* ::Package:: *)

BeginPackage[ "Evolution`" ]

Evolution::usage = "A preliminary approach to understanding evolution over generations"

Begin["Private`"]

Evolution[pop_Integer, reser_, generations_?IntegerQ] := Module[{reser2 = ReserParse[reser]},
  (list = {Table[0, pop]};
  Table[AppendTo[list, Table[r = NRand[];
  If[RandomReal[] <= reser2, Min[Last[list]] + If[r + Min[Last[list]] < 0, 0, r], Max[Last[list]] + If[r + Max[Last[list]] < 0, 0, r]], {pop}]], generations];
  Return@ListLinePlot[{Table[Max[list[[n]]], {n, 1, Length[list]}], Table[Sort[list[[n]]][[Ceiling[pop / 2]]], {n, 1, Length[list]}], Table[Min[list[[n]]], {n, 1, Length[list]}]},
    ImageSize -> 800, PlotStyle -> Thickness[0], Mesh -> All, MeshStyle -> {PointSize[0.002]}, PlotRange -> All, PlotLegends -> {"Highest", "Middle", "Lowest"}])]

ClearAll[NRand, URand, ReserParse]

NRand[___] := RandomVariate[NormalDistribution[0, 0.001]];
URand[___] := RandomReal[{-0.001, 0.001}];
ReserParse[num_] := If[num < 1, num, If[1 < num <= 100, num / 100]];

End[]

EndPackage[]

