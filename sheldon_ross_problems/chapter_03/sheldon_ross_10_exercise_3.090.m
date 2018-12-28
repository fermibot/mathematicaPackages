Table[ParallelTable[
  Module[{accidents = RandomVariate[PoissonDistribution[5], 3],
    i = 3},
    While[True,
      accidents =
          Rest[accidents] ~ Join ~ {RandomVariate[PoissonDistribution[5]]};
      i += 1;
      If[accidents == {0, 1, 2}, Break[]]
    ];
    i
  ], 10] // Mean // N, 10]


Table[ParallelTable[
  Module[{accidents = RandomVariate[PoissonDistribution[5], 4],
    i = 4},
    While[True,
      accidents =
          Rest[accidents] ~ Join ~ {RandomVariate[PoissonDistribution[5]]};
      i += 1;
      If[accidents == {2, 1, 0, 2}, Break[]]
    ];
    i
  ], 10] // Mean // N, 10]