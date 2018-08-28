ClearAll[x];
x := RandomVariate[PoissonDistribution[2],
  RandomVariate[PoissonDistribution[4]]];
Module[{accidents = Table[x, 1000000]},
  Histogram[Plus @@@ Replace[accidents, {} -> {0}]]]