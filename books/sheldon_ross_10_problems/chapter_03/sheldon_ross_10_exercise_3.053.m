Module[
  {\[CapitalLambda] := RandomVariate[ExponentialDistribution[1]], data},
  data =
      KeySort@
          Counts[
            Table[RandomVariate[PoissonDistribution[\[CapitalLambda]]], 10000]
          ];
  BarChart[
    data,
    ImageSize -> 788,
    Frame -> True,
    ChartLabels -> Placed[{Keys@data, Values@data}, {Below, Above}],
    ChartStyle -> Directive[EdgeForm[Red], LightBlue],
    FrameLabel -> (Style[#, 20] & /@ {"Outcome", "Count"})]
]

Plot[1 / 2^(n + 1), {n, 0, 10}, PlotRange -> All, Frame -> True,
  ImageSize -> 788,
  GridLines -> {Range[0, 10, 0.5], Range[0, 0.5, 0.05]},
  AspectRatio -> 0.5,
  FrameLabel -> (Style[#, 20] & /@ {"n",
    "\!\(\*FractionBox[\(1\), SuperscriptBox[\(2\), \(n + 1\)]]\)"})]