AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
<< utilities`;
ClearAll[ballotGenerator];

ballotGenerator[candidates_Association] :=
    Module[{total = Plus @@ Values[candidates], probabilities, keys,
      values, masterList, votes},
      keys = Keys[candidates];
      values = Values[candidates];
      masterList =
          Join @@ MapThread[ConstantArray[#1, #2] &, {keys, values}];
      votes = RandomSample[masterList, total]
    ]

ballotGenerator[candidates_Association, instances_] :=
    Table[ballotGenerator[candidates], instances]

Module[{plot},
  plot =
      DistributionChart[
        Transpose@Table[
          Module[{data = {valuesMissing[#, "A"],
            valuesMissing[#, "B"]} & /@

              associationAppender[
                ballotGenerator[
                  Association[{"A" -> #[[1]], "B" -> #[[2]]}]]]},
            Length /@ (Select[
              data, #] & /@ {#[[1]] > #[[2]] &, #[[2]] > #[[1]] &,
              #[[1]] == #[[2]] &})
          ], 1000],
        ImageSize -> 788,
        ChartElementFunction -> "PointDensity",
        ChartLabels -> {"A ahead of B", "B head of A", "A equal to B"},
        PlotLabel ->
            "Total A votes = " <> ToString[#[[1]]] <>
                " & total B votes = " <> ToString[#[[2]]],
        FrameLabel -> {None, "Number of occurances in 1000 trials"}];

  Export[
    StringReplace[NotebookFileName[],
      ".nb" -> "_ahead_behind_A_votes_" <> ToString[#[[1]]] <> ".png"],
    plot, ImageSize -> 788, ImageResolution -> 500]
] & /@ ({#, 200 - #} & /@ Range[10, 190, 10])


Module[{plot},
  plot = ListLinePlot[Transpose[
    {valuesMissing[#, "A"], valuesMissing[#, "B"]} & /@
        associationAppender[
          ballotGenerator[Association[{"A" -> #[[1]], "B" -> #[[2]]}]]]],
    PlotLegends -> {"Candidate A", "Candidate B"},
    Frame -> True,
    FrameLabel -> (Style[#, 12] & /@ {"Total number of votes",
      "Votes for A and B"}),
    PlotLabel -> Style[
      "Accumulating votes " <> "A gets " <> ToString[#[[1]]]
          <> " votes and B gets " <> ToString[#[[2]]] <> " votes", Red],
    Filling -> {1 -> {2}}, PlotRange -> {{0, 200}, {0, 200}},
    ImageSize -> 700, AspectRatio -> 1];

  Export[
    StringReplace[NotebookFileName[],
      ".nb" ->
          "_ballot_counting_A_total_" <> ToString[#[[1]]] <> ".png"],
    plot, ImageSize -> 788, ImageResolution -> 500]
] & /@ ({#, 200 - #} & /@ Range[10, 190, 10])



Module[{plot},
  plot = ListLinePlot[Transpose[
    {valuesMissing[#, "A"], valuesMissing[#, "B"]} & /@
        associationAppender[
          ballotGenerator[Association[{"A" -> #[[1]], "B" -> #[[2]]}]]]],
    PlotLegends -> {"Candidate A", "Candidate B"},
    Frame -> True,
    FrameLabel -> (Style[#, 12] & /@ {"Total number of votes",
      "Votes for A and B"}),
    PlotLabel -> Style[
      "Accumulating votes " <> "A gets " <> ToString[#[[1]]]
          <> " votes and B gets " <> ToString[#[[2]]] <> " votes", Red],
    Filling -> {1 -> {2}}, PlotRange -> {{0, 200}, {0, 200}},
    ImageSize -> 700, AspectRatio -> 1] & /@ ({#, 200 - #} & /@
      Range[1, 199, 1]);

  Export[
    StringReplace[NotebookFileName[],
      ".nb" -> "_ballot_counting_animation.gif"],
    plot, ImageSize -> 788, ImageResolution -> 100,
    "DisplayDurations" -> 1]
]