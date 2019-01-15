(* :Title: standard_error *)
(* :Context: standard_error` *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-15 *)
(* :OriginalCreationDate: 2017-02-19 *)

a = Table[RandomReal[], {n, 1, 10000}];
Histogram[{
  a1 = Table[Mean[Table[RandomChoice[a], {10}]], {10000}],
  a2 = Table[Mean[Table[RandomChoice[a], {100}]], {10000}],
  a3 = Table[Mean[Table[RandomChoice[a], {1000}]], {10000}]
}, {0.005}, PlotRange -> All,
  ChartLegends ->
      {
        StringJoin[
          "n = 10     : \!\(\*OverscriptBox[\(\[Sigma]\), \(^\)]\) = ",
          ToString[StandardDeviation[a1]], " = \[Sigma] * ",
          ToString[StandardDeviation[a1] / StandardDeviation[a]]],
        StringJoin[
          "n = 100   : \!\(\*OverscriptBox[\(\[Sigma]\), \(^\)]\) = ",
          ToString[StandardDeviation[a2]], " = \[Sigma] * ",
          ToString[StandardDeviation[a2] / StandardDeviation[a]]],
        StringJoin[
          "n = 1000 : \!\(\*OverscriptBox[\(\[Sigma]\), \(^\)]\) = ",
          ToString[StandardDeviation[a3]], " = \[Sigma] * ",
          ToString[StandardDeviation[a3] / StandardDeviation[a]]]
      }, PlotLabel ->
    StringJoin["Standard Deviation of the Population = ",
      ToString[StandardDeviation[a]]]]


0.2879 / Sqrt[10]

Sqrt[1 / 12] / Sqrt[1000] // N

1 / 12 // N

0.5 * (1 - E^-6)

10 * 0.5 * (1 - E^-6) * (1 - (0.5 * (1 - E^-6)))

StandardDeviation[
  Table[Mean[
    Table[If[RandomReal[] < 0.4918, 1, 0], {100}]], {100000}]] // N

0.04997371937273659` * 10

Sqrt[0.5 * (1 - E^-6) * (1 - 0.5 * (1 - E^-6))]
