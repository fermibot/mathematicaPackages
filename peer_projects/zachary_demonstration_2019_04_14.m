(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-14 *)


Module[{mean = {2, 3, 4, 5, 6}},
  Plot[Evaluate[PDF[ExponentialDistribution[#], x] & /@ mean], {x, 0,
    3}, PlotRange -> All, ImageSize -> 788, PlotLegends -> mean,
    Frame -> True]]


Module[{exponential, timelines, maxX},
  exponential = RandomVariate[ExponentialDistribution[3], 500];
  timelines = Accumulate[exponential];
  maxX = 10 Ceiling[Divide[Last@timelines, 10]];
  Graphics[{Opacity@0.2, InfiniteLine[{{#, 0}, {#, 1}}]} & /@
      timelines, ImageSize -> 1600, Frame -> True,
    FrameTicks -> {Range[0, maxX, 10], False},
    PlotRange -> {{0, maxX}, {0, 10}}]
]



Module[{exponential, timelines, counts, maxX},
  exponential = RandomVariate[ExponentialDistribution[3], {50, 10000}];
  timelines = Accumulate[#] & /@ exponential;
  maxX = (10 Ceiling[Divide[Last@#, 10]]) & /@ timelines;
  counts = KeySort@Counts[Length /@ BinLists[#]] & /@ timelines;
  ListLinePlot[counts, Frame -> True, ImageSize -> 800,
    PlotStyle -> {{Red, Opacity@0.5, Thickness@0}},
    InterpolationOrder -> 2, PlotRange -> All]]



Module[{data =
    Take[Import[StringReplace[NotebookFileName[], ".nb" -> ".csv"],
      "List"], 25], \[Mu], \[Sigma], \[Mu]s},
  \[Mu] = Mean@data;
  \[Sigma] = StandardDeviation@data;
  \[Mu]s =
      Riffle[\[Mu] + # Divide[1.96 \[Sigma], Sqrt@Length@data] & /@ {-1,
        1}, \[Mu]];
  Plot[Evaluate[
    PDF[ExponentialDistribution[Divide[1, #]], x] & /@ \[Mu]s], {x, 0,
    4}, PlotRange -> All,
    PlotLegends -> {"Lower confidence", "Mean", "Upper confidence"},
    ImageSize -> 788, Frame -> True,
    GridLines -> {Range[0, 5, 0.2], Range[0, 3, 0.2]},
    Filling -> {2 -> {1}, 2 -> {3}}
  ]
]