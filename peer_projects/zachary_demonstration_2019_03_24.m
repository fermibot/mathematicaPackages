(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-14 *)


Module[{data = Join @@ Import["section_04.csv"], \[Mu], \[Sigma],
  samples, n = 60, nSamples = 10000, sampleMeans, histogram,
  theoreticalDistribution},
  \[Mu] = Mean@data;
  \[Sigma] = StandardDeviation@data;
  samples = Table[RandomSample[data, n], nSamples];
  sampleMeans = Mean /@ samples;
  histogram = Histogram[sampleMeans, Automatic, "PDF"];
  theoreticalDistribution =
      Plot[PDF[NormalDistribution[\[Mu], Divide[\[Sigma], Sqrt@n]],
        x], {x, 0, 10}, PlotRange -> {{0, 10}, All}];
  Show[histogram, theoreticalDistribution, Frame -> True]
]

Module[{data = Join @@ Import["section_04.csv"], \[Mu], \[Sigma],
  nSamples = 100, sampleMeans, histogram, listPlot, theoreticalPlot},
  \[Mu] = Mean@data;
  \[Sigma] = StandardDeviation@data;
  listPlot = ListPlot[Table[
    {n + RandomVariate[NormalDistribution[0, 0.2]], Module[{samples},
      samples = Table[RandomSample[data, n], nSamples];
      StandardDeviation@(Mean /@ samples)
    ]}, {n, 1, 10, 1}, 200
  ], PlotStyle -> {{PointSize@0.002, Red}}];
  theoreticalPlot =
      Plot[Divide[\[Sigma], Sqrt@n], {n, 0, 10}, PlotStyle -> LightGray];
  Show[listPlot, theoreticalPlot, Frame -> True,
    PlotRange -> {{0, 10}, {0, 5}}, ImageSize -> 788]
]

Module[{data = Join @@ Import["section_04.csv"], \[Mu], \[Sigma],
  nSamples = 100, histogram, listPlot, theoreticalPlot,
  sampleSizes = {2, 3, 4, 5, 10, 15, 20, 30, 50, 60, 70, 80, 100, 150,
    200, 250, 500, 600, 750}},
  \[Mu] = Mean@data;

  listPlot =
      ListPlot[Table[{sampleSize, Module[{samples, standardTScores},
        samples = Table[RandomSample[data, sampleSize], nSamples];
        standardTScores = (Mean@# - \[Mu]) / (StandardDeviation@# / Sqrt[
          sampleSize]) & /@ samples;
        StandardDeviation@standardTScores
      ]}, {sampleSize, sampleSizes}, 100], Frame -> True,
        ImageSize -> 788, PlotStyle -> {{PointSize@0.001, Red}}];
  theoreticalPlot =
      ListPlot[Table[{n - 1,
        StandardDeviation[StudentTDistribution[n - 1]]}, {n,
        sampleSizes}]];

  Show[listPlot, theoreticalPlot]
]

Module[{\[Mu], \[Sigma], nSamples = 200, histogram, listPlot,
  theoreticalPlot,
  sampleSizes = {2, 3, 4, 5, 10, 15, 20, 30, 50, 60, 70, 80, 100, 150,
    200, 250}},
  \[Mu] = 5;

  listPlot =
      ListPlot[Table[{sampleSize, Module[{samples, standardTScores},
        samples = Table[RandomReal[{0, 10}, sampleSize], nSamples];
        standardTScores = (Mean@# - 5) / (StandardDeviation@# / Sqrt[
          sampleSize]) & /@ samples;
        StandardDeviation@standardTScores
      ]}, {sampleSize, sampleSizes}, 100], Frame -> True,
        ImageSize -> 788, PlotStyle -> {{PointSize@0.001, Red}}];
  theoreticalPlot =
      ListPlot[Table[{n - 1,
        StandardDeviation[StudentTDistribution[n - 1]]}, {n,
        sampleSizes}]];

  Show[listPlot, theoreticalPlot]
]