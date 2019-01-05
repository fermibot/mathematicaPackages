ClearAll[twoPlayersGame]

twoPlayersGame[player1_, player2_] :=
    Module[{probabilities, players = {player1, player2}},
      probabilities = Divide[#, Plus @@ players] & /@ players;
      RandomChoice[probabilities -> players]]
twoPlayersGame[{player1_, player2_}] :=
    twoPlayersGame[player1, player2]
twoPlayersGame[association_Association] :=
    Module[{probabilities, players = Keys@association, winner},
      probabilities = Values@association;
      probabilities = Divide[#, Plus @@ probabilities] & /@ probabilities;
      winner = RandomChoice[probabilities -> players];
      {Complement[Keys@association, {winner}][[1]], winner}
    ];

Module[{players =
    Transpose@
        Import[StringReplace[NotebookFileName[], ".nb" -> ".xlsx"]][[1]],
  playersDictionary},
  playersDictionary = <||>;
  (playersDictionary[First@#] = Rest@#) & /@ players;

  MapThread[(playersDictionary[#1] = RandomSample[#2]) &, {Keys@
      playersDictionary, Values@playersDictionary}];

  Module[{poolWinners, poolWinnersDictionary = <||>},
    poolWinners =
        Table[Module[{poolPlayersTrack, poolPlayers = playersDictionary[#]},
          poolPlayersTrack = {poolPlayers};
          While[Length@poolPlayers > 1,
            poolPlayers = twoPlayersGame /@ Partition[poolPlayers, 2];
            AppendTo[poolPlayersTrack, poolPlayers]
          ];
          poolPlayers[[1]]
        ], 1][[1]] & /@ Keys[playersDictionary];
    MapThread[(poolWinnersDictionary[#1] = #2) &, {ToUpperCase@
        Alphabet[][[1 ;; 3]], poolWinners}];

    Print[poolWinnersDictionary];
    twoPlayersGame[<|"A" -> 2, "B" -> 3|>] // Print;

    Module[{outcomes = {}, printTemporary, megaRuns = 10},
      Table[Module[{outcome = {}, runs = 2},
        printTemporary =
            PrintTemporary[
              Style["Simulating sequence: " <> ToString[r] <> " off " <>
                  ToString@megaRuns, Red]];
        Table[
          Module[{counter = 0,
            gameTrack = <|"A" -> {}, "B" -> {}, "C" -> {}|>,
            waiting = "C", current = {"A", "B"}, roundLoser, roundWinner,
            winner},
            While[True, counter += 1;
            {roundLoser, roundWinner} =
                Module[{secretDictionary =
                    Echo[Association[# -> poolWinnersDictionary[#] & /@
                        current]]}, twoPlayersGame[secretDictionary]];
            current = {roundWinner, waiting};
            waiting = roundLoser;
            MapThread[(gameTrack[#1] =
                Append[gameTrack[#1], #2]) &, {{current[[1]],
              current[[2]], waiting}, {1, 0, 0}}];
            If[counter >= 2,
              If[Or @@ (Take[#, -2] == {1, 1} & /@ gameTrack),
                winner =
                    Piecewise[{#, Take[gameTrack[#], -2] == {1, 1}} & /@
                        Keys[gameTrack]];
                AppendTo[outcome, {counter, winner}];
                Break[]]]]], runs];
        AppendTo[outcomes, KeySort[Counts[#[[2]] & /@ outcome] / runs]];
        Pause[0.01];
        NotebookDelete@printTemporary;], {r, 1, megaRuns}];
    ]
  ];
]

