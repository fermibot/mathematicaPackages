(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

ClearAll[d];
d[x_, t_, v_] := Piecewise[{{v 1.5^(x - t), 0 <= x <= t}, {I, x > t}}];

Module[{dat = Table[{t, RandomReal[{4, 8}]}, {t, 0, 10, 0.1}], a, b},
  a = ListPlot[dat, PlotStyle -> {PointSize[0.005], Red}];
  b = Plot[
    Table[d[x, dat[[n, 1]], dat[[n, 2]]], {n, 1, Length[dat]}], {x, 0,
      10}, Exclusions -> True, PlotStyle -> {Opacity[1], Thickness[0]}];
  Show[a, b, ImageSize -> 700, PlotRange -> {{0, 10}, {0, 8}},
    AxesOrigin -> {0, 0},
    PlotLabel ->
        "Sums spread over time along with their value over time @ 50% discount rate", AxesLabel -> {"t", "$"}]]

Module[{dat = Table[{t, 8}, {t, 0, 10, 0.1}], a, b},
  a = ListPlot[dat, PlotStyle -> {PointSize[0.005], Red}];
  b = Plot[
    Table[d[x, dat[[n, 1]], dat[[n, 2]]], {n, 1, Length[dat]}], {x, 0,
      10}, Exclusions -> True, PlotStyle -> {Opacity[1], Thickness[0]}];
  Show[a, b, ImageSize -> 700, PlotRange -> {{0, 10}, {0, 8}},
    AxesOrigin -> {0, 0},
    PlotLabel ->
        "Sums spread over time along with their value over time @ 50% discount rate", AxesLabel -> {"t", "$"}]]

Module[{dat = Table[{t, RandomReal[{4, 8}]}, {t, 0, 10, 0.1}], a, b},
  a = ListPlot[dat, PlotStyle -> {PointSize[0.005], Red}];
  b = Plot[
    Table[d[x, dat[[n, 1]], dat[[n, 2]]], {n, 1, Length[dat]}], {x, 0,
      10}, Exclusions -> True, PlotStyle -> {Opacity[1], Thickness[0]}];
  Show[a, b, ImageSize -> 700, PlotRange -> {{0, 10}, {0, 8}},
    AxesOrigin -> {0, 0},
    PlotLabel ->
        "Sums spread over time along with their value over time @ 50% discount rate", AxesLabel -> {"t", "$"}]]

Module[{dat = Table[{t, RandomReal[{4, 8}]}, {t, 0, 10, 0.5}], a, b},
  a = ListPlot[dat, PlotStyle -> {PointSize[0.005], Red}];
  b = Plot[
    Table[d[x, dat[[n, 1]], dat[[n, 2]]], {n, 1, Length[dat]}], {x, 0,
      10}, Exclusions -> True, PlotStyle -> {Opacity[1], Thickness[0]}];
  Show[a, b, ImageSize -> 700, PlotRange -> {{0, 10}, {0, 8}},
    AxesOrigin -> {0, 0},
    PlotLabel ->
        "Sums spread over time along with their value over time @ 50% discount rate", AxesLabel -> {"t", "$"}]]

Module[{\[Lambda] = 20, s1, s2},
  s1 = ListLinePlot[
    Table[{n,
      Exp[-\[Lambda] t] Divide[Power[\[Lambda] t, n],
        Factorial[n]]}, {t, 0.1, 3, .1}, {n, 0, 80, 1}],
    PlotRange -> All, PlotLegends -> "Expressions",
    PlotStyle -> Thickness[0], ImageSize -> 600];
  s2 = Plot[0.35 Exp[Divide[-t, 30]], {t, 0, 80}];
  Show[{s1, s2}, PlotRange -> All]]