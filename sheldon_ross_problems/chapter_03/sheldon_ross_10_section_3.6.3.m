AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
SetOptions[$FrontEndSession, "EvaluationCompletionAction" -> {"ScrollToOutput"}]
Needs["utilities`"];

Uniform Priors

Gamma[n + 1] / (Gamma[k + 1] Gamma[n - k + 1]) \!\(
\ * SubsuperscriptBox[\(\[Integral]\), \(0\), \(1\)]\(
\ * SuperscriptBox[\(p\), \(k\)]
\ * SuperscriptBox[\((1 - p)\), \(n - k\)]\[DifferentialD]p\)\)

ListPlot[{Gamma[# + 1] / Gamma[# + 2] & /@ Range[100],
  1 / (# + 1) & /@ Range[100]}, PlotRange -> All, ImageSize -> 700]

Module[{p = RandomReal[] & /@ Range[10000], data},
  data = KeySort@Counts[RandomVariate[BinomialDistribution[20, #]] & /@ p];
  BarChart[data,
    ChartLabels -> Placed[{Keys@data, Values@data}, {Below, Above}],
    ImageSize -> 788]
]