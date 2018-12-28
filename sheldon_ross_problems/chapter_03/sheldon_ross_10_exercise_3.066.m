Module[{teams = {{0.6, 0.4} -> {2, 3}, {0.3, 0.7} -> {2, 3}}, goals,
  games, outcomes, barChart, distributionChart,
  iterations = Power[10, 4]},
  goals :=
      Plus @@ (RandomVariate[PoissonDistribution[RandomChoice[#]]] & /@
          teams);
  outcomes = Table[goals, iterations];
  games = KeySort[Counts[outcomes]];

  barChart =
      BarChart[games, ImageSize -> 788,
        Frame -> {{True, True}, {False, True}},
        FrameTicks -> {Range@Max@Keys@games, Automatic},
        ChartLabels ->
            Placed[{N[Values@games / iterations], Values@games}, {Above,
              Below}], AspectRatio -> 0.5, ChartStyle -> LightBlue,
        PlotLabel -> Style["Distribution of the outcomes", Black, 13]];
  distributionChart =
      DistributionChart[{{outcomes, Mean /@ Partition[outcomes, 10]}},
        ImageSize -> 788, ChartElementFunction -> "PointDensity",
        ChartLegends ->
            Placed[{"Actual Outcomes", "Batched Means (Batch size = 10)"},
              Below], AspectRatio -> 0.5,
        PlotLabel ->
            Style["Distribution Chart of the outcomes and the batch means",
              13, Black]];
  Column[{barChart, "\n\n", distributionChart}]
]