ClearAll[yRandomizer];
yRandomizer[list_List] :=
    Module[{yRand = RandomReal[{-.1, .1}]}, {{-1, yRand}} ~ Join ~
        MapThread[{#1, #2} &, {list, {yRand} ~ Join ~
            RandomReal[{-1, 1}, Length@list - 1]}]]

Module[{data =
    DeleteCases[
      Import[StringReplace[NotebookFileName[], ".nb" -> ".csv"]], {}],
  collisions, last, reflected, absorbed, passed},
  collisions = {Length[#], Last[#]} & /@ data;
  last = Last /@ data;
  reflected = Select[data, (Last[#] < 0) &];
  absorbed = Select[data, (0 <= Last@# <= 2) &];
  passed = Select[data, (Last@# > 2) &];

  Graphics[
    {
      {Green, Opacity[0.1], Thickness@0,
        BezierCurve[yRandomizer /@ reflected]},
      {Blue, Opacity[0.1], Thickness@0,
        BezierCurve[yRandomizer /@ passed]},
      {Red, Opacity[0.1], Thickness@0,
        BezierCurve[yRandomizer /@ absorbed]},
      {InfiniteLine[{{0, -1}, {0, 1}}]},
      {InfiniteLine[{{2, -1}, {2, 1}}]}
    }
    , PlotRange -> All, ImageSize -> 788]
]

