AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
<< lists`;
<< utilities`;

Module[{plotData, nNodes = Union @@ (Range[10] * 10^# & /@ Range[0, 1])},
  plotData = Module[{graphTruth},
    graphTruth =
        lists`listProportion[#,
          True] & /@ (Table[Module[{nodes = Range@#, graph},

          ConnectedGraphQ[
            Graph[# \[UndirectedEdge] RandomChoice[nodes] & /@ nodes]]
        ], 1000] & /@ nNodes);
    associateLists[nNodes, graphTruth]
  ] & /@ Range@20;
  ListLogLogPlot[plotData, Joined -> True,
    PlotStyle ->
        Table[{Darker@Green, Opacity@0.2, Thickness@0}, Length@plotData],
    InterpolationOrder -> 2, ImageSize -> 788,
    Ticks -> {nNodes, Range[0, 1, 0.1]}]]