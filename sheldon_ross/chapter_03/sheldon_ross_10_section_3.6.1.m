ClearAll[swap, position, expectedPosition];
swap[list_List, superiorNumber_] :=
    Module[{tempList = list, current},
      Prepend[DeleteCases[tempList, superiorNumber], superiorNumber]];

expectedPosition[probabilitiesIn_Association, key_] :=
    Module[{probabilities = probabilitiesIn, element, keys},

      1 + (element = probabilitiesIn[#];
      probabilities = KeyDrop[probabilitiesIn, #];
      element Plus @@ (# / (element + #) & /@ Values[probabilities])) &[
        key]]



position[list_List, item_] := Position[list, item][[1, 1]]
Module[{n = 10, probabilities, list, choices, queue, plotData},
  list = Range[n];
  probabilities =
      unitize[Association@
          MapThread[#1 -> #2 &, {list, RandomReal[{0, 1}, n]}]];
  choices = RandomChoice[Values@# -> Keys@# &[probabilities], 100];
  queue = {list};
  Table[AppendTo[queue, list = swap[list, choices[[r]]]], {r, 1,
    Length@choices}];
  plotData =
      Association@
          SortBy[Table[r -> (position[#, r] & /@ queue), {r, 1, n}],
            Mean[Values[#]] &];

  ListPlot[probabilities, GridLines -> {Keys@probabilities, Automatic},
    Frame -> True, ImageSize -> 788] // Print;
  DistributionChart[Values@plotData, ImageSize -> 788,
    ChartElementFunction -> "Density", ChartStyle -> Lighter@Red,
    ChartLabels ->
        Placed[{Keys@KeySort@plotData,
          N@Values@
              KeySort@associationFunctionMap[plotData, Mean]}, {Below,
          Above}]] // Print;
]