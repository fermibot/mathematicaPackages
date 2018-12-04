ClearAll[problem3034];
problem3034[rangeIn_ : 6, numberIn_ : 10, iterations_] :=
    Module[{turns = {}, range = Range[rangeIn], number = numberIn},
      Table[Module[
        {dice := RandomChoice[range], rolls, turn},
        rolls = Table[dice, number];
        turn = 0;
        While[Length@rolls > 0,
          rolls = DeleteCases[rolls, 6];
          rolls = Table[dice, Length@rolls];
          turn += 1;
        ];
        AppendTo[turns, turn];
      ], iterations];
      turns
    ]

Module[{sets = {1, 2, 5, 10, 20, 25, 40, 50, 100}},
  DistributionChart[Table[problem3034[6, n, 10000], {n, sets}],
    ChartElementFunction -> "SmoothDensity", ImageSize -> 788,
    ChartLabels -> ("n = " <> ToString[#] & /@ sets),
    PlotRange -> {Automatic, {0, 60}}]
]

(*looking to see if the detached head state is gotten rid off*)