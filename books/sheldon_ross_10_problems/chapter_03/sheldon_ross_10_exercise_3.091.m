AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

With[{runs = 10000},
  accumulatingMean@Table[Module[{sequence = RandomChoice[{0, 1}, 8], i},
    i = Length@sequence;
    While[True,
      If[sequence == {1, 0, 1, 1, 0, 1, 0, 1}, Break[]];
      sequence = Rest[sequence] ~ Join ~ {RandomChoice[{0, 1}]};
      i += 1;
    ];
    i
  ], runs] //
      DistributionChart[#, "ChartElementFunction" -> "PointDensity",
        ImageSize -> 788,
        ChartLegends ->
            Placed["Distribution of the number of trials needed to get the \
sequence {1,0,1,1,0,1,0,1} " <> ToString[runs] <> " runs", Below]] &]