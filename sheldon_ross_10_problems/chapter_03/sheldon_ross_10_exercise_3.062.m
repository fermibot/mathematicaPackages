Module[{outcomes = {}, players = ToUpperCase[Alphabet[][[1 ;; 3]]],
  printTemporary, megaRuns = 1000},
  Table[
    Module[{outcome = {}, runs = 1000},
      printTemporary =
          PrintTemporary[
            Style["Simulating sequence: " <> ToString[r] <> " off " <>
                ToString@megaRuns, Red]];
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
              AppendTo[outcome, {counter, winner}];
              Break[]]
          ]
        ]], runs];
      AppendTo[outcomes, KeySort[Counts[#[[2]] & /@ outcome] / runs]];
      Pause[0.01];
      NotebookDelete@printTemporary;
    ], {r, 1, megaRuns}];

  outcomes =
      Association@
          Table[player -> (#[player] & /@ outcomes), {player, players}];
  DistributionChart[outcomes, "ChartElementFunction" -> #,
    PlotLabel -> Style[#, Bold, 16], ImageSize -> 788,
    AspectRatio -> 0.3,
    ChartLabels ->
        Placed[{# <> "\n" & /@ (ToString /@
            N /@ Mean /@ Values@outcomes),
          "\n" <> # & /@ Keys@outcomes}, {Above,
          Below}]] & /@ {"PointDensity", "SmoothDensity", "Quantile"} //
      Column // Framed
]