Needs["JLink`"]
SetOptions[InstallJava, JVMArguments -> "-Xmx8g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx8g"];
ReinstallJava[];
SetOptions[$FrontEndSession,
  EvaluationCompletionAction -> {"ScrollToOutput"}]

Column[
  Framed[#, FrameStyle -> GrayLevel[0.9]] & /@
      Module[{
        data = Transpose@Import[FileNames["*.csv", NotebookDirectory[]][[1]]],
        chartLabels =
            (Rotate[#, Divide[\[Pi], 2] - Divide[\[Pi], 10]]) & /@
                (MapThread[("\!\(\*SubscriptBox[\(p\), \(\(\\\ \\)\(A\)\)]\) = " <>
                    ToString[#1[[1]]] <>
                    " \!\(\*SubscriptBox[\(p\), \(B\)]\) = " <>
                    ToString[#1[[2]]]) &, {{#, 1 - #} & /@
                    Range[0.05, 0.95, 0.05]}]), max = 400},

        DistributionChart[data,
          ImageSize -> 788,
          ChartElementFunction -> #,
          GridLines -> {None, Range[25, max, 25]},
          FrameLabel -> {{Style["N", 16, Red], ""}, {"", ""}},
          ChartLabels -> chartLabels, AspectRatio -> 1,
          PlotRange -> {All, {0, max}}] & /@ {"PointDensity", "SmoothDensity", "GlassQuantile", "LineDensity"}
      ]
]