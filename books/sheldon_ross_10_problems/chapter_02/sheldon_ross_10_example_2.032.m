Module[{coupons = Range[25], barData, trials = 1000000},
  barData =
      Reverse@Sort@
          Counts[Length /@ Union /@ RandomChoice[coupons, {trials, 10}]];
  Labeled[BarChart[barData, ChartLabels -> Keys@barData,
    LabelingFunction -> (Placed[#, Above] &),
    AxesLabel -> {None, Style["Count", 15]}, ImageSize -> 788,
    PlotLabel -> ToString[trials] <> " trials"],
    "Number of unique coupons"]
]

Export[StringReplace[NotebookFileName[], ".nb" -> ".png"], %,
ImageSize -> 788, ImageResolution -> 1200]

Module[{coupons = Range[25], barData, trials = 1000000},
  barData =
      N@Mean[Length /@ Union /@ RandomChoice[coupons, {trials, 10}]]]