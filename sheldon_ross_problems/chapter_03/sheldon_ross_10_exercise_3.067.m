ClearAll[associationRandomizer];
associationRandomizer[association_?AssociationQ, offset_Real : 0.3] :=
    Module[{mapRange = Length@association},
      MapThread[{#1 + Cos[#4] #3, #2 + Sin[#4] #3} &, {Keys@association,
        Values@association,
        RandomVariate[NormalDistribution[0, offset], mapRange],
        RandomReal[{-\[Pi], \[Pi]}, mapRange]}]]

Module[{p = 0.5, length = 100, plotExtent = 25, iterations = 10000},
  ListPlot[
    associationRandomizer[#, 0.5] & /@
        Table[(Counts[
          Length /@ Cases[#, {1 ..}] &[
            Split@RandomChoice[{p, 1 - p} -> {1, 0}, length]]]),
          iterations], AspectRatio -> 1,
    PlotRange -> {{0, plotExtent}, {0, plotExtent}}, ImageSize -> 788,
    PlotStyle -> {{Opacity@0.2, PointSize@0.001, Lighter@Blue}},
    Frame -> True, GridLines -> ConstantArray[Range[plotExtent], 2],
    GridLinesStyle -> LightGray,
    FrameLabel -> (Style[#, 14] & /@ {"Length of continuous wins",
      "Number of occurrences"})]
]

Grid[Partition[
  Table[Module[{p = r, length = 100, plotExtent = 15,
    iterations = 10000},
    ListPlot[
      associationRandomizer[#, 0.5] & /@
          Table[(Counts[
            Length /@ Cases[#, {1 ..}] &[
              Split@RandomChoice[{p, 1 - p} -> {1, 0}, length]]]),
            iterations], AspectRatio -> 1,
      PlotRange -> {{0, plotExtent}, {0, plotExtent}},
      ImageSize -> 263,
      PlotStyle -> {{Opacity@0.25, PointSize@0.001, Darker@Hue@r}},
      Frame -> True, (*GridLines\[Rule]ConstantArray[Range[plotExtent],
     2]*)GridLinesStyle -> LightGray]
  ], {r, 0.1, 0.9, 0.1}], 3]]