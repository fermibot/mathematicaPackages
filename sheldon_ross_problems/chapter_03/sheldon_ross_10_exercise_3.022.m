AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

Module[{data},
  data = {Last@#, Length@#} & /@
      ToExpression /@
          StringSplit[Import[FileNames["*.txt", NotebookDirectory[]][[1]]],
            "\n"];
  data = GroupBy[data, #[[1]] &];
  data = KeySort[#[[All, 2]] & /@ data];
  DistributionChart[data, ImageSize -> 800,
    ChartElementFunction -> "PointDensity", ChartLabels -> Keys@data]
]