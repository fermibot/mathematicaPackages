Module[{dimensions = 16, transitionMatrix, labels},
  transitionMatrix = ConstantArray[0, ConstantArray[dimensions, 2]];
  Table[If[(i == 1 && j == 1) || (i == dimensions && j == dimensions),
    transitionMatrix[[i, j]] = 1,
    If[((i == j - 1) || (i == j + 1)) && (i != 1) && (i != dimensions),
      transitionMatrix[[i, j]] = 0.5]], {i, 1, dimensions}, {j, 1,
    dimensions}];
  labels =
      "$" <> ToString[#] & /@
          Range[0, Dimensions[transitionMatrix][[1]] - 1];
  labels[[-1]] = labels[[-1]] <> " Win";
  labels[[1]] = labels[[1]] <> " Broke";
  Graph[labels, DiscreteMarkovProcess[1, transitionMatrix],
    GraphLayout -> "CircularEmbedding", ImageSize -> 500] // Framed
]

Clear[markovSimulator, chainObject];
markovSimulator[transitionMatrix_?MatrixQ, currentState_Integer] :=
    Module[{states = Range[Dimensions[transitionMatrix][[1]]]},
      RandomChoice[transitionMatrix[[currentState]] -> states]];

chainObject[list_List, totalNodes_Integer] :=
    Module[{perimeter = CirclePoints[totalNodes]}, perimeter]

Module[{dimensions = 16, transitionMatrix, labels, p = 0.8,
  iterations = 1},
  transitionMatrix = ConstantArray[0, ConstantArray[dimensions, 2]];
  Table[If[(i == 1 && j == 1) || (i == dimensions && j == dimensions),
    transitionMatrix[[i, j]] = 1,
    If[(i == j + 1) && (i != dimensions),
      transitionMatrix[[i, j]] = 1 - p,
      If[(i == j - 1) && (i != 1), transitionMatrix[[i, j]] = p]]], {i,
    1, dimensions}, {j, 1, dimensions}];
  labels =
      "$" <> ToString[#] & /@
          Range[0, Dimensions[transitionMatrix][[1]] - 1];
  labels[[-1]] = labels[[-1]] <> " Win";
  labels[[1]] = labels[[1]] <> " Broke";

  Table[Module[{simulation, start = 7},
    simulation = {start};
    While[True,
      start = markovSimulator[transitionMatrix, start];
      AppendTo[simulation, start];
      If[start == 1 || start == 16, Break[]];
    ];
    simulation
  ], iterations][[1]]
]