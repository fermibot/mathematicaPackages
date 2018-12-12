Module[{outcomesMeta = {}},
  Table[Module[{outcomes, turns = 10000},
    outcomes =
        ParallelTable[
          Module[{coin := RandomChoice[{0.3, 0.5, 0.7}], coinTemp},
            coinTemp = coin;
            Count[RandomChoice[{coinTemp, 1 - coinTemp} -> {1, 0}, 10], 1]],
          turns];
    outcomes = {#, N@Divide[Count[outcomes, #], turns]} & /@
        Range[0, 10];
    AppendTo[outcomesMeta, outcomes];
  ], 200];
  ListLinePlot[outcomesMeta, Frame -> True, ImageSize -> 788,
    InterpolationOrder -> 2,
    PlotStyle -> {{PointSize@0.004, Thickness@0, Darker@Green,
      Opacity@0.1}},
    GridLines -> {Range @@ {0, 10, 0.5}, Range @@ {0, 0.2, 0.02}},
    FrameTicks -> {Range @@ {0, 10, 1}, Range @@ {0, 0.2, 0.02}},
    PlotRange -> {Automatic, {0, 0.2}}, AspectRatio -> 0.5,
    PlotLabel -> "P{N=n}"]]


Module[{simulation},
  simulation =
      Module[{turns = 10000, coin := RandomChoice[{0.3, 0.5, 0.7}],
        coinTemp},
        Mean /@
            ParallelTable[coinTemp = coin;
            RandomChoice[{coinTemp, 1 - coinTemp} -> {1, 0}], turns, 100]
      ];
  Histogram[simulation, {0.01}, ImageSize -> 788, Frame -> True,
    GridLines -> None, AspectRatio -> 0.5,
    PlotLabel -> "Distribution of : P{X=heads} or P{X=$$$}"]
]