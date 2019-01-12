Module[
  {\[Beta] = 0.1, iterations = 25, simulation, iterationValues,
    linePlot, distributionMean, distributionVariance,
    aspectRatio = AspectRatio -> 0.3},

  simulation =
      Table[
        NestList[# + RandomVariate[NormalDistribution[0, \[Beta] Power[#, 2]]] &, 1, iterations], 100];
  iterationValues = Transpose@simulation;
  linePlot =
      Labeled[
        ListLinePlot[
          simulation, PlotRange -> {{0, iterations + 1}, All},
          PlotStyle -> {{Thickness[0], Opacity@0.2, Purple}},
          InterpolationOrder -> 2, Frame -> True,
          GridLines -> {Range[0, iterations], None},
          ImageSize -> 788, aspectRatio
        ],
        Rotate["Progression", Divide[Pi, 2]], Left];

  {distributionMean, distributionVariance} =
      Table[
        Labeled[
          DistributionChart[iterationValues, GridLines -> {None, {1}},
            ImageSize -> 788,
            ChartLabels ->
                Placed[Rotate["   " <> ToString[#],
                  Divide[Pi, 2]] & /@ (params[[1]] /@ iterationValues), Above],
            ChartElementFunction -> "PointDensity", aspectRatio],
          Rotate[params[[2]], Divide[Pi, 2]], Left],
        {params, {{Mean, "Mean"}, {Variance, "Variance"}}}];

  Framed@Column[{linePlot, distributionMean, distributionVariance}]
]