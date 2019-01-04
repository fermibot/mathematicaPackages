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