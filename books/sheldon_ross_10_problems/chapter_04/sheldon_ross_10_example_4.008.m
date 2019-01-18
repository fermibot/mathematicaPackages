Module[{transitionMatrix = {{0.7, 0.3}, {0.4, 0.6}}},
  MatrixPower[transitionMatrix, 4]]

Clear[markovSimulator];
markovSimulator[transitionMatrix_?MatrixQ, currentState_Integer] :=
    Module[{states = Range[Dimensions[transitionMatrix][[1]]]},
      RandomChoice[transitionMatrix[[currentState]] -> states]];

Module[{transitionMatrix, state = 1, coordinates, simulation,
  transitions, labelCoordinates, nStates},
  transitionMatrix = {{0.7, 0.3}, {0.4, 0.6}};
  nStates = Length@transitionMatrix;
  simulation =
      Table[state = markovSimulator[transitionMatrix, state], 10000];
  coordinates =
      Association@
          MapThread[{#1 -> #2} &, {Range@nStates, CirclePoints@nStates}];
  labelCoordinates = 2 CirclePoints[Length@transitionMatrix];
  coordinates = coordinates[#] & /@ simulation;
  transitions =
      Partition[#, 2] &[Riffle[Drop[coordinates, -1], Rest[coordinates]]];
  Graphics[{{Opacity@0.02, Hue[RandomReal[{0.5, 0.7}]], Thickness@0,
    BezierCurve[{#[[1]],
      Mean[{#[[1]] + #[[2]]}] + RandomReal[{-0.5, 0.5}, 2], #[[
          2]]}]} & /@ transitions,
    MapThread[
      Text[Style[Rotate[#1, #3 + \[Pi]], 16], #2] &, {{"Rains Tomorrow",
      "Doesn't Rain Tomorrow"}, labelCoordinates,
      Range[\[Pi] / 2, 3 \[Pi] / 2, \[Pi]]}]}, ImageSize -> 788]
]