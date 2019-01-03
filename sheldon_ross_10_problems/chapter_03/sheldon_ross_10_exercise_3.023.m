AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
SetOptions[$FrontEndSession,
  EvaluationCompletionAction -> {"ScrollToOutput"}]

ClearAll[randomizer];

randomizer[number_, percentage_ : 1] :=
    number + RandomReal[0.01 percentage {-number, number}];

Module[{data},
  data = KeySort@
      Association@
          Table[
            {p ->
                Module[{megaList = {}},
                  Module[{list = {0} ~ Join ~ RandomChoice[{p, 1 - p} -> {0, 1}, 2]},
                    While[True,
                      If[Count[list[[-3 ;; -1]], 1] == 2,
                        AppendTo[megaList, list]; Break[],
                        AppendTo[list, RandomChoice[{p, 1 - p} -> {0, 1}]]]]
                  ]; & /@ Range[1000];
                  Length /@ megaList
                ]}
            , {p, 0.05, 0.80, 0.05}];

  DistributionChart[
    randomizer[#, 5] & /@ # & /@ data,
    ChartLabels -> Keys@data,
    ChartElementFunction -> "PointDensity",
    ImageSize -> 788,
    GridLines -> {None, Mean /@ (Values@data)},
    AspectRatio -> 1,
    PlotRange -> {All, All}
  ]
]