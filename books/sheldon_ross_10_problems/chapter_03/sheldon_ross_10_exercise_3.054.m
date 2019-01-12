Module[{probabilities = Divide[Range@10, 10]},
  Labeled[Histogram[
    Mean /@ Partition[(RandomVariate[GeometricDistribution[#]] + 1) & /@
        RandomChoice[probabilities, 1000000], 100], {0.05},
    Frame -> True,
    FrameLabel -> Style["\[Mu](N) \[Congruent] E(N)", 15, Lighter@Red],
    ImageSize -> 788],
    Style["Means calculated for batches of size 15", Lighter@Red, 20],
    Top]
]

Module[{probabilities = Divide[Range@10, 10], data},
  data = KeySort@
      Counts[(RandomVariate[GeometricDistribution[#]] + 1) & /@
          RandomChoice[probabilities, 10000]];
  Labeled[BarChart[data,
    ChartLabels ->
        Placed[{Keys@data,
          Rotate[#, Divide[\[Pi], 2]] & /@ (Values@data)}, {Below,
          Above}], Frame -> True, ImageSize -> 788],
    Style["Counts of the number of turns taken for a pass", Lighter@Red,
      20], Top]
]