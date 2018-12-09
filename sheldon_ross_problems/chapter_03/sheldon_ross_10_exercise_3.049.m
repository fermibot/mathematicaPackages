Module[{topSimulation, AWins, BWins},
  topSimulation = Table[Module[{simulation},
    simulation = Table[
      Module[{a = 0, b = 0, c = 0, probability = 0.1},
        While[True,
          c += 1;
          If[RandomReal[] <= probability, a += 1, b += 1];
          If[Abs[a - b] >= 2, Break[]]];
        {{"A", "B"}[[Position[{a, b}, Max[a, b]][[1, 1]]]], c}
      ]
      , 50];
    Mean /@ (#[[2]] & /@ # & /@ GroupBy[simulation, #[[1]] &])
  ], 1000];
  AWins = #["A"] & /@ topSimulation;
  BWins = #["B"] & /@ topSimulation;

  DistributionChart[{AWins, BWins}]
]