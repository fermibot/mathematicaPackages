ClearAll[dataReformat, poissonDistributionZero, peopleInOut,
  peopleAccumulator, busPlot, ranger];

stopFormat[item_String] :=
 StringReplace[item, {"Stop#" -> "", " - " -> " ", " " -> " "}]
dataReformat[item_String] := ToExpression /@ StringSplit[item, "::"]

poissonDistributionZero[\[Lambda]_] :=
 If[\[Lambda] <= 0, 0, RandomVariate[PoissonDistribution[\[Lambda]]]]

ranger[list_List] :=
 MapThread[{#1, #2} &, {Range[0, Length@list - 1], list}]

peopleInOut[n_, inOut_List] :=
 Clip[n + inOut[[1]] - inOut[[2]], {0, \[Infinity]}]
peopleAccumulator[stopData_List] := Module[{people = 0},
  Table[people = peopleInOut[people, stopData[[r]]], {r, 1,
     Length@stopData}]~Join~{0}]

busPlot[data_, color_: Red] :=
 Module[{plotData = data}, ListLinePlot[peopleAccumulator /@ plotData,
   PlotStyle ->
    Table[{Thickness[0.0001], Opacity[0.2], color}, Length@plotData],
   AspectRatio -> 0.25,
   ImageSize -> 788]]

Module[{data =
   Import[StringReplace[NotebookFileName[], ".nb" -> ".xlsx"]][[1]],
  dataH, dataD, stops, bus10H, bus121,
  bus10HSim, bus121Sim,
  bus10HPassPlot, bus121PassPlot,
  bus10HSimPlotData, bus121SimPlotData,
  boarDeboard10H, boarDeboard121,
  bus10HTime, bus121Time
  },

 dataH = First[data];
 dataD = Transpose[Rest[Transpose[Drop[Rest@Rest@data, -1]]]];
 {bus10H, bus121} = Transpose[dataD];
 {bus10H, bus121} = {dataReformat /@ bus10H, dataReformat /@ bus121};
 stops = stopFormat /@ First[Transpose[Drop[Rest@Rest@data, -1]]];

 {bus10HSim, bus121Sim} =
  ParallelTable[{{0, 0}}~Join~(poissonDistributionZero /@ # & /@ #),
     1000] & /@ {bus10H, bus121};

 {bus10HTime, bus121Time} =
  10 N@Mean@Flatten[Max /@ # & /@ #] & /@ {bus10HSim, bus121Sim};

 {bus10HPassPlot, bus121PassPlot} =
  MapThread[
   Module[{plotData = #1},
     ListLinePlot[ranger /@ peopleAccumulator /@ plotData,
      PlotStyle ->
       Table[{Thickness[0.0001], Opacity[0.25], Lighter@#2},
        Length@plotData],
      ImageSize -> 788,
      PlotLabel -> "Rounte " <> #3, PlotRange -> {{0, 22}, {0, 70}},
      InterpolationOrder -> 2, Frame -> True]] &,
   {{bus10HSim, bus121Sim}, {Red, Blue}, {"10H", "121"}}];


 {boarDeboard10H, boarDeboard121} = MapThread[DistributionChart[
     MapThread[{#1, #2} &, {10 Transpose[
         First /@ # & /@ #1], -10 Transpose[Last /@ # & /@ #1]}],
     ChartStyle -> {Lighter@Green, Lighter@Red}, ImageSize -> 788,
     ChartElementFunction -> "Density",
     FrameLabel -> {"Stops", "Boarding/Deboarding time (sec)"},
     ChartLabels -> {(Rotate[#,
           90 \[Degree]] & /@ ((StringDrop[#, 3] & /@ stops)~
           Join~{#2})), {"", ""}},
     PlotLabel -> "Route " <> #3] &, {{bus10HSim,
     bus121Sim}, {"Allwyn X Roads", "Miyapur"}, {"10H", "121"}}];

 MapThread[
  Export[StringReplace[NotebookFileName[],
     ".nb" -> "_" <> ToString[#1] <> ".png"], #2,
    ImageSize -> 788, ImageResolution -> 500] &,
  {{"bus10HPassPlot", "bus121PassPlot", "boarDeboard10H",
    "boarDeboard121"},
   {bus10HPassPlot, bus121PassPlot, boarDeboard10H, boarDeboard121}}];

 Print[{bus10HTime, bus121Time}];

 ]