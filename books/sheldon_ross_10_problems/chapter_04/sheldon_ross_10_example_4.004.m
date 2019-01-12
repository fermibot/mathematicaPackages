Module[{iterations = 100000},
  Table[Module[{matrix = {{0.7, 0, 0.3, 0}, {0.5, 0, 0.5, 0}, {0, 0.4,
    0, 0.6}, {0, 0.2, 0, 0.8}}, data, \[ScriptCapitalP],
    happinessAssociation},
    happinessAssociation = <|1 -> "Rain Rain", 2 -> "No-Rain Rain",
      3 -> "Rain No-Rain", 4 -> "No-Rain No-Rain"|>;
    \[ScriptCapitalP] = DiscreteMarkovProcess[initial, matrix];
    data =
        KeySort@Counts[
          RandomFunction[\[ScriptCapitalP], {0, iterations}][[2, 1, 1]]];
    Overlay[{BarChart[data, Frame -> True, ImageSize -> 394,
      AspectRatio -> 1,
      PlotRange -> {Automatic, {0, 0.7 iterations}},
      ChartLabels ->
          Placed[{ToString[#] <> "" & /@ Values@data,
            Rotate[#, Divide[Pi, 2]] & /@ (happinessAssociation[#] & /@
                Keys@data)}, {Above, Bottom}],
      Epilog ->
          Text[Style[
            "Initial State = " <>
                ToString[happinessAssociation[initial]], 12,
            Blue], {2.5, .6750 iterations}]],
      Labeled[Grid[matrix, Frame -> All],
        Style["  Markov Chain \nTransition Matrix", Darker@Green],
        Top]}, Alignment -> {-0.5, 0.5}]
  ], {initial, Range[4]}] //
      Labeled[Grid[Partition[#, 2]],
        Rotate[Style[
          "Number of iterations per Markov Chain: " <>
              ToString@iterations, 14, Red], 0], Top] &]