Module[{simulation, runs = 100000},
  simulation =
      KeySort@Counts[
        Table[Module[{sum = 0, roll := RandomChoice[Range[6]]},
          While[True,
            sum += roll;
            If[sum > 100, Break[]]
          ];
          sum
        ], runs]];
  Framed@BarChart[simulation,
    ChartLabels ->
        Placed[{Values@simulation, Keys@simulation}, {Above, Below}],
    Frame -> True, ImageSize -> 788,
    PlotLabel ->
        "Distribution for sums for " <> ToString[runs] <> " runs"]
]