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

Clear[markovSimulator, circlePointsRandomizer, chainObject];
markovSimulator[transitionMatrix_?MatrixQ, currentState_Integer] :=
    Module[{states = Range[Dimensions[transitionMatrix][[1]]]},
      RandomChoice[transitionMatrix[[currentState]] -> states]];

circlePointsRandomizer[n_Integer] :=
    MapThread[{(1 + #2) Sin[Divide[2 \[Pi] #1, n]], (1 + #2) Cos[
      Divide[2 \[Pi] #1, n]]} &, {Range[n],
      RandomReal[{-0.2, 0.2}, n]}]


chainObject[list_List, totalNodes_Integer] :=
    Module[{perimeter = circlePointsRandomizer[totalNodes],
      circleSubset}, circleSubset = perimeter[[list]];
    {Opacity@0.1, BSplineCurve[circleSubset, SplineDegree -> 2]}
    ]

Grid[Partition[#, 3]] &[
  Table[Module[{dimensions = 16, transitionMatrix, labels, p = prob,
    iterations = 100, simulations = {}},
    transitionMatrix = ConstantArray[0, ConstantArray[dimensions, 2]];
    Table[If[(i == 1 && j == 1) || (i == dimensions &&
        j == dimensions), transitionMatrix[[i, j]] = 1,
      If[(i == j + 1) && (i != dimensions),
        transitionMatrix[[i, j]] = 1 - p,
        If[(i == j - 1) && (i != 1),
          transitionMatrix[[i, j]] = p]]], {i, 1, dimensions}, {j, 1,
      dimensions}];
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
      AppendTo[simulations, simulation];
    ], iterations];

    Graphics[{chainObject[#, 16] & /@ simulations,
      Text["p = " <> ToString[p], {0, 0}]},
      PlotRange -> ConstantArray[{-1.3, 1.3}, 2], ImageSize -> 262]
  ], {prob, Range[0.1, 0.9, 0.1]}]]