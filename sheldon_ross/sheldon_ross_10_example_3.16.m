AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["qFunctions`"];
Needs["utilities`"]

Module[{files =
    FileNames["*0.txt",
      NotebookDirectory[] <> "distribution_chart_data"], labels},
  files = SortBy[files,
    ToExpression[
      StringSplit[Last[StringSplit[#, "_"]], ".txt"][[1]]] &];
  labels =
      StringSplit[Last[StringSplit[#, "_"]], ".txt"][[1]] & /@ files;
  DistributionChart[
    ToExpression[StringSplit[Import[#], "\n"]] & /@ files,
    ChartLabels -> labels, AspectRatio -> 2, ImageSize -> 788,
    ChartElementFunction -> "PointDensity",
    GridLines -> {None, Range[0, 1000, 25]},
    FrameLabel -> {"Length of the List",
      "Number of steps taken for sorting"}]
]

Export[StringReplace[NotebookFileName[], ".nb" -> ".png"], %,
ImageSize -> 788, ImageResolution -> 350]


Plot[2 (n + 2) Log[n + 2], {n, 1, 3000}, Frame -> True,
  FrameLabel -> {"Length of the List",
    "Number of steps taken for sorting"}, GridLines -> Automatic]
Export[StringReplace[NotebookFileName[], ".nb" -> "_02.png"], %,
ImageSize -> 788, ImageResolution -> 500]


ClearAll[sequenceHuePlot]
sequenceHuePlot[list_List] :=
    Module[{length = Length@list},
      Graphics[Table[{Hue[0.8 list[[r]] / length],
        EdgeForm[Gray], Opacity[0.8],
        Rectangle[{r - 1, 0}, {r, 0.2 length}]}, {r, 1, length}]]]

Module[{path = NotebookDirectory[] <> "animation_data", files, tags},
  files = FileNames["*.txt", path];
  tags = Last[StringSplit[StringDelete[#, path], {"_", ".txt"}]] & /@
      files;

  Parallelize[MapThread[
    Module[{data = ToExpression[StringSplit[StringReplace[Import[#1],
      {"[" -> "{", "]" -> "}"}], "\n"]]},
      data = Flatten /@ data;
      Export[StringReplace[#1, ".txt" -> ".gif"],
        sequenceHuePlot /@ data, ImageSize -> 788,
        "DisplayDurations" -> 1]
    ] &, {files}]]

]