Module[{peoplePerDay =
    KeySort[Counts@
        With[{\[Lambda] = 2},
          RandomVariate[PoissonDistribution[5], 100000]]]},
  BarChart[peoplePerDay,
    LabelingFunction -> (Placed[Rotate[#, 90 \[Degree]], Above] &),
    ChartLabels -> Automatic, ImageSize -> 788]]

ClearAll[genderDivide]

genderDivide[n_, p_ : 0.5] :=
    Module[{genderDivide =
        RandomChoice[{p, 1 - p} -> {0, 1}, n]}, {Count[genderDivide, 0],
      Count[genderDivide, 1]}]

Table[
  Module[{plot},
    plot = BarChart[
      Plus @@@
          GatherBy[
            genderDivide[#, p] & /@
                Sort@RandomVariate[PoissonDistribution[5], 10000],
            Total@# &],
      ChartLayout -> "Stacked",
      LabelingFunction -> (Placed[Rotate[#, 90 \[Degree]], Above] &),
      Frame -> True,
      PlotLabel -> Style["Probability for females = " <> ToString@p, 20],
      FrameLabel -> (Style[#, 15] & /@ {"Stacked Counts",
        "Total number of people"}),
      ImageSize -> 788, ChartLegends -> {"Female", "Male"}];
    Export[StringReplace[NotebookFileName[],
      ".nb" -> "_stacked_chart_" <> ToString[Round[10 p]] <> ".png"],
      plot,
      ImageSize -> 788, ImageResolution -> 800]
  ]
  , {p, 0.1, 0.9, 0.1}]

Export[StringReplace[NotebookFileName[],
  ".nb" -> "_theoretical_all.png"],
  Column[{ListLinePlot[
    Table[{n, E^(-10 #) (10 #)^n / n!}, {n, 0, 25}] & /@
        Range[0.1, 0.9, 0.1], PlotRange -> All,
    PlotLegends -> ("p = " <> ToString[#] & /@ Range[0.1, 0.9, 0.1]),
    ImageSize -> 788],
    ListLinePlot[
      Table[E^(-10 (1 - #)) (10 (1 - #))^n / n!, {n, 0, 25}] & /@
          Range[0.1, 0.9, 0.1], PlotRange -> All,
      PlotLegends -> ("(1-p) = " <> ToString[#] & /@
          Range[0.1, 0.9, 0.1]), ImageSize -> 788]}], ImageSize -> 788]


Table[
  Module[{images}, images = ListLinePlot[With[{p = p}, {
    Table[
      If[n == #,
        Callout[{n, E^(-10 (1 - p)) (10 (1 - p))^n / n!}, n,
          Above], {n, E^(-10 (1 - p)) (10 (1 - p))^n / n!}], {n, 0,
      25}],
    Table[
      If[n == 20 - #,
        Callout[{n, E^(-10 (p)) (10 (p))^n / n!}, 20 - #, Above], {n,
        E^(-10 (p)) (10 (p))^n / n!}], {n, 0, 25}]}],
    Frame -> True, FrameLabel -> {"n+m", "P{i=n+m}"},
    PlotRange -> {{0, 25}, {0, 0.5}},
    PlotLegends -> {"Male", "Female"},
    PlotLabel ->
        "P{female} = " <> ToString[p] <> " & p{male} = " <>
            ToString[1 - p]] & /@ Range[0, 20];

  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_theoretical_dists_p_" <> ToString[p] <> ".gif"], images,
    ImageSize -> 788, ImageResolution -> 300,
    "DisplayDurations" -> 0.5];
  Print["Exported for p = " <> ToString[p]]
  ]
  , {p, 0.1, 0.9, 0.1}]