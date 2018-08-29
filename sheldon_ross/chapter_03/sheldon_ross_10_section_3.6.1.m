AppendTo[$Path,"D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["statistics`"];

ClearAll[swap, position,];
swap[list_List, superiorNumber_] :=
  Module[{tempList = list, current},
   Prepend[DeleteCases[tempList, superiorNumber], superiorNumber]];

expectedPosition[probabilities_Association] := Module

position[list_List, item_] := Position[list, item][[1, 1]]

Module[{n = 20, probabilities, list, choices, queue, plotData},

 list = Range[n];
 probabilities =
  unitize[Association@
    MapThread[#1 -> #2 &, {list, RandomReal[{0, 1}, n]}]];
 choices = RandomChoice[Values@# -> Keys@# &[probabilities], 20];
 queue = {list};
 Table[AppendTo[queue, list = swap[list, choices[[r]]]], {r, 1,
   Length@choices}];
 plotData =
  SortBy[Table[r -> (position[#, r] & /@ queue), {r, 1, n}],
   Mean[Values[#]] &];

 DistributionChart[Values@plotData, ImageSize -> 788,
   ChartElementFunction -> "Density", ChartStyle -> Lighter@Red,
   ChartLabels -> Keys@plotData] // Print;
 ]