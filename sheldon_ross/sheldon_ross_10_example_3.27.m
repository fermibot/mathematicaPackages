AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
<< utilities`;
ClearAll[ballotGenerator];

ballotGenerator[candidates_Association] :=
    Module[{total = Plus @@ Values[candidates], probabilities, keys,
      values, masterList, votes},
      keys = Keys[candidates];
      values = Values[candidates];
      masterList = Join @@ MapThread[ConstantArray[#1, #2] &, {keys, values}];
      votes = RandomSample[masterList, total]
    ]

ballotGenerator[candidates_Association, instances_] :=
    Table[ballotGenerator[candidates], instances]
ListLinePlot[
  Transpose[{valuesMissing[#, "A"], valuesMissing[#, "B"]} & /@
      associationAppender[
        ballotGenerator[Association[{"A" -> 500, "B" -> 500}]]]],
  PlotLegends -> {"Candidate A", "Candidate B"}, ImageSize -> 788,
  AspectRatio -> 1]
