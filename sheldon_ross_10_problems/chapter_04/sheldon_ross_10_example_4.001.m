Table[Module[{matrix = {{\[Alpha], 1 - \[Alpha]}, {\[Beta],
  1 - \[Beta]}}, data, iterations = 10000, \[ScriptCapitalP]},
  \[ScriptCapitalP] = DiscreteMarkovProcess[{0, 1}, matrix];
  data =
      KeySort@Counts[
        RandomFunction[\[ScriptCapitalP], {0, iterations}][[2, 1, 1]]];
  BarChart[data, Frame -> True, ImageSize -> 199, AspectRatio -> 1,
    PlotRange -> {Automatic, {0, iterations}},
    ChartLabels ->
        Placed[#@data & /@ {Values, Keys}, {Above, Bottom}],
    Epilog ->
        Text[Style[
          "\[Alpha]=" <> ToString[\[Alpha]] <> " & \[Beta]=" <>
              ToString[\[Beta]], 12], {1.5, 9750}]]
],
  {\[Alpha], Range[0.2, 0.8, 0.2]}, {\[Beta], Range[0.2, 0.8, 0.2]}
] // Grid //
    Labeled[#,
      Rotate[Style["Number of iterations per Markov Chain: 10000", 14,
        Red], 0], Top] &