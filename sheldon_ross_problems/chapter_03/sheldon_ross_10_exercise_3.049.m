Framed@
    Grid@
        Partition[
          Table[
            With[{p = prob},
              Module[{topSimulation, AWins, BWins, chartPair},
                chartPair = {AWins, BWins};
                topSimulation = Table[
                  Module[{simulation},
                    simulation = Table[
                      Module[{a = 0, b = 0, c = 0, probability = p},
                        While[True,
                          c += 1;
                          If[RandomReal[] <= probability, a += 1, b += 1];
                          If[Abs[a - b] >= 2, Break[]]];
                        {{"A", "B"}[[Position[{a, b}, Max[a, b]][[1, 1]]]], c}
                      ]
                      , 100];
                    Mean /@ (#[[2]] & /@ # & /@ GroupBy[simulation, #[[1]] &])
                  ],
                  1000];
                {AWins, BWins} = {#["A"] & /@ topSimulation, #["B"] & /@ topSimulation};
                DistributionChart[chartPair,
                  ChartElementFunction -> "PointDensity",
                  ChartLabels ->
                      Placed[{{"A", "B"}, N@Mean@Select[#, NumberQ] & /@ {AWins, BWins}}, {Below, Above}],
                  PlotRange -> {Automatic, {0, 10}},
                  AspectRatio -> 1, ImageSize -> 260,
                  PlotLabel -> Style["p = " <> ToString@prob, Italic]]
              ]
            ]
            , {prob, Range[0.1, .9, 0.1]}], 3]