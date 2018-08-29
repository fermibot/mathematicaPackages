Module[{rates = {5, 15, 20}, sample = 200000},
  DistributionChart[
    Association[(Style["\[Lambda] = " <> ToString[#], Red] ->
        RandomVariate[PoissonDistribution[#], sample] & /@ rates)
        ~ Join ~
        {Style["\[Lambda] = 5 + 15", Red] ->
            Plus @@ (RandomVariate[PoissonDistribution[#], sample] & /@ {5,
              15})}],
    ChartLabels -> Automatic,
    ChartElementFunction -> "HistogramDensity", ImageSize -> 788,
    GridLines -> {None, rates}]
]