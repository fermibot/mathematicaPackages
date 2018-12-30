AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

accumulatingMean@Table[Module[{sequence = RandomChoice[{0, 1}, 8], i},
  i = Length@sequence;
  While[True,
    If[sequence == {1, 0, 1, 1, 0, 1, 0, 1}, Break[]];
    sequence = Rest[sequence] ~ Join ~ {RandomChoice[{0, 1}]};
    i += 1;
  ];
  i
], 1000] //
    DistributionChart[#, "ChartElementFunction" -> "PointDensity"] &