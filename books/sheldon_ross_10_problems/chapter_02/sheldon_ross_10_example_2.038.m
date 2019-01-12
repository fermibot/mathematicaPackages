Module[{data, divisions = 30, plots,
  chartTypes = {"PointDensity", "HistogramDensity", "SmoothDensity"}},
  data = Transpose[
    Sort[#] & /@
        RandomVariate[NormalDistribution[], {1000, divisions}]];
  plots =
      DistributionChart[
        Join @@ {{Flatten@data}, data},
        ChartLabels ->
            Join @@ {{Style["All", Red]},
              Style[Subscript["x", ToString[#]], 12] & /@ Range@divisions},
        ImageSize -> 788,
        AspectRatio -> 0.5,
        GridLines -> {Range[divisions + 1], Range[-6, 6, 1]},
        ChartElementFunction -> #,
        AxesLabel -> {"Distribution", "Rank of the random number"}] & /@
          chartTypes;
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_normal_" <> ToString[chartTypes[[#]]] <> ".png"],
    plots[[#]],
    ImageSize -> 788, ImageResolution -> 500] & /@
      Range@Length@chartTypes
]

Module[{data, divisions = 30,
  chartTypes = {"PointDensity", "HistogramDensity", "SmoothDensity"},
  plots},
  data = Transpose[
    Sort[#] & /@
        RandomVariate[UniformDistribution[], {1000, divisions}]];
  plots =
      DistributionChart[Join @@ {{Flatten@data}, data},
        ChartLabels ->
            Join @@ {{Style["All", Red]},
              Style[Subscript["x", ToString[#]], 12] & /@ Range@divisions},
        ImageSize -> 788,
        AspectRatio -> 0.5,
        GridLines -> {Range[divisions + 1], Range[0, 1, 0.25]},
        ChartElementFunction -> #,
        AxesLabel -> {"Distribution", "Rank of the random number"}] & /@
          chartTypes;
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_uniform_" <> ToString[chartTypes[[#]]] <> ".png"],
    plots[[#]],
    ImageSize -> 788, ImageResolution -> 500] & /@
      Range@Length@chartTypes
]

Module[{data, divisions = 30,
  chartTypes = {"PointDensity", "HistogramDensity", "SmoothDensity"},
  plots},
  data = Transpose[
    Sort[#] & /@
        RandomVariate[ExponentialDistribution[1], {1000, divisions}]];
  plots =
      DistributionChart[Join @@ {{Flatten@data}, data},
        ChartLabels ->
            Join @@ {{Style["All", Red]},
              Style[Subscript["x", ToString[#]], 12] & /@ Range@divisions},
        ImageSize -> 788,
        AspectRatio -> 0.5,
        GridLines -> {Range[divisions + 1], Range[0, 14, 1]},
        ChartElementFunction -> #,
        AxesLabel -> {"Distribution", "Rank of the random number"}] & /@
          chartTypes;
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_exponential_" <> ToString[chartTypes[[#]]] <> ".png"],
    plots[[#]],
    ImageSize -> 788, ImageResolution -> 500] & /@
      Range@Length@chartTypes
]

Module[{data, divisions = 30,
  chartTypes = {"PointDensity", "HistogramDensity", "SmoothDensity"},
  plots},
  data = Transpose[
    Sort[#] & /@
        RandomVariate[GammaDistribution[2, 2], {1000, divisions}]];
  plots =
      DistributionChart[Join @@ {{Flatten@data}, data},
        ChartLabels ->
            Join @@ {{Style["All", Red]},
              Style[Subscript["x", ToString[#]], 12] & /@ Range@divisions},
        ImageSize -> 788,
        AspectRatio -> 0.5,
        GridLines -> {Range[divisions + 1], Range[0, 30, 1]},
        ChartElementFunction -> #,
        AxesLabel -> {"Distribution", "Rank of the random number"}] & /@
          chartTypes;
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_gamma_" <> ToString[chartTypes[[#]]] <> ".png"],
    plots[[#]],
    ImageSize -> 788, ImageResolution -> 500] & /@
      Range@Length@chartTypes
]

Module[{data, divisions = 30,
  chartTypes = {"PointDensity", "HistogramDensity", "SmoothDensity"},
  plots},
  data = Transpose[
    Sort[#] & /@
        RandomVariate[ChiSquareDistribution[1], {1000, divisions}]];
  plots =
      DistributionChart[Join @@ {{Flatten@data}, data},
        ChartLabels ->
            Join @@ {{Style["All", Red]},
              Style[Subscript["x", ToString[#]], 12] & /@ Range@divisions},
        ImageSize -> 788,
        AspectRatio -> 0.5,
        GridLines -> {Range[divisions + 1], Range[0, 20, 1]},
        ChartElementFunction -> #,
        AxesLabel -> {"Distribution", "Rank of the random number"}] & /@
          chartTypes;
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_chiSquare_" <> ToString[chartTypes[[#]]] <> ".png"],
    plots[[#]],
    ImageSize -> 788, ImageResolution -> 500] & /@
      Range@Length@chartTypes
]

Module[{data =
    Sort[#] & /@ RandomVariate[NormalDistribution[], {20, 10}], dataP},
  data = Table[dataP = data;
  Table[dataP[[r, \[Psi]]] = Style[dataP[[r, \[Psi]]], Red], {r, 1,
    Length@dataP}]; dataP, {\[Psi], 1, Dimensions[data][[2]]}];
  data = Framed[TableForm[#]] & /@ data;
  Export[StringReplace[NotebookFileName[], ".nb" -> "_01.gif"], data,
    "DisplayDurations" -> 1, ImageSize -> 788, ImageResolution -> 1200]
]