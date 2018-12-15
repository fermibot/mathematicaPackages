Module[
  {accidents :=
      RandomChoice[{0.6, 0.4} -> {RandomVariate[PoissonDistribution[9]], RandomVariate[PoissonDistribution[3]]}]},
  accidents = KeySort@Counts[accidents & /@ Range[1000000]];

  BarChart[
    accidents,
    ImageSize -> 788,
    Frame -> True,
    ChartLabels -> Placed[{Keys@accidents, Rotate[#, Divide[\[Pi], 2]] & /@ (Values@accidents)}, {Below,Above}],
    PlotLabel -> Style["Distribution of the accidents occuring in the city", 20]]
]