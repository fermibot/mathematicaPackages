ClearAll[associationRandomizer];
associationRandomizer[association_?AssociationQ, offset_Real : 0.3] :=
    Module[{mapRange = Length@association},
      MapThread[{#1 + Cos[#4] #3, #2 + Sin[#4] #3} &, {Keys@association,
        Values@association,
        RandomVariate[NormalDistribution[0, offset], mapRange],
        RandomReal[{-\[Pi], \[Pi]}, mapRange]}]]

Module[{p = 0.5, length = 120, plotExtent = 25, iterations = 10000},
  ListPlot[
    associationRandomizer /@
        Table[(Counts[
          Length /@ Cases[#, {1 ..}] &[
            Split@RandomChoice[{p, 1 - p} -> {1, 0}, length]]]),
          iterations], AspectRatio -> 1,
    PlotRange -> {{0, plotExtent}, {0, plotExtent}}, ImageSize -> 788,
    PlotStyle -> {{Opacity@0.35, PointSize@0.001, Lighter@Blue}},
    Frame -> True, GridLines -> ConstantArray[Range[plotExtent], 2],
    GridLinesStyle -> LightGray]
]

Grid[Partition[
  Table[Module[{p = r, length = 120, plotExtent = 20,
    iterations = 1000},
    ListPlot[
      associationRandomizer /@
          Table[(Counts[
            Length /@ Cases[#, {1 ..}] &[
              Split@RandomChoice[{p, 1 - p} -> {1, 0}, length]]]),
            iterations], AspectRatio -> 1,
      PlotRange -> {{0, plotExtent}, {0, plotExtent}},
      ImageSize -> 394,
      PlotStyle -> {{Opacity@0.5, PointSize@0.001, Lighter@Blue}},
      Frame -> True, (*GridLines\[Rule]ConstantArray[Range[plotExtent],
     2]*)GridLinesStyle -> LightGray]
  ], {r, 0.1, 0.8, 0.1}], 2]]