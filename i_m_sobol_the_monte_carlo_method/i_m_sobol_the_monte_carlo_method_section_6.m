Column[With[{var = #},
    Module[{
      figs = <|4 -> (Min[{#[[1]], #[[2]], #[[3]], #[[4]]}] &),
        5 -> (Min[{#[[1]], #[[2]], Max[{#[[3]], #[[4]]}, #[[5]]]}] &),
         6 -> (Max[{#[[1]], Min[{#[[2]], #[[3]]}],
             Min[{#[[4]], #[[5]]}], #[[6]]}] &)|>,
      lifeTimes, simulation},

     lifeTimes = RandomVariate[ExponentialDistribution[3], {100, var}];
     simulation = figs[var][#] & /@ lifeTimes;
     DistributionChart[Transpose[lifeTimes]~Join~{simulation},
      ChartElementFunction -> "PointDensity", ImageSize -> 300]
     ]
    ] & /@ {4, 5, 6}]