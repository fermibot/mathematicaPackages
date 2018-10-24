AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
SetOptions[$FrontEndSession,
  EvaluationCompletionAction -> {"ScrollToOutput"}]

Module[{data},
  data =
      KeySort@
          Association@
              Table[
                {p ->
                    Module[{megaList = {}},
                      Module[{list = RandomChoice[{p, 1 - p} -> {0, 1}, 2]},
                        While[True,
                          If[list[[{-2, -1}]] == {1, 1},
                            AppendTo[megaList, list]; Break[],
                            AppendTo[list, RandomChoice[{p, 1 - p} -> {0, 1}]]]]
                      ]; & /@ Range[1000];
                      Length /@ megaList
                    ]}
                , {p, 0.05, 0.80, 0.05}];
  DistributionChart[
    data,
    ChartLabels -> Keys@data,
    ChartElementFunction -> "SmoothDensity", ImageSize -> 788,
    GridLines -> {None, Mean /@ (Values@data)}, AspectRatio -> 1
  ]
]