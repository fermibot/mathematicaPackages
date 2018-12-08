Module[{customers := RandomVariate[PoissonDistribution[10]],
  spending := RandomVariate[UniformDistribution[{0, 100}]],
  simulation, mean, variance},
  simulation =
      Table[Plus @@ (spending & /@ Range[customers]), 1000, 100];
  mean = Mean /@ simulation;
  variance = Variance /@ simulation;
  Column[Table[
    Labeled[Framed[
      Row[MapThread[
        DistributionChart[#1,
          ChartElementFunction -> chartElementFunction,
          ImageSize -> 394, AspectRatio -> 0.35, PlotLabel -> #2,
          PlotRange -> All] &, {{mean, variance}, {"Mean:\[Mu]",
          "Variance:\!\(\*SuperscriptBox[\(\[Sigma]\), \(2\)]\)"}}]]],
      Rotate[chartElementFunction, Divide[Pi, 2]],
      Left], {chartElementFunction, {"PointDensity", "SmoothDensity",
      "GlassQuantile", "BoxWhisker", "HistogramDensity"}}]]
]