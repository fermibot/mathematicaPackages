(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-14 *)


Module[{ocurrences, probabilities},
  ocurrences = KeySort@<|1 -> 2, 2 -> 4, 3 -> 6, 4 -> 8|>;
  probabilities = ocurrences / Total@ocurrences;
  ListPlot[# & /@ probabilities, ImageSize -> 600,
    GridLines -> {Range[4], Range[0, 0.4, 0.1]}, Frame -> True,
    FillingStyle -> Red, Joined -> False, Filling -> Axis,
    PlotLegends -> probabilities]
]

Module[{dictionary, numbers, probabilities, pdf, cdf},
  dictionary = KeySort@<|1 -> 2, 2 -> 4, 3 -> 6, 4 -> 8|> / 20;
  numbers = Keys@dictionary;
  probabilities = Values@dictionary;
  pdf = dictionary;
  cdf = Association@
      MapThread[#1 -> #2 &, {numbers, Accumulate@probabilities}];
  ListPlot[{pdf, cdf}, PlotLegends -> {"PMF", "CMF"},
    ImageSize -> 1200, Frame -> True,
    GridLines -> {Range[0, 4, 0.1], Range[0, 1, 0.1]},
    AspectRatio -> 0.25]
]

Plot[PDF[NormalDistribution[], x], {x, -10, 10}, PlotRange -> All]