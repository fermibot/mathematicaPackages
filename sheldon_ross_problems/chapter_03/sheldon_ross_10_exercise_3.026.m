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
        Transpose@Import[FileNames["*.csv", NotebookDirectory[]][[1]]],
        9]},

  DistributionChart[data,
    ImageSize -> 788,
    ChartElementFunction -> "SmoothDensity",
    ChartLayout -> "Overlapped", ChartBaseStyle -> Opacity[0.5],
    GridLines -> {None, Range[80, 800, 80]}, AspectRatio -> 1]
]