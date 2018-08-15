AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
<< utilities`;
ClearAll[minSum];
minSum[x_] :=
    Module[{total = x, count = 1, sum = RandomReal[]},
      While[sum <= total, sum += RandomReal[]; count += 1]; count]
minSum[x_, sampleSize_] := Table[minSum[x], sampleSize]

Module[{data, theory, meanTrack, mergedPlot,
  range = Range[0.01, 1, 0.01]},
  data = Table[minSum[#, 100] & /@ range, 100];
  data = MapThread[{#1, #2} &, {range, Mean /@ #}] & /@ data;
  meanTrack =
      ListLinePlot[data,
        ImageSize -> 788,
        InterpolationOrder -> 2,
        PlotStyle -> Table[{Red, Thickness[0], Opacity@0.4}, Length@data],
        Mesh -> All, MeshStyle -> {Black, PointSize[0]}];

  theory = Plot[E^x, {x, 0, 1}, PlotStyle -> {Dashed, Yellow, Thick}];
  mergedPlot =
      Show[meanTrack, theory, AspectRatio -> 1,
        PlotLabel ->
            stringJoinStyled[{Style["Simulation", Red],
              Style[" Theory", Darker@Yellow]}], ImageSize -> 788,
        Frame -> True, FrameLabel -> {"x", "M(x)"}];
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_x_less_than_1.png"], mergedPlot,
    ImageResolution -> 1000, ImageSize -> 788]
]
Export[StringReplace[NotebookFileName[], ".nb" -> ".txt"],
  Parallelize[
    N /@ {Mean[#], StandardDeviation[#]} & /@ (Import[#][[1]] & /@
        FileNames["*.csv", NotebookDirectory[]])]]
Module[{sortedData =
    SortBy[ToExpression /@ # & /@
        (StringSplit[StringDelete[#, " "], ","] & /@
            StringSplit[
              StringDelete[
                Import[StringReplace[NotebookFileName[],
                  ".nb" -> ".txt"]], {"{", "}"}], "\n"]), #[[2]] &], muPlot,
  sigmaPlot},
  sortedData = MapThread[Prepend[#1, #2] &, {sortedData, Range[100]}];
  muPlot =
      ListLinePlot[sortedData[[All, {1, 3}]], ImageSize -> 788,
        Mesh -> All, MeshStyle -> {Blue, PointSize[0.004]},
        AspectRatio -> 2, Frame -> True, FrameLabel -> {"x", "Var(M)"},
        GridLines -> {sortedData[[All, 1]], sortedData[[All, 3]]}];
  sigmaPlot =
      ListLinePlot[sortedData[[All, {1, 2}]], ImageSize -> 788,
        Mesh -> All, MeshStyle -> {Blue, PointSize[0.004]},
        AspectRatio -> 1, Frame -> True, FrameLabel -> {"x", "Exp(M)"},
        GridLines -> {sortedData[[All, 1]], sortedData[[All, 2]]}];

  MapThread[
    Export[StringReplace[NotebookFileName[],
      ".nb" -> "_x_greater_than_1_" <> #1 <> ".png"], #2,
      ImageResolution -> 500, ImageSize -> 788] &, {{"mean",
    "standardDeviation"}, {muPlot, sigmaPlot}}]

]