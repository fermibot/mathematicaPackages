Module[{transitionMatrix = {{0.8, 0.0, 0.2}, {0.0, 0.8, 0.2}, {0.1,
  0.1, 0.8}}}, MatrixPower[transitionMatrix, 2]]

Clear[markovSimulator, argument, rotatePoint];
markovSimulator[transitionMatrix_?MatrixQ, currentState_Integer] :=
    Module[{states = Range[Dimensions[transitionMatrix][[1]]]},
      RandomChoice[transitionMatrix[[currentState]] -> states]];
argument[points_List] :=
    Module[{difference = points[[1]] - points[[2]]},
      If[difference[[1]] == difference[[2]], 0,
        ArcTan[Divide[difference[[2]], difference[[1]]]]]];
rotatePoint[point_,
  angle_] := {{Cos@angle, -Sin@angle}, {Sin@angle, Cos@angle}}.point;

Module[{transitionMatrix, state = 1, coordinates, simulation,
  transitions, labelCoordinates, nStates},
  transitionMatrix = {{0.8, 0.0, 0.2}, {0.0, 0.8, 0.2}, {0.1, 0.1,
    0.8}};
  nStates = Length@transitionMatrix;
  simulation =
      Table[state = markovSimulator[transitionMatrix, state], 2000];
  coordinates =
      Association@
          MapThread[{#1 -> #2} &, {Range@nStates, CirclePoints@nStates}];
  labelCoordinates = 1.25 CirclePoints[Length@transitionMatrix];
  coordinates = coordinates[#] & /@ simulation;
  transitions =
      Partition[#, 2] &[Riffle[Drop[coordinates, -1], Rest[coordinates]]];
  Graphics[{
    {Opacity@0.1, Hue[RandomReal[{0.60, 0.65}]], Thickness@0,
      BezierCurve[{#[[1]],
        Mean[#] +
            rotatePoint[RandomReal[{-0.25, 0.25}, 2], argument[#]],
        rotatePoint[RandomReal[{-0.25, 0.25}, 2], argument[#]], #[[
            2]]}]} & /@ transitions,
    MapThread[
      Text[Style[Rotate[#1, #3], 16], #2] &, {{"Red-Red", "Blue-Blue",
      "Red-Blue"}, labelCoordinates, {\[Pi] / 3, 0, -\[Pi] / 3}}]},
    ImageSize -> 788] // Framed
]