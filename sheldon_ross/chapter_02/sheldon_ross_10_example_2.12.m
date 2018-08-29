cumulativeRange[list_List] := Accumulate[list] / Range[Length@list];
Show[Table[
  Module[{data =
      cumulativeRange[RandomVariate[PoissonDistribution[2], 180]]},
    Graphics[
      Table[{PointSize[0.002], Opacity[0.5],
        Point[{data[[r]] Sin[2 r \[Degree]],
          data[[r]] Cos[2 r \[Degree]]}]}, {r, 1, Length@data}],
      ImageSize -> 734]], 50]]

ClearAll[cumulativeRange, radialLine];

cumulativeRange[list_List] := Accumulate[list] / Range[Length@list];
radialLine[data_] :=
    {Opacity[0.05], Thickness[0],
      Line[Table[{data[[r]] Sin[2 r \[Degree]],
        data[[r]] Cos[2 r \[Degree]]}, {r, 1, Length@data}]]};

Export[NotebookDirectory[] <> "poisson_01.png",
  Module[{data =
      Table[cumulativeRange[
        RandomVariate[PoissonDistribution[3.2], 180]], 500]},
    Graphics[Join @@ {{Red, Thickness[0.005], Circle[{0, 0}, 3.2]},
      {Opacity[0.01], Black, Thickness[0], radialLine[#] & /@ data}},
      Frame -> True]], ImageSize -> 754]

counter[count_] :=
    Module[{data = RandomVariate[PoissonDistribution[3.2], count]},
      Length[Select[data, # <= 2 &]] / count]

DistributionChart[
  Table[counter[#], 1000] & /@ {5, 10, 20, 50, 100, 200, 500, 1000},
  ChartElementFunction -> "HistogramDensity",
  ChartLabels -> {5, 10, 20, 50, 100, 200, 500, 1000},
  PlotLabel ->
      "P{x\[LessEqual]2} with the number of seconds of waiting time"]

SetOptions[SelectedNotebook[], PrintingStyleEnvironment -> "Printout",
  ShowSyntaxStyles -> True]