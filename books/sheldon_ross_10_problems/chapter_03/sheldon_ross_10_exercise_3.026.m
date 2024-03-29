Needs["JLink`"]
SetOptions[InstallJava, JVMArguments -> "-Xmx8g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx8g"];
ReinstallJava[];
AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
SetOptions[$FrontEndSession,
  EvaluationCompletionAction -> {"ScrollToOutput"}]

Module[
  {data =
      Partition[
        Transpose@
            Import[FileNames["*.csv", NotebookDirectory[]][[1]]],
        9],
    chartLabels = ("\!\(\*SubscriptBox[\(p\), \(A\)]\) = " <> ToString[#]) & /@ Range[0.1, 0.9, 0.1], max = 500},

  Column[
    Framed[#, FrameStyle -> GrayLevel[0.8]] & /@
        Column /@
            Partition[
              MapThread[
                DistributionChart[#1,
                  ImageSize -> 788,
                  ChartElementFunction -> "SmoothDensity",
                  ChartBaseStyle -> Opacity[0.5],
                  GridLines -> {None, Range[100, max, 100]},
                  ChartLabels -> chartLabels,
                  FrameLabel -> {{"", #2}, {"", ""}},
                  AspectRatio -> 0.25,
                  PlotRange -> {All, {0, max}}
                ] &, {data, ("\!\(\*SubscriptBox[\(p\), \(B\)]\) = " <> ToString[#]) & /@ Range[0.1, 0.9, 0.1]}
              ]
              , 3]
  ]
]