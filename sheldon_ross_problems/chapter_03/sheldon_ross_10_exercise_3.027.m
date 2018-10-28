Needs["JLink`"]
SetOptions[InstallJava, JVMArguments -> "-Xmx8g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx8g"];
ReinstallJava[];
AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
SetOptions[$FrontEndSession, EvaluationCompletionAction -> {"ScrollToOutput"}]

Module[
  {data = Transpose@Import[FileNames["*.csv", NotebookDirectory[]][[1]]],
    chartLabels = (Rotate["\!\(\*SubscriptBox[\(p\), \(A\)]\) = " <> ToString[#], Divide[\[Pi], 8]]) & /@ Range[0.1, 0.9, 0.05],
    max = 500},

  DistributionChart[
    data,
    ImageSize -> 788,
    ChartElementFunction -> "SmoothDensity",
    ChartBaseStyle -> Opacity[0.5],
    GridLines -> {None, Range[25, max, 25]},
    ChartLabels -> chartLabels,
    AspectRatio -> 1,
    PlotRange -> {All, {0, max}}
  ]
]