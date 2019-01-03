Module[
  {guests = RandomVariate[PoissonDistribution[10], 10000],
    simulation, plotData, plotDataSmooth},
  plotData = {guests, simulation};
  simulation =
      Table[Length[
        Select[RandomReal[{0, 1}, n - 1], # <= RandomReal[] &]], {n,
        guests}];
  SmoothHistogram[plotData, ImageSize -> 788, Frame -> True,
    GridLines -> {Range[0, 25], Range[0, 0.25, 0.0125]},
    AspectRatio -> 0.5,
    PlotLegends -> Placed[{"Number of guests", "Number of guests that arrived earlier than you"}, Below],
    PlotLabel -> Style[#, 20] &["Smooth Kernel Histograms of the scenario"]
  ]
]
