Module[
  {storms := RandomVariate[PoissonDistribution[RandomReal[{0, 5}]]],
    days = 1000000},
  storms = Table[storms, days];
  Divide[Length[Select[storms, # >= 3 &]], days] // N
]