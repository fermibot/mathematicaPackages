AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["statistics`"];

simulation[families_] :=
    Module[{probabilities =
        unitize[PDF[PoissonDistribution[25], #] & /@ Range[1, 50]] ->
            Range[1, 50], samples, plotData, plotProbabilities},
      samples =
          Table[unitize[
            Counts[RandomChoice[
              Join @@ (Table[# - 1, #] & /@
                  RandomChoice[probabilities, 2000]), families]]], 200];
      plotProbabilities =
          associateLists[Values[probabilities], Keys[probabilities]];
      ListLinePlot[samples ~ Join ~ {plotProbabilities},
        GridLines -> {Range@50, Range[0, 0.20, 0.01]}, ImageSize -> 788,
        InterpolationOrder -> 2,
        PlotStyle ->
            Table[{Thickness[0], Opacity[0.2], Green}, Length@samples] ~
                Join ~ {{Red, Thick, Dashed}}, Mesh -> All,
        MeshStyle -> {Red, PointSize[0]}, PlotRange -> {{0, 50}, {0, 0.15}}]
    ]