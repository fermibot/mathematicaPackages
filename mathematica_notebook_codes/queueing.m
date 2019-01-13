(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

Histogram[
  Table[RandomVariate[PoissonDistribution[100]] -
      RandomVariate[PoissonDistribution[200]], {n, 1, 20000}], {1},
  ImageSize -> 800]

Module[{len = 5, ina, ser, s, arr, serb},
  ina = Table[RandomVariate[ExponentialDistribution[2]], {len}];
  ser = Table[RandomVariate[ExponentialDistribution[4]], {len}];
  s = {0};
  arr = Drop[
    Table[s = Append[s, s[[n - 1]] + ina[[n - 1]]], {n, 2,
      6}][[len]], {-1}];
  serb = {0};
  arr = TableForm[Transpose[{ina, ser, arr}],
    TableHeadings -> {None, {"Inter-arrival Times", "Service Times",
      "Arrival"}}]]

Module[{len = 5, ina, ser, s, arr, serb, r = {}},
  ina = Table[RandomVariate[ExponentialDistribution[2]], {len}];
  ser = Table[RandomVariate[ExponentialDistribution[4]], {len}];
  s = {0};
  arr = Drop[
    Table[s = Append[s, s[[n - 1]] + ina[[n - 1]]], {n, 2,
      6}][[len]], {-1}];
  serb = {0};
  r = Table[Append[serb, ser[[n - 1]] + arr[[n - 1]]], {n, 2, 6}];

  Print@TableForm[Transpose[{ina, ser, arr}],
    TableHeadings -> {None, {"Inter-arrival Times", "Service Times",
      "Arrival"}}];
  Print@r;
]

Plot[Table[
  PDF[StudentTDistribution[\[Nu]], x], {\[Nu], {0.1, 0.5, 4}}] //
    Evaluate, {x, -5, 5}, Filling -> Axis]

Plot[Table[
  PDF[StudentTDistribution[\[Nu]], x], {\[Nu], 1, 10000000,
    1000000}] // Evaluate, {x, -5, 5}, Filling -> Axis,
  FillingStyle -> Opacity[0.01], ImageSize -> 600,
  PlotLegends -> Automatic, PlotRange -> {{-0.1, 0.1}, {0.39, 0.41}}]

Plot[Table[PDF[NormalDistribution[0, 1], x], {\[Nu], 1, 1, 1}] //
    Evaluate, {x, -5, 5}, Filling -> Axis,
  FillingStyle -> Opacity[0.01], ImageSize -> 600,
  PlotLegends -> Automatic, PlotRange -> {{-0.1, 0.1}, {0.39, 0.41}}]
