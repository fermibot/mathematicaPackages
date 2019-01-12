Module[{iterations = 100000},
  Table[Module[{matrix = {{0.5, 0.4, 0.1}, {0.3, 0.4, 0.3}, {0.2, 0.3,
    0.5}}, data, \[ScriptCapitalP], happinessAssociation},
    happinessAssociation = <|1 -> "Cheerful", 2 -> "So-So",
      3 -> "Glum"|>;
    \[ScriptCapitalP] = DiscreteMarkovProcess[initial, matrix];
    data =
        KeySort@Counts[
          RandomFunction[\[ScriptCapitalP], {0, iterations}][[2, 1, 1]]];
    BarChart[data, Frame -> True, ImageSize -> 262, AspectRatio -> 1,
      PlotRange -> {Automatic, {0, 0.7 iterations}},
      ChartLabels ->
          Placed[{Values@data,
            Rotate[#, Divide[Pi, 4]] & /@ (happinessAssociation[#] & /@
                Keys@data)}, {Above, Bottom}],
      Epilog ->
          Text[Style[
            "Initial State = " <> ToString[happinessAssociation[initial]],
            12], {2, .6750 iterations}]]
  ], {initial, Range[3]}] //
      Labeled[Grid[Partition[#, 3]],
        Rotate[Style[
          "Number of iterations per Markov Chain: " <>
              ToString@iterations, 14, Red], 0], Top] &]


Module[{iterations = 100000},
  Table[Module[{matrix = {{p, Divide[1 - p, 2], Divide[1 - p, 2]}, {p,
    Divide[1 - p, 2], Divide[1 - p, 2]}, {p, Divide[1 - p, 2],
    Divide[1 - p, 2]}}, data, \[ScriptCapitalP],
    happinessAssociation},
    happinessAssociation = <|1 -> "Cheerful", 2 -> "So-So",
      3 -> "Glum"|>;
    \[ScriptCapitalP] = DiscreteMarkovProcess[1, matrix];
    data =
        KeySort@Counts[
          RandomFunction[\[ScriptCapitalP], {0, iterations}][[2, 1, 1]]];
    Overlay[{BarChart[data, Frame -> True, ImageSize -> 262,
      AspectRatio -> 1, PlotRange -> {Automatic, {0, 1 iterations}},
      ChartLabels ->
          Placed[{ToString[#] <> "\n" & /@ (Values@data),
            Rotate[#, 0] & /@ (happinessAssociation[#] & /@
                Keys@data)}, {Above, Bottom}]], Grid@matrix},
      Alignment -> {0.8, 0.8}]
  ], {p, Range[0.1, 0.9, 0.1]}] //
      Labeled[Grid[Partition[#, 3]],
        Rotate[Style[
          "Number of iterations per Markov Chain: " <>
              ToString@iterations, 14, Red], 0], Top] &]