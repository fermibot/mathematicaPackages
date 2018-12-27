ClearAll[customMod]
customMod[n_Integer] := If[Divisible[n, 2], 2, 1]

Module[{plotData},
  plotData = Transpose@Table[
    Module[{outcomes, outcomesProbability, runs = 100},
      outcomes = Table[Module[{winner, players = {"A", "B"}},
        Module[{i = 1, range = Range@6, winOutcomes = {6, 7}},
          While[True,

            If[Plus @@ RandomChoice[range, 2] ==
                winOutcomes[[customMod[i]]],
              winner = {i, players[[customMod[i]]]};
              Break[]];
            i += 1;
          ]
        ];
        winner
      ], runs];
      outcomesProbability =
          KeySort@(#[[1]] & /@ # & /@ (GroupBy[outcomes, #[[2]] &]));
      outcomesProbability = N@(Length[outcomesProbability["A"]] / runs);
      outcomes = N@Mean[#[[1]] & /@ outcomes];
      {outcomesProbability, outcomes}
    ], 1000];
  Framed@Histogram[plotData, {0.01}, ImageSize -> 788,
    ChartLegends -> Placed[{"P{A wins}", "E[X]"}, Top], Frame -> True,
    FrameTicks -> {Range[0, 8, 0.5], Automatic}]
]