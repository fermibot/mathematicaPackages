AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

Module[{data},
  data = ({Last@#, Length@#} & /@ ToExpression /@ StringSplit[Import[#], "\n"]) &[#] & /@ FileNames["*.txt", NotebookDirectory[]];
  data = GroupBy[#, #[[1]] &] & /@ data;
  data = KeySort[(#[[All, 2]] & /@ # &[#])] &[#] & /@ data;
  Column[
    Framed[
      DistributionChart[data,
        ImageSize -> 800,
        ChartElementFunction -> #,
        ChartLabels -> {Style[#, 16, Red] & /@ {"k = 3\n", "k = 4\n"}, Keys@data[[1]]}]
    ] & /@ {"SmoothDensity", "PointDensity", "GlassQuantile"}]
]
