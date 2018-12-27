ClearAll[customMod]
customMod[n_Integer] := If[Divisible[n, 2], 2, 1]

Table[Module[{winner, players = {"A", "B"}},
  Module[{i = 1, range = Range@6, winOutcomes = {6, 7}},
    While[True,
      If[Plus @@ RandomChoice[range, 2] == winOutcomes[[customMod[i]]],
        winner = {i, players[[customMod[i]]]};
        Break[]];
      i += 1;
    ]
  ];
  winner
], 1000]