Table[Module[{matrix = {{p, 1 - p}, {1 - p, p}}, data,
  iterations = 10000, \[ScriptCapitalP]},
  \[ScriptCapitalP] = DiscreteMarkovProcess[{0, 1}, matrix];
  data =
      KeySort@Counts[
        RandomFunction[\[ScriptCapitalP], {0, iterations}][[2, 1, 1]]];
  BarChart[data, Frame -> True, ImageSize -> 262, AspectRatio -> 1,
    PlotRange -> {Automatic, {0, iterations}},
    ChartLabels ->
        Placed[#@data & /@ {Values, Keys}, {Above, Bottom}],
    Epilog -> Text[Style["p = " <> ToString[p], 12], {1.5, 9750}]]
], {p, Range[0.1, 0.9, 0.1]}] //
    Labeled[Grid[Partition[#, 3]],
      Rotate[Style["Number of iterations per Markov Chain: 10000", 14,
        Red], 0], Top] &