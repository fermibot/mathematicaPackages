ClearAll[yRandomizer];
yRandomizer[list_List] :=
    Module[{yRand = RandomReal[{-.02, .02}]}, {{-1, yRand}} ~ Join ~
        MapThread[{#1, #2} &, {list, {yRand} ~ Join ~
            RandomReal[{-1, 1}, Length@list - 1]}]]

Module[{data =
    DeleteCases[
      Import[StringReplace[NotebookFileName[], ".nb" -> ".csv"]], {}],
  collisions, last, reflected, absorbed, passed, plotDataReflected,
  plotDataPassed, plotDataAbsorbed},
  collisions = {Length[#], Last[#]} & /@ data;
  last = Last /@ data;
  reflected = Select[data, (Last[#] < 0) &];
  absorbed = Select[data, (0 <= Last@# <= 2) &];
  passed = Select[data, (Last@# > 2) &];
  plotDataReflected = yRandomizer /@ reflected;
  plotDataPassed = yRandomizer /@ passed;
  plotDataAbsorbed = yRandomizer /@ absorbed;

  Echo[Length /@ {passed, reflected, absorbed}];

  Framed@Column[Graphics[
    {
      {Red, Opacity[0.1], Arrowheads@0.02,
        Thickness@0, #[plotDataReflected]},
      {Gray, Opacity[0.04], Arrowheads@0.02,
        Thickness@0, #[plotDataPassed]},
      {Gray, Opacity[0.04], Arrowheads@0.02,
        Thickness@0, #[plotDataAbsorbed]},
      {InfiniteLine[{{0, -1}, {0, 1}}]},
      {InfiniteLine[{{2, -1}, {2, 1}}]}
    }
    , PlotRange -> All, ImageSize -> 788,
    PlotLabel ->
        "Reflected Neutrons: " <> ToString@# <>
            " representation"] & /@ {Arrow, BSplineCurve}]
]

(*Need to run python code before running this one*)
Module[{multiSimData,
  printTemporary = PrintTemporary["Beginning analysis"]},
  multiSimData =
      Module[{data = DeleteCases[Import[#], {}], collisions, last,
        reflected, absorbed, passed, plotDataReflected, plotDataPassed,
        plotDataAbsorbed},
        collisions = {Length[#], Last[#]} & /@ data;
        last = Last /@ data;
        reflected = Select[data, (Last[#] < 0) &];
        absorbed = Select[data, (0 <= Last@# <= 2) &];
        passed = Select[data, (Last@# > 2) &];
        plotDataReflected = yRandomizer /@ reflected;
        plotDataPassed = yRandomizer /@ passed;
        plotDataAbsorbed = yRandomizer /@ absorbed;
        NotebookDelete[printTemporary];
        printTemporary =
            PrintTemporary[Style["Analyzing the file " <> #, Darker@Green]];
        Length /@ {passed, reflected, absorbed}
      ] & /@
          SortBy[FileNames["*temp*", NotebookDirectory[]],
            ToExpression@Last[StringSplit[StringDelete[#, ".csv"], "_"]] &];
  Export[StringReplace[NotebookFileName[], ".nb" -> ".xlsx"],
    multiSimData]
]