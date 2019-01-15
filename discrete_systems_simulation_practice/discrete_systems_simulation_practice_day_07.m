(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)
(* :OriginalCreationDate: 2017-02-22 *)



u16807[iseed_] := Mod[(iseed) * 16807, 2147483647];
Module[{iseed = 1, data, u, \[ScriptCapitalD], u0 = 2147483647,
  po = 100000},
  data = Table[iseed = u16807[iseed]; u = iseed / u0;
  If[u < 0.7, 2 Log[u / 0.5], -2 Log[(1 - u) / 0.5]], {n, 1, po}];
  Histogram[data, {0.05},
    ChartStyle -> Directive[{LightBlue, EdgeForm[Red]}],
    ImageSize -> 500, PlotRange -> {{-15, 15}, {0, 1200}},
    PlotLabel -> "Laplace Function created from Inverse CDF method",
    ChartLegends ->
        "0.5(\!\(\*FractionBox[\(1\), \(2\)]\))\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(-\(\(|\)\*FractionBox[\(x\), \(2\)]\(|\)\)\)]\)"];
  \[ScriptCapitalD] = HistogramDistribution[data];
  DiscretePlot[#[\[ScriptCapitalD], x], {x, -4, 4, .01},
    PlotLabel -> #] & /@ {PDF, CDF}]


po = 100000;
iseed1 = 600;
iseed2 = 25;
u16807[iseed_] := Mod[(iseed) * 16807, 2147483647]
rand = Table[
  iseed1 = u16807[iseed1];
  iseed2 = u16807[iseed2];
  {iseed1 / 2147483647, iseed2 / 2147483647}, {n, 1, po}];
acc[x_, y_] := If[0 <= x < 0.5, Log[1 - y], -Log[1 - y]];
dat = Table[acc[rand[[n, 1]], rand[[n, 2]]], {n, 1, po}];
\[ScriptCapitalD] = HistogramDistribution[dat];
DiscretePlot[#[\[ScriptCapitalD], x], {x, -4, 4, .01},
  PlotLabel -> #] & /@ {PDF, CDF}

po = 100000;
u16807[iseed_] := Mod[(iseed) * 16807, u0 = 2147483647]; iseed = 1;
data = Table[iseed = u16807[iseed]; u = iseed / u0;
If[u < 0.9, 2 Log[u / 0.5], -2 Log[(1 - u) / 0.5]], {n, 1, po}];
Histogram[data, {0.05},
  ChartStyle -> Directive[{LightBlue, EdgeForm[Red]}],
  ImageSize -> 500, PlotRange -> {{-15, 15}, {0, 1200}},
  PlotLabel -> "Laplace Function created from Inverse CDF method",
  ChartLegends ->
      "0.5(\!\(\*FractionBox[\(1\), \(2\)]\))\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(-\(\(|\)\*FractionBox[\(x\), \(2\)]\(|\)\)\)]\)"]
\[ScriptCapitalD] = HistogramDistribution[data];
DiscretePlot[#[\[ScriptCapitalD], x], {x, -4, 4, .01},
  PlotLabel -> #] & /@ {PDF, CDF}


Plot[{1 - \[Sqrt](1 + (2 u) / 5.613), 1 + \[Sqrt](1 + (2 u) / 5.613)}, {u,
  0, 1}]

1 - Sqrt[1 - 2 / 5.613]

Plot[{-Log[1 - u], Log[1 - u]}, {u, 0, 1}]

Plot[{Log[1 - u / 0.5] If[u < 0.5, 1, 0], -Log[(1 - u) / 0.5] If[u <= 0.5,
  0, 1]}, {u, 0, 1}]

Solve[-x^2 / 2 + x - (0.487 + u / 83.27) == 0, x]