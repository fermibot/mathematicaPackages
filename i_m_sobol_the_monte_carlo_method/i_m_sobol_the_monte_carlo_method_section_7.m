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

  Column[Graphics[
    {
      {Red, Opacity[0.1], Thickness@0, #[plotDataReflected]},
      {Blue, Opacity[0.1], Thickness@0, #[plotDataPassed]},
      {Green, Opacity[0.2], Thickness@0, #[plotDataAbsorbed]},
      {InfiniteLine[{{0, -1}, {0, 1}}]},
      {InfiniteLine[{{2, -1}, {2, 1}}]}
    }
    , PlotRange -> All, ImageSize -> 788] & /@ {Line, BezierCurve,
    BSplineCurve}]
]