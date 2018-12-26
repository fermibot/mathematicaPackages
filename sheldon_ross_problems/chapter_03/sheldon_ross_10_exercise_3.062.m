Module[{counter = 0, gameTrack = <|"A" -> {}, "B" -> {}, "C" -> {}|>,
  waiting = "C", current = {"A", "B"}, loser, winner},
  While[True,
    counter += 1;
    {loser, winner} = RandomSample[current, 2];
    current = {winner, waiting};
    waiting = loser;
    MapThread[(gameTrack[#1] =
        Append[gameTrack[#1], #2]) &, {{current[[1]], current[[2]],
      waiting}, {1, 0, 0}}];
    Print[gameTrack];
    If[counter >= 2,
      If[Or @@ (Take[#, -2] == {1, 1} & /@ gameTrack), Break[]]];
  ]
]