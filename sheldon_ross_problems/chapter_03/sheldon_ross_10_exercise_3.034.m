Module[{turns = {}},
  Table[Module[
    {dice := RandomChoice[{1, 2, 3, 4, 5, 6}], rolls, turn},
    rolls = Table[dice, 10];
    turn = 0;
    While[Length@rolls > 0,
      rolls = DeleteCases[rolls, 6];
      rolls = Table[dice, Length@rolls];
      turn += 1;
    ];
    AppendTo[turns, turn];
  ], 100];
  turns
]