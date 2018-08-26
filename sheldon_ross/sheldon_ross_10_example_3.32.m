AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];
Needs["statistics`"];

ClearAll[expectedValue, theoProbabilities];
expectedValue[probabilities_Association, n_] :=
    Module[{rates = Keys@probabilities, odds = Values@probabilities},
      Plus @@ (rates * odds * (PDF[PoissonDistribution[#], n] & /@ rates)) /
          Plus @@ (odds * (PDF[PoissonDistribution[#], n] & /@ rates))]
theoProbabilities[probabilities_Association, n_, m_] :=
    Module[{rates = Keys@probabilities, odds = Values@probabilities},
      Plus @@ (odds * (PDF[PoissonDistribution[#], n] & /@
          rates) * (PDF[PoissonDistribution[#], m] & /@ rates)) /
          Plus @@ (odds * (PDF[PoissonDistribution[#], n] & /@ rates))]

Module[{types = 20, probabilities, typeProbabilities,
  allTypeTimeLines, someTypeTimeLines, restTypeTimeLines,
  firstYears = Range[0, 42], meanData, meanPlotData, expectedData,
  nPolicyholders = 200, probPreData, probPreDataGrouped,
  probPreDataGroupedKeys, singlePlotData, probPlotData1,
  probPlotData2},


  BlockRandom[
    probabilities =
        Association@
            MapThread[#1 -> #2 &, {RandomSample[Range[1, 2 * types], types],
              RandomReal[{0, 1}, types]}];
    probabilities = statistics`unitize[probabilities];
    typeProbabilities = Values@probabilities -> Keys@probabilities;,
    RandomSeeding -> 1];

  allTypeTimeLines =
      Table[RandomVariate[PoissonDistribution[#], 2] & /@
          RandomChoice[typeProbabilities, 1000], nPolicyholders];


  ListPlot[Sort[probabilities], Frame -> True,
    FrameLabel -> {"Profile Type", "Probability"},
    GridLines -> {Range@40, Range[0, 0.2, 0.005]}, ImageSize -> 788] //
      Print;
  expectedData = {#, expectedValue[probabilities, #]} & /@ firstYears;
  meanData =
      Table[Module[{list =
          Module[{select = Select[#, #[[1]] == firstYears[[r]] &]},
            If[select === {}, Null, Transpose[select][[2]]]]},
        If[list === Null, 0, N@Mean[list]]], {r, 1,
        Length@firstYears}] & /@ allTypeTimeLines;
  meanPlotData = MapThread[{#1, #2} &, {firstYears, #}] & /@ meanData;
  ListLinePlot[{expectedData} ~ Join ~ meanPlotData,
    PlotStyle -> ({{Thick, Darker@Green, Dashed}} ~ Join ~
        Table[{Thickness[0], Gray, Opacity[0.1]}, Length@meanPlotData]),
    ImageSize -> 788, Mesh -> None, InterpolationOrder -> 2,
    Frame -> True,
    FrameLabel -> {"\!\(\*StyleBox[\"#\",FontSlant->\"Italic\"]\) \
accidents in the First Year",
      "Expected number of accidents in the second year"},
    AspectRatio -> 43 / 50, PlotRange -> {{0, 43}, {0, 50}}];
  Export[StringReplace[NotebookFileName[],
    ".nb" -> ".csv"], {{"Type of Profile", "Probability of Profile"}} ~
      Join ~ MapThread[{#1, #2} &, {Keys@probabilities,
    Values@probabilities}], OverwriteTarget -> True];

  probPreData =
      RandomVariate[PoissonDistribution[#], 2] & /@
          RandomChoice[typeProbabilities, 1000];
  probPreDataGrouped = GroupBy[probPreData, #[[1]] &];
  probPreDataGroupedKeys = Keys[probPreDataGrouped];
  probPreDataGroupedKeys = Range[0, 40];

  probPlotData1 =
      Module[{subData = probPreDataGrouped[#]},
        KeySort[N[
          Length /@ GroupBy[subData, #[[2]] &] / Length@subData]]] & /@
          probPreDataGroupedKeys;
  probPlotData2 =
      Table[{#, theoProbabilities[probabilities, r, #]} & /@
          Range[0, 60], {r, 0, 40}];

  ListLinePlot[probPlotData2, PlotRange -> All, ImageSize -> 788,
    PlotStyle -> Thickness@0, Frame -> True,
    FrameLabel -> {"\!\(\*SubscriptBox[\(N\), \(2\)]\)", "Probability"},
    PlotLegends -> ("\!\(\*SubscriptBox[\(N\), \(1\)]\) = " <>
        ToString@# & /@ Range[0, 40])]

]