Module[{numberOfAccidents =
    RandomVariate[PoissonDistribution[4], 10000], accidents},
  accidents =
      RandomVariate[PoissonDistribution[2], #] & /@ numberOfAccidents;
  DistributionChart[{numberOfAccidents, Flatten@accidents,
    Total /@ accidents}, ChartElementFunction -> "Density",
    ChartStyle -> Red, ImageSize -> 788,
    ChartLabels ->
        Placed[{{N@Mean@numberOfAccidents, N@Mean@Flatten@accidents,
          N@Mean@(Total /@ accidents)}, {"Accidents/Week",
          "Injuries/Accident", "Injuries/week"}}, {Above, Below}]]
]