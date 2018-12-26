Table[Module[{counter = 0,
  gameTrack = <|"A" -> {}, "B" -> {}, "C" -> {}|>, waiting = "C",
  current = {"A", "B"}, roundLoser, roundWinner, winner},
  While[True,
    counter += 1;
    {roundLoser, roundWinner} = RandomSample[current, 2];
    current = {roundWinner, waiting};
    waiting = roundLoser;
    MapThread[(gameTrack[#1] =
        Append[gameTrack[#1], #2]) &, {{current[[1]], current[[2]],
      waiting}, {1, 0, 0}}];
    If[counter >= 2,
      If[Or @@ (Take[#, -2] == {1, 1} & /@ gameTrack),
        winner =
            Piecewise[{#, Take[gameTrack[#], -2] == {1, 1}} & /@
                Keys[gameTrack]];
        AppendTo[outcomes, {counter, winner}];
        Break[]]
    ]
  ]
], runs];
KeySort[Counts[#[[2]] & /@ outcomes] / runs // N]