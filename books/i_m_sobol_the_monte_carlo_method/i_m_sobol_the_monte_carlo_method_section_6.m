Column@Module[{plotData},
  plotData = Table[
    With[{var = #},
      Module[{
        figs = <|
          4 -> ({#[[1]], #[[2]], #[[3]], #[[4]]} &),
          5 -> ({Max[{#[[1]], #[[2]]}], #[[3]], #[[4]], #[[5]]} &),

          6 -> ({Max[{#[[1]], #[[2]]}],
            Max[{#[[3]], #[[4]]}], #[[5]], #[[6]]} &),

          7 -> ({Max[{#[[1]], #[[2]]}], Max[{#[[3]], #[[4]]}],
            Max[#[[5]], #[[6]]], #[[7]]} &),

          8 -> ({Max[{#[[1]], #[[2]]}], Max[{#[[3]], #[[4]]}],
            Max[#[[5]], #[[6]]], Max[#[[7]], #[[8]]]} &),

          9 -> ({Max[{#[[1]], #[[2]], #[[3]]}],
            Max[{#[[4]], #[[5]]}], Max[#[[6]], #[[7]]],
            Max[#[[8]], #[[9]]]} &),

          10 -> ({Max[{#[[1]], #[[2]], #[[3]]}],
            Max[{#[[4]], #[[5]], #[[6]]}], Max[#[[7]], #[[8]]],
            Max[#[[9]], #[[10]]]} &),

          11 -> ({Max[{#[[1]], #[[2]], #[[3]]}],
            Max[{#[[4]], #[[5]], #[[6]]}],
            Max[#[[7]], #[[8]], #[[9]]], Max[#[[10]], #[[11]]]} &),

          12 -> ({Max[{#[[1]], #[[2]], #[[3]]}],
            Max[{#[[4]], #[[5]], #[[6]]}],
            Max[#[[7]], #[[8]], #[[9]]],
            Max[#[[10]], #[[11]], #[[12]]]} &)
        |>,
        lifeTimes, simulation},

        lifeTimes =
            RandomVariate[ExponentialDistribution[5], {1, var}];
        lifeTimes = figs[var][#] & /@ lifeTimes;
        simulation = Min /@ lifeTimes;
        Mean@simulation]] & /@ Range[4, 12], 2000];

  DistributionChart[Transpose@plotData, ChartElementFunction -> #,
    ChartLabels ->
        Placed[Rotate[#,
          0 \[Pi]] & /@ (StringJoin[# <> "\n"] & /@ {"1-1-1-1",
          "  2-1-1-1", "2-2-1-1", "2-2-2-1", "2-2-2-2", "3-2-2-2",
          "3-3-2-2", "3-3-3-2", "3-3-3-3"}), Above],
    ImageSize -> 788,
    PlotLabel ->
        "Configurations and Lifetime Profiles"] & /@ {"SmoothDensity",
    "PointDensity", "Density", "HistogramDensity"}]