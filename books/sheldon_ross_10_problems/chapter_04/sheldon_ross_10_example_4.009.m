Module[{transitionMatrix = {{0.7, 0.0, 0.3, 0.0}, {0.5, 0.0, 0.5,
  0.0}, {0.0, 0.4, 0.0, 0.6}, {0.0, 0.2, 0.0, 0.8}}},
  MatrixPower[transitionMatrix, 2]]

Clear[markovSimulator];
markovSimulator[transitionMatrix_?MatrixQ, currentState_Integer] :=
    Module[{states = Range[Dimensions[transitionMatrix][[1]]]},
      RandomChoice[transitionMatrix[[currentState]] -> states]];

Module[{transitionMatrix, state = 1, coordinates, simulation,
  transitions, labelCoordinates, nStates},
  transitionMatrix = {{0.7, 0.0, 0.3, 0.0}, {0.5, 0.0, 0.5, 0.0}, {0.0,
    0.4, 0.0, 0.6}, {0.0, 0.2, 0.0, 0.8}};
  nStates = Length@transitionMatrix;
  simulation =
      Table[state = markovSimulator[transitionMatrix, state], 5000];
  coordinates =
      Association@
          MapThread[{#1 -> #2} &, {Range@nStates, CirclePoints@nStates}];
  labelCoordinates = 2 CirclePoints[Length@transitionMatrix];
  coordinates = coordinates[#] & /@ simulation;
  transitions =
      Partition[#, 2] &[Riffle[Drop[coordinates, -1], Rest[coordinates]]];
  Graphics[{{Opacity@0.1, Hue[RandomReal[{0.0, 0.1}]], Thickness@0,
    BezierCurve[{#[[1]],
      Mean[{#[[1]] + #[[2]]}] + RandomReal[{-0.5, 0.5}, 2], #[[
          2]]}]} & /@ transitions,
    MapThread[
      Text[Style[Rotate[#1, #3 - 3 \[Pi] / 4],
        16], #2] &, {"State " <> ToString@# & /@ Range[0, 3],
      labelCoordinates, Range[0, 3 \[Pi] / 2, \[Pi] / 2]}]},
    ImageSize -> 788] // Framed
]